#!/bin/bash

# TLS CA 시작 -------------------------------------------------------------------------------------------
# TLS CA 클라이언트 인증서 파일 경로 설정
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/fabric-ca/tls-ca/tls-cert.pem

# TLS CA 관리자 홈 디렉토리 생성
mkdir -p ../../organizations/tls-ca/admin

# TLS CA 클라이언트 홈 디렉토리 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/tls-ca/admin

# TLS CA 관리자 등록 (admin 사용자가 adminpw 비밀번호로 등록됨)
../../../bin/fabric-ca-client enroll -d -u https://admin:adminpw@0.0.0.0:5054

# naver 피어 등록 (peer0naver와 peer1naver 등록)
../../../bin/fabric-ca-client register -d --id.name peer0naver --id.secret peer0pw --id.type peer -u https://0.0.0.0:5054
../../../bin/fabric-ca-client register -d --id.name peer1naver --id.secret peer1pw --id.type peer -u https://0.0.0.0:5054

# delivery 피어 등록 (peer0delivery와 peer1delivery 등록)
../../../bin/fabric-ca-client register -d --id.name peer0delivery --id.secret peer0pw --id.type peer -u https://0.0.0.0:5054
../../../bin/fabric-ca-client register -d --id.name peer1delivery --id.secret peer1pw --id.type peer -u https://0.0.0.0:5054

# restaurant 피어 등록 (peer0restaurant와 peer1restaurant 등록)
../../../bin/fabric-ca-client register -d --id.name peer0restaurant --id.secret peer0pw --id.type peer -u https://0.0.0.0:5054
../../../bin/fabric-ca-client register -d --id.name peer1restaurant --id.secret peer1pw --id.type peer -u https://0.0.0.0:5054

# orderer 등록 (각 조직의 orderer 등록)
../../../bin/fabric-ca-client register -d --id.name orderer1naver --id.secret orderer1pw --id.type orderer -u https://0.0.0.0:5054
../../../bin/fabric-ca-client register -d --id.name orderer2naver --id.secret orderer2pw --id.type orderer -u https://0.0.0.0:5054
../../../bin/fabric-ca-client register -d --id.name orderer3delivery --id.secret orderer3pw --id.type orderer -u https://0.0.0.0:5054
../../../bin/fabric-ca-client register -d --id.name orderer4delivery --id.secret orderer4pw --id.type orderer -u https://0.0.0.0:5054
../../../bin/fabric-ca-client register -d --id.name orderer5restaurant --id.secret orderer5pw --id.type orderer -u https://0.0.0.0:5054

# 관리자 등록 (각 조직의 관리자 등록)
../../../bin/fabric-ca-client register -d --id.name naveradmin --id.secret adminpw --id.type admin -u https://0.0.0.0:5054
../../../bin/fabric-ca-client register -d --id.name deliveryadmin --id.secret adminpw --id.type admin -u https://0.0.0.0:5054
../../../bin/fabric-ca-client register -d --id.name restaurantadmin --id.secret adminpw --id.type admin -u https://0.0.0.0:5054

# TLS CA 끝 -------------------------------------------------------------------------------------------

# org1 시작 -------------------------------------------------------------------------------------------
sleep 5  # 잠시 대기

echo "Working on ca-naver"

# naver 조직의 CA 클라이언트 인증서 파일 경로 설정
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/fabric-ca/naver/ca-cert.pem

# naver 조직의 CA 관리자 홈 디렉토리 생성
mkdir -p ../../organizations/peerOrganizations/naver.com/ca/admin

# naver 조직의 CA 클라이언트 홈 디렉토리 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/naver.com/ca/admin

# naver 조직의 CA 관리자 등록 (admin 사용자가 adminpw 비밀번호로 등록됨)
../../../bin/fabric-ca-client enroll -d -u https://admin:adminpw@0.0.0.0:7054

