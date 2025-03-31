# AdGuard Private DDNS

[中文文档](readmes/readme.zh-cn.md)

This project is contributed by [@jqknono](https://github.com/jqknono).

## Overview

AdGuard Private DDNS aims to provide an easy way to set up a quick private Dynamic DNS (DDNS) without the need to purchase a domain name. By leveraging the base functionality of AdGuardHome, you can achieve this seamlessly.

## Features

- Quick and easy setup.
- Utilizes AdGuardPrivate for DDNS functionality.
- Supports both Windows and Unix-based systems.

## Difference from Traditional DDNS

Unlike traditional DDNS, this private DDNS has the following advantages:

- **No Cache Time**: Changes take effect immediately without waiting for DNS cache expiration.
- **No DNS Propagation**: Updates are instantly available without the need for DNS propagation delays.
- **No Domain Purchase Required**: You can use pseudo-domains for access, eliminating the need to buy a domain name.
- **Privacy Protection**: Only users connected to the private DNS service can resolve the DNS, ensuring privacy.
- **AdGuardHome Support**: Fully compatible with AdGuardHome, leveraging its functionality for seamless DDNS setup.

## Getting Started

1. Ensure you have [AdGuardPrivate] installed and running.
2. Follow the instructions provided in the `win/ddns.ps1` (for Windows) or `unix/ddns.sh` (for Unix-based systems) scripts to configure your private DDNS.

## License

This project is licensed under the terms of the [LICENSE](LICENSE) included in the repository.
