# AdGuard Prywatny DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Ten projekt został dostarczony przez [@jqknono](https://github.com/jqknono).

## Przegląd

AdGuard Prywatny DDNS ma na celu zapewnienie prostego sposobu szybkiej konfiguracji prywatnego dynamicznego DNS (DDNS) bez konieczności zakupu domeny.
Ten skrypt DDNS został opracowany specjalnie dla [adguardprivate.com](https://adguardprivate.com), wykorzystując podstawowe funkcje AdGuardPrivate, aby umożliwić płynną realizację tej funkcji.
Jeśli samodzielnie wdrożyłeś AdGuardHome, możesz również użyć tego skryptu do skonfigurowania DDNS dla AdGuardHome.

## Rozpoczęcie pracy

### AdGuardPrivate

![AdGuardPrivate](./assets/adguardprivate.webp)

1. Wdrożono i uruchomiono AdGuardPrivate
2. Przejdź do **Przepisywania DNS**, pobierz skrypt DDNS
3. Uruchom skrypt

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

1. Wdrożono i uruchomiono AdGuardHome
2. Pobierz skrypt z [wydania](https://github.com/AdGuardPrivate/adguardprivate-ddns/releases)
3. Uruchom skrypt

**Windows**

```powershell
# Uruchom skrypt w bieżącej sesji
Set-ExecutionPolicy Bypass -Scope Process
.\ddns.ps1 -BaseUrl <base_url> -Username <username> -Password <password> -Domain <domain>
```

**Linux**

```shell
chmod +x ddns.sh
./ddns.sh -b <base_url> -u <username> -p <password> -d <domain>
```

## Funkcje

- Szybka i łatwa konfiguracja.
- Wykorzystanie AdGuardPrivate do realizacji funkcji DDNS.
- Obsługa systemów Windows i Unix.
- Wiele opcji uwierzytelniania: ciasteczka (bezpieczniejsze, ale mogą wygasnąć) lub nazwa użytkownika/hasło (trwalsze, ale mniej bezpieczne).
- **Obsługa AdGuardHome**: pełna kompatybilność z AdGuardHome, wykorzystująca jego funkcje do płynnej konfiguracji DDNS.

## Różnice w porównaniu z tradycyjnym DDNS

W przeciwieństwie do tradycyjnego DDNS, ten prywatny DDNS oferuje następujące korzyści:

- **Brak czasu buforowania**: zmiany są natychmiastowo widoczne, bez konieczności oczekiwania na wygaśnięcie pamięci podręcznej DNS.
- **Brak propagacji DNS**: aktualizacje są natychmiast dostępne, bez opóźnień związanych z propagacją DNS.
- **Brak konieczności zakupu domeny**: możesz używać pseudodomen do dostępu, eliminując potrzebę zakupu domeny.
- **Ochrona prywatności**: tylko użytkownicy podłączeni do prywatnej usługi DNS mogą rozwiązywać DNS, zapewniając prywatność.

## Przewodnik wprowadzający

1. Upewnij się, że AdGuardPrivate lub AdGuardHome jest zainstalowany i działa.
2. Postępuj zgodnie z instrukcjami zawartymi w skryptach `win/ddns.ps1` (dla Windows) lub `unix/ddns.sh` (dla systemów Unix), aby skonfigurować swój prywatny DDNS.

## Licencja

Ten projekt jest licencjonowany na warunkach zawartych w [LICENCJI](LICENSE) dołączonej do repozytorium.