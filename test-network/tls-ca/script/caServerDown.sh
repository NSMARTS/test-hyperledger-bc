docker-compose -f ../compose/compose-ca.yaml down -v

# 환경변수 설정

# 삭제할 CA 파일 리스트
RM_CA_FILES="msp ca-cert.pem fabric-ca-server.db IssuerPublicKey IssuerRevocationPublicKey tls-cert.pem"

# 삭제할 CRYPTO 파일 리스트
RM_CRYPTO_FILES="
  admin/msp 
  admin/tls-msp 
  ca/admin/msp
  ca/admin/tls-msp  
  msp
  orderers/orderer.naver.com/assets
  orderers/orderer.naver.com/msp
  orderers/orderer.naver.com/tls-msp
  orderers/orderer2.naver.com/assets
  orderers/orderer2.naver.com/msp
  orderers/orderer2.naver.com/tls-msp
  orderers/orderer3.delivery.com/assets
  orderers/orderer3.delivery.com/msp
  orderers/orderer3.delivery.com/tls-msp
  orderers/orderer4.delivery.com/assets
  orderers/orderer4.delivery.com/msp
  orderers/orderer4.delivery.com/tls-msp
  orderers/orderer5.restaurant.com/assets
  orderers/orderer5.restaurant.com/msp
  orderers/orderer5.restaurant.com/tls-msp
  peers/peer0.naver.com/assets
  peers/peer0.naver.com/msp
  peers/peer0.naver.com/tls-msp
  peers/peer1.naver.com/assets
  peers/peer1.naver.com/msp
  peers/peer1.naver.com/tls-msp  
  peers/peer0.delivery.com/assets
  peers/peer0.delivery.com/msp
  peers/peer0.delivery.com/tls-msp  
  peers/peer1.delivery.com/assets
  peers/peer1.delivery.com/msp
  peers/peer1.delivery.com/tls-msp  
  peers/peer0.restaurant.com/assets
  peers/peer0.restaurant.com/msp
  peers/peer0.restaurant.com/tls-msp    
  peers/peer1.restaurant.com/assets
  peers/peer1.restaurant.com/msp
  peers/peer1.restaurant.com/tls-msp    
"

# 파일 및 디렉터리 삭제
for file in $RM_CA_FILES; do
    rm -rf ../../organizations/fabric-ca/naver/$file
    rm -rf ../../organizations/fabric-ca/delivery/$file
    rm -rf ../../organizations/fabric-ca/restaurant/$file
    rm -rf ../../organizations/fabric-ca/tls-ca/$file
done

for file in $RM_CRYPTO_FILES; do
    rm -rf ../../organizations/peerOrganizations/naver.com/$file
    rm -rf ../../organizations/peerOrganizations/delivery.com/$file
    rm -rf ../../organizations/peerOrganizations/restaurant.com/$file
    rm -rf ../../organizations/tls-ca/$file
done