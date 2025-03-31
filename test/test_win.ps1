# AdGuard Private DDNS Test Script
# Tests functionality of the win\ddns.ps1 script

# Global variables
$ErrorActionPreference = "Stop"
$testDomain = "test.example.com"
$testIPv4 = "192.168.1.100"
$testIPv6 = "2001:db8::1"
# Use paths relative to script location
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$rootDir = Split-Path -Parent $scriptDir
$scriptPath = Join-Path $rootDir "win\ddns.ps1"
$adGuardPrivatePath = Join-Path $rootDir "bin\AdGuardPrivate.exe"
$configPath = Join-Path $rootDir "bin\AdGuardPrivate.yaml"
$adGuardProcess = $null

# Create test temp directory
$testTempDir = Join-Path $scriptDir "temp"
if (-not (Test-Path $testTempDir)) {
    New-Item -Path $testTempDir -ItemType Directory -Force | Out-Null
}

$testConfig = @{
    base_url = "http://localhost:8081"
    username = "test"
    password = "testtest"
    domain = $testDomain
    cookies = ""
    enable_ipv4 = $true
    enable_ipv6 = $true
    DEBUG = 1
}

# Clean up any existing temp files
Function Cleanup-TempFiles {
    if (Test-Path $testTempDir) {
        Get-ChildItem -Path $testTempDir -File | Remove-Item -Force
    }
}

Function Start-AdGuardPrivate {
    Write-Host "Checking if AdGuard Private is already running..." -ForegroundColor Cyan
    try {
        # Check if AdGuard Private is already running
        $maxRetries = 3
        $retryCount = 0
        $started = $false
        
        # Create authentication header with correct credentials
        # Encode "test:testtest" to base64 for basic auth
        $auth = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("$($testConfig.username):$($testConfig.password)"))
        $headers = @{
            "Authorization" = "Basic $auth"
        }
        
        while (-not $started -and $retryCount -lt $maxRetries) {
            try {
                $response = Invoke-WebRequest -Uri "http://localhost:8081/control/status" `
                                          -UseBasicParsing -TimeoutSec 5 `
                                          -Headers $headers
                                          
                if ($response.StatusCode -eq 200) {
                    $started = $true
                    Write-Host "AdGuard Private is already running!" -ForegroundColor Green
                    return $true
                }
            }
            catch {
                $retryCount++
                Write-Host "Trying to connect to existing AdGuard Private (attempt $retryCount of $maxRetries)..." -ForegroundColor Yellow
                Start-Sleep -Seconds 2
            }
        }
        
        # If AdGuard Private is not already running, start it
        Write-Host "Starting AdGuard Private in the background..." -ForegroundColor Cyan
        
        Write-Host "AdGuard Private path: $adGuardPrivatePath" -ForegroundColor Yellow
        Write-Host "Config path: $configPath" -ForegroundColor Yellow
        
        # Check if AdGuard Private exists
        if (-not (Test-Path $adGuardPrivatePath)) {
            Write-Host "AdGuard Private executable not found at: $adGuardPrivatePath" -ForegroundColor Red
            throw "AdGuard Private executable not found"
        }
        
        Write-Host "Starting AdGuard Private with command:" -ForegroundColor Yellow
        $arguments = "--web-addr 0.0.0.0:8081 --no-check-update --verbose"
        Write-Host "$adGuardPrivatePath $arguments" -ForegroundColor Yellow
        
        # Start AdGuard Private process for the tests
        $processInfo = Start-Process -FilePath $adGuardPrivatePath `
                                  -ArgumentList $arguments `
                                  -PassThru -NoNewWindow
        $script:adGuardProcess = $processInfo
        
        Write-Host "AdGuard Private process started with ID: $($processInfo.Id)" -ForegroundColor Yellow

        # Wait for AdGuard Private to start
        Write-Host "Waiting for AdGuard Private to start up..." -ForegroundColor Yellow
        Start-Sleep -Seconds 10
        
        # Check if the process is still running
        if ($processInfo.HasExited) {
            Write-Host "AdGuard Private process has exited prematurely with code: $($processInfo.ExitCode)" -ForegroundColor Red
            throw "AdGuard Private process exited prematurely"
        }
        
        # Check if the service is responding
        $maxRetries = 12
        $retryCount = 0
        $started = $false
        
        while (-not $started -and $retryCount -lt $maxRetries) {
            try {
                $response = Invoke-WebRequest -Uri "http://localhost:8081/control/status" `
                                          -UseBasicParsing -TimeoutSec 5 `
                                          -Headers $headers
                                          
                if ($response.StatusCode -eq 200) {
                    $started = $true
                    Write-Host "AdGuard Private started successfully!" -ForegroundColor Green
                }
            }
            catch {
                $retryCount++
                Write-Host "Waiting for AdGuard Private to be ready (attempt $retryCount of $maxRetries): $_" -ForegroundColor Yellow
                Start-Sleep -Seconds 5
            }
        }
        
        if (-not $started) {
            throw "Failed to start AdGuard Private after $maxRetries attempts"
        }
        
        return $true
    }
    catch {
        Write-Host "Error starting AdGuard Private: $_" -ForegroundColor Red
        return $false
    }
}

