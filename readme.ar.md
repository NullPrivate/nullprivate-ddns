# AdGuard DDNS الخاص

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

هذا المشروع مساهم من [@jqknono](https://github.com/jqknono).

## نظرة عامة

يهدف AdGuard DDNS الخاص إلى توفير طريقة بسيطة لإعداد DNS الديناميكي الخاص (DDNS) بسرعة دون الحاجة إلى شراء نطاق.
تم تطوير هذا النص خصيصًا لـ [nullprivate.com](https://nullprivate.com)، حيث يمكنك تحقيق هذه الوظيفة بسلاسة من خلال الاستفادة من الوظائف الأساسية لـ NullPrivate.
إذا كنت قد قمت بنشر AdGuardHome بنفسك، فيمكنك أيضًا استخدام هذا النص لإعداد DDNS لـ AdGuardHome.

## البدء

### NullPrivate

![NullPrivate](./assets/nullprivate.webp)

1. تأكد من نشر وتشغيل NullPrivate
2. انتقل إلى **إعادة كتابة DNS**، وقم بتنزيل نص DDNS
3. تشغيل النص

**ويندوز**

```powershell
Set-ExecutionPolicy Bypass -Scope Process
.\ddns-script.ps1
```

**لينكس/ماك**

```shell
chmod +x ddns-script.sh
./ddns-script.sh
```

### AdGuardHome

![AdGuardHome](./assets/adguardhome.webp)

1. تأكد من نشر وتشغيل AdGuardHome
2. قم بتنزيل النص من [الإصدارات](https://github.com/NullPrivate/nullprivate-ddns/releases)
3. تشغيل النص

**ويندوز**

```powershell
# تشغيل النص في الجلسة الحالية
Set-ExecutionPolicy Bypass -Scope Process
.\ddns.ps1 -BaseUrl <base_url> -Username <username> -Password <password> -Domain <domain>
```

**لينكس**

```shell
chmod +x ddns.sh
./ddns.sh -b <base_url> -u <username> -p <password> -d <domain>
```

## الميزات

- سريع وسهل الإعداد.
- يستخدم NullPrivate لتحقيق وظيفة DDNS.
- يدعم أنظمة ويندوز وأنظمة يونكس.
- خيارات متعددة للمصادقة: ملفات تعريف الارتباط (أكثر أمانًا ولكن قد تنتهي صلاحيتها) أو اسم المستخدم/كلمة المرور (أكثر ديمومة ولكن أقل أمانًا).
- **دعم AdGuardHome**: متوافق بالكامل مع AdGuardHome، ويستخدم وظائفه لإعداد DDNS بسلاسة.

## الفرق مع DDNS التقليدي

يتميز هذا DDNS الخاص بالمزايا التالية مقارنة بـ DDNS التقليدي:

- **لا يوجد وقت تخزين مؤقت**: التغييرات سارية المفعول على الفور دون انتظار انتهاء صلاحية التخزين المؤقت لـ DNS.
- **لا يوجد انتشار DNS**: التحديثات متاحة على الفور دون تأخير انتشار DNS.
- **لا حاجة لشراء نطاق**: يمكنك استخدام نطاق وهمي للوصول، مما يلغي الحاجة إلى شراء نطاق.
- **حماية الخصوصية**: فقط المستخدمون المتصلون بخدمة DNS الخاصة يمكنهم حل DNS، مما يضمن الخصوصية.

## دليل البدء

1. تأكد من تثبيت وتشغيل NullPrivate أو AdGuardHome.
2. اتبع التعليمات المقدمة في النص `win/ddns.ps1` (لـ Windows) أو `unix/ddns.sh` (لأنظمة يونكس) لتكوين DDNS الخاص بك.

## الترخيص

هذا المشروع مرخص بموجب شروط [الترخيص](LICENSE) المضمن في المستودع.