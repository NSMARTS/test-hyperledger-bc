[//]: # "SPDX-License-Identifier: CC-BY-4.0"

# Hyperledger Fabric Samples

[![Build Status](https://dev.azure.com/Hyperledger/Fabric-Samples/_apis/build/status/Fabric-Samples?branchName=main)](https://dev.azure.com/Hyperledger/Fabric-Samples/_build/latest?definitionId=28&branchName=main)

You can use Fabric samples to get started working with Hyperledger Fabric, explore important Fabric features, and learn how to build applications that can interact with blockchain networks using the Fabric SDKs. To learn more about Hyperledger Fabric, visit the [Fabric documentation](https://hyperledger-fabric.readthedocs.io/en/latest).

## Getting started with the Fabric samples

To use the Fabric samples, you need to download the Fabric Docker images and the Fabric CLI tools. First, make sure that you have installed all of the [Fabric prerequisites](https://hyperledger-fabric.readthedocs.io/en/latest/prereqs.html). You can then follow the instructions to [Install the Fabric Samples, Binaries, and Docker Images](https://hyperledger-fabric.readthedocs.io/en/latest/install.html) in the Fabric documentation. In addition to downloading the Fabric images and tool binaries, the Fabric samples will also be cloned to your local machine.

## Test network

The [Fabric test network](test-network) in the samples repository provides a Docker Compose based test network with two
Organization peers and an ordering service node. You can use it on your local machine to run the samples listed below.
You can also use it to deploy and test your own Fabric chaincodes and applications. To get started, see
the [test network tutorial](https://hyperledger-fabric.readthedocs.io/en/latest/test_network.html).

The [Kubernetes Test Network](test-network-k8s) sample builds upon the Compose network, constructing a Fabric
network with peer, orderer, and CA infrastructure nodes running on Kubernetes. In addition to providing a sample
Kubernetes guide, the Kube test network can be used as a platform to author and debug _cloud ready_ Fabric Client
applications on a development or CI workstation.

## Asset transfer samples and tutorials

The asset transfer series provides a series of sample smart contracts and applications to demonstrate how to store and transfer assets using Hyperledger Fabric.
Each sample and associated tutorial in the series demonstrates a different core capability in Hyperledger Fabric. The **Basic** sample provides an introduction on how
to write smart contracts and how to interact with a Fabric network using the Fabric SDKs. The **Ledger queries**, **Private data**, and **State-based endorsement**
samples demonstrate these additional capabilities. Finally, the **Secured agreement** sample demonstrates how to bring all the capabilities together to securely
transfer an asset in a more realistic transfer scenario.

| **Smart Contract**                                    | **Description**                                                                                                                                                                                                                                                                                                                     | **Tutorial**                                                                                                                                      | **Smart contract languages**     | **Application languages**        |
| ----------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------- | -------------------------------- |
| [Basic](asset-transfer-basic)                         | The Basic sample smart contract that allows you to create and transfer an asset by putting data on the ledger and retrieving it. This sample is recommended for new Fabric users.                                                                                                                                                   | [Writing your first application](https://hyperledger-fabric.readthedocs.io/en/latest/write_first_app.html)                                        | Go, JavaScript, TypeScript, Java | Go, JavaScript, TypeScript, Java |
| [Ledger queries](asset-transfer-ledger-queries)       | The ledger queries sample demonstrates range queries and transaction updates using range queries (applicable for both LevelDB and CouchDB state databases), and how to deploy an index with your chaincode to support JSON queries (applicable for CouchDB state database only).                                                    | [Using CouchDB](https://hyperledger-fabric.readthedocs.io/en/latest/couchdb_tutorial.html)                                                        | Go, JavaScript                   | Java, JavaScript                 |
| [Private data](asset-transfer-private-data)           | This sample demonstrates the use of private data collections, how to manage private data collections with the chaincode lifecycle, and how the private data hash can be used to verify private data on the ledger. It also demonstrates how to control asset updates and transfers using client-based ownership and access control. | [Using Private Data](https://hyperledger-fabric.readthedocs.io/en/latest/private_data_tutorial.html)                                              | Go, Java                         | JavaScript                       |
| [State-Based Endorsement](asset-transfer-sbe)         | This sample demonstrates how to override the chaincode-level endorsement policy to set endorsement policies at the key-level (data/asset level).                                                                                                                                                                                    | [Using State-based endorsement](https://github.com/hyperledger/fabric-samples/tree/main/asset-transfer-sbe)                                       | Java, TypeScript                 | JavaScript                       |
| [Secured agreement](asset-transfer-secured-agreement) | Smart contract that uses implicit private data collections, state-based endorsement, and organization-based ownership and access control to keep data private and securely transfer an asset with the consent of both the current owner and buyer.                                                                                  | [Secured asset transfer](https://hyperledger-fabric.readthedocs.io/en/latest/secured_asset_transfer/secured_private_asset_transfer_tutorial.html) | Go                               | JavaScript                       |
| [Events](asset-transfer-events)                       | The events sample demonstrates how smart contracts can emit events that are read by the applications interacting with the network.                                                                                                                                                                                                  | [README](asset-transfer-events/README.md)                                                                                                         | JavaScript, Java                 | JavaScript                       |
| [Attribute-based access control](asset-transfer-abac) | Demonstrates the use of attribute and identity based access control using a simple asset transfer scenario                                                                                                                                                                                                                          | [README](asset-transfer-abac/README.md)                                                                                                           | Go                               | None                             |

## Additional samples

Additional samples demonstrate various Fabric use cases and application patterns.

| **Sample**                         | **Description**                                                                                                                                                              | **Documentation**                                                                                                 |
| ---------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| [Off chain data](off_chain_data)   | Learn how to use block events to build an off-chain database for reporting and analytics.                                                                                    | [Peer channel-based event services](https://hyperledger-fabric.readthedocs.io/en/latest/peer_event_services.html) |
| [Token SDK](token-sdk)             | Sample REST API around the Hyperledger Labs [Token SDK](https://github.com/hyperledger-labs/fabric-token-sdk) for privacy friendly (zero knowledge proof) UTXO transactions. | [README](token-sdk/README.md)                                                                                     |
| [Token ERC-20](token-erc-20)       | Smart contract demonstrating how to create and transfer fungible tokens using an account-based model.                                                                        | [README](token-erc-20/README.md)                                                                                  |
| [Token UTXO](token-utxo)           | Smart contract demonstrating how to create and transfer fungible tokens using a UTXO (unspent transaction output) model.                                                     | [README](token-utxo/README.md)                                                                                    |
| [Token ERC-1155](token-erc-1155)   | Smart contract demonstrating how to create and transfer multiple tokens (both fungible and non-fungible) using an account based model.                                       | [README](token-erc-1155/README.md)                                                                                |
| [Token ERC-721](token-erc-721)     | Smart contract demonstrating how to create and transfer non-fungible tokens using an account-based model.                                                                    | [README](token-erc-721/README.md)                                                                                 |
| [High throughput](high-throughput) | Learn how you can design your smart contract to avoid transaction collisions in high volume environments.                                                                    | [README](high-throughput/README.md)                                                                               |
| [Simple Auction](auction-simple)   | Run an auction where bids are kept private until the auction is closed, after which users can reveal their bid.                                                              | [README](auction-simple/README.md)                                                                                |
| [Dutch Auction](auction-dutch)     | Run an auction in which multiple items of the same type can be sold to more than one buyer. This example also includes the ability to add an auditor organization.           | [README](auction-dutch/README.md)                                                                                 |

## License <a name="license"></a>

Hyperledger Project source code files are made available under the Apache
License, Version 2.0 (Apache-2.0), located in the [LICENSE](LICENSE) file.
Hyperledger Project documentation files are made available under the Creative
Commons Attribution 4.0 International License (CC-BY-4.0), available at http://creativecommons.org/licenses/by/4.0/.

# 하이퍼레저 패브릭 블록체인 네트워크 실행 가이드

## 사전 준비 단계

### Git 설정

```bash
git config --global core.autocrlf false
git config --global core.longpaths true
```

### 하이퍼레저 패브릭 바이너리 및 도커 이미지 다운로드

```bash
curl -sSL https://bit.ly/2ysbOFE | bash -s -- 2.3.3
```

## 네트워크 실행 절차

### 1. CA 노드 실행

`test-network/tls-ca/script` 디렉토리로 이동

```bash
# CA 노드 실행
./1.caScriptStart.sh

# 실행된 노드 확인
docker ps -a
```

### 2. 인증서 발급 및 네트워크 구동

```bash
# 인증서 발급
./2.registerEnroll.sh

# 블록체인 네트워크 노드 전체 실행
./3.networkUp.sh

# 실행된 노드 확인
docker ps -a
```

### 3. 채널 생성 및 체인코드 설치

`scripts` 디렉토리로 이동

#### 채널 생성

```bash
./4.channelJoin.sh
# 성공 시 200 응답
```

#### 체인코드 패키징 및 설치

```bash
# 체인코드 디렉토리로 이동
cd ../chaincodes/orders-chaincode/

# 종속성 설치 및 빌드
npm i
npm run build

# scripts 디렉토리로 복귀
cd ../../test-network/scripts/

# 체인코드 패키징
./5.chaincodePackaging.sh

# 체인코드 승인 (Package ID 수정 필요)
./6.chaincodeApprove.sh
```

## 추가 설정

### 웹 서버 연결 프로파일 수정

`utils/connection-profile/connection.json` 파일 수정 사항:

-   `NaverMSP`, `DeliveryMSP`, `RestaurantMSP`의 `adminPrivateKey` 경로 업데이트
-   경로: `peerOrganizations/ooo.com/admin/msp/keystore`
-   `../fabric-network` → `../test-hyperledger-bc` 로 경로 변경

## 기타 스크립트

### 인증서 관리

-   `s3CertificateUpload.sh`: S3에 인증서 백업
-   `s3CertificateDelete.sh`: S3 인증서 삭제
-   `s3CertificateDownload.sh`: S3에서 인증서 다운로드

### 네트워크 중단

-   `caServerDown.sh`: CA 노드 종료

## 주의사항

-   인증서 백업을 반드시 수행하세요
-   각 스크립트 실행 시 순서와 경로에 주의하세요
-   AWS CLI 사전 설치 필요 (`sudo apt install awscli -y`)
