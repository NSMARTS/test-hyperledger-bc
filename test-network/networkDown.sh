# 도커 네트워크 종료 -v(볼륨) --remove-orphans(yaml과 관련없는 볼륨 데이터 삭제)
docker-compose -f ./naver/compose/compose-naver.yaml down -v --remove-orphans

docker-compose -f ./delivery/compose/compose-delivery.yaml down -v --remove-orphans

docker-compose -f ./restaurant/compose/compose-restaurant.yaml down -v --remove-orphans

# 볼륨 전체 삭제
docker volume rm $(docker volume ls -q)

# 네트워크 삭제
docker network prune

# 체인코드 이미지 삭제  
docker rmi -f $(docker images -q --filter=reference='*dev-*') 

docker rm $(docker ps -a -q --filter "ancestor=hyperledger/fabric-nodeenv:2.5")

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
    sudo rm -rf ./organizations/fabric-ca/naver/$file
    sudo rm -rf ./organizations/fabric-ca/delivery/$file
    sudo rm -rf ./organizations/fabric-ca/restaurant/$file
    sudo rm -rf ./organizations/fabric-ca/tls-ca/$file
done

for file in $RM_CRYPTO_FILES; do
    sudo rm -rf ./organizations/peerOrganizations/naver.com/$file
    sudo rm -rf ./organizations/peerOrganizations/delivery.com/$file
    sudo rm -rf ./organizations/peerOrganizations/restaurant.com/$file
    sudo rm -rf ./organizations/tls-ca/$file
done
