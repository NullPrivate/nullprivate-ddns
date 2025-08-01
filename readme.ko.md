# AdGuard 개인 DDNS

[English](readme.md) | [Français](readme.fr.md) | [Português](readme.pt.md) | [Italiano](readme.it.md) | [Polski](readme.pl.md) | [Türkçe](readme.tr.md) | [Español](readme.es.md) | [Deutsch](readme.de.md) | [日本語](readme.ja.md) | [中文](readme.zh.md) | [Русский](readme.ru.md) | [العربية](readme.ar.md) | [한국어](readme.ko.md) | [Nederlands](readme.nl.md) | [Dansk](readme.da.md) | [Suomi](readme.fi.md) | [Norsk](readme.no.md) | [Svenska](readme.sv.md)

이 프로젝트는 [@jqknono](https://github.com/jqknono)가 기여했습니다.

## 개요

AdGuard 개인 DDNS는 도메인을 구매할 필요 없이 개인 동적 DNS(DDNS)를 빠르게 설정할 수 있는 간단한 방법을 제공합니다.
이 DDNS 스크립트는 [adguardprivate.com](https://adguardprivate.com)을 위해 개발되었으며, AdGuardPrivate의 기본 기능을 활용하여 이 기능을 원활하게 구현할 수 있습니다.
AdGuardHome을 자체 배포한 경우에도 이 스크립트를 사용하여 AdGuardHome의 DDNS를 설정할 수 있습니다.

## 시작하기

### AdguardPrivate

![AdGuardPrivate](./assets/adguardprivate.webp)

1. AdGuardPrivate가 배포되어 실행 중인지 확인
2. **DNS 재작성**으로 이동하여 DDNS 스크립트 다운로드
3. 스크립트 실행

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

1. AdGuardHome이 배포되어 실행 중인지 확인
2. [릴리스](https://github.com/AdGuardPrivate/adguardprivate-ddns/releases)에서 스크립트 다운로드
3. 스크립트 실행

**Windows**

```powershell
# 현재 세션에서 스크립트 실행
Set-ExecutionPolicy Bypass -Scope Process
.\ddns.ps1 -BaseUrl <base_url> -Username <username> -Password <password> -Domain <domain>
```

**Linux**

```shell
chmod +x ddns.sh
./ddns.sh -b <base_url> -u <username> -p <password> -d <domain>
```

## 기능

- 빠르고 쉽게 설정 가능
- AdGuardPrivate를 활용한 DDNS 기능 지원
- Windows 및 Unix 기반 시스템 지원
- 다양한 인증 옵션: 쿠키(더 안전하지만 만료될 수 있음) 또는 사용자 이름/비밀번호(더 오래 지속되지만 보안성이 낮음)
- **AdGuardHome 지원**: AdGuardHome과 완벽 호환되어 원활한 DDNS 설정 가능

## 기존 DDNS와의 차이점

기존 DDNS와 달리 이 개인 DDNS는 다음과 같은 장점이 있습니다:

- **캐시 시간 없음**: 변경 사항이 즉시 적용되며 DNS 캐시 만료를 기다릴 필요 없음
- **DNS 전파 없음**: 업데이트가 즉시 사용 가능하며 DNS 전파 지연 없음
- **도메인 구매 불필요**: 가상 도메인을 사용하여 접근할 수 있어 도메인 구매 필요 없음
- **개인 정보 보호**: 개인 DNS 서비스에 연결된 사용자만 DNS를 해석할 수 있어 개인 정보 보장

## 시작 가이드

1. AdGuardPrivate 또는 AdGuardHome이 설치되어 실행 중인지 확인
2. Windows용 `win/ddns.ps1` 또는 Unix 기반 시스템용 `unix/ddns.sh` 스크립트에 제공된 지침에 따라 개인 DDNS를 구성

## 라이선스

이 프로젝트는 저장소에 포함된 [LICENSE](LICENSE)의 조건에 따라 라이선스가 부여됩니다.