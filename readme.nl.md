# AdGuard Privé DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Dit project is bijgedragen door [@jqknono](https://github.com/jqknono).

## Overzicht

AdGuard Privé DDNS is ontworpen om een eenvoudige manier te bieden om snel een privé dynamische DNS (DDNS) in te stellen zonder een domeinnaam te hoeven kopen.
Dit DDNS-script is speciaal ontwikkeld voor [nullprivate.com](https://nullprivate.com), door gebruik te maken van de basisfunctionaliteit van NullPrivate kunt u deze functie naadloos implementeren.
Als u AdGuardHome zelf hebt geïmplementeerd, kunt u dit script ook gebruiken om de DDNS van AdGuardHome in te stellen.

## Aan de slag

### NullPrivate

![NullPrivate](./assets/nullprivate.webp)

1. NullPrivate is geïmplementeerd en actief
2. Navigeer naar **DNS Herschrijving**, download het DDNS-script
3. Voer het script uit

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

1. AdGuardHome is geïmplementeerd en actief
2. Download het script van [release](https://github.com/NullPrivate/nullprivate-ddns/releases)
3. Voer het script uit

**Windows**

```powershell
# Voer het script uit in deze sessie
Set-ExecutionPolicy Bypass -Scope Process
.\ddns.ps1 -BaseUrl <base_url> -Username <username> -Password <password> -Domain <domain>
```

**Linux/macOS**

```shell
chmod +x ddns.sh
./ddns.sh -b <base_url> -u <username> -p <password> -d <domain>
```

## Functies

- Snel en eenvoudig in te stellen.
- Maakt gebruik van NullPrivate voor DDNS-functionaliteit.
- Ondersteuning voor Windows en Unix-gebaseerde systemen.
- Meerdere authenticatie-opties: cookies (veiliger maar kunnen verlopen) of gebruikersnaam/wachtwoord (duurzamer maar minder veilig).
- **AdGuardHome-ondersteuning**: Volledig compatibel met AdGuardHome, maakt gebruik van zijn functionaliteit voor naadloze DDNS-instelling.

## Verschil met traditionele DDNS

In tegenstelling tot traditionele DDNS heeft deze privé DDNS de volgende voordelen:

- **Geen cachetijd**: Wijzigingen zijn direct van kracht, zonder te wachten op het verlopen van DNS-cache.
- **Geen DNS-propagatie**: Updates zijn direct beschikbaar, zonder vertraging door DNS-propagatie.
- **Geen domeinnaam nodig**: U kunt een pseudodomeinnaam gebruiken voor toegang, waardoor het kopen van een domeinnaam overbodig is.
- **Privacybescherming**: Alleen gebruikers die verbonden zijn met de privé DNS-service kunnen DNS oplossen, wat privacy garandeert.

## Startgids

1. Zorg ervoor dat NullPrivate of AdGuardHome is geïnstalleerd en actief is.
2. Volg de instructies in het script `win/ddns.ps1` (voor Windows) of `unix/ddns.sh` (voor Unix-gebaseerde systemen) om uw privé DDNS te configureren.

## Licentie

Dit project is gelicentieerd onder de voorwaarden van de [LICENTIE](LICENSE) inbegrepen in de repository.