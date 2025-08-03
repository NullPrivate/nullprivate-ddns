# AdGuard Private DDNS Update Script
# For Windows Systems (PowerShell)
#

param(
    [string]$BaseUrl,
    [string]$Username,
    [string]$Password,
    [string]$Domain,
    [string]$Cookies,
    [boolean]$EnableIPv4,
    [boolean]$EnableIPv6,
    [switch]$Help
)

# Configuration - modify before running
$base_url = if ($PSBoundParameters.ContainsKey('BaseUrl')) { $BaseUrl } else { "{{server_name}}" }  # Example: http://localhost:34020 or https://dns.example.com
# Remove trailing slash from base_url if present
$base_url = $base_url.TrimEnd('/')
$username = if ($PSBoundParameters.ContainsKey('Username')) { $Username } else { "{{username}}" }     # AdGuard Private username
$password = if ($PSBoundParameters.ContainsKey('Password')) { $Password } else { "{{password}}" }     # AdGuard Private password
$domain = if ($PSBoundParameters.ContainsKey('Domain')) { $Domain } else { "{{domain}}" }             # Domain to update, e.g.: nas.example.com
$cookies = if ($PSBoundParameters.ContainsKey('Cookies')) { $Cookies } else { "{{cookies}}" }         # Cookie string for authentication, e.g.: "agh_session=abc123"

# IP version configuration
$enable_ipv4 = if ($PSBoundParameters.ContainsKey('EnableIPv4')) { $EnableIPv4 } else { $true }       # Enable IPv4 DDNS updates
$enable_ipv6 = if ($PSBoundParameters.ContainsKey('EnableIPv6')) { $EnableIPv6 } else { $true }       # Enable IPv6 DDNS updates

# Debug mode switch (0=off, 1=on)
$DEBUG = 0

# Script temporary files
$TEMP_FILE_IPV4 = "$env:TEMP\adguard_ddns_ipv4.tmp"
$TEMP_FILE_IPV6 = "$env:TEMP\adguard_ddns_ipv6.tmp"

# Display usage information
function Show-Usage {
    Write-Host "Usage:" -ForegroundColor Blue
    Write-Host "  Edit the script and set the following parameters before running or pass as arguments:"
    Write-Host "  -BaseUrl  - AdGuard Private server URL (e.g., https://{xxxxxxxxxxxxxxxx}.adguardprivate.com)" -ForegroundColor Yellow
    Write-Host "  -Domain   - Domain to update (e.g., nas.example.com)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  For authentication, use one of the following methods:" -ForegroundColor White
    Write-Host "  1. Username/Password (recommended):" -ForegroundColor White
    Write-Host "     -Username - AdGuard Private username" -ForegroundColor Yellow
    Write-Host "     -Password - AdGuard Private password" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  2. Cookies (alternative, may expire):" -ForegroundColor White
    Write-Host "     -Cookies  - Cookie string (e.g., 'agh_session=abc123')" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  Optional parameters:" -ForegroundColor White
    Write-Host "  -EnableIPv4 - Enable/disable IPv4 DDNS updates (true/false)" -ForegroundColor Yellow
    Write-Host "  -EnableIPv6 - Enable/disable IPv6 DDNS updates (true/false)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "  Example usage:" -ForegroundColor White
    Write-Host "    .\ddns.ps1 -BaseUrl 'https://{xxxxxxxxxxxxxxxx}.adguardprivate.com' -Username 'admin' -Password 'password123' -Domain 'nas.example.com'"
    Write-Host ""
    Write-Host "    # OR using cookies instead of username/password:" -ForegroundColor White
    Write-Host "    .\ddns.ps1 -BaseUrl 'https://{xxxxxxxxxxxxxxxx}.adguardprivate.com' -Cookies 'agh_session=abc123' -Domain 'nas.example.com'"
    Write-Host ""
    Write-Host "    # OR disabling IPv6 updates:" -ForegroundColor White
    Write-Host "    .\ddns.ps1 -BaseUrl 'https://{xxxxxxxxxxxxxxxx}.adguardprivate.com' -Username 'admin' -Password 'password123' -Domain 'nas.example.com' -EnableIPv6 `$false"
    Write-Host ""
    Write-Host "Note: This script is specifically developed for adguardprivate.com" -ForegroundColor Blue
    exit
}

