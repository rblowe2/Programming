#!/bin/bash

# ========================
# AWS Deployment Master Script
# ========================
echo "Starting AWS Deployment..."

# ========================
# Step 1: Configure AWS CLI
# ========================
aws configure set aws_access_key_id "YOUR_AWS_ACCESS_KEY"
aws configure set aws_secret_access_key "YOUR_AWS_SECRET_KEY"
aws configure set region us-east-1

# ========================
# Step 2: Validate Required Deployment Files
# ========================
if [[ ! -f "aws_ci_cd_pipeline.json" || ! -f "aws_cloudformation_setup.yaml" ]]; then
    echo "[ERROR] Missing required files! Ensure aws_ci_cd_pipeline.json and aws_cloudformation_setup.yaml are present."
    exit 1
fi

# ========================
# Step 3: AWS CodePipeline Setup
# ========================
aws codepipeline update-pipeline --cli-input-json file://aws_ci_cd_pipeline.json || { echo "[ERROR] AWS CodePipeline update failed."; exit 1; }

# ========================
# Step 4: Install Dependencies
# ========================
echo "Installing FastAPI and Uvicorn..."
pip install fastapi uvicorn || { echo "[ERROR] FastAPI/Uvicorn installation failed."; exit 1; }

# ========================
# Step 5: Deploy CloudFormation Stack
# ========================
aws cloudformation deploy --template-file aws_cloudformation_setup.yaml --stack-name AI-Business-Solutions --capabilities CAPABILITY_NAMED_IAM || { echo "[ERROR] CloudFormation deployment failed."; exit 1; }

# ========================
# Step 6: Deployment Complete
# ========================
echo "AWS Deployment Completed Successfully!"