# naver 피어 및 orderer 등록 (7054 포트를 통해 등록)
../../../bin/fabric-ca-client register -d --id.name peer0naver --id.secret peer0pw --id.type peer -u https://0.0.0.0:7054
../../../bin/fabric-ca-client register -d --id.name peer1naver --id.secret peer1pw --id.type peer -u https://0.0.0.0:7054
../../../bin/fabric-ca-client register -d --id.name orderer1naver --id.secret orderer1pw --id.type orderer -u https://0.0.0.0:7054
../../../bin/fabric-ca-client register -d --id.name orderer2naver --id.secret orderer2pw --id.type orderer -u https://0.0.0.0:7054
../../../bin/fabric-ca-client register -d --id.name naveradmin --id.secret adminpw --id.type admin -u https://0.0.0.0:7054

# org1 끝 -------------------------------------------------------------------------------------------

# org2 시작 -------------------------------------------------------------------------------------------
sleep 5  # 잠시 대기
echo "Working on ca-delivery"

# delivery 조직의 CA 클라이언트 인증서 파일 경로 설정
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/fabric-ca/delivery/ca-cert.pem

# delivery 조직의 CA 관리자 홈 디렉토리 생성
mkdir -p ../../organizations/peerOrganizations/delivery.com/ca/admin

# delivery 조직의 CA 클라이언트 홈 디렉토리 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/delivery.com/ca/admin

# delivery 조직의 CA 관리자 등록 (admin 사용자가 adminpw 비밀번호로 등록됨)
../../../bin/fabric-ca-client enroll -d -u https://admin:adminpw@0.0.0.0:9054

# delivery 피어 및 orderer 등록 (9054 포트를 통해 등록)
../../../bin/fabric-ca-client register -d --id.name peer0delivery --id.secret peer0pw --id.type peer -u https://0.0.0.0:9054
../../../bin/fabric-ca-client register -d --id.name peer1delivery --id.secret peer1pw --id.type peer -u https://0.0.0.0:9054
../../../bin/fabric-ca-client register -d --id.name orderer3delivery --id.secret orderer3pw --id.type orderer -u https://0.0.0.0:9054
../../../bin/fabric-ca-client register -d --id.name orderer4delivery --id.secret orderer4pw --id.type orderer -u https://0.0.0.0:9054
../../../bin/fabric-ca-client register -d --id.name deliveryadmin --id.secret adminpw --id.type admin -u https://0.0.0.0:9054

# org2 끝 -------------------------------------------------------------------------------------------

# org3 시작 -------------------------------------------------------------------------------------------
sleep 5  # 잠시 대기
echo "Working on ca-restaurant"

# restaurant 조직의 CA 클라이언트 인증서 파일 경로 설정
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/fabric-ca/restaurant/ca-cert.pem

# restaurant 조직의 CA 관리자 홈 디렉토리 생성
mkdir -p ../../organizations/peerOrganizations/restaurant.com/ca/admin

# restaurant 조직의 CA 클라이언트 홈 디렉토리 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/restaurant.com/ca/admin

# restaurant 조직의 CA 관리자 등록 (admin 사용자가 adminpw 비밀번호로 등록됨)
../../../bin/fabric-ca-client enroll -d -u https://admin:adminpw@0.0.0.0:10054

# restaurant 피어 및 orderer 등록 (10054 포트를 통해 등록)
../../../bin/fabric-ca-client register -d --id.name peer0restaurant --id.secret peer0pw --id.type peer -u https://0.0.0.0:10054
../../../bin/fabric-ca-client register -d --id.name peer1restaurant --id.secret peer1pw --id.type peer -u https://0.0.0.0:10054
../../../bin/fabric-ca-client register -d --id.name orderer5restaurant --id.secret orderer5pw --id.type orderer -u https://0.0.0.0:10054
../../../bin/fabric-ca-client register -d --id.name restaurantadmin --id.secret adminpw --id.type admin -u https://0.0.0.0:10054

