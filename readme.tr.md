# AdGuard Özel DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

Bu proje [@jqknono](https://github.com/jqknono) tarafından katkıda bulunulmuştur.

## Genel Bakış

AdGuard Özel DDNS, bir alan adı satın almadan hızlı ve özel bir Dinamik DNS (DDNS) kurmanın kolay bir yolunu sağlamayı amaçlamaktadır. Bu DDNS betiği özellikle [adguardprivate.com](https://adguardprivate.com) için geliştirilmiştir ve AdGuardPrivate'ın temel işlevselliğini kullanarak bunu sorunsuz bir şekilde başarabilirsiniz.

## Özellikler

- Hızlı ve kolay kurulum.
- DDNS işlevselliği için AdGuardPrivate kullanır.
- Windows ve Unix tabanlı sistemleri destekler.
- Çoklu kimlik doğrulama seçenekleri: çerezler (daha güvenli ama süresi dolabilir) veya kullanıcı adı/şifre (daha kalıcı ama daha az güvenli).
- **AdGuardHome Desteği**: AdGuardHome ile tamamen uyumludur, DDNS kurulumu için işlevselliğini kullanır.

## Geleneksel DDNS'den Farkı

Geleneksel DDNS'den farklı olarak, bu özel DDNS aşağıdaki avantajlara sahiptir:

- **Önbellek Süresi Yok**: Değişiklikler DNS önbellek süresinin dolmasını beklemeden hemen etkili olur.
- **DNS Yayılımı Yok**: Güncellemeler, DNS yayılımı gecikmelerine gerek kalmadan anında kullanılabilir.
- **Alan Adı Satın Alma Gerekli Değil**: Erişim için sahte alan adları kullanabilirsiniz, alan adı satın alma ihtiyacını ortadan kaldırır.
- **Gizlilik Koruması**: Sadece özel DNS hizmetine bağlı kullanıcılar DNS'i çözebilir, gizliliği sağlar.

## Başlarken

1. AdGuardPrivate veya AdGuardHome'un kurulu ve çalışır durumda olduğundan emin olun.
2. Özel DDNS'inizi yapılandırmak için `win/ddns.ps1` (Windows için) veya `unix/ddns.sh` (Unix tabanlı sistemler için) betiklerinde verilen talimatları izleyin.

## Lisans

Bu proje, depoda bulunan [LICENSE](LICENSE) şartlarına göre lisanslanmıştır.