# Check if help is requested
if ($Help) {
    Show-Usage
}

# Check if all essential parameters are provided
function Check-Params {
    $missing = $false

    # Check base_url
    if ([string]::IsNullOrEmpty($base_url) -or $base_url -eq "{{server_name}}") {
        Write-Host "Error: Server URL (base_url) is required" -ForegroundColor Red
        $missing = $true
    }
    # Ensure base_url includes protocol
    elseif (-not ($base_url.StartsWith("http://") -or $base_url.StartsWith("https://"))) {
        Write-Host "Error: Server URL must start with 'http://' or 'https://'" -ForegroundColor Red
        $missing = $true
    }

    # Check domain
    if ([string]::IsNullOrEmpty($domain) -or $domain -eq "{{domain}}") {
        Write-Host "Error: Domain name (domain) is required" -ForegroundColor Red
        $missing = $true
    }

    # Check authentication
    if (([string]::IsNullOrEmpty($username) -or $username -eq "{{username}}") -or 
        ([string]::IsNullOrEmpty($password) -or $password -eq "{{password}}")) {
        if ([string]::IsNullOrEmpty($cookies) -or $cookies -eq "{{cookies}}") {
            Write-Host "Error: Authentication is required (either username/password or cookies)" -ForegroundColor Red
            $missing = $true
        }
    }

    # Show usage if any essential parameter is missing
    if ($missing) {
        Write-Host ""
        Show-Usage
    }
}

# Check authentication method
function Check-Auth {
    if (([string]::IsNullOrEmpty($username) -or $username -eq "{{username}}") -or 
        ([string]::IsNullOrEmpty($password) -or $password -eq "{{password}}")) {
        if ([string]::IsNullOrEmpty($cookies) -or $cookies -eq "{{cookies}}") {
            Write-Host "Error: No authentication method available." -ForegroundColor Red
            Write-Host "Please provide either username/password or cookies." -ForegroundColor Red
            Show-Usage
        } else {
            Write-Host "Warning: Using cookies for authentication. Username/password is recommended as cookies may expire." -ForegroundColor Yellow
        }
    }
}

# Color output function
function Write-ColorOutput {
    param([string]$Text, [string]$Color = "White")
    
    $prevColor = $host.UI.RawUI.ForegroundColor
    $host.UI.RawUI.ForegroundColor = $Color
    Write-Output $Text
    $host.UI.RawUI.ForegroundColor = $prevColor
}

# Get current public IP address
function Get-CurrentIP {
    param([string]$IPVersion = "ipv4")
    
    $IP_SERVICES = @{}
    $IP_SERVICES["ipv4"] = @(
        "https://api.ipify.org",
        "https://ifconfig.me/ip",
        "https://icanhazip.com",
        "https://ipinfo.io/ip",
        "https://4.ipw.cn"
    )
    $IP_SERVICES["ipv6"] = @(
        "https://api6.ipify.org",
        "https://ifconfig.co",
        "https://icanhazip.com",
        "https://api6.my-ip.io/ip",
        "https://6.ipw.cn"
    )
    
    foreach ($service in $IP_SERVICES[$IPVersion]) {
        try {
            $current_ip = Invoke-RestMethod -Uri $service -TimeoutSec 10
            
            if ($IPVersion -eq "ipv4") {
                if ($current_ip -match "^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$") {
                    return $current_ip
                }
            }
            else {
                if ($current_ip -match "^([0-9a-fA-F]{0,4}:){1,7}[0-9a-fA-F]{0,4}$") {
                    return $current_ip
                }
            }
        }
        catch {
        }
    }
    
    return $null
}

