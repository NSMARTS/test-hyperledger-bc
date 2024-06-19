export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/naver.com/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NaverMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CC_NAME=order
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=order_v1:180aa0ff62d4fc303885051ab2225b314084bed612f5a7c37de66bfbed6cdb19

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID orderchannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID




export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/delivery.com/orderers/orderer3.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="DeliveryMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/delivery.com/admin/msp
export CORE_PEER_ADDRESS=localhost:11051
export CC_NAME=order
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=order_v1:180aa0ff62d4fc303885051ab2225b314084bed612f5a7c37de66bfbed6cdb19

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID orderchannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID





sleep 3



export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="RestaurantMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/restaurant.com/admin/msp
export CORE_PEER_ADDRESS=localhost:15051
export CC_NAME=order
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=order_v1:180aa0ff62d4fc303885051ab2225b314084bed612f5a7c37de66bfbed6cdb19

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:15051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:17051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID orderchannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID


export ORDERER_CA=${PWD}/../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem


../../bin/peer lifecycle chaincode checkcommitreadiness --channelID orderchannel --name $CC_NAME  --version $CC_VERSION --sequence 1 --output json  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem -o localhost:7050 --tls --cafile $ORDERER_CA  --init-required

sleep 3


../../bin/peer lifecycle chaincode commit -o localhost:7050 --tls --cafile $ORDERER_CA --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem   --peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:15051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:17051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --channelID orderchannel --name $CC_NAME --version $CC_VERSION --sequence 1 --init-required

sleep 3


# ../../bin/peer chaincode invoke -o localhost:7050 --tls --cafile $ORDERER_CA --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem   --peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:15051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:17051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem -C orderchannel -n $CC_NAME --isInit -c '{"function":"InitLedger","Args":[]}'

../../bin/peer chaincode invoke -o localhost:7050 --tls --cafile $ORDERER_CA \
--peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:11051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:13051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:15051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:17051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
-C orderchannel -n $CC_NAME --isInit -c '{"function":"GetAllOrders","Args":[]}'


echo contract 채널 시작 -----------------------------------------


export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/naver.com/admin/msp
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NaverMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CC_NAME=contract
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=contract_v1:15715ad07ab287a4540b307b805700b2c16a4b02baad02a404b8e285b0723d9f

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID contractchannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID



sleep 3



export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="RestaurantMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/restaurant.com/admin/msp
export CORE_PEER_ADDRESS=localhost:15051
export CC_NAME=contract
export CC_VERSION=v1
# 패키지 아이디는 매번 변경된다.
export PACKAGE_ID=contract_v1:15715ad07ab287a4540b307b805700b2c16a4b02baad02a404b8e285b0723d9f

../../bin/peer lifecycle chaincode approveformyorg  --peerAddresses localhost:15051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:17051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  -o localhost:7050 --tls --cafile $ORDERER_CA --channelID contractchannel --name $CC_NAME --version $CC_VERSION --init-required --sequence 1 --waitForEvent --package-id $PACKAGE_ID


export ORDERER_CA=${PWD}/../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/peer lifecycle chaincode checkcommitreadiness --channelID contractchannel --name $CC_NAME  --version $CC_VERSION --sequence 1 --output json  --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem -o localhost:7050 --tls --cafile $ORDERER_CA  --init-required


sleep 3


../../bin/peer lifecycle chaincode commit -o localhost:7050 --tls --cafile $ORDERER_CA --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem  --peerAddresses localhost:15051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --peerAddresses localhost:17051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem --channelID contractchannel --name $CC_NAME --version $CC_VERSION --sequence 1 --init-required

sleep 3



../../bin/peer chaincode invoke -o localhost:7050 --tls --cafile $ORDERER_CA \
--peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:15051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
--peerAddresses localhost:17051 --tlsRootCertFiles ${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem \
-C contractchannel -n $CC_NAME --isInit -c '{"function":"GetAllContractInfos","Args":[]}'


echo contract 채널 끝 -----------------------------------------
