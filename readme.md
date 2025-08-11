# AdGuard Private DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

This project is contributed by [@jqknono](https://github.com/jqknono).

## Overview

AdGuard Private DDNS aims to provide a simple method for quickly setting up private dynamic DNS (DDNS) without purchasing a domain name.  
This DDNS script is specifically developed for [nullprivate.com](https://nullprivate.com). By leveraging NullPrivate's core functionality, you can seamlessly implement this feature.  
If you have self-deployed AdGuardHome, you can also use this script to set up DDNS for AdGuardHome.

## Getting Started

### NullPrivate

![NullPrivate](./assets/nullprivate.webp)

1. Ensure NullPrivate is deployed and running  
2. Navigate to **DNS Rewrites**, download the DDNS script  
3. Run the script  

**Windows**

```powershell
Set-ExecutionPolicy Bypass -Scope Process
.\ddns-script.ps1
```

**Linux/macOS**

```shell
chmod +x ddns-script.sh
./ddns-script.sh
```

### AdGuardHome

![AdGuardHome](./assets/adguardhome.webp)

1. Ensure AdGuardHome is deployed and running  
2. Download the script from [releases](https://github.com/NullPrivate/nullprivate-ddns/releases)  
3. Run the script  

**Windows**

```powershell
# Run script in current session
Set-ExecutionPolicy Bypass -Scope Process
.\ddns.ps1 -BaseUrl <base_url> -Username <username> -Password <password> -Domain <domain>
```

**Linux/macOS**

```shell
chmod +x ddns.sh
./ddns.sh -b <base_url> -u <username> -p <password> -d <domain>
```

## Features

- Quick and easy setup  
- Leverages NullPrivate for DDNS functionality  
- Supports Windows and Unix-based systems  
- Multiple authentication options: cookies (more secure but may expire) or username/password (more persistent but less secure)  
- **AdGuardHome support**: Fully compatible with AdGuardHome, utilizing its features for seamless DDNS setup  

## Differences from Traditional DDNS

Unlike traditional DDNS, this private DDNS offers the following advantages:

- **No cache time**: Changes take effect immediately without waiting for DNS cache expiration  
- **No DNS propagation**: Updates are instantly available without DNS propagation delays  
- **No domain purchase required**: You can use pseudo-domains for access, eliminating the need to purchase a domain  
- **Privacy protection**: Only users connected to the private DNS service can resolve DNS, ensuring privacy  

## Getting Started Guide

1. Ensure NullPrivate or AdGuardHome is installed and running  
2. Follow the instructions provided in the `win/ddns.ps1` (for Windows) or `unix/ddns.sh` (for Unix-based systems) scripts to configure your private DDNS  

## License

This project is licensed under the terms included in the [LICENSE](LICENSE) file in the repository.