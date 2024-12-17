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

## 블록체인 실행 방법

-   깃설정

```bash
git config --global core.autocrlf false
git config --global core.longpaths true
```

-   하이퍼레저 패브릭 바이너리 파일 및 도커 이미지 다운

```bash
curl -sSL https://bit.ly/2ysbOFE | bash -s -- 2.3.3
```

-   네트워크 실행

    하이퍼레저 네트워크를 실행시키기 위해 test-network/tls-ca/script
    경로로 이동. 이곳에선 ca와 관련된 스크립트가 존재

1.caScriptStart.sh 는 CA 노드를 실행시키는 스크립트.
CA는 peer, orderer, couchDB, admin, client 인증서를 발급하는 역할을 하는 노드
2.registerEnroll.sh 은 CA노드가 인증서를 발급하는 스크립트
3.networkUp.sh 은 나머지 블록체인 네트워크 노드를 실행시키는 스크립트
caServerDown.sh 은 CA노드를 종료시키는 코드
delivery-config.yaml restaurant-config.yaml naver-config.yaml은 인증서 관련 설정 파일

```bash
# ca 노드 실행
./1.caScriptStart.sh
# 실행된 노드 목록 조회
docker ps -a
```

```bash
# 인증서 발급
./2.registerEnroll.sh
# 하이퍼레저 패브릭 나머지 노드 전체 실행
./3.networkUp.sh
# 실행된 노드 목록 조회
docker ps -a
```

-   채널 가입 및 체인코드 설치

```bash
cd ../../scripts
ls
```

4.channelJoin.sh은 채널 생성에 필요한 block 파일을 생성 및 참가하는 코드 이다.
해당 코드 안에는 블록을 생성하는 명령어가 존재한다.
이 코드의 flag를 보면 -configPath ${PWD}/../configtx 가 있는데
configtx.yaml 이 코드에서 채널과 조직 설정 파일이다.
5.chaincodePackaging.sh은 체인코드를 패키징 후 설치하는 스크립트이다. 5번 스크립트를 실행하기전 반드시 체인코드 경로로가 체인코드를 빌드해야한다.
6.chaincodeApprove.sh은 체인코드 승인 스크립트 이다. 6번을 실행하기전 반드시 5번 스크립트 실행 후 나온 ID를 복사 후 PACKAGE_ID 환경변수를 변경 해야한다.
7.s3CertificateUpload.sh은 s3에 인증서를 업로드하는 코드이다. 인증서 발급한 데이터를 백업하는 것 이다. 만약 백업을 하지 않고 종료를 해버리면 인증서가 다 먹통된다. 7번 스크립트는 그냥 awscli를 사용함으로 aws cli를 설치해야한다.

```bash
./1# aws cli 설치
sudo apt install awscli -y
# aws 계정 정보 등록
aws configure
```

s3CertificateDelete.sh은 s3 인증서 삭제 스크립트이다. s3 인증서 업로드 하기 전 미리 삭제해두고 실행하자
s3CertificateDownload.sh은 s3 인증서 다운로드 스크립트 이다. 백업한거 다운로드가 가능하다.
orderchannel.block 은 4번 스크립트를 실행하면 생성되는 파일이다. 채널 생성에 필요한 block 파일이니 매우 중요하다.

```bash
./4.channelJoin.sh
```

성공적으로 완료되면 200 이 뜬다.
다음은 체인코드 패키징 및 설치이다.
chaincodes/orders-chaincode 경로로 이동.
체인코드 파일을 빌드한다.

```bash
cd ../../chaincodes/orders-chaincode/
npm i
npm run build
```