# org3 끝 -------------------------------------------------------------------------------------------
sleep 5  # 잠시 대기
echo "All CA and registration done"

# naver 피어 등록 -----------------------------------------------
echo "Enroll naver"

# peer0-naver 등록 시작 -----------------------------------------------
echo "*** Enroll peer0-naver"

# naver 조직의 peer0 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/assets/ca 
cp ${PWD}/../../organizations/peerOrganizations/naver.com/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/assets/ca/naver-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/assets/tls-ca/tls-ca-cert.pem

# peer0-naver 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer0.naver.com
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/assets/ca/naver-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# peer0-naver 등록 (7054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer0naver:peer0pw@0.0.0.0:7054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer0naver:peer0pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts peer0.naver.com --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/tls-msp/keystore/key.pem

# peer0-naver 등록 끝 -----------------------------------------------

# peer1-naver 등록 시작 -----------------------------------------------
echo "*** Enroll peer1-naver"

# naver 조직의 peer1 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/assets/ca 
cp ${PWD}/../../organizations/peerOrganizations/naver.com/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/assets/ca/naver-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/assets/tls-ca/tls-ca-cert.pem

# peer1-naver 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer1.naver.com
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/assets/ca/naver-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# peer1-naver 등록 (7054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer1naver:peer1pw@0.0.0.0:7054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer1naver:peer1pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts peer1.naver.com --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/tls-msp/keystore/key.pem

# peer1-naver 등록 끝 -----------------------------------------------

# peer0-delivery 등록 시작 -----------------------------------------------
echo "*** Enroll peer0-delivery"

# delivery 조직의 peer0 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/assets/ca 
cp ${PWD}/../../organizations/peerOrganizations/delivery.com/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/assets/ca/delivery-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/assets/tls-ca/tls-ca-cert.pem

# peer0-delivery 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/assets/ca/delivery-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# peer0-delivery 등록 (9054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer0delivery:peer0pw@0.0.0.0:9054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer0delivery:peer0pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts peer0.delivery.com --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/tls-msp/keystore/key.pem
# peer0-delivery 등록 끝 -----------------------------------------------

# peer1-delivery 등록 시작 -----------------------------------------------
echo "*** Enroll peer1-delivery"

# delivery 조직의 peer1 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com/assets/ca 
cp ${PWD}/../../organizations/peerOrganizations/delivery.com/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com/assets/ca/delivery-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com/assets/tls-ca/tls-ca-cert.pem

# peer1-delivery 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com/assets/ca/delivery-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# peer1-delivery 등록 (9054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer1delivery:peer1pw@0.0.0.0:9054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer1delivery:peer1pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts peer1.delivery.com --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com/tls-msp/keystore/key.pem
# peer1-delivery 등록 끝 -----------------------------------------------

# peer0-restaurant 등록 시작 -----------------------------------------------
echo "*** Enroll peer0-restaurant"

# restaurant 조직의 peer0 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/assets/ca 
cp ${PWD}/../../organizations/peerOrganizations/restaurant.com/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/assets/ca/restaurant-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/assets/tls-ca/tls-ca-cert.pem

# peer0-restaurant 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/assets/ca/restaurant-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# peer0-restaurant 등록 (10054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer0restaurant:peer0pw@0.0.0.0:10054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer0restaurant:peer0pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts peer0.restaurant.com --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/tls-msp/keystore/key.pem
# peer0-restaurant 등록 끝 -----------------------------------------------

# peer1-restaurant 등록 시작 -----------------------------------------------
echo "*** Enroll peer1-restaurant"

# restaurant 조직의 peer1 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/assets/ca 
cp ${PWD}/../../organizations/peerOrganizations/restaurant.com/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/assets/ca/restaurant-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/assets/tls-ca/tls-ca-cert.pem

