# AdGuard Private DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Этот проект предоставлен [@jqknono](https://github.com/jqknono).

## Обзор

AdGuard Private DDNS предназначен для простой и быстрой настройки частного динамического DNS (DDNS) без необходимости покупки домена.  
Этот скрипт DDNS разработан специально для [adguardprivate.com](https://adguardprivate.com), используя базовые функции AdGuardPrivate для бесшовной реализации этой возможности.  
Если у вас уже развернут AdGuardHome, вы также можете использовать этот скрипт для настройки DDNS в AdGuardHome.

## Начало работы

### AdGuardPrivate

![AdGuardPrivate](./assets/adguardprivate.webp)

1. Убедитесь, что AdGuardPrivate развернут и работает.
2. Перейдите в раздел **DNS Rewrite**, скачайте скрипт DDNS.
3. Запустите скрипт.

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

1. Убедитесь, что AdGuardHome развернут и работает.
2. Скачайте скрипт из [релизов](https://github.com/AdGuardPrivate/adguardprivate-ddns/releases).
3. Запустите скрипт.

**Windows**

```powershell
# Запуск скрипта в текущей сессии
Set-ExecutionPolicy Bypass -Scope Process
.\ddns.ps1 -BaseUrl <base_url> -Username <username> -Password <password> -Domain <domain>
```

**Linux/macOS**

```shell
chmod +x ddns.sh
./ddns.sh -b <base_url> -u <username> -p <password> -d <domain>
```

## Возможности

- Быстрая и простая настройка.
- Использование AdGuardPrivate для реализации DDNS.
- Поддержка Windows и Unix-подобных систем.
- Несколько вариантов аутентификации: cookies (более безопасно, но может истекать) или имя пользователя/пароль (более долговечно, но менее безопасно).
- **Поддержка AdGuardHome**: полная совместимость с AdGuardHome для бесшовной настройки DDNS.

## Отличия от традиционного DDNS

В отличие от традиционного DDNS, этот частный DDNS имеет следующие преимущества:

- **Нет времени кэширования**: изменения вступают в силу немедленно, без ожидания истечения кэша DNS.
- **Нет распространения DNS**: обновления доступны сразу, без задержек распространения DNS.
- **Не нужно покупать домен**: вы можете использовать псевдо-домен для доступа, что устраняет необходимость покупки домена.
- **Защита конфиденциальности**: только пользователи, подключенные к частному DNS-сервису, могут разрешать DNS, обеспечивая конфиденциальность.

## Руководство по началу работы

1. Убедитесь, что AdGuardPrivate или AdGuardHome установлен и работает.
2. Следуйте инструкциям в скриптах `win/ddns.ps1` (для Windows) или `unix/ddns.sh` (для Unix-подобных систем), чтобы настроить ваш частный DDNS.

## Лицензия

Этот проект лицензирован в соответствии с условиями [LICENSE](LICENSE), включенной в репозиторий.