# 노드정보와 채널정보를 S3 업로드


#!/bin/bash

# 우선 스크립트 실행 전 aws cli 설치
# sudo apt install awscli -y
# aws configure 를 입력. 사용자 정보 등록

# 인증서 파일이 위치한 디렉토리 설정

sudo mkdir ../backup

# 로컬에 저장할 디렉토리 설정
LOCAL_DIR="../backup"

# AWS S3 버킷 이름 설정
S3_BUCKET="hyperledger-fabric-certification-example"

# S3 버킷의 내용을 로컬 디렉토리로 동기화
aws s3 sync s3://$S3_BUCKET/backup $LOCAL_DIR

echo "All files have been downloaded from S3."