# peer1-restaurant 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/assets/ca/restaurant-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# peer1-restaurant 등록 (10054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer1restaurant:peer1pw@0.0.0.0:10054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://peer1restaurant:peer1pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts peer1.restaurant.com --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/tls-msp/keystore/key.pem
# peer1-restaurant 등록 끝 -----------------------------------------------

# orderer1-naver 등록 시작 -----------------------------------------------

echo "### Enroll orderer1-naver"

# orderer1-naver 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com/assets/ca
cp ${PWD}/../../organizations/peerOrganizations/naver.com/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com/assets/ca/naver-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com/assets/tls-ca/tls-ca-cert.pem

# orderer1-naver 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com/assets/ca/naver-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# orderer1-naver 등록 (7054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer1naver:orderer1pw@0.0.0.0:7054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer1naver:orderer1pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts orderer.naver.com --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com/tls-msp/keystore/key.pem

# orderer1-naver 등록 끝 -----------------------------------------------

# orderer2-naver 등록 시작 -----------------------------------------------

echo "### Enroll orderer2-naver"

# orderer2-naver 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer2.naver.com/assets/ca
cp ${PWD}/../../organizations/peerOrganizations/naver.com/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer2.naver.com/assets/ca/naver-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer2.naver.com/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer2.naver.com/assets/tls-ca/tls-ca-cert.pem

# orderer2-naver 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer2.naver.com
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer2.naver.com/assets/ca/naver-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# orderer2-naver 등록 (7054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer2naver:orderer2pw@0.0.0.0:7054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer2.naver.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer2naver:orderer2pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts orderer2.naver.com --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer2.naver.com/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer2.naver.com/tls-msp/keystore/key.pem

# orderer2-naver 등록 끝 -----------------------------------------------

# orderer3-delivery 등록 시작 -----------------------------------------------

echo "### Enroll orderer3-delivery"

# orderer3-delivery 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer3.delivery.com/assets/ca
cp ${PWD}/../../organizations/peerOrganizations/delivery.com/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer3.delivery.com/assets/ca/delivery-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer3.delivery.com/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer3.delivery.com/assets/tls-ca/tls-ca-cert.pem

# orderer3-delivery 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer3.delivery.com
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer3.delivery.com/assets/ca/delivery-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# orderer3-delivery 등록 (9054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer3delivery:orderer3pw@0.0.0.0:9054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer3.delivery.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer3delivery:orderer3pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts orderer3.delivery.com --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer3.delivery.com/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer3.delivery.com/tls-msp/keystore/key.pem

# orderer3-delivery 등록 끝 -----------------------------------------------

# orderer4-delivery 등록 시작 -----------------------------------------------

echo "### Enroll orderer4-delivery"

# orderer4-delivery 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer4.delivery.com/assets/ca
cp ${PWD}/../../organizations/peerOrganizations/delivery.com/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer4.delivery.com/assets/ca/delivery-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer4.delivery.com/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer4.delivery.com/assets/tls-ca/tls-ca-cert.pem

# orderer4-delivery 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer4.delivery.com
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer4.delivery.com/assets/ca/delivery-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# orderer4-delivery 등록 (9054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer4delivery:orderer4pw@0.0.0.0:9054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer4.delivery.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer4delivery:orderer4pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts orderer4.delivery.com --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer4.delivery.com/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer4.delivery.com/tls-msp/keystore/key.pem

# orderer4-delivery 등록 끝 -----------------------------------------------

# orderer5-restaurant 등록 시작 -----------------------------------------------

echo "### Enroll orderer5-restaurant"

