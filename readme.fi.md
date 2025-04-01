# AdGuard Private DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Tämän projektin on luonut [@jqknono](https://github.com/jqknono).

## Yleiskatsaus

AdGuard Private DDNS pyrkii tarjoamaan helpon tavan perustaa nopeasti yksityinen dynaaminen DNS (DDNS) ilman domain-nimen ostamista. Tämä DDNS-skripti on kehitetty erityisesti [adguardprivate.com](https://adguardprivate.com) -sivustolle, ja hyödyntämällä AdGuardPrivaten perustoimintoja voit saavuttaa tämän saumattomasti.

## Ominaisuudet

- Nopea ja helppo asennus.
- Käyttää AdGuardPrivatea DDNS-toiminnallisuuteen.
- Tukee sekä Windows- että Unix-pohjaisia järjestelmiä.
- Useita autentikointivaihtoehtoja: evästeet (turvallisempi, mutta voi vanhentua) tai käyttäjätunnus/salasana (pysyvämpi, mutta vähemmän turvallinen).
- **AdGuardHome-tuki**: Täysin yhteensopiva AdGuardHomen kanssa, hyödyntäen sen toimintoja saumattomaan DDNS-asennukseen.

## Ero perinteiseen DDNS:ään

Toisin kuin perinteinen DDNS, tällä yksityisellä DDNS:llä on seuraavat edut:

- **Ei välimuistiaikaa**: Muutokset astuvat voimaan välittömästi ilman DNS-välimuistin vanhenemista.
- **Ei DNS-leviämistä**: Päivitykset ovat välittömästi saatavilla ilman DNS-leviämisen viivettä.
- **Ei domain-ostotarvetta**: Voit käyttää pseudodomaineja pääsyn saamiseksi, mikä poistaa domain-nimen ostamisen tarpeen.
- **Yksityisyyden suoja**: Vain yksityiseen DNS-palveluun yhdistetyt käyttäjät voivat ratkaista DNS:n, mikä varmistaa yksityisyyden.

## Aloittaminen

1. Varmista, että sinulla on AdGuardPrivate tai AdGuardHome asennettuna ja käynnissä.
2. Noudata `win/ddns.ps1` (Windowsille) tai `unix/ddns.sh` (Unix-pohjaisille järjestelmille) skripteissä annettuja ohjeita yksityisen DDNS:n määrittämiseksi.

## Lisenssi

Tämä projekti on lisensoitu [LICENSE](LICENSE) -tiedostossa määriteltyjen ehtojen mukaisesti, joka on mukana arkistossa.