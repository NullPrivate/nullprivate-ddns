# AdGuard Private DDNS

[Documentation en chinois](readme.zh-cn.md)

Ce projet est contribué par [@jqknono](https://github.com/jqknono).

## Aperçu

AdGuard Private DDNS vise à fournir un moyen simple de configurer rapidement un DNS dynamique privé (DDNS) sans avoir besoin d'acheter un nom de domaine. Ce script DDNS est spécifiquement développé pour [adguardprivate.com](https://adguardprivate.com) et en tirant parti de la fonctionnalité de base d'AdGuardPrivate, vous pouvez y parvenir de manière transparente.

## Fonctionnalités

- Configuration rapide et facile.
- Utilise AdGuardPrivate pour la fonctionnalité DDNS.
- Supporte à la fois les systèmes Windows et Unix.
- Plusieurs options d'authentification : cookies (plus sûrs mais peuvent expirer) ou nom d'utilisateur/mot de passe (plus persistants mais moins sécurisés).
- **Support AdGuardHome** : Entièrement compatible avec AdGuardHome, tirant parti de sa fonctionnalité pour une configuration DDNS transparente.

## Différence par rapport au DDNS traditionnel

Contrairement au DDNS traditionnel, ce DDNS privé présente les avantages suivants :

- **Pas de Temps de Cache** : Les changements prennent effet immédiatement sans attendre l'expiration du cache DNS.
- **Pas de Propagation DNS** : Les mises à jour sont instantanément disponibles sans besoin de délais de propagation DNS.
- **Pas d'Achat de Domaine Requis** : Vous pouvez utiliser des pseudo-domaines pour l'accès, éliminant le besoin d'acheter un nom de domaine.
- **Protection de la Vie Privée** : Seuls les utilisateurs connectés au service DNS privé peuvent résoudre le DNS, assurant la confidentialité.

## Commencer

1. Assurez-vous d'avoir AdGuardPrivate ou AdGuardHome installé et en cours d'exécution.
2. Suivez les instructions fournies dans les scripts `win/ddns.ps1` (pour Windows) ou `unix/ddns.sh` (pour les systèmes basés sur Unix) pour configurer votre DDNS privé.

## Licence

Ce projet est sous licence selon les termes de la [LICENCE](LICENSE) incluse dans le référentiel.