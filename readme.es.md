# AdGuard Private DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Este proyecto es contribuido por [@jqknono](https://github.com/jqknono).

## Descripción general

AdGuard Private DDNS tiene como objetivo proporcionar una manera fácil de configurar un DNS dinámico privado (DDNS) sin necesidad de comprar un nombre de dominio. Este script de DDNS está desarrollado específicamente para [adguardprivate.com](https://adguardprivate.com) y, al aprovechar la funcionalidad base de AdGuardPrivate, puedes lograr esto de manera fluida.

## Características

- Configuración rápida y fácil.
- Utiliza AdGuardPrivate para la funcionalidad de DDNS.
- Soporta tanto sistemas basados en Windows como en Unix.
- Múltiples opciones de autenticación: cookies (más seguras pero pueden expirar) o nombre de usuario/contraseña (más persistentes pero menos seguras).
- **Soporte para AdGuardHome**: Totalmente compatible con AdGuardHome, aprovechando su funcionalidad para una configuración de DDNS fluida.

## Diferencia con el DDNS tradicional

A diferencia del DDNS tradicional, este DDNS privado tiene las siguientes ventajas:

- **Sin tiempo de caché**: Los cambios surten efecto inmediatamente sin necesidad de esperar a que expire el caché de DNS.
- **Sin propagación de DNS**: Las actualizaciones están disponibles de inmediato sin necesidad de retrasos en la propagación de DNS.
- **No se requiere compra de dominio**: Puedes usar pseudo-dominios para el acceso, eliminando la necesidad de comprar un nombre de dominio.
- **Protección de privacidad**: Solo los usuarios conectados al servicio de DNS privado pueden resolver el DNS, asegurando la privacidad.

## Primeros pasos

1. Asegúrate de tener AdGuardPrivate o AdGuardHome instalado y en funcionamiento.
2. Sigue las instrucciones proporcionadas en los scripts `win/ddns.ps1` (para Windows) o `unix/ddns.sh` (para sistemas basados en Unix) para configurar tu DDNS privado.

## Licencia

Este proyecto está licenciado bajo los términos de la [LICENCIA](LICENSE) incluida en el repositorio.