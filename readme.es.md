# AdGuard DDNS Privado

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Este proyecto es contribuido por [@jqknono](https://github.com/jqknono).

## Resumen

AdGuard DDNS Privado tiene como objetivo proporcionar un método sencillo para configurar rápidamente un DNS dinámico (DDNS) privado sin necesidad de comprar un dominio.
Este script DDNS está diseñado específicamente para [adguardprivate.com](https://adguardprivate.com), aprovechando la funcionalidad básica de AdGuardPrivate para implementar esta característica sin problemas.
Si ya has implementado AdGuardHome por tu cuenta, también puedes usar este script para configurar el DDNS de AdGuardHome.

## Comenzar

### AdGuardPrivate

![AdGuardPrivate](./assets/adguardprivate.webp)

1. AdGuardPrivate está implementado y en funcionamiento
2. Navega a **Reescrituras DNS**, descarga el script DDNS
3. Ejecuta el script

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

1. AdGuardHome está implementado y en funcionamiento
2. Descarga el script desde [release](https://github.com/AdGuardPrivate/adguardprivate-ddns/releases)
3. Ejecuta el script

**Windows**

```powershell
# Ejecuta el script en esta sesión
Set-ExecutionPolicy Bypass -Scope Process
.\ddns.ps1 -BaseUrl <base_url> -Username <username> -Password <password> -Domain <domain>
```

**Linux/macOS**

```shell
chmod +x ddns.sh
./ddns.sh -b <base_url> -u <username> -p <password> -d <domain>
```

## Características

- Rápido y fácil de configurar.
- Utiliza AdGuardPrivate para implementar la funcionalidad DDNS.
- Compatible con Windows y sistemas basados en Unix.
- Múltiples opciones de autenticación: cookies (más seguras pero pueden expirar) o nombre de usuario/contraseña (más persistentes pero menos seguras).
- **Soporte para AdGuardHome**: totalmente compatible con AdGuardHome, aprovechando sus funciones para una configuración DDNS sin problemas.

## Diferencias con el DDNS tradicional

A diferencia del DDNS tradicional, este DDNS privado ofrece las siguientes ventajas:

- **Sin tiempo de caché**: los cambios se aplican inmediatamente, sin esperar a que expire el caché DNS.
- **Sin propagación DNS**: las actualizaciones están disponibles al instante, sin retrasos de propagación DNS.
- **No es necesario comprar un dominio**: puedes usar un dominio falso para acceder, eliminando la necesidad de comprar un dominio.
- **Protección de privacidad**: solo los usuarios conectados al servicio DNS privado pueden resolver el DNS, garantizando la privacidad.

## Guía de inicio

1. Asegúrate de que AdGuardPrivate o AdGuardHome estén instalados y en funcionamiento.
2. Sigue las instrucciones proporcionadas en los scripts `win/ddns.ps1` (para Windows) o `unix/ddns.sh` (para sistemas basados en Unix) para configurar tu DDNS privado.

## Licencia

Este proyecto está licenciado bajo los términos de la [LICENCIA](LICENSE) incluida en el repositorio.