# orderer5-restaurant 관련 디렉토리 및 파일 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/assets/ca
cp ${PWD}/../../organizations/peerOrganizations/restaurant.com/ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/assets/ca/restaurant-ca-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/assets/tls-ca 
cp ${PWD}/../../organizations/tls-ca/admin/msp/cacerts/* ${PWD}/../../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/assets/tls-ca/tls-ca-cert.pem

# orderer5-restaurant 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/assets/ca/restaurant-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# orderer5-restaurant 등록 (10054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer5restaurant:orderer5pw@0.0.0.0:10054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://orderer5restaurant:orderer5pw@0.0.0.0:5054 --enrollment.profile tls --csr.hosts orderer5.restaurant.com --csr.hosts localhost

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/tls-msp/keystore/key.pem

# orderer5-restaurant 등록 끝 -----------------------------------------------

# naver 관리자 등록 시작 -----------------------------------------------
echo "### Enroll Naver Admin"

# naver 관리자 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/naver.com/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/assets/ca/naver-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# naver 관리자 등록 (7054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://naveradmin:adminpw@0.0.0.0:7054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://naveradmin:adminpw@0.0.0.0:5054 --enrollment.profile tls

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/naver.com/admin/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/naver.com/admin/tls-msp/keystore/key.pem

# 관리자 인증서 복사 및 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/msp/admincerts
cp ${PWD}/../../organizations/peerOrganizations/naver.com/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/msp/admincerts/naver-admin-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/naver.com/admin/msp/admincerts
cp ${PWD}/../../organizations/peerOrganizations/naver.com/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/naver.com/admin/msp/admincerts/naver-admin-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/naver.com/msp/{admincerts,cacerts,tlscacerts,users}

cp ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/assets/ca/naver-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/naver.com/msp/cacerts/

cp ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/assets/tls-ca/tls-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/naver.com/msp/tlscacerts/

# peer1-naver 관리자 인증서 복사 및 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/msp/admincerts
cp ${PWD}/../../organizations/peerOrganizations/naver.com/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/msp/admincerts/naver-admin-cert.pem

cp ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/assets/ca/naver-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/naver.com/msp/cacerts/

cp ${PWD}/../../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/assets/tls-ca/tls-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/naver.com/msp/tlscacerts/

cp ${PWD}/../../organizations/peerOrganizations/naver.com/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/naver.com/msp/admincerts/admin-naver-cert.pem

cp ./naver-config.yaml ${PWD}/../../organizations/peerOrganizations/naver.com/msp/config.yaml

# orderer1-naver 조직 구성 설정
cp ./naver-config.yaml ${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com/msp/config.yaml

# orderer2-naver 조직 구성 설정
cp ./naver-config.yaml ${PWD}/../../organizations/peerOrganizations/naver.com/orderers/orderer2.naver.com/msp/config.yaml

# naver 관리자 등록 끝 -----------------------------------------------

# delivery 관리자 등록 시작 -----------------------------------------------
echo "### Enroll delivery Admin"

# delivery 관리자 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/delivery.com/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/assets/ca/delivery-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# delivery 관리자 등록 (9054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://deliveryadmin:adminpw@0.0.0.0:9054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://deliveryadmin:adminpw@0.0.0.0:5054 --enrollment.profile tls

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/delivery.com/admin/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/delivery.com/admin/tls-msp/keystore/key.pem

# 관리자 인증서 복사 및 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/msp/admincerts
cp ${PWD}/../../organizations/peerOrganizations/delivery.com/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/msp/admincerts/delivery-admin-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/delivery.com/admin/msp/admincerts
cp ${PWD}/../../organizations/peerOrganizations/delivery.com/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/delivery.com/admin/msp/admincerts/delivery-admin-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/delivery.com/msp/{admincerts,cacerts,tlscacerts,users}

cp ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/assets/ca/delivery-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/delivery.com/msp/cacerts/

cp ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/assets/tls-ca/tls-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/delivery.com/msp/tlscacerts/

# peer1-delivery 관리자 인증서 복사 및 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com/msp/admincerts
cp ${PWD}/../../organizations/peerOrganizations/delivery.com/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com/msp/admincerts/delivery-admin-cert.pem

cp ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com/assets/ca/delivery-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/delivery.com/msp/cacerts/

cp ${PWD}/../../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com/assets/tls-ca/tls-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/delivery.com/msp/tlscacerts/

cp ${PWD}/../../organizations/peerOrganizations/delivery.com/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/delivery.com/msp/admincerts/admin-delivery-cert.pem

cp ./delivery-config.yaml ${PWD}/../../organizations/peerOrganizations/delivery.com/msp/config.yaml

# orderer3-delivery 조직 구성 설정
cp ./delivery-config.yaml ${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer3.delivery.com/msp/config.yaml

# orderer4-delivery 조직 구성 설정
cp ./delivery-config.yaml ${PWD}/../../organizations/peerOrganizations/delivery.com/orderers/orderer4.delivery.com/msp/config.yaml

# delivery 관리자 등록 끝 -----------------------------------------------

# restaurant 관리자 등록 시작 -----------------------------------------------
echo "### Enroll restaurant Admin"

# restaurant 관리자 홈 디렉토리 및 환경 변수 설정
export FABRIC_CA_CLIENT_HOME=${PWD}/../../organizations/peerOrganizations/restaurant.com/admin
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/assets/ca/restaurant-ca-cert.pem
export FABRIC_CA_CLIENT_MSPDIR=msp

# restaurant 관리자 등록 (10054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://restaurantadmin:adminpw@0.0.0.0:10054

# TLS 인증서 설정
export FABRIC_CA_CLIENT_MSPDIR=tls-msp
export FABRIC_CA_CLIENT_TLS_CERTFILES=${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/assets/tls-ca/tls-ca-cert.pem

# TLS 인증서 등록 (5054 포트를 통해 등록)
../../../bin/fabric-ca-client enroll -d -u https://restaurantadmin:adminpw@0.0.0.0:5054 --enrollment.profile tls

# TLS 인증서의 키 파일 복사 및 이름 변경
cp ${PWD}/../../organizations/peerOrganizations/restaurant.com/admin/tls-msp/keystore/*_sk ${PWD}/../../organizations/peerOrganizations/restaurant.com/admin/tls-msp/keystore/key.pem

# 관리자 인증서 복사 및 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/msp/admincerts
cp ${PWD}/../../organizations/peerOrganizations/restaurant.com/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/msp/admincerts/restaurant-admin-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/restaurant.com/admin/msp/admincerts
cp ${PWD}/../../organizations/peerOrganizations/restaurant.com/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/restaurant.com/admin/msp/admincerts/restaurant-admin-cert.pem

mkdir -p ${PWD}/../../organizations/peerOrganizations/restaurant.com/msp/{admincerts,cacerts,tlscacerts,users}

cp ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/assets/ca/restaurant-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/restaurant.com/msp/cacerts/

cp ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/assets/tls-ca/tls-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/restaurant.com/msp/tlscacerts/

# peer1-restaurant 관리자 인증서 복사 및 설정
mkdir -p ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/msp/admincerts
cp ${PWD}/../../organizations/peerOrganizations/restaurant.com/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/msp/admincerts/restaurant-admin-cert.pem

cp ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/assets/ca/restaurant-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/restaurant.com/msp/cacerts/

cp ${PWD}/../../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/assets/tls-ca/tls-ca-cert.pem ${PWD}/../../organizations/peerOrganizations/restaurant.com/msp/tlscacerts/

cp ${PWD}/../../organizations/peerOrganizations/restaurant.com/admin/msp/signcerts/cert.pem ${PWD}/../../organizations/peerOrganizations/restaurant.com/msp/admincerts/admin-restaurant-cert.pem

cp ./restaurant-config.yaml ${PWD}/../../organizations/peerOrganizations/restaurant.com/msp/config.yaml

# orderer5-restaurant 조직 구성 설정
cp ./restaurant-config.yaml ${PWD}/../../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/msp/config.yaml

# restaurant 관리자 등록 끝 -----------------------------------------------

