# AdGuard DDNS Privato

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Questo progetto è stato contribuito da [@jqknono](https://github.com/jqknono).

## Panoramica

AdGuard DDNS Privato mira a fornire un metodo semplice per configurare rapidamente un DNS Dinamico (DDNS) privato senza dover acquistare un dominio.
Questo script DDNS è sviluppato specificamente per [nullprivate.com](https://nullprivate.com), sfruttando le funzionalità di base di NullPrivate per offrire questa funzionalità in modo fluido.
Se hai già installato AdGuardHome autonomamente, puoi utilizzare questo script per configurare il DDNS di AdGuardHome.

## Come Iniziare

### NullPrivate

![NullPrivate](./assets/nullprivate.webp)

1. Assicurati che NullPrivate sia installato e in esecuzione
2. Vai alla sezione **Riscrittura DNS**, scarica lo script DDNS
3. Esegui lo script

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

1. Assicurati che AdGuardHome sia installato e in esecuzione
2. Scarica lo script da [release](https://github.com/NullPrivate/nullprivate-ddns/releases)
3. Esegui lo script

**Windows**

```powershell
# Esegui lo script nella sessione corrente
Set-ExecutionPolicy Bypass -Scope Process
.\ddns.ps1 -BaseUrl <base_url> -Username <username> -Password <password> -Domain <domain>
```

**Linux/macOS**

```shell
chmod +x ddns.sh
./ddns.sh -b <base_url> -u <username> -p <password> -d <domain>
```

## Funzionalità

- Configurazione rapida e semplice.
- Sfrutta NullPrivate per la funzionalità DDNS.
- Supporto per Windows e sistemi basati su Unix.
- Multiple opzioni di autenticazione: cookie (più sicuri ma potenzialmente scadenti) o nome utente/password (più duraturi ma meno sicuri).
- **Supporto AdGuardHome**: completamente compatibile con AdGuardHome, sfruttando le sue funzionalità per una configurazione DDNS senza interruzioni.

## Differenze rispetto al DDNS Tradizionale

A differenza del DDNS tradizionale, questo DDNS privato offre i seguenti vantaggi:

- **Nessun tempo di cache**: le modifiche hanno effetto immediato, senza attendere la scadenza della cache DNS.
- **Nessuna propagazione DNS**: gli aggiornamenti sono disponibili immediatamente, senza ritardi di propagazione DNS.
- **Nessun acquisto di dominio necessario**: puoi utilizzare un dominio fittizio per l'accesso, eliminando la necessità di acquistare un dominio.
- **Protezione della privacy**: solo gli utenti connessi al servizio DNS privato possono risolvere il DNS, garantendo la privacy.

## Guida Introduttiva

1. Assicurati che NullPrivate o AdGuardHome siano installati e in esecuzione.
2. Segui le istruzioni fornite negli script `win/ddns.ps1` (per Windows) o `unix/ddns.sh` (per sistemi basati su Unix) per configurare il tuo DDNS privato.

## Licenza

Questo progetto è concesso in licenza secondo i termini della [LICENSE](LICENSE) inclusa nel repository.