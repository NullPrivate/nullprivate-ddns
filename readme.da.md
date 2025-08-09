# AdGuard Privat DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Dette projekt er bidraget af [@jqknono](https://github.com/jqknono).

## Oversigt

AdGuard Privat DDNS har til formål at give en enkel metode til hurtigt at opsætte en privat dynamisk DNS (DDNS) uden at skulle købe et domæne.
Dette DDNS-script er udviklet specifikt til [nullprivate.com](https://nullprivate.com), og ved at udnytte AdGuardPrivats kernefunktioner kan du implementere denne funktion problemfrit.
Hvis du allerede har selv-installeret AdGuardHome, kan du også bruge dette script til at konfigurere AdGuardHomes DDNS.

## Kom i gang

### AdGuardPrivate

![AdGuardPrivate](./assets/nullprivate.webp)

1. Har AdGuardPrivate installeret og kørende
2. Naviger til **DNS-omskrivning**, download DDNS-scriptet
3. Kør scriptet

**Windows**

```powershell
Set-ExecutionPolicy Bypass -Scope Process
.\ddns-script.ps1
```

**linux/macOS**

```shell
chmod +x ddns-script.sh
./ddns-script.sh
```

### AdGuardHome

![AdGuardHome](./assets/adguardhome.webp)

1. Har AdGuardHome installeret og kørende
2. Download scriptet fra [release](https://github.com/AdGuardPrivate/nullprivate-ddns/releases)
3. Kør scriptet

**Windows**

```powershell
# Kør scriptet i denne session
Set-ExecutionPolicy Bypass -Scope Process
.\ddns.ps1 -BaseUrl <base_url> -Username <username> -Password <password> -Domain <domain>
```

**Linux/macOS**

```shell
chmod +x ddns.sh
./ddns.sh -b <base_url> -u <username> -p <password> -d <domain>
```

## Funktioner

- Hurtig og nem opsætning.
- Udnytter AdGuardPrivate til DDNS-funktionalitet.
- Understøtter Windows og Unix-baserede systemer.
- Flere godkendelsesmuligheder: cookies (mere sikre men kan udløbe) eller brugernavn/adgangskode (mere vedvarende men mindre sikkert).
- **AdGuardHome-understøttelse**: Fuldt kompatibel med AdGuardHome, udnytter dets funktioner til problemfri DDNS-opsætning.

## Forskelle fra traditionel DDNS

I modsætning til traditionel DDNS har denne private DDNS følgende fordele:

- **Ingen cachetid**: Ændringer træder i kraft med det samme, ingen ventetid på DNS-cacheudløb.
- **Ingen DNS-spredning**: Opdateringer er tilgængelige med det samme, ingen forsinkelse fra DNS-spredning.
- **Ingen behov for at købe domæne**: Du kan bruge et pseudo-domæne til adgang, hvilket eliminerer behovet for at købe et domæne.
- **Privatlivsbeskyttelse**: Kun brugere, der er forbundet til den private DNS-tjeneste, kan løse DNS, hvilket sikrer privatliv.

## Kom godt i gang

1. Sørg for, at AdGuardPrivate eller AdGuardHome er installeret og kørende.
2. Følg vejledningen i scriptet `win/ddns.ps1` (til Windows) eller `unix/ddns.sh` (til Unix-baserede systemer) for at konfigurere din private DDNS.

## Licens

Dette projekt er licenseret under vilkårene i [LICENSE](LICENSE), som er inkluderet i repositoryet.