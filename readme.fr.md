# AdGuard DDNS Privé

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Ce projet est contribué par [@jqknono](https://github.com/jqknono).

## Aperçu

AdGuard DDNS Privé vise à fournir une méthode simple pour configurer rapidement un DNS Dynamique (DDNS) privé sans avoir à acheter un nom de domaine.
Ce script DDNS est spécialement développé pour [adguardprivate.com](https://adguardprivate.com), en utilisant les fonctionnalités de base d'AdGuardPrivate, vous pouvez implémenter cette fonctionnalité de manière transparente.
Si vous avez auto-hébergé AdGuardHome, vous pouvez également utiliser ce script pour configurer le DDNS d'AdGuardHome.

## Commencer

### AdGuardPrivate

![AdGuardPrivate](./assets/adguardprivate.webp)

1. AdGuardPrivate est déployé et en cours d'exécution
2. Accédez à **Réécriture DNS**, téléchargez le script DDNS
3. Exécutez le script

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

1. AdGuardHome est déployé et en cours d'exécution
2. Téléchargez le script depuis [release](https://github.com/AdGuardPrivate/adguardprivate-ddns/releases)
3. Exécutez le script

**Windows**

```powershell
# Exécuter le script dans cette session
Set-ExecutionPolicy Bypass -Scope Process
.\ddns.ps1 -BaseUrl <base_url> -Username <username> -Password <password> -Domain <domain>
```

**Linux/macOS**

```shell
chmod +x ddns.sh
./ddns.sh -b <base_url> -u <username> -p <password> -d <domain>
```

## Fonctionnalités

- Rapide et facile à configurer.
- Utilise AdGuardPrivate pour la fonctionnalité DDNS.
- Prend en charge Windows et les systèmes basés sur Unix.
- Plusieurs options d'authentification : cookies (plus sécurisés mais pouvant expirer) ou nom d'utilisateur/mot de passe (plus persistants mais moins sécurisés).
- **Prise en charge d'AdGuardHome** : entièrement compatible avec AdGuardHome, utilisant ses fonctionnalités pour une configuration DDNS transparente.

## Différences avec un DDNS traditionnel

Contrairement à un DDNS traditionnel, ce DDNS privé offre les avantages suivants :

- **Pas de temps de cache** : les modifications prennent effet immédiatement, sans attente d'expiration du cache DNS.
- **Pas de propagation DNS** : les mises à jour sont disponibles immédiatement, sans délai de propagation DNS.
- **Pas besoin d'acheter un nom de domaine** : vous pouvez utiliser un pseudo-domaine pour accéder, éliminant le besoin d'acheter un nom de domaine.
- **Protection de la vie privée** : seuls les utilisateurs connectés au service DNS privé peuvent résoudre le DNS, garantissant la confidentialité.

## Guide de démarrage

1. Assurez-vous qu'AdGuardPrivate ou AdGuardHome est installé et en cours d'exécution.
2. Suivez les instructions fournies dans les scripts `win/ddns.ps1` (pour Windows) ou `unix/ddns.sh` (pour les systèmes basés sur Unix) pour configurer votre DDNS privé.

## Licence

Ce projet est sous licence selon les termes inclus dans le fichier [LICENSE](LICENSE) du dépôt.