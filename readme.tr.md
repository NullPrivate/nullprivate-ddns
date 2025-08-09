# AdGuard Özel DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Bu proje [@jqknono](https://github.com/jqknono) tarafından katkı sağlanmıştır.

## Genel Bakış

AdGuard Özel DDNS, alan adı satın almadan hızlı bir şekilde özel dinamik DNS (DDNS) kurmanın basit bir yolunu sunmayı amaçlamaktadır.
Bu DDNS betiği [nullprivate.com](https://nullprivate.com) için geliştirilmiştir, AdGuardPrivate'ın temel işlevlerinden yararlanarak bu özelliği sorunsuz bir şekilde uygulayabilirsiniz.
Eğer kendi AdGuardHome'unuzu dağıttıysanız, bu betiği AdGuardHome'un DDNS'sini ayarlamak için de kullanabilirsiniz.

## Başlarken

### AdGuardPrivate

![AdGuardPrivate](./assets/nullprivate.webp)

1. AdGuardPrivate'ı dağıtın ve çalıştırın
2. **DNS Yeniden Yazma** bölümüne gidin, DDNS betiğini indirin
3. Betiği çalıştırın

**Windows**

```powershell
Set-ExecutionPolicy Bypass -Scope Process
.\ddns-script.ps1
```

**linux/macOS**

```shell
chmod +x ddns-script.sh
./ddns-script.sh
```

### AdGuardHome

![AdGuardHome](./assets/adguardhome.webp)

1. AdGuardHome'u dağıtın ve çalıştırın
2. [release](https://github.com/AdGuardPrivate/nullprivate-ddns/releases) sayfasından betiği indirin
3. Betiği çalıştırın

**Windows**

```powershell
# Betiği bu oturumda çalıştır
Set-ExecutionPolicy Bypass -Scope Process
.\ddns.ps1 -BaseUrl <base_url> -Username <username> -Password <password> -Domain <domain>
```

**Linux/macOS**

```shell
chmod +x ddns.sh
./ddns.sh -b <base_url> -u <username> -p <password> -d <domain>
```

## Özellikler

- Hızlı ve kolay kurulum.
- DDNS işlevselliği için AdGuardPrivate'ı kullanır.
- Windows ve Unix tabanlı sistemleri destekler.
- Çoklu kimlik doğrulama seçenekleri: çerezler (daha güvenli ancak süresi dolabilir) veya kullanıcı adı/şifre (daha kalıcı ancak daha az güvenli).
- **AdGuardHome desteği**: AdGuardHome ile tam uyumludur, sorunsuz DDNS kurulumu için işlevlerinden yararlanır.

## Geleneksel DDNS'den Farkı

Geleneksel DDNS'den farklı olarak, bu özel DDNS aşağıdaki avantajlara sahiptir:

- **Önbellek süresi yok**: Değişiklikler hemen etkili olur, DNS önbelleğinin süresinin dolmasını beklemeye gerek yoktur.
- **DNS yayılımı yok**: Güncellemeler anında kullanılabilir, DNS yayılım gecikmesi yoktur.
- **Alan adı satın almaya gerek yok**: Erişim için sahte alan adları kullanabilirsiniz, bu da alan adı satın alma ihtiyacını ortadan kaldırır.
- **Gizlilik koruması**: Yalnızca özel DNS hizmetine bağlı kullanıcılar DNS çözümlemesi yapabilir, gizliliği sağlar.

## Başlangıç Kılavuzu

1. AdGuardPrivate veya AdGuardHome'un kurulu ve çalışır durumda olduğundan emin olun.
2. Windows için `win/ddns.ps1` veya Unix tabanlı sistemler için `unix/ddns.sh` betiğinde sağlanan talimatları izleyerek özel DDNS'nizi yapılandırın.

## Lisans

Bu proje, depoda bulunan [LICENSE](LICENSE) koşulları altında lisanslanmıştır.