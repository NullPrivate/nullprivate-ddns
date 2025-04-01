# AdGuard Private DDNS

[Documentação em Chinês](readme.zh-cn.md)

Este projeto é contribuído por [@jqknono](https://github.com/jqknono).

## Visão Geral

O AdGuard Private DDNS tem como objetivo fornecer uma maneira fácil de configurar rapidamente um DNS Dinâmico Privado (DDNS) sem a necessidade de comprar um nome de domínio. Este script DDNS é desenvolvido especificamente para [adguardprivate.com](https://adguardprivate.com) e, ao aproveitar a funcionalidade básica do AdGuardPrivate, você pode alcançar isso de forma contínua.

## Recursos

- Configuração rápida e fácil.
- Utiliza o AdGuardPrivate para funcionalidade DDNS.
- Suporta tanto sistemas Windows quanto baseados em Unix.
- Várias opções de autenticação: cookies (mais seguros, mas podem expirar) ou nome de usuário/senha (mais persistentes, mas menos seguros).
- **Suporte ao AdGuardHome**: Totalmente compatível com o AdGuardHome, aproveitando sua funcionalidade para configuração DDNS contínua.

## Diferença em Relação ao DDNS Tradicional

Ao contrário do DDNS tradicional, este DDNS privado tem as seguintes vantagens:

- **Sem Tempo de Cache**: As alterações entram em vigor imediatamente, sem a necessidade de esperar pelo término do cache DNS.
- **Sem Propagação de DNS**: As atualizações estão disponíveis instantaneamente, sem a necessidade de atrasos na propagação do DNS.
- **Sem Necessidade de Compra de Domínio**: Você pode usar pseudo-domínios para acesso, eliminando a necessidade de comprar um nome de domínio.
- **Proteção de Privacidade**: Apenas usuários conectados ao serviço DNS privado podem resolver o DNS, garantindo privacidade.

## Começando

1. Certifique-se de ter o AdGuardPrivate ou o AdGuardHome instalado e em execução.
2. Siga as instruções fornecidas nos scripts `win/ddns.ps1` (para Windows) ou `unix/ddns.sh` (para sistemas baseados em Unix) para configurar seu DDNS privado.

## Licença

Este projeto é licenciado sob os termos da [LICENÇA](LICENSE) incluída no repositório.