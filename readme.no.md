# AdGuard Privat DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Dette prosjektet er bidratt av [@jqknono](https://github.com/jqknono).

## Oversikt

AdGuard Privat DDNS er designet for å tilby en enkel måte å raskt sette opp en privat dynamisk DNS (DDNS) uten å måtte kjøpe et domene.
Dette DDNS-skriptet er utviklet spesielt for [nullprivate.com](https://nullprivate.com), og ved å utnytte AdGuardPrivate sin grunnleggende funksjonalitet kan du implementere denne funksjonen sømløst.
Hvis du allerede har satt opp din egen AdGuardHome, kan du også bruke dette skriptet for å konfigurere AdGuardHome sin DDNS.

## Komme i gang

### AdGuardPrivate

![AdGuardPrivate](./assets/nullprivate.webp)

1. Har du allerede deployet og kjører AdGuardPrivate
2. Naviger til **DNS-omdirigering**, last ned DDNS-skriptet
3. Kjør skriptet

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

1. Har du allerede deployet og kjører AdGuardHome
2. Last ned skriptet fra [release](https://github.com/AdGuardPrivate/nullprivate-ddns/releases)
3. Kjør skriptet

**Windows**

```powershell
# Kjør skriptet i denne økten
Set-ExecutionPolicy Bypass -Scope Process
.\ddns.ps1 -BaseUrl <base_url> -Username <username> -Password <password> -Domain <domain>
```

**Linux/macOS**

```shell
chmod +x ddns.sh
./ddns.sh -b <base_url> -u <username> -p <password> -d <domain>
```

## Funksjoner

- Rask og enkel å sette opp.
- Utnytter AdGuardPrivate for å implementere DDNS-funksjonalitet.
- Støtter Windows og Unix-baserte systemer.
- Flere autentiseringsalternativer: informasjonskapsler (mer sikker, men kan utløpe) eller brukernavn/passord (mer varig, men mindre sikker).
- **AdGuardHome-støtte**: Fullt kompatibel med AdGuardHome, og utnytter dens funksjonalitet for sømløs DDNS-oppsett.

## Forskjell fra tradisjonell DDNS

I motsetning til tradisjonell DDNS, har denne private DDNS-en følgende fordeler:

- **Ingen cachetid**: Endringer treffer umiddelbart, ingen ventetid på at DNS-cachen utløper.
- **Ingen DNS-spredning**: Oppdateringer er umiddelbart tilgjengelige, ingen forsinkelse fra DNS-spredning.
- **Ingen behov for å kjøpe domene**: Du kan bruke et pseudo-domene for tilgang, noe som eliminerer behovet for å kjøpe et domene.
- **Personvernsbeskyttelse**: Bare brukere som er tilkoblet den private DNS-tjenesten kan løse DNS, noe som sikrer personvern.

## Komme i gang

1. Forsikre deg om at AdGuardPrivate eller AdGuardHome er installert og kjører.
2. Følg instruksjonene i `win/ddns.ps1` (for Windows) eller `unix/ddns.sh` (for Unix-baserte systemer) for å konfigurere din private DDNS.

## Lisens

Dette prosjektet er lisensiert under vilkårene i [LICENSE](LICENSE) som er inkludert i repositoriet.