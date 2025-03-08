#!/bin/bash

echo "🚀 Starting Fix & Deploy Script..."

# Step 1: Remove sensitive SSH keys from tracking
echo "🔑 Removing sensitive SSH keys..."
git rm --cached -r .ssh/id_rsa .ssh/id_rsa.pub 2>/dev/null
rm -rf ~/.ssh/id_rsa ~/.ssh/id_rsa.pub  # Securely delete local SSH keys
git commit --amend -C HEAD
git push origin main --force

# Step 2: Fix package.json (Add missing build script)
echo "🛠️ Fixing package.json..."
if grep -q '"build":' package.json; then
    echo "✅ Build script already exists in package.json"
else
    sed -i '/"scripts": {/a \ \ "build": "react-scripts build",' package.json
    echo "✅ Added build script to package.json"
fi

# Step 3: Install dependencies
echo "📦 Installing dependencies..."
npm install

# Step 4: Run the build process
echo "🏗️ Running build..."
npm run build

# Step 5: Deploy the project (if build succeeds)
if [ $? -eq 0 ]; then
    echo "🚀 Deploying project..."
    ./deploy-fix.sh
else
    echo "❌ Build failed! Check errors above."
    exit 1
fi

echo "✅ Fix & Deploy Script Completed!"