Function Stop-AdGuardPrivate {
    Write-Host "Stopping AdGuard Private..." -ForegroundColor Cyan
    if ($script:adGuardProcess -ne $null) {
        try {
            Stop-Process -Id $script:adGuardProcess.Id -Force
            Write-Host "AdGuard Private stopped successfully" -ForegroundColor Green
        }
        catch {
            Write-Host "Error stopping AdGuard Private: $_" -ForegroundColor Red
        }
    }
    
    # Restore the original configuration by copying the backup file
    try {
        $configPath = Join-Path $rootDir "bin\AdGuardPrivate.yaml"
        $backupPath = Join-Path $rootDir "bin\AdGuardPrivate.yaml.bak"
        
        if (Test-Path $backupPath) {
            Write-Host "Restoring original configuration from backup..." -ForegroundColor Cyan
            Copy-Item -Path $backupPath -Destination $configPath -Force
            Write-Host "Configuration restored successfully" -ForegroundColor Green
        } else {
            Write-Host "Backup configuration file not found: $backupPath" -ForegroundColor Yellow
        }
    } catch {
        Write-Host "Error restoring configuration: $_" -ForegroundColor Red
    }
}

Function Create-TempScript {
    param([hashtable]$Config)
    
    # Read the original script
    $scriptContent = Get-Content $scriptPath -Raw
    
    # Replace configuration values
    $scriptContent = $scriptContent -replace '\$base_url = "{{server_name}}"', "`$base_url = `"$($Config.base_url)`""
    $scriptContent = $scriptContent -replace '\$username = "{{username}}"', "`$username = `"$($Config.username)`""
    $scriptContent = $scriptContent -replace '\$password = "{{password}}"', "`$password = `"$($Config.password)`""
    $scriptContent = $scriptContent -replace '\$domain = "{{domain}}"', "`$domain = `"$($Config.domain)`""
    $scriptContent = $scriptContent -replace '\$cookies = "{{cookies}}"', "`$cookies = `"$($Config.cookies)`""
    $scriptContent = $scriptContent -replace '\$enable_ipv4 = \$true', "`$enable_ipv4 = `$$($Config.enable_ipv4)"
    $scriptContent = $scriptContent -replace '\$enable_ipv6 = \$true', "`$enable_ipv6 = `$$($Config.enable_ipv6)"
    $scriptContent = $scriptContent -replace '\$DEBUG = 1', "`$DEBUG = $($Config.DEBUG)"
    
    # Create a temporary script file in the test temp directory
    $tempScriptPath = Join-Path $testTempDir "ddns_test_script_$([Guid]::NewGuid().ToString()).ps1"
    Set-Content -Path $tempScriptPath -Value $scriptContent
    
    return $tempScriptPath
}

Function Mock-Get-CurrentIP {
    param([string]$TempScriptPath, [string]$IPv4, [string]$IPv6)
    
    $scriptContent = Get-Content $TempScriptPath -Raw
    
    # Replace the Get-CurrentIP function with a mock
    $mockFunction = @"
function Get-CurrentIP {
    param([string]`$IPVersion = "ipv4")
    
    if (`$IPVersion -eq "ipv4") {
        return "$IPv4"
    }
    else {
        return "$IPv6"
    }
}
"@
    
    # Find the original function and replace it
    $pattern = "function Get-CurrentIP \{[\s\S]*?\n\}"
    $scriptContent = $scriptContent -replace $pattern, $mockFunction
    
    # Write back the modified script
    $scriptContent | Out-File -FilePath $TempScriptPath
}

Function Test-CreateDNSRecord {
    param([string]$TempScriptPath)
    
    Write-Host "`nTEST: Creating DNS Record" -ForegroundColor Cyan
    Write-Host "------------------------" -ForegroundColor Cyan
    
    # First run to create the record
    try {
        & $TempScriptPath
        Write-Host "[PASS] DNS record creation test completed" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "[FAIL] DNS record creation test failed: $_" -ForegroundColor Red
        return $false
    }
}

Function Test-UpdateDNSRecord {
    param([string]$TempScriptPath)
    
    Write-Host "`nTEST: Updating DNS Record" -ForegroundColor Cyan
    Write-Host "------------------------" -ForegroundColor Cyan
    
    # Modify the mock IP address
    Mock-Get-CurrentIP -TempScriptPath $TempScriptPath -IPv4 "192.168.1.200" -IPv6 "2001:db8::2"
    
    # Run the script again to update the record
    try {
        & $TempScriptPath
        Write-Host "[PASS] DNS record update test completed" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "[FAIL] DNS record update test failed: $_" -ForegroundColor Red
        return $false
    }
}

Function Test-NoChangeDNSRecord {
    param([string]$TempScriptPath)
    
    Write-Host "`nTEST: No Change DNS Record" -ForegroundColor Cyan
    Write-Host "-------------------------" -ForegroundColor Cyan
    
    # Run the script again with the same IP (no change expected)
    try {
        & $TempScriptPath
        Write-Host "[PASS] No change DNS record test completed" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "[FAIL] No change DNS record test failed: $_" -ForegroundColor Red
        return $false
    }
}

Function Test-IPv4Only {
    param([string]$TempScriptPath)
    
    Write-Host "`nTEST: IPv4 Only" -ForegroundColor Cyan
    Write-Host "-------------" -ForegroundColor Cyan
    
    # Modify configuration to enable only IPv4
    $scriptContent = Get-Content $TempScriptPath -Raw
    $scriptContent = $scriptContent -replace '\$enable_ipv6 = \$true', "`$enable_ipv6 = `$false"
    $scriptContent | Out-File -FilePath $TempScriptPath
    
    # Run the script
    try {
        & $TempScriptPath
        Write-Host "[PASS] IPv4 only test completed" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "[FAIL] IPv4 only test failed: $_" -ForegroundColor Red
        return $false
    }
}

Function Test-IPv6Only {
    param([string]$TempScriptPath)
    
    Write-Host "`nTEST: IPv6 Only" -ForegroundColor Cyan
    Write-Host "-------------" -ForegroundColor Cyan
    
    # Modify configuration to enable only IPv6
    $scriptContent = Get-Content $TempScriptPath -Raw
    $scriptContent = $scriptContent -replace '\$enable_ipv4 = \$true', "`$enable_ipv4 = `$false"
    $scriptContent = $scriptContent -replace '\$enable_ipv6 = \$false', "`$enable_ipv6 = `$true"
    $scriptContent | Out-File -FilePath $TempScriptPath
    
    # Run the script
    try {
        & $TempScriptPath
        Write-Host "[PASS] IPv6 only test completed" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "[FAIL] IPv6 only test failed: $_" -ForegroundColor Red
        return $false
    }
}

