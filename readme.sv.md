# AdGuard Privat DDNS

[Engelska](readme.md) | [Franska](readme.fr.md) | [Portugisiska](readme.pt.md) | [Italienska](readme.it.md) | [Polska](readme.pl.md) | [Turkiska](readme.tr.md) | [Spanska](readme.es.md) | [Tyska](readme.de.md) | [Japanska](readme.ja.md) | [Kinesiska](readme.zh.md) | [Ryska](readme.ru.md) | [Arabiska](readme.ar.md) | [Koreanska](readme.ko.md) | [Nederländska](readme.nl.md) | [Danska](readme.da.md) | [Finska](readme.fi.md) | [Norska](readme.no.md) | [Svenska](readme.sv.md)

Detta projekt bidrar av [@jqknono](https://github.com/jqknono).

## Översikt

AdGuard Privat DDNS syftar till att erbjuda ett enkelt sätt att sätta upp en snabb privat dynamisk DNS (DDNS) utan behovet att köpa ett domännamn. Detta DDNS-skript är specifikt utvecklat för [adguardprivate.com](https://adguardprivate.com) och genom att utnyttja AdGuardPrivates basfunktioner kan du uppnå detta sömlöst.

## Funktioner

- Snabb och enkel installation.
- Använder AdGuardPrivate för DDNS-funktionalitet.
- Stödjer både Windows och Unix-baserade system.
- Flera autentiseringsalternativ: cookies (säkrare men kan upphöra) eller användarnamn/lösenord (mer beständigt men mindre säkert).
- **AdGuardHome-stöd**: Fullt kompatibel med AdGuardHome, utnyttjar dess funktionalitet för sömlös DDNS-installation.

## Skillnad från traditionell DDNS

Till skillnad från traditionell DDNS har denna privata DDNS följande fördelar:

- **Ingen cachetid**: Ändringar träder i kraft omedelbart utan att vänta på att DNS-cachen ska upphöra.
- **Ingen DNS-propagering**: Uppdateringar är omedelbart tillgängliga utan behov av DNS-propagationsfördröjningar.
- **Inget domänköp krävs**: Du kan använda pseudodomäner för åtkomst, vilket eliminerar behovet att köpa ett domännamn.
- **Skydd av integritet**: Endast användare som är anslutna till den privata DNS-tjänsten kan lösa DNS, vilket säkerställer integritet.

## Komma igång

1. Se till att du har AdGuardPrivate eller AdGuardHome installerat och igång.
2. Följ instruktionerna som ges i `win/ddns.ps1` (för Windows) eller `unix/ddns.sh` (för Unix-baserade system) skript för att konfigurera din privata DDNS.

## Licens

Detta projekt är licensierat enligt villkoren i [LICENSE](LICENSE) som ingår i förvaret.