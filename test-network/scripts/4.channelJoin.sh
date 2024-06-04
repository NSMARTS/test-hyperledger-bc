#----------------------------------------------------------------------------------------------
# 채널 생성에 필요한 파일을 생성하는 스크립트
# orderchannel 생성 
echo 채널 블록 생성
../../bin/configtxgen -profile ThreeOrgNetworkRaft -configPath ${PWD}/../configtx -outputBlock orderchannel.block -channelID orderchannel
sleep 3
#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
# 오더러 채널 참가
# 여기서  -o localhost:7053은 ORDERER_ADMIN_LISTENADDRESS 설정값임. 설정값은 compose-smarts-service.yaml에 있다.

echo 오더러1 채널 참가 

export ORDERER_CA=${PWD}/../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel join --channelID orderchannel --config-block orderchannel.block -o localhost:7053 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/naver.com/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/naver.com/admin/tls-msp/keystore/key.pem
sleep 3

echo 오더러2 채널 참가

export ORDERER_CA=${PWD}/../organizations/peerOrganizations/naver.com/orderers/orderer2.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
../../bin/osnadmin channel join --channelID orderchannel --config-block orderchannel.block -o localhost:7055 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/naver.com/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/naver.com/admin/tls-msp/keystore/key.pem
sleep 3

#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------

echo 오더러3 채널 참가
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/delivery.com/orderers/orderer3.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel join --channelID orderchannel --config-block orderchannel.block -o localhost:7057 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/delivery.com/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/delivery.com/admin/tls-msp/keystore/key.pem
sleep 3

echo 오더러4 채널 참가
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/delivery.com/orderers/orderer4.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel join --channelID orderchannel --config-block orderchannel.block -o localhost:7059 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/delivery.com/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/delivery.com/admin/tls-msp/keystore/key.pem
sleep 3

#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
echo 오더러5 채널 참가

export ORDERER_CA=${PWD}/../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel join --channelID orderchannel --config-block orderchannel.block -o localhost:7061 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/restaurant.com/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/restaurant.com/admin/tls-msp/keystore/key.pem
sleep 3
#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
# 터미널 peer1 채널에 참가
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NaverMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/naver.com/peers/peer0.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/naver.com/admin/msp
export CORE_PEER_ADDRESS=localhost:7051

../../bin/peer channel join -b orderchannel.block

sleep 3

# 터미널 peer2 채널에 참가
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/naver.com/orderers/orderer2.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="NaverMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/naver.com/peers/peer1.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/naver.com/admin/msp
export CORE_PEER_ADDRESS=localhost:9051

../../bin/peer channel join -b orderchannel.block

sleep 3
#----------------------------------------------------------------------------------------------

# 터미널 peer1 채널에 참가
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/delivery.com/orderers/orderer3.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="DeliveryMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/delivery.com/peers/peer0.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/delivery.com/admin/msp
export CORE_PEER_ADDRESS=localhost:11051

../../bin/peer channel join -b orderchannel.block

sleep 3

# 터미널 peer2 채널에 참가
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/delivery.com/orderers/orderer4.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="DeliveryMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/delivery.com/peers/peer1.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/delivery.com/admin/msp
export CORE_PEER_ADDRESS=localhost:13051

../../bin/peer channel join -b orderchannel.block

sleep 3
#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------

# 터미널 peer1 채널에 참가
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="RestaurantMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer0.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/restaurant.com/admin/msp
export CORE_PEER_ADDRESS=localhost:15051

../../bin/peer channel join -b orderchannel.block

sleep 3

# 터미널 peer2 채널에 참가
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="RestaurantMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/../organizations/peerOrganizations/restaurant.com/peers/peer1.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem
export CORE_PEER_MSPCONFIGPATH=${PWD}/../organizations/peerOrganizations/restaurant.com/admin/msp
export CORE_PEER_ADDRESS=localhost:17051

../../bin/peer channel join -b orderchannel.block

sleep 3
#----------------------------------------------------------------------------------------------

echo 채널 상태 조회----------------
export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/naver.com/orderers/orderer.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel list -o localhost:7053 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/naver.com/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/naver.com/admin/tls-msp/keystore/key.pem

export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/naver.com/orderers/orderer2.naver.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel list -o localhost:7055 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/naver.com/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/naver.com/admin/tls-msp/keystore/key.pem



export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/delivery.com/orderers/orderer3.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel list -o localhost:7057 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/delivery.com/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/delivery.com/admin/tls-msp/keystore/key.pem

export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/delivery.com/orderers/orderer4.delivery.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel list -o localhost:7057 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/delivery.com/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/delivery.com/admin/tls-msp/keystore/key.pem

export FABRIC_CFG_PATH=${PWD}/../configtx
export ORDERER_CA=${PWD}/../organizations/peerOrganizations/restaurant.com/orderers/orderer5.restaurant.com/tls-msp/tlscacerts/tls-0-0-0-0-5054.pem

../../bin/osnadmin channel list -o localhost:7059 --ca-file $ORDERER_CA --client-cert ${PWD}/../organizations/peerOrganizations/restaurant.com/admin/tls-msp/signcerts/cert.pem --client-key ${PWD}/../organizations/peerOrganizations/restaurant.com/admin/tls-msp/keystore/key.pem