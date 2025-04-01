# AdGuard Private DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Dieses Projekt wird von [@jqknono](https://github.com/jqknono) beigetragen.

## Überblick

AdGuard Private DDNS zielt darauf ab, eine einfache Möglichkeit zu bieten, eine schnelle private dynamische DNS (DDNS) ohne den Kauf einer Domain einzurichten. Dieses DDNS-Skript wurde speziell für [adguardprivate.com](https://adguardprivate.com) entwickelt und durch die Nutzung der Basis-Funktionalität von AdGuardPrivate können Sie dies nahtlos erreichen.

## Funktionen

- Schnelle und einfache Einrichtung.
- Nutzt AdGuardPrivate für DDNS-Funktionalität.
- Unterstützt sowohl Windows- als auch Unix-basierte Systeme.
- Mehrere Authentifizierungsoptionen: Cookies (sicherer, aber möglicherweise ablaufend) oder Benutzername/Passwort (dauerhafter, aber weniger sicher).
- **AdGuardHome Unterstützung**: Vollständig kompatibel mit AdGuardHome, nutzt dessen Funktionalität für eine nahtlose DDNS-Einrichtung.

## Unterschied zu traditionellem DDNS

Im Gegensatz zu traditionellem DDNS hat dieses private DDNS die folgenden Vorteile:

- **Keine Cache-Zeit**: Änderungen treten sofort in Kraft, ohne auf das Ablaufen des DNS-Caches zu warten.
- **Keine DNS-Propagation**: Updates sind sofort verfügbar, ohne Verzögerungen durch DNS-Propagation.
- **Kein Domainkauf erforderlich**: Sie können Pseudo-Domains für den Zugriff verwenden, was den Kauf einer Domain überflüssig macht.
- **Datenschutz**: Nur Benutzer, die mit dem privaten DNS-Dienst verbunden sind, können die DNS auflösen, was den Datenschutz gewährleistet.

## Einstieg

1. Stellen Sie sicher, dass AdGuardPrivate oder AdGuardHome installiert und in Betrieb ist.
2. Befolgen Sie die Anweisungen in den Skripten `win/ddns.ps1` (für Windows) oder `unix/ddns.sh` (für Unix-basierte Systeme), um Ihre private DDNS zu konfigurieren.

## Lizenz

Dieses Projekt ist unter den Bedingungen der [LICENSE](LICENSE) lizenziert, die im Repository enthalten ist.