Function Test-CookieAuthentication {
    param([string]$TempScriptPath)
    
    Write-Host "`nTEST: Cookie Authentication" -ForegroundColor Cyan
    Write-Host "------------------------" -ForegroundColor Cyan
    
    # Get a session cookie from AdGuard Private
    try {
        $loginBody = @{
            name = $testConfig.username
            password = $testConfig.password
        } | ConvertTo-Json
        
        $response = Invoke-WebRequest -Uri "$($testConfig.base_url)/control/login" `
                                    -Method Post `
                                    -Body $loginBody `
                                    -ContentType "application/json" `
                                    -SessionVariable session
        
        $cookie = $session.Cookies.GetCookies("$($testConfig.base_url)") | Where-Object { $_.Name -eq "agh_session" }
        
        if ($cookie) {
            # Update the script with cookie authentication
            $scriptContent = Get-Content $TempScriptPath -Raw
            $scriptContent = $scriptContent -replace '\$username = ".*"', "`$username = `"`"" 
            $scriptContent = $scriptContent -replace '\$password = ".*"', "`$password = `"`"" 
            $scriptContent = $scriptContent -replace '\$cookies = ".*"', "`$cookies = `"agh_session=$($cookie.Value)`""
            $scriptContent | Out-File -FilePath $TempScriptPath
            
            # Run the script
            & $TempScriptPath
            Write-Host "[PASS] Cookie authentication test completed" -ForegroundColor Green
            return $true
        }
        else {
            Write-Host "[FAIL] Failed to get authentication cookie" -ForegroundColor Red
            return $false
        }
    }
    catch {
        Write-Host "[FAIL] Cookie authentication test failed: $_" -ForegroundColor Red
        return $false
    }
}

Function Run-AllTests {
    Write-Host "Starting AdGuard Private DDNS Script Tests" -ForegroundColor Cyan
    Write-Host "=======================================" -ForegroundColor Cyan
    
    # Clean up any existing temp files
    Cleanup-TempFiles
    
    # Start AdGuard Private
    if (-not (Start-AdGuardPrivate)) {
        Write-Host "Failed to start AdGuard Private. Tests aborted." -ForegroundColor Red
        return
    }
    
    try {
        # Create temporary script with test configuration
        $tempScriptPath = Create-TempScript -Config $testConfig
        
        # Mock the Get-CurrentIP function to return consistent test values
        Mock-Get-CurrentIP -TempScriptPath $tempScriptPath -IPv4 $testIPv4 -IPv6 $testIPv6
        
        # Run tests
        $testResults = @{
            "Create DNS Record" = Test-CreateDNSRecord -TempScriptPath $tempScriptPath
            "Update DNS Record" = Test-UpdateDNSRecord -TempScriptPath $tempScriptPath
            "No Change DNS Record" = Test-NoChangeDNSRecord -TempScriptPath $tempScriptPath
            "IPv4 Only" = Test-IPv4Only -TempScriptPath $tempScriptPath
            "IPv6 Only" = Test-IPv6Only -TempScriptPath $tempScriptPath
            "Cookie Authentication" = Test-CookieAuthentication -TempScriptPath $tempScriptPath
        }
        
        # Clean up
        Cleanup-TempFiles
        
        # Show test summary
        Write-Host "`nTest Summary:" -ForegroundColor Cyan
        Write-Host "=============" -ForegroundColor Cyan
        
        $passedTests = 0
        $totalTests = $testResults.Count
        
        foreach ($test in $testResults.Keys) {
            $result = $testResults[$test]
            $statusColor = if ($result) { "Green" } else { "Red" }
            $statusSymbol = if ($result) { "[PASS]" } else { "[FAIL]" }
            
            Write-Host "$statusSymbol $test" -ForegroundColor $statusColor
            
            if ($result) {
                $passedTests++
            }
        }
        
        Write-Host "`nResults: $passedTests/$totalTests tests passed" -ForegroundColor Cyan
        
        if ($passedTests -eq $totalTests) {
            Write-Host "All tests passed!" -ForegroundColor Green
        }
        else {
            Write-Host "Some tests failed. Review the log for details." -ForegroundColor Yellow
        }
    }
    catch {
        Write-Host "Error running tests: $_" -ForegroundColor Red
    }
    finally {
        # Stop AdGuard Private
        Stop-AdGuardPrivate
        
        # Final cleanup
        Cleanup-TempFiles
    }
}

# Run all tests
Run-AllTests