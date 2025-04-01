# AdGuard Private DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

このプロジェクトは[@jqknono](https://github.com/jqknono)によって寄稿されました。

## 概要

AdGuard Private DDNSは、ドメイン名を購入する必要なく、簡単にプライベートダイナミックDNS（DDNS）を設定するための方法を提供することを目指しています。このDDNSスクリプトは[adguardprivate.com](https://adguardprivate.com)専用に開発されており、AdGuardPrivateの基本機能を活用することで、これをシームレスに実現できます。

## 機能

- 迅速かつ簡単な設定。
- DDNS機能にAdGuardPrivateを利用。
- WindowsおよびUnixベースのシステムをサポート。
- 複数の認証オプション：クッキー（安全だが期限切れの可能性あり）またはユーザー名/パスワード（より持続的だがセキュリティが低い）。
- **AdGuardHomeサポート**：AdGuardHomeと完全に互換性があり、その機能を活用してシームレスなDDNS設定が可能です。

## 伝統的なDDNSとの違い

伝統的なDDNSとは異なり、このプライベートDDNSには以下の利点があります：

- **キャッシュ時間なし**：変更はDNSキャッシュの期限切れを待つことなく即座に効果を発揮します。
- **DNS伝播なし**：更新はDNS伝播の遅延を必要とせず、即座に利用可能です。
- **ドメイン購入不要**：アクセスに擬似ドメインを使用でき、ドメイン名の購入が不要です。
- **プライバシー保護**：プライベートDNSサービスに接続しているユーザーのみがDNSを解決できるため、プライバシーが確保されます。

## 始め方

1. AdGuardPrivateまたはAdGuardHomeがインストールされ、実行されていることを確認してください。
2. Windowsの場合は`win/ddns.ps1`、Unixベースのシステムの場合は`unix/ddns.sh`スクリプトに記載されている指示に従って、プライベートDDNSを設定してください。

## ライセンス

このプロジェクトは、リポジトリに含まれる[LICENSE](LICENSE)の条項に基づいてライセンスされています。