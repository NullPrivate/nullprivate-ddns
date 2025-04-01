# AdGuard 개인 DDNS

[영어](readme.md) | [프랑스어](readme.fr.md) | [포르투갈어](readme.pt.md) | [이탈리아어](readme.it.md) | [폴란드어](readme.pl.md) | [터키어](readme.tr.md) | [스페인어](readme.es.md) | [독일어](readme.de.md) | [일본어](readme.ja.md) | [중국어](readme.zh.md) | [러시아어](readme.ru.md) | [아랍어](readme.ar.md) | [한국어](readme.ko.md) | [네덜란드어](readme.nl.md) | [덴마크어](readme.da.md) | [핀란드어](readme.fi.md) | [노르웨이어](readme.no.md) | [스웨덴어](readme.sv.md)

이 프로젝트는 [@jqknono](https://github.com/jqknono)에 의해 기여되었습니다.

## 개요

AdGuard 개인 DDNS는 도메인 이름을 구매할 필요 없이 빠르고 쉽게 개인 동적 DNS(DDNS)를 설정할 수 있는 방법을 제공하는 것을 목표로 합니다. 이 DDNS 스크립트는 [adguardprivate.com](https://adguardprivate.com)을 위해 특별히 개발되었으며, AdGuardPrivate의 기본 기능을 활용하여 이를 원활하게 달성할 수 있습니다.

## 기능

- 빠르고 쉬운 설정.
- DDNS 기능을 위해 AdGuardPrivate을 활용.
- Windows 및 Unix 기반 시스템 모두 지원.
- 여러 인증 옵션: 쿠키(더 안전하지만 만료될 수 있음) 또는 사용자 이름/비밀번호(더 지속적이지만 덜 안전함).
- **AdGuardHome 지원**: AdGuardHome과 완전히 호환되며, 이를 통해 원활한 DDNS 설정을 가능하게 합니다.

## 전통적인 DDNS와의 차이점

전통적인 DDNS와 달리, 이 개인 DDNS는 다음과 같은 장점이 있습니다:

- **캐시 시간 없음**: 변경 사항이 DNS 캐시 만료를 기다리지 않고 즉시 적용됩니다.
- **DNS 전파 없음**: 업데이트가 DNS 전파 지연 없이 즉시 사용 가능합니다.
- **도메인 구매 필요 없음**: 접근을 위해 가상 도메인을 사용할 수 있어 도메인 이름을 구매할 필요가 없습니다.
- **프라이버시 보호**: 개인 DNS 서비스에 연결된 사용자만 DNS를 확인할 수 있어 프라이버시를 보장합니다.

## 시작하기

1. AdGuardPrivate 또는 AdGuardHome이 설치되고 실행 중인지 확인하십시오.
2. Windows의 경우 `win/ddns.ps1`, Unix 기반 시스템의 경우 `unix/ddns.sh` 스크립트에 제공된 지침을 따라 개인 DDNS를 구성하십시오.

## 라이선스

이 프로젝트는 저장소에 포함된 [LICENSE](LICENSE)의 조건에 따라 라이선스가 부여됩니다.