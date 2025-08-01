# AdGuard DDNS Privado

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Este projeto foi contribuído por [@jqknono](https://github.com/jqknono).

## Visão Geral

O AdGuard DDNS Privado visa fornecer uma maneira simples de configurar rapidamente um DNS Dinâmico (DDNS) privado sem a necessidade de comprar um domínio.
Este script DDNS foi desenvolvido especificamente para [adguardprivate.com](https://adguardprivate.com), aproveitando a funcionalidade básica do AdGuardPrivate para implementar esse recurso de forma integrada.
Se você já possui uma instalação própria do AdGuardHome, também pode usar este script para configurar o DDNS do AdGuardHome.

## Começando

### AdGuardPrivate

![AdGuardPrivate](./assets/adguardprivate.webp)

1. Tenha o AdGuardPrivate implantado e em execução
2. Navegue até **Reescrita DNS**, baixe o script DDNS
3. Execute o script

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

1. Tenha o AdGuardHome implantado e em execução
2. Baixe o script do [release](https://github.com/AdGuardPrivate/adguardprivate-ddns/releases)
3. Execute o script

**Windows**

```powershell
# Execute o script nesta sessão
Set-ExecutionPolicy Bypass -Scope Process
.\ddns.ps1 -BaseUrl <base_url> -Username <username> -Password <password> -Domain <domain>
```

**Linux**

```shell
chmod +x ddns.sh
./ddns.sh -b <base_url> -u <username> -p <password> -d <domain>
```

## Recursos

- Configuração rápida e fácil.
- Utiliza o AdGuardPrivate para implementar a funcionalidade DDNS.
- Suporte para Windows e sistemas baseados em Unix.
- Múltiplas opções de autenticação: cookies (mais seguros, mas podem expirar) ou nome de usuário/senha (mais persistentes, mas menos seguros).
- **Suporte ao AdGuardHome**: totalmente compatível com o AdGuardHome, aproveitando seus recursos para uma configuração perfeita de DDNS.

## Diferenças em Relação ao DDNS Tradicional

Diferente do DDNS tradicional, este DDNS privado oferece as seguintes vantagens:

- **Sem tempo de cache**: as alterações entram em vigor imediatamente, sem esperar pela expiração do cache DNS.
- **Sem propagação DNS**: as atualizações estão disponíveis imediatamente, sem atrasos de propagação DNS.
- **Sem necessidade de comprar um domínio**: você pode usar um pseudodomínio para acesso, eliminando a necessidade de comprar um domínio.
- **Proteção de privacidade**: apenas usuários conectados ao serviço DNS privado podem resolver o DNS, garantindo privacidade.

## Guia de Início Rápido

1. Certifique-se de que o AdGuardPrivate ou AdGuardHome está instalado e em execução.
2. Siga as instruções fornecidas nos scripts `win/ddns.ps1` (para Windows) ou `unix/ddns.sh` (para sistemas baseados em Unix) para configurar seu DDNS privado.

## Licença

Este projeto está licenciado sob os termos da [LICENSE](LICENSE) incluída no repositório.