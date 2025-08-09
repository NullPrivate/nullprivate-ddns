# AdGuard Privat DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Detta projekt bidrog av [@jqknono](https://github.com/jqknono).

## Översikt

AdGuard Privat DDNS syftar till att erbjuda ett enkelt sätt att snabbt sätta upp en privat dynamisk DNS (DDNS) utan att behöva köpa en domän.
Detta DDNS-skript är utvecklat specifikt för [nullprivate.com](https://nullprivate.com), och genom att utnyttja AdGuardPrivats grundläggande funktioner kan du sömlöst implementera denna funktion.
Om du redan har självdistribuerat AdGuardHome kan du också använda detta skript för att konfigurera AdGuardHomes DDNS.

## Komma igång

### AdGuardPrivate

![AdGuardPrivate](./assets/nullprivate.webp)

1. Har distribuerat och kör AdGuardPrivate
2. Navigera till **DNS-omskrivning**, ladda ner DDNS-skriptet
3. Kör skriptet

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

1. Har distribuerat och kör AdGuardHome
2. Ladda ner skriptet från [release](https://github.com/AdGuardPrivate/nullprivate-ddns/releases)
3. Kör skriptet

**Windows**

```powershell
# Kör skriptet i denna session
Set-ExecutionPolicy Bypass -Scope Process
.\ddns.ps1 -BaseUrl <base_url> -Username <username> -Password <password> -Domain <domain>
```

**Linux/macOS**

```shell
chmod +x ddns.sh
./ddns.sh -b <base_url> -u <username> -p <password> -d <domain>
```

## Funktioner

- Snabb och enkel att sätta upp.
- Utnyttjar AdGuardPrivate för DDNS-funktionalitet.
- Stöd för Windows och Unix-baserade system.
- Flera autentiseringsalternativ: cookies (säkrare men kan gå ut) eller användarnamn/lösenord (mer beständigt men mindre säkert).
- **AdGuardHome-stöd**: Fullt kompatibel med AdGuardHome, utnyttjar dess funktioner för sömlös DDNS-konfiguration.

## Skillnader mot traditionell DDNS

Till skillnad från traditionell DDNS har denna privata DDNS följande fördelar:

- **Ingen cachetid**: Ändringar träder i kraft omedelbart, ingen väntan på att DNS-cachen ska upphöra.
- **Ingen DNS-spridning**: Uppdateringar är omedelbart tillgängliga, ingen fördröjning från DNS-spridning.
- **Inget behov av att köpa domän**: Du kan använda en pseudodomän för åtkomst, vilket eliminerar behovet av att köpa en domän.
- **Integritetsskydd**: Endast användare anslutna till den privata DNS-tjänsten kan lösa DNS, vilket säkerställer integritet.

## Komma igång-guide

1. Se till att AdGuardPrivate eller AdGuardHome är installerat och körs.
2. Följ instruktionerna i skripten `win/ddns.ps1` (för Windows) eller `unix/ddns.sh` (för Unix-baserade system) för att konfigurera din privata DDNS.

## Licens

Detta projekt är licensierat under villkoren i [LICENS](LICENSE) som ingår i förrådet.