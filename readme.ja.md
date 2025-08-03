# AdGuard プライベート DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

このプロジェクトは [@jqknono](https://github.com/jqknono) によって貢献されました。

## 概要

AdGuard プライベート DDNS は、ドメインを購入することなく、簡単にプライベートなダイナミック DNS (DDNS) を迅速に設定する方法を提供します。
この DDNS スクリプトは [adguardprivate.com](https://adguardprivate.com) 向けに開発され、AdGuardPrivate の基本機能を利用してシームレスにこの機能を実現できます。
AdGuardHome を自己ホストしている場合も、このスクリプトを使用して AdGuardHome の DDNS を設定できます。

## はじめに

### AdGuardPrivate

![AdGuardPrivate](./assets/adguardprivate.webp)

1. AdGuardPrivate をデプロイして実行していること
2. **DNS 書き換え**に移動し、DDNS スクリプトをダウンロード
3. スクリプトを実行

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

1. AdGuardHome をデプロイして実行していること
2. [リリース](https://github.com/AdGuardPrivate/adguardprivate-ddns/releases)からスクリプトをダウンロード
3. スクリプトを実行

**Windows**

```powershell
# 現在のセッションでスクリプトを実行
Set-ExecutionPolicy Bypass -Scope Process
.\ddns.ps1 -BaseUrl <base_url> -Username <username> -Password <password> -Domain <domain>
```

**Linux/macOS**

```shell
chmod +x ddns.sh
./ddns.sh -b <base_url> -u <username> -p <password> -d <domain>
```

## 機能

- 迅速かつ簡単に設定可能
- AdGuardPrivate を利用した DDNS 機能
- Windows および Unix ベースのシステムをサポート
- 複数の認証オプション: クッキー（より安全だが期限切れの可能性あり）またはユーザー名/パスワード（より持続的だが安全性は低い）
- **AdGuardHome サポート**: AdGuardHome と完全互換で、シームレスな DDNS 設定を実現

## 従来の DDNS との違い

従来の DDNS と異なり、このプライベート DDNS には以下の利点があります:

- **キャッシュ時間なし**: 変更は即時反映され、DNS キャッシュの期限を待つ必要がありません
- **DNS 伝播不要**: 更新は即時利用可能で、DNS 伝播の遅延がありません
- **ドメイン購入不要**: 疑似ドメインを使用してアクセスできるため、ドメインを購入する必要がありません
- **プライバシー保護**: プライベート DNS サービスに接続しているユーザーのみが DNS を解決できるため、プライバシーが保証されます

## スタートガイド

1. AdGuardPrivate または AdGuardHome がインストールされ実行されていることを確認
2. Windows の場合は `win/ddns.ps1`、Unix ベースのシステムの場合は `unix/ddns.sh` スクリプトに記載されている手順に従ってプライベート DDNS を設定

## ライセンス

このプロジェクトは、リポジトリに含まれる [LICENSE](LICENSE) の条項に基づいてライセンスされています。