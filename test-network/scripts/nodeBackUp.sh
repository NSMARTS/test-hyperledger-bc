# 노드 백업
# 블록체인 네트워크 각 노드 별 현재 상태를 압축 보관   

sudo mkdir ../backup

echo 네이버 peer0 복제

docker run --rm --volumes-from peer0.naver.com -v $(pwd)/../backup:/backup busybox tar cvf /backup/peer0.naver.com-backup.tar -C /var/hyperledger/production .

docker run --rm --volumes-from orderer.naver.com -v $(pwd)/../backup:/backup busybox tar cvf /backup/orderer.naver.com-backup.tar -C /var/hyperledger/production/orderer .

docker run --rm --volumes-from couchdb0 -v $(pwd)/../backup:/backup busybox tar cvf /backup/couchdb0-backup.tar -C /opt/couchdb/data .

echo 네이버 peer1 복제

docker run --rm --volumes-from peer1.naver.com -v $(pwd)/../backup:/backup busybox tar cvf /backup/peer1.naver.com-backup.tar -C /var/hyperledger/production .

docker run --rm --volumes-from orderer2.naver.com -v $(pwd)/../backup:/backup busybox tar cvf /backup/orderer2.naver.com-backup.tar -C /var/hyperledger/production/orderer .

docker run --rm --volumes-from couchdb1 -v $(pwd)/../backup:/backup busybox tar cvf /backup/couchdb1-backup.tar -C /opt/couchdb/data .

echo 배달업체 peer0 복제

docker run --rm --volumes-from peer0.delivery.com -v $(pwd)/../backup:/backup busybox tar cvf /backup/peer0.delivery.com-backup.tar -C /var/hyperledger/production .

docker run --rm --volumes-from orderer3.delivery.com -v $(pwd)/../backup:/backup busybox tar cvf /backup/orderer3.delivery.com-backup.tar -C /var/hyperledger/production/orderer .

docker run --rm --volumes-from couchdb2 -v $(pwd)/../backup:/backup busybox tar cvf /backup/couchdb2-backup.tar -C /opt/couchdb/data .

echo 배달업체 peer1 복제

docker run --rm --volumes-from peer1.delivery.com -v $(pwd)/../backup:/backup busybox tar cvf /backup/peer1.delivery.com-backup.tar -C /var/hyperledger/production .

docker run --rm --volumes-from orderer4.delivery.com -v $(pwd)/../backup:/backup busybox tar cvf /backup/orderer4.delivery.com-backup.tar -C /var/hyperledger/production/orderer .

docker run --rm --volumes-from couchdb3 -v $(pwd)/../backup:/backup busybox tar cvf /backup/couchdb3-backup.tar -C /opt/couchdb/data .

echo 음식점 peer0 복제. 

docker run --rm --volumes-from peer0.restaurant.com -v $(pwd)/../backup:/backup busybox tar cvf /backup/peer0.restaurant.com-backup.tar -C /var/hyperledger/production .

docker run --rm --volumes-from orderer5.restaurant.com -v $(pwd)/../backup:/backup busybox tar cvf /backup/orderer5.restaurant.com-backup.tar -C /var/hyperledger/production/orderer .

docker run --rm --volumes-from couchdb4 -v $(pwd)/../backup:/backup busybox tar cvf /backup/couchdb4-backup.tar -C /opt/couchdb/data .


echo 음식점 peer1 복제 오더러는 5개라 이번엔 오더러 안함.

docker run --rm --volumes-from peer1.restaurant.com -v $(pwd)/../backup:/backup busybox tar cvf /backup/peer1.restaurant.com-backup.tar -C /var/hyperledger/production .

docker run --rm --volumes-from couchdb5 -v $(pwd)/../backup:/backup busybox tar cvf /backup/couchdb5-backup.tar -C /opt/couchdb/data .

echo 채널에 필요한 블록 복제
cp ./orderchannel.block ../backup/orderchannel.block
cp ./contractchannel.block ../backup/contractchannel.block
