# AdGuard Yksityinen DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Tämän projektin on luonut [@jqknono](https://github.com/jqknono).

## Yleiskatsaus

AdGuard Yksityinen DDNS tarjoaa yksinkertaisen tavan nopeaan dynaamisen DNS:n (DDNS) asetukseen ilman verkkotunnuksen ostamista.
Tämä DDNS-skripti on kehitetty erityisesti [adguardprivate.com](https://adguardprivate.com) -palvelua varten, ja AdGuardPrivate:n perustoimintoja hyödyntämällä voit saada tämän toiminnon käyttöösi saumattomasti.
Jos olet jo asentanut AdGuardHome:n, voit käyttää tätä skriptiä myös AdGuardHome:n DDNS:n asetukseen.

## Käyttöönotto

### AdGuardPrivate

![AdGuardPrivate](./assets/adguardprivate.webp)

1. AdGuardPrivate on asennettu ja käynnissä
2. Siirry **DNS-ohitukset** -osioon ja lataa DDNS-skripti
3. Suorita skripti

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

1. AdGuardHome on asennettu ja käynnissä
2. Lataa skripti [release](https://github.com/AdGuardPrivate/adguardprivate-ddns/releases) -sivulta
3. Suorita skripti

**Windows**

```powershell
# Suorita skripti nykyisessä istunnossa
Set-ExecutionPolicy Bypass -Scope Process
.\ddns.ps1 -BaseUrl <base_url> -Username <username> -Password <password> -Domain <domain>
```

**Linux/macOS**

```shell
chmod +x ddns.sh
./ddns.sh -b <base_url> -u <username> -p <password> -d <domain>
```

## Ominaisuudet

- Nopea ja helppo asentaa
- Hyödyntää AdGuardPrivatea DDNS-toiminnon toteuttamiseen
- Tukee Windowsia ja Unix-pohjaisia järjestelmiä
- Useita tunnistautumisvaihtoehtoja: evästeet (turvallisempi, mutta voi vanhentua) tai käyttäjätunnus/salasana (kestävämpi, mutta vähemmän turvallinen)
- **AdGuardHome-tuki**: Täysin yhteensopiva AdGuardHomen kanssa, hyödyntäen sen toimintoja saumattomaan DDNS-asetukseen

## Erot perinteiseen DDNS:ään verrattuna

Toisin kuin perinteinen DDNS, tällä yksityisellä DDNS:llä on seuraavat edut:

- **Ei välimuistiaikarajoja**: Muutokset tulevat voimaan välittömästi, eikä DNS-välimuistin vanhenemista tarvitse odottaa
- **Ei DNS-levitystä**: Päivitykset ovat käytettävissä välittömästi ilman DNS-levityksen viivettä
- **Ei verkkotunnuksen ostamista**: Voit käyttää pseudoverkkotunnusta, mikä poistaa verkkotunnuksen ostamisen tarpeen
- **Yksityisyyden suojaus**: Vain yksityiseen DNS-palveluun yhdistäneet käyttäjät voivat selvittää DNS:n, mikä takaa yksityisyyden

## Aloitusopas

1. Varmista, että AdGuardPrivate tai AdGuardHome on asennettu ja käynnissä
2. Noudata `win/ddns.ps1` (Windows) tai `unix/ddns.sh` (Unix-pohjaiset järjestelmät) -skripteissä annettuja ohjeita yksityisen DDNS:n määrittämiseksi

## Lisenssi

Tämä projekti on lisensoitu säilytyspaikassa olevan [LICENSE](LICENSE) -dokumentin ehtojen mukaisesti.