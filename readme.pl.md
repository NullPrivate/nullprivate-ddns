# AdGuard Private DDNS

[中文文档](readme.zh-cn.md)

Ten projekt jest współtworzony przez [@jqknono](https://github.com/jqknono).

## Przegląd

AdGuard Private DDNS ma na celu zapewnienie łatwego sposobu na szybkie ustawienie prywatnego Dynamicznego DNS (DDNS) bez konieczności zakupu nazwy domeny. Ten skrypt DDNS został specjalnie opracowany dla [adguardprivate.com](https://adguardprivate.com) i dzięki wykorzystaniu podstawowej funkcjonalności AdGuardPrivate, możesz to osiągnąć bezproblemowo.

## Funkcje

- Szybka i łatwa konfiguracja.
- Wykorzystuje AdGuardPrivate do funkcjonalności DDNS.
- Obsługuje zarówno systemy Windows, jak i oparte na Unixie.
- Wiele opcji uwierzytelniania: ciasteczka (bezpieczniejsze, ale mogą wygasnąć) lub nazwa użytkownika/hasło (bardziej trwałe, ale mniej bezpieczne).
- **Wsparcie AdGuardHome**: Pełna kompatybilność z AdGuardHome, wykorzystująca jego funkcjonalność do bezproblemowej konfiguracji DDNS.

## Różnice w stosunku do tradycyjnego DDNS

W odróżnieniu od tradycyjnego DDNS, ten prywatny DDNS ma następujące zalety:

- **Brak czasu buforowania**: Zmiany wchodzą w życie natychmiast bez konieczności oczekiwania na wygaśnięcie pamięci podręcznej DNS.
- **Brak propagacji DNS**: Aktualizacje są natychmiast dostępne bez potrzeby opóźnień w propagacji DNS.
- **Brak konieczności zakupu domeny**: Możesz używać pseudodomen do dostępu, eliminując potrzebę kupowania nazwy domeny.
- **Ochrona prywatności**: Tylko użytkownicy podłączeni do prywatnej usługi DNS mogą rozwiązywać DNS, zapewniając prywatność.

## Rozpoczęcie pracy

1. Upewnij się, że masz zainstalowany i uruchomiony AdGuardPrivate lub AdGuardHome.
2. Postępuj zgodnie z instrukcjami podanymi w skryptach `win/ddns.ps1` (dla Windows) lub `unix/ddns.sh` (dla systemów opartych na Unixie) w celu skonfigurowania swojego prywatnego DDNS.

## Licencja

Ten projekt jest licencjonowany na warunkach [LICENSE](LICENSE) zawartych w repozytorium.