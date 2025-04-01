# AdGuard Private DDNS

[Documentazione in cinese](readme.zh-cn.md)

Questo progetto è contribuito da [@jqknono](https://github.com/jqknono).

## Panoramica

AdGuard Private DDNS mira a fornire un modo semplice per configurare rapidamente un DNS dinamico privato (DDNS) senza la necessità di acquistare un nome di dominio. Questo script DDNS è sviluppato specificamente per [adguardprivate.com](https://adguardprivate.com) e, sfruttando la funzionalità di base di AdGuardPrivate, è possibile ottenere questo risultato senza problemi.

## Funzionalità

- Configurazione rapida e semplice.
- Utilizza AdGuardPrivate per la funzionalità DDNS.
- Supporta sia sistemi Windows che basati su Unix.
- Opzioni di autenticazione multiple: cookie (più sicuri ma possono scadere) o nome utente/password (più persistenti ma meno sicuri).
- **Supporto AdGuardHome**: Completamente compatibile con AdGuardHome, sfruttando la sua funzionalità per una configurazione DDNS senza problemi.

## Differenza rispetto al DDNS tradizionale

A differenza del DDNS tradizionale, questo DDNS privato ha i seguenti vantaggi:

- **Nessun Tempo di Cache**: Le modifiche hanno effetto immediato senza dover attendere la scadenza della cache DNS.
- **Nessuna Propagazione DNS**: Gli aggiornamenti sono immediatamente disponibili senza la necessità di ritardi nella propagazione DNS.
- **Nessun Acquisto di Dominio Richiesto**: È possibile utilizzare pseudo-domini per l'accesso, eliminando la necessità di acquistare un nome di dominio.
- **Protezione della Privacy**: Solo gli utenti connessi al servizio DNS privato possono risolvere il DNS, garantendo la privacy.

## Inizio

1. Assicurati di avere AdGuardPrivate o AdGuardHome installato e in esecuzione.
2. Segui le istruzioni fornite nei script `win/ddns.ps1` (per Windows) o `unix/ddns.sh` (per sistemi basati su Unix) per configurare il tuo DDNS privato.

## Licenza

Questo progetto è concesso in licenza secondo i termini della [LICENSE](LICENSE) inclusa nel repository.