# Generate authorization header
function Get-AuthorizationHeader {
    if ($username -and $password) {
        $pair = "$($username):$($password)"
        $bytes = [System.Text.Encoding]::ASCII.GetBytes($pair)
        $base64 = [System.Convert]::ToBase64String($bytes)
        $headers = @{
            "Authorization" = "Basic $base64"
        }
        
        if ($DEBUG -eq 1) {
            Write-Host "DEBUG: Using Basic Authentication"
            Write-Host "DEBUG: Username: $username"
            # Do not print password for security
        }
    }
    elseif ($cookies) {
        $headers = @{
            "Cookie" = $cookies
        }
        
        if ($DEBUG -eq 1) {
            Write-Host "DEBUG: Using Cookie Authentication"
            Write-Host "DEBUG: Cookies: $cookies"
        }
    }
    else {
        Write-ColorOutput "Error: Please provide username/password or cookies for authentication." "Red"
        exit 1
    }
    
    return $headers
}

# Get current domain's DNS record for specific IP version
function Get-CurrentRecord {
    param([string]$IPVersion = "ipv4")
    
    $headers = Get-AuthorizationHeader

    try {
        $response = Invoke-RestMethod -Uri "$base_url/control/rewrite/list" -Headers $headers -Method Get
        
        if ($DEBUG -eq 1) {
            Write-Host "DEBUG: Records response: $($response | ConvertTo-Json -Depth 10)"
        }
        
        foreach ($record in $response) {
            if ($record.domain -eq $domain) {
                if ($IPVersion -eq "ipv4" -and $record.answer -match "^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$") {
                    return $record
                }
                elseif ($IPVersion -eq "ipv6" -and $record.answer -match "^([0-9a-fA-F]{0,4}:){1,7}[0-9a-fA-F]{0,4}$") {
                    return $record
                }
            }
        }
    }
    catch {
        Write-ColorOutput "Failed to get DNS record: $_" "Red"
        if ($DEBUG -eq 1) {
            Write-Host "DEBUG: Error details: $($_.Exception.Message)"
        }
    }
    
    return $null
}

# Delete existing DNS record
function Remove-ExistingRecord {
    param($Record)
    
    
    $baseHeaders = Get-AuthorizationHeader
    $headers = @{
        "Content-Type" = "application/json"
    }
    foreach ($key in $baseHeaders.Keys) {
        $headers[$key] = $baseHeaders[$key]
    }
    
    try {
        $body = $Record | ConvertTo-Json -Compress
        $response = Invoke-RestMethod -Uri "$base_url/control/rewrite/delete" -Headers $headers -Method Post -Body $body
        Write-ColorOutput "Successfully deleted existing DNS record" "Green"
        return $true
    }
    catch {
        Write-ColorOutput "Issue deleting existing record, continuing with update..." "Yellow"
        return $false
    }
}

# Create new DNS record
function Add-NewRecord {
    param(
        [string]$NewIP,
        [string]$IPVersion = "ipv4"
    )
    
    
    $baseHeaders = Get-AuthorizationHeader
    $headers = @{
        "Content-Type" = "application/json"
    }
    foreach ($key in $baseHeaders.Keys) {
        $headers[$key] = $baseHeaders[$key]
    }
    
    $body = @{
        domain = $domain
        answer = $NewIP
    } | ConvertTo-Json -Compress
    
    try {
        $response = Invoke-RestMethod -Uri "$base_url/control/rewrite/add" -Headers $headers -Method Post -Body $body
        Write-ColorOutput "$IPVersion DNS record created successfully" "Green"
        return $true
    }
    catch {
        Write-ColorOutput "Failed to create $IPVersion DNS record" "Red"
        return $false
    }
}

