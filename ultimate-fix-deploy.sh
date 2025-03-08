#!/bin/bash

echo "🚀 Starting Ultimate Fix & Deploy Script..."

### 🔑 FIX SSH KEYS ###
echo "🔑 Removing existing SSH keys..."
rm -rf ~/.ssh/id_rsa ~/.ssh/id_rsa.pub

echo "🔑 Generating a new SSH key..."
ssh-keygen -t rsa -b 4096 -C "your-email@example.com" -f ~/.ssh/id_rsa -N ""

echo "🔑 Starting SSH agent..."
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

echo "🔑 Your new SSH Public Key (Add to GitHub Settings → SSH Keys):"
cat ~/.ssh/id_rsa.pub

read -p "🔑 Press ENTER after adding your SSH key to GitHub..." temp

echo "🔑 Testing GitHub SSH connection..."
ssh -T git@github.com

### 🛠 FIX GIT REPOSITORY ###
echo "🛠 Resetting Git repository..."
rm -rf .git
git init
git remote add origin git@github.com:rblowe2/Programming.git

echo "🛠 Creating a .gitignore file..."
echo -e "node_modules/\n.ssh/\n.aws/\n*.log\nbuild/\ndist/" > .gitignore

echo "🛠 Staging and committing all files..."
git add --all
git commit -m "Reinitializing repository with cleaned files"

echo "🛠 Force pushing to GitHub..."
git branch -M main
git push --force origin main

### 🏗 FIX REACT FILES ###
echo "🏗 Ensuring required React files exist..."
mkdir -p public src
echo '<!DOCTYPE html><html><head><title>React App</title></head><body><div id="root"></div></body></html>' > public/index.html
echo 'import React from "react"; import ReactDOM from "react-dom/client"; import "./index.css"; const root = ReactDOM.createRoot(document.getElementById("root")); root.render(<h1>Hello, World!</h1>);' > src/index.js
echo 'body { font-family: Arial, sans-serif; text-align: center; }' > src/index.css

### 📦 FIX NPM / INSTALL DEPENDENCIES ###
echo "📦 Ensuring package.json exists..."
if [ ! -f package.json ]; then
    echo '{"name": "cloudshell-user", "version": "1.0.0", "scripts": {"build": "react-scripts build"}, "dependencies": {"react": "^18.0.0", "react-dom": "^18.0.0", "react-scripts": "latest"}}' > package.json
fi

echo "📦 Installing dependencies..."
npm install

### 🚀 BUILD & DEPLOY ###
echo "🏗 Running build..."
npm run build

if [ $? -eq 0 ]; then
    echo "🚀 Build succeeded! Pushing to GitHub..."
    git add --all
    git commit -m "Successful build & deploy"
    git push origin main
else
    echo "❌ Build failed! Check errors above."
    exit 1
fi

echo "✅ Fix & Deploy Script Completed!"

