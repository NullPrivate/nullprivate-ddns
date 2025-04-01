# AdGuard Private DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Dette prosjektet er bidratt av [@jqknono](https://github.com/jqknono).

## Oversikt

AdGuard Private DDNS har som mål å tilby en enkel måte å sette opp en rask privat dynamisk DNS (DDNS) uten behov for å kjøpe et domenenavn. Dette DDNS-scriptet er spesielt utviklet for [adguardprivate.com](https://adguardprivate.com) og ved å utnytte den grunnleggende funksjonaliteten til AdGuardPrivate, kan du oppnå dette sømløst.

## Funksjoner

- Rask og enkel oppsett.
- Benytter AdGuardPrivate for DDNS-funksjonalitet.
- Støtter både Windows og Unix-baserte systemer.
- Flere autentiseringsalternativer: informasjonskapsler (sikrere men kan utløpe) eller brukernavn/passord (mer vedvarende men mindre sikkert).
- **AdGuardHome-støtte**: Fullt kompatibel med AdGuardHome, utnytter dens funksjonalitet for sømløs DDNS-oppsett.

## Forskjell fra tradisjonell DDNS

I motsetning til tradisjonell DDNS, har denne private DDNS følgende fordeler:

- **Ingen hurtiglager-tid**: Endringer trer i kraft umiddelbart uten å vente på utløp av DNS-hurtiglager.
- **Ingen DNS-propagering**: Oppdateringer er umiddelbart tilgjengelige uten behov for DNS-propagering-forsinkelser.
- **Ingen domenekjøp nødvendig**: Du kan bruke pseudo-domener for tilgang, noe som eliminerer behovet for å kjøpe et domenenavn.
- **Personvernvern**: Kun brukere koblet til den private DNS-tjenesten kan løse DNS, noe som sikrer personvern.

## Komme i gang

1. Sørg for at du har AdGuardPrivate eller AdGuardHome installert og kjører.
2. Følg instruksjonene som er gitt i `win/ddns.ps1` (for Windows) eller `unix/ddns.sh` (for Unix-baserte systemer) skript for å konfigurere din private DDNS.

## Lisens

Dette prosjektet er lisensiert under vilkårene i [LICENSE](LICENSE) inkludert i repositoriet.