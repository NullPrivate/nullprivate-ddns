# AdGuard Private DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Dit project wordt bijgedragen door [@jqknono](https://github.com/jqknono).

## Overzicht

AdGuard Private DDNS heeft als doel een eenvoudige manier te bieden om een snelle privé Dynamic DNS (DDNS) in te stellen zonder de noodzaak om een domeinnaam te kopen. Dit DDNS-script is specifiek ontwikkeld voor [adguardprivate.com](https://adguardprivate.com) en door gebruik te maken van de basisfunctionaliteit van AdGuardPrivate, kunt u dit naadloos bereiken.

## Functies

- Snelle en eenvoudige installatie.
- Maakt gebruik van AdGuardPrivate voor DDNS-functionaliteit.
- Ondersteunt zowel Windows als Unix-gebaseerde systemen.
- Meerdere authenticatieopties: cookies (veiliger maar kunnen verlopen) of gebruikersnaam/wachtwoord (meer persistent maar minder veilig).
- **AdGuardHome Ondersteuning**: Volledig compatibel met AdGuardHome, maakt gebruik van de functionaliteit voor een naadloze DDNS-installatie.

## Verschil met Traditionele DDNS

In tegenstelling tot traditionele DDNS, heeft deze privé DDNS de volgende voordelen:

- **Geen Cachetijd**: Wijzigingen treden onmiddellijk in werking zonder te wachten op de vervaldatum van de DNS-cache.
- **Geen DNS-Propagatie**: Updates zijn onmiddellijk beschikbaar zonder vertragingen door DNS-propagatie.
- **Geen Domeinaankoop Vereist**: U kunt pseudodomeinen gebruiken voor toegang, waardoor de aankoop van een domeinnaam niet nodig is.
- **Privacybescherming**: Alleen gebruikers die zijn verbonden met de privé DNS-service kunnen de DNS oplossen, wat privacy waarborgt.

## Aan de slag

1. Zorg ervoor dat u AdGuardPrivate of AdGuardHome hebt geïnstalleerd en draaiend.
2. Volg de instructies die worden gegeven in het `win/ddns.ps1` (voor Windows) of `unix/ddns.sh` (voor Unix-gebaseerde systemen) script om uw privé DDNS te configureren.

## Licentie

Dit project is gelicentieerd onder de voorwaarden van de [LICENSE](LICENSE) die in de repository is opgenomen.