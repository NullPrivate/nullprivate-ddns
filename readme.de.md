# AdGuard Privates DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Dieses Projekt wurde von [@jqknono](https://github.com/jqknono) beigetragen.

## Übersicht

AdGuard Privates DDNS bietet eine einfache Methode zur schnellen Einrichtung eines privaten dynamischen DNS (DDNS) ohne den Kauf einer Domain.  
Dieses DDNS-Skript wurde speziell für [adguardprivate.com](https://adguardprivate.com) entwickelt. Durch die Nutzung der Grundfunktionen von AdGuardPrivate können Sie diese Funktionalität nahtlos implementieren.  
Wenn Sie AdGuardHome selbst bereitgestellt haben, können Sie dieses Skript auch zur Einrichtung des DDNS für AdGuardHome verwenden.

## Erste Schritte

### AdGuardPrivate

![AdGuardPrivate](./assets/adguardprivate.webp)

1. AdGuardPrivate ist bereits bereitgestellt und läuft.
2. Navigieren Sie zu **DNS-Umschreibung**, laden Sie das DDNS-Skript herunter.
3. Führen Sie das Skript aus.

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

1. AdGuardHome ist bereits bereitgestellt und läuft.
2. Laden Sie das Skript von [Release](https://github.com/AdGuardPrivate/adguardprivate-ddns/releases) herunter.
3. Führen Sie das Skript aus.

**Windows**

```powershell
# Skript in der aktuellen Sitzung ausführen
Set-ExecutionPolicy Bypass -Scope Process
.\ddns.ps1 -BaseUrl <base_url> -Username <username> -Password <password> -Domain <domain>
```

**Linux/macOS**

```shell
chmod +x ddns.sh
./ddns.sh -b <base_url> -u <username> -p <password> -d <domain>
```

## Funktionen

- Schnell und einfach einzurichten.
- Nutzt AdGuardPrivate für die DDNS-Funktionalität.
- Unterstützt Windows und Unix-basierte Systeme.
- Mehrere Authentifizierungsoptionen: Cookies (sicherer, können aber ablaufen) oder Benutzername/Passwort (länger haltbar, aber weniger sicher).
- **AdGuardHome-Unterstützung**: Vollständig kompatibel mit AdGuardHome, nutzt dessen Funktionen für eine nahtlose DDNS-Einrichtung.

## Unterschiede zu herkömmlichem DDNS

Im Vergleich zu herkömmlichem DDNS bietet dieses private DDNS folgende Vorteile:

- **Keine Cache-Zeit**: Änderungen werden sofort wirksam, ohne Wartezeit auf DNS-Cache-Ablauf.
- **Keine DNS-Verbreitung**: Updates sind sofort verfügbar, ohne Verzögerung durch DNS-Verbreitung.
- **Kein Domain-Kauf erforderlich**: Sie können eine Pseudodomain für den Zugriff verwenden, was den Kauf einer Domain überflüssig macht.
- **Datenschutz**: Nur Benutzer, die mit dem privaten DNS-Dienst verbunden sind, können das DNS auflösen, was die Privatsphäre gewährleistet.

## Anleitung für den Einstieg

1. Stellen Sie sicher, dass AdGuardPrivate oder AdGuardHome installiert und ausgeführt wird.
2. Befolgen Sie die Anweisungen in den Skripten `win/ddns.ps1` (für Windows) oder `unix/ddns.sh` (für Unix-basierte Systeme), um Ihr privates DDNS zu konfigurieren.

## Lizenz

Dieses Projekt ist unter den Bedingungen der im Repository enthaltenen [LICENSE](LICENSE) lizenziert.