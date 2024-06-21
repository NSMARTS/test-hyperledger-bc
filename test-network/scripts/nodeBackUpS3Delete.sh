#!/bin/bash

# 우선 스크립트 실행 전 aws cli 설치
# sudo apt install awscli -y
# aws configure 를 입력. 사용자 정보 등록

# 인증서 파일이 위치한 디렉토리 설정

# 로컬에 저장할 디렉토리 설정

S3_BUCKET="hyperledger-fabric-certification-example"

# 버킷 중 backup 삭제

aws s3 rm "s3://$S3_BUCKET/backup/" --recursive

echo "All certificate files under organizations directory have been removed from S3."