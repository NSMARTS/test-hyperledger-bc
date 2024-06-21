echo 채널 블록 복구

cp ../backup/orderchannel.block ./orderchannel.block
cp ../backup/contractchannel.block ./contractchannel.block


echo 네이버 peer0 복구

docker run --rm --volumes-from peer0.naver.com -v $(pwd)/../backup:/backup busybox tar xvf /backup/peer0.naver.com-backup.tar -C /var/hyperledger/production

docker run --rm --volumes-from orderer.naver.com -v $(pwd)/../backup:/backup busybox tar xvf /backup/orderer.naver.com-backup.tar -C /var/hyperledger/production/orderer

docker run --rm --volumes-from couchdb0 -v $(pwd)/../backup:/backup busybox tar xvf /backup/couchdb0-backup.tar -C /opt/couchdb/data

echo 네이버 peer1 복구

docker run --rm --volumes-from peer1.naver.com -v $(pwd)/../backup:/backup busybox tar xvf /backup/peer1.naver.com-backup.tar -C /var/hyperledger/production

docker run --rm --volumes-from orderer2.naver.com -v $(pwd)/../backup:/backup busybox tar xvf /backup/orderer2.naver.com-backup.tar -C /var/hyperledger/production/orderer

docker run --rm --volumes-from couchdb1 -v $(pwd)/../backup:/backup busybox tar xvf /backup/couchdb1-backup.tar -C /opt/couchdb/data

echo 배달 peer0 복구

docker run --rm --volumes-from peer0.delivery.com -v $(pwd)/../backup:/backup busybox tar xvf /backup/peer0.delivery.com-backup.tar -C /var/hyperledger/production

docker run --rm --volumes-from orderer3.delivery.com -v $(pwd)/../backup:/backup busybox tar xvf /backup/orderer3.delivery.com-backup.tar -C /var/hyperledger/production/orderer

docker run --rm --volumes-from couchdb2 -v $(pwd)/../backup:/backup busybox tar xvf /backup/couchdb2-backup.tar -C /opt/couchdb/data

echo 배달 peer1 복구

docker run --rm --volumes-from peer1.delivery.com -v $(pwd)/../backup:/backup busybox tar xvf /backup/peer1.delivery.com-backup.tar -C /var/hyperledger/production

docker run --rm --volumes-from orderer4.delivery.com -v $(pwd)/../backup:/backup busybox tar xvf /backup/orderer4.delivery.com-backup.tar -C /var/hyperledger/production/orderer

docker run --rm --volumes-from couchdb3 -v $(pwd)/../backup:/backup busybox tar xvf /backup/couchdb3-backup.tar -C /opt/couchdb/data

echo 음식점 peer0 복구

docker run --rm --volumes-from peer0.restaurant.com -v $(pwd)/../backup:/backup busybox tar xvf /backup/peer0.restaurant.com-backup.tar -C /var/hyperledger/production

docker run --rm --volumes-from orderer5.restaurant.com -v $(pwd)/../backup:/backup busybox tar xvf /backup/orderer5.restaurant.com-backup.tar -C /var/hyperledger/production/orderer

docker run --rm --volumes-from couchdb4 -v $(pwd)/../backup:/backup busybox tar xvf /backup/couchdb4-backup.tar -C /opt/couchdb/data

echo 음식점 peer1 복구

docker run --rm --volumes-from peer1.restaurant.com -v $(pwd)/../backup:/backup busybox tar xvf /backup/peer1.restaurant.com-backup.tar -C /var/hyperledger/production

docker run --rm --volumes-from couchdb5 -v $(pwd)/../backup:/backup busybox tar xvf /backup/couchdb5-backup.tar -C /opt/couchdb/data


echo 파일을 복구 후 다시 재시작.
docker-compose -f ../naver/compose/compose-naver.yaml restart 
docker-compose -f ../delivery/compose/compose-delivery.yaml restart 
docker-compose -f ../restaurant/compose/compose-restaurant.yaml restart