# Update DNS record
function Update-DNSRecord {
    param([string]$IPVersion = "ipv4")
    
    
    $temp_file = if ($IPVersion -eq "ipv4") { $TEMP_FILE_IPV4 } else { $TEMP_FILE_IPV6 }
    
    # Get current public IP
    $current_ip = Get-CurrentIP -IPVersion $IPVersion
    if (-not $current_ip) {
        Write-ColorOutput "Warning: Unable to get current $IPVersion address" "Yellow"
        return
    }
    Write-ColorOutput "Current public ${IPVersion}: $current_ip" "Green"
    
    # Get current DNS record
    $existing_record = Get-CurrentRecord -IPVersion $IPVersion
    
    if ($existing_record) {
        
        # Compare IPs
        if ($existing_record.answer -eq $current_ip) {
            Write-ColorOutput "$IPVersion DNS record is up to date ($domain -> $current_ip)" "Green"
            return
        }
        
        Write-ColorOutput "Updating $domain $IPVersion record: $($existing_record.answer) -> $current_ip" "Yellow"

        # Update existing record
        $baseHeaders = Get-AuthorizationHeader
        $headers = @{
            "Content-Type" = "application/json"
        }
        foreach ($key in $baseHeaders.Keys) {
            $headers[$key] = $baseHeaders[$key]
        }
        
        # Create the correct request body format for updating DNS record
        # Based on the test script, the format should be:
        # {"target": {original_record}, "update": {modified_record}}
        $updateRecord = $existing_record | ConvertTo-Json -Depth 10 | ConvertFrom-Json
        $updateRecord.answer = $current_ip
        
        $body = @{
            target = $existing_record
            update = $updateRecord
        } | ConvertTo-Json -Compress
        
        try {
            if ($DEBUG -eq 1) {
                Write-Host "DEBUG: Sending update request to $base_url/control/rewrite/update"
                Write-Host "DEBUG: Headers: $($headers | ConvertTo-Json -Compress)"
                Write-Host "DEBUG: Body: $body"
            }
            
            $response = Invoke-RestMethod -Uri "$base_url/control/rewrite/update" -Headers $headers -Method Put -Body $body
            Write-ColorOutput "$IPVersion DNS record updated successfully" "Green"
            # Save current IP for next comparison
            $current_ip | Out-File -FilePath $temp_file
        }
        catch {
            Write-ColorOutput "Failed to update $IPVersion DNS record" "Red"
            if ($DEBUG -eq 1) {
                Write-Host "DEBUG: Error details: $($_.Exception.Message)"
                Write-Host "DEBUG: Error details: $($_ | Out-String)"
            }
        }
    }
    else {
        Write-ColorOutput "Domain $domain has no $IPVersion record yet" "Yellow"
        # Create new record
        Add-NewRecord -NewIP $current_ip -IPVersion $IPVersion
    }
}

# Main function
function Start-DDNSUpdate {
    Write-ColorOutput "AdGuard Private DDNS Update Script" "Cyan"
    Write-ColorOutput "===================" "Cyan"
    
    # Check if all essential parameters are provided
    Check-Params

    # Check authentication method
    Check-Auth
    
    # Update IPv4 record if enabled
    if ($enable_ipv4) {
        Write-ColorOutput "`nUpdating IPv4 record" "Cyan"
        Write-ColorOutput "------------------" "Cyan"
        Update-DNSRecord -IPVersion "ipv4"
    }
    else {
        Write-ColorOutput "`nIPv4 updates disabled" "Yellow"
    }
    
    # Update IPv6 record if enabled
    if ($enable_ipv6) {
        Write-ColorOutput "`nUpdating IPv6 record" "Cyan"
        Write-ColorOutput "------------------" "Cyan"
        Update-DNSRecord -IPVersion "ipv6"
    }
    else {
        Write-ColorOutput "`nIPv6 updates disabled" "Yellow"
    }
    
    Write-ColorOutput "`nDDNS update completed" "Green"
}

# Execute main function
Start-DDNSUpdate
