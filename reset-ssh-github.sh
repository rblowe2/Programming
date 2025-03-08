#!/bin/bash

echo "🚀 Resetting SSH and Configuring GitHub Access..."

# 🛑 Step 1: Delete Old SSH Keys
echo "🗑️ Removing old SSH keys..."
rm -rf ~/.ssh
mkdir ~/.ssh
chmod 700 ~/.ssh

# 🔑 Step 2: Generate a New SSH Key
echo "🔑 Generating a new SSH key..."
ssh-keygen -t rsa -b 4096 -C "your-email@example.com" -f ~/.ssh/id_rsa -N ""

# 🚀 Step 3: Start the SSH Agent and Add the Key
echo "🔄 Starting the SSH agent..."
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# 📋 Step 4: Display the SSH Key
echo "📋 Copy the SSH key below and add it to GitHub (https://github.com/settings/keys):"
cat ~/.ssh/id_rsa.pub
echo ""
echo "🔑 After adding the key to GitHub, press ENTER to continue..."
read

# ✅ Step 5: Test GitHub Connection
echo "🔍 Testing SSH connection to GitHub..."
ssh -T git@github.com

# 🚀 Step 6: Force Git to Use the New SSH Key
echo "⚙️ Configuring Git to use the correct SSH key..."
git config --global core.sshCommand "ssh -i ~/.ssh/id_rsa -o IdentitiesOnly=yes"

# ✅ Step 7: Verify Git Remote and Push
echo "🔍 Checking Git remote URL..."
git remote -v

echo "🚀 Pushing changes to GitHub..."
git add --force --all
git commit -m "Fixing repository state"
git push origin main --force

echo "✅ SSH and GitHub access successfully reset!"

