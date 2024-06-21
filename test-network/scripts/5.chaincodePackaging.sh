# 체인코드 빌드
# 경로에서 알아서 하자.

# 패키징

echo ---------------------- Order chaincode regist start -------------------------------------
export FABRIC_CFG_PATH=${PWD}/../configtx
export CC_SRC_PATH=${PWD}/../../chaincodes/orders-chaincode/
export CC_NAME=order
export CC_VERSION=v1
mkdir ../packagedChaincode
chmod -R 755 ../packagedChaincode

../../bin/peer lifecycle chaincode package ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz --path ${CC_SRC_PATH} --lang node --label ${CC_NAME}_${CC_VERSION} >&log.txt

# 체인코드 naver peer0 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NaverMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/naver.com/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CC_NAME=order
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz

sleep 3

# 체인코드 naver peer1 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/naver.com/orderers/orderer2.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NaverMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/naver.com/admin/msp
export CORE_PEER_ADDRESS=localhost:9051
export CC_NAME=order
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz


sleep 3


# 체인코드 delivery peer0 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/delivery.com/orderers/orderer3.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="DeliveryMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/delivery.com/admin/msp
export CORE_PEER_ADDRESS=localhost:11051
export CC_NAME=order
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz


sleep 3



# 체인코드 delivery peer1 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/delivery.com/orderers/orderer4.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="DeliveryMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/delivery.com/admin/msp
export CORE_PEER_ADDRESS=localhost:13051
export CC_NAME=order
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz


sleep 3

# 체인코드 restaurant peer0 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="RestaurantMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/restaurant.com/admin/msp
export CORE_PEER_ADDRESS=localhost:15051
export CC_NAME=order
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz


sleep 3

# 체인코드 Restaurant peer1 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="RestaurantMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/restaurant.com/admin/msp
export CORE_PEER_ADDRESS=localhost:17051
export CC_NAME=order
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz


sleep 3

echo -----------------------------------------------------------
echo 설치된 패키지 id 확인!!
echo ----------------------------------------------------------
../../bin/peer lifecycle chaincode queryinstalled

# Chaincode code package identifier:  
# order_v1:ec2ff80e4d85033de67b4a1b81b03657237abfa2b579fe2ec23b26c5e73df8a9


echo ---------------------- order chaincode regist end -------------------------------------




# 체인코드 빌드
# 경로에서 알아서 하자.

# 패키징

echo ---------------------- contract chaincode regist start -------------------------------------
export FABRIC_CFG_PATH=${PWD}/../configtx
export CC_SRC_PATH=${PWD}/../../chaincodes/contracts-chaincode/
export CC_NAME=contract
export CC_VERSION=v1
../../bin/peer lifecycle chaincode package ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz --path ${CC_SRC_PATH} --lang node --label ${CC_NAME}_${CC_VERSION} >&log.txt

# 체인코드 naver peer0 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NaverMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/naver.com/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CC_NAME=contract
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz

sleep 3

# 체인코드 naver peer1 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/naver.com/orderers/orderer2.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NaverMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/naver.com/admin/msp
export CORE_PEER_ADDRESS=localhost:9051
export CC_NAME=contract
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz


sleep 3

# 체인코드 restaurant peer0 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="RestaurantMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/restaurant.com/admin/msp
export CORE_PEER_ADDRESS=localhost:15051
export CC_NAME=contract
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz


sleep 3

# 체인코드 Restaurant peer1 인스톨
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="RestaurantMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/restaurant.com/admin/msp
export CORE_PEER_ADDRESS=localhost:17051
export CC_NAME=contract
export CC_VERSION=v1
../../bin/peer lifecycle chaincode install ../packagedChaincode/${CC_NAME}_${CC_VERSION}.tar.gz


sleep 3

echo -----------------------------------------------------------
echo 설치된 패키지 id 확인!!
echo ----------------------------------------------------------
../../bin/peer lifecycle chaincode queryinstalled

# Chaincode code package identifier:  
# order_v1:ec2ff80e4d85033de67b4a1b81b03657237abfa2b579fe2ec23b26c5e73df8a9


echo ---------------------- contract chaincode regist end -------------------------------------

