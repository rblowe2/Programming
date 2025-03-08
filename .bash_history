#!/bin/bash
# ========================
# AWS Deployment Master Script (Auto-Fixed Version)
# ========================
# This script automates the deployment of the AI Business Solutions system.
# Follow the highlighted areas to fix any remaining issues manually.
# ========================
# Step 1: Set AWS Region and IAM Role (Auto-Fixed)
# ========================
AWS_REGION="us-east-1"
IAM_ROLE_ARN="arn:aws:iam::571600833037:instance-profile/System"
GITHUB_REPO="https://github.com/rblowe2/ATS.git"
# ========================
# Step 2: Validate AWS CLI Configuration
# ========================
echo "Resetting AWS CLI credentials..."
rm -rf ~/.aws/credentials
aws configure set aws_access_key_id "YOUR_AWS_ACCESS_KEY"
aws configure set aws_secret_access_key "YOUR_AWS_SECRET_KEY"
aws configure set region us-east-1 --profile default set region us-east-1
aws configure
udFormation Stack
# ========================
echo "Deploying CloudFormation Stack..."
if [[ ! -f "aws_cloudformation_setup.yaml" ]]; then     echo "\e[47;30m[ERROR] Missing aws_cloudformation_setup.yaml! Please create this file manually.\e[0m";     exit 1; fi
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
ssh -T git@github.com
git push origin main --force
git rm --cached Programming.git/Programming
git rm --cached Programming
git rm --cached ai-business-solutions/
git add --all
git commit -m "Fixing repository state"
git push origin main --force
exit
git submodule deinit -f --all
git rm -rf --cached Programming.git/Programming
git rm -rf --cached Programming
git rm -rf --cached ai-business-solutions
git status
git clean -fdx
git reset --hard HEAD
git commit -m "Fixing repository state"
git add --all
git commit -m "Fixing repository state"
git push origin main --force
exit
nano reset-ssh-github.sh
y
nano reset-ssh-github.sh
chmod +x reset-ssh-github.sh
./reset-ssh-github.sh
./deploy-fix.sh
exit
git submodule deinit -f --all
rm -rf .git/modules/*
rm -rf Programming.git/Programming/.git
rm -rf Programming/.git
rm -rf ai-business-solutions/.git
git rm --cached Programming.git/Programming
git rm --cached Programming
git rm --cached ai-business-solutions
git add --force --all
git commit -m "Fixing repository state"
git push origin main --force
nano deploy-fix.sh
chmod +x deploy-fix.sh
./deploy-fix.sh
exit
rm -rf Programming.git Programming ai-business-solutions your-app
git status
git rm -rf --cached Programming.git Programming ai-business-solutions your-app
npm init -y
npm install react react-dom react-scripts --save
git add --force --all
git commit -m "Fixing repository state"
git push origin main --force
exit
rm -rf ~/.npm/_cacache ~/.npm/_logs ~/.cache ~/.local ~/.config
docker system prune -a -f
npm cache clean --force
df -h
du -ah /home/cloudshell-user | sort -rh | head -n 20
rm -rf <big-file-or-folder>
rm -rf .git
rm -rf node_modules
npm cache clean --force
docker system prune -a -f
df -h
git init
git remote add origin git@github.com:rblowe2/Programming.git
git add --force --all
git commit -m "Fixing repository state"
git push origin main --force
exit
git branch -m main
git push --set-upstream origin main
git push origin main --force
exit
rm -rf ~/.ssh/id_rsa ~/.ssh/id_rsa.pub  # Deletes old SSH keys
ssh-keygen -t rsa -b 4096 -C "your-email@example.com"
rm -rf ~/.ssh/id_rsa ~/.ssh/id_rsa.pub  # Deletes old SSH keys
ssh-keygen -t rsa -b 4096 -C "your-email@example.com"
mkdir -p ~/.ssh
chmod 700 ~/.ssh  # Secure the directory
ssh-keygen -t rsa -b 4096 -C "your-email@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub
ssh -T git@github.com
exit
rm -rf .git
git init
git remote add origin git@github.com:rblowe2/Programming.git
nano .gitignore
git rm --cached -r .ssh/
git rm --cached -r .aws/
git rm --cached -r node_modules/
git rm --cached -r *.log
git add --all
git commit -m "Reinitializing repository with cleaned files"
git branch -M main
git push --force origin main
git pull origin main
exit
