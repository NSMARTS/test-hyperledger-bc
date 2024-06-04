#!/bin/bash

# 우선 스크립트 실행 전 aws cli 설치
# sudo apt install awscli -y
# aws configure 를 입력. 사용자 정보 등록

# 인증서 파일이 위치한 디렉토리 설정
CERT_DIR="../organizations"

# AWS S3 버킷 이름 설정
S3_BUCKET="hyperledger-fabric-certification-example"

# 디렉토리 구조를 S3에 그대로 유지하면서 인증서 파일을 S3로 업로드
find "$CERT_DIR" -type f | while read -r file; do
    aws s3 cp "$file" "s3://$S3_BUCKET/${file#../}"
done