#!/bin/bash

# jq 설치 여부 확인 및 설치
if ! command -v jq &> /dev/null; then
    echo "jq가 설치되어 있지 않습니다. 설치를 진행합니다."
    sudo apt-get update
    sudo apt-get install -y jq
else
    echo "jq가 이미 설치되어 있습니다."
fi

# JSON 파일 경로 설정
json_file="../explorer/connection-profile/blockchain_network.json"

# 각 조직의 keystore 디렉토리 설정
declare -A keystore_dirs=(
  ["NaverMSP"]="../organizations/peerOrganizations/naver.com/admin/msp/keystore"
  ["DeliveryMSP"]="../organizations/peerOrganizations/delivery.com/admin/msp/keystore"
  ["RestaurantMSP"]="../organizations/peerOrganizations/restaurant.com/admin/msp/keystore"
)

# 각 keystore 디렉토리에 있는 파일명을 JSON에 반영
for org in "${!keystore_dirs[@]}"; do
  keystore_dir="${keystore_dirs[$org]}"
  private_key_file=$(ls "$keystore_dir" | head -n 1)
  private_key_path="$keystore_dir/$private_key_file"
  
  if [ -f "$private_key_path" ]; then
    # 기존 경로 유지하면서 새로운 경로 반영
    jq --arg org "$org" --arg private_key_file "$private_key_file" \
    --arg old_path "/tmp/crypto/peerOrganizations/${org,,}.com/admin/msp/keystore" \
    '.organizations[$org].adminPrivateKey.path = "\($old_path)/\($private_key_file)"' \
    "$json_file" > tmp.$$.json && mv tmp.$$.json "$json_file"
  else
    echo "No private key file found in $keystore_dir"
  fi
done

echo "Updated adminPrivateKey paths in $json_file"

docker-compose -f ../explorer/docker-compose.yaml up -d

