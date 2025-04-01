# AdGuard Privat DDNS

[Engelsk](readme.md) | [Fransk](readme.fr.md) | [Portugisisk](readme.pt.md) | [Italiensk](readme.it.md) | [Polsk](readme.pl.md) | [Tyrkisk](readme.tr.md) | [Spansk](readme.es.md) | [Tysk](readme.de.md) | [Japansk](readme.ja.md) | [Kinesisk](readme.zh.md) | [Russisk](readme.ru.md) | [Arabisk](readme.ar.md) | [Koreansk](readme.ko.md) | [Hollandsk](readme.nl.md) | [Dansk](readme.da.md) | [Finsk](readme.fi.md) | [Norsk](readme.no.md) | [Svensk](readme.sv.md)

Dette projekt er bidraget af [@jqknono](https://github.com/jqknono).

## Oversigt

AdGuard Privat DDNS har til formål at tilbyde en nem måde at opsætte en hurtig privat dynamisk DNS (DDNS) uden behov for at købe et domænenavn. Dette DDNS-script er specifikt udviklet til [adguardprivate.com](https://adguardprivate.com), og ved at udnytte AdGuardPrivates grundlæggende funktionalitet kan du opnå dette problemfrit.

## Funktioner

- Hurtig og nem opsætning.
- Udnytter AdGuardPrivate til DDNS-funktionalitet.
- Understøtter både Windows og Unix-baserede systemer.
- Flere autentificeringsmuligheder: cookies (sikrere, men kan udløbe) eller brugernavn/adgangskode (mere vedholdende, men mindre sikker).
- **AdGuardHome-understøttelse**: Fuldt kompatibel med AdGuardHome og udnytter dens funktionalitet til problemfri DDNS-opsætning.

## Forskel fra traditionel DDNS

I modsætning til traditionel DDNS har denne private DDNS følgende fordele:

- **Ingen cachetid**: Ændringer træder i kraft øjeblikkeligt uden at vente på DNS-cachens udløb.
- **Ingen DNS-propagering**: Opdateringer er øjeblikkeligt tilgængelige uden behov for DNS-propageringstider.
- **Ingen køb af domæne kræves**: Du kan bruge pseudodomæner til adgang, hvilket eliminerer behovet for at købe et domænenavn.
- **Beskyttelse af privatliv**: Kun brugere, der er tilsluttet den private DNS-tjeneste, kan løse DNS'en, hvilket sikrer privatliv.

## Kom godt i gang

1. Sørg for, at du har AdGuardPrivate eller AdGuardHome installeret og kørende.
2. Følg instruktionerne i `win/ddns.ps1` (for Windows) eller `unix/ddns.sh` (for Unix-baserede systemer) scripts til at konfigurere din private DDNS.

## Licens

Dette projekt er licenseret under betingelserne i [LICENSE](LICENSE) inkluderet i arkivet.