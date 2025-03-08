#!/bin/bash

echo "🚀 Starting Fix & Deploy Script..."

# Clean up disk space
echo "🧹 Cleaning up disk space..."
rm -rf ~/.npm/_logs ~/.npm/_cache
docker system prune -a -f
npm cache clean --force
echo "✅ Disk cleanup complete."

# Check Git status
echo "🔧 Checking Git Repository..."
git status

# Add and commit changes
echo "📤 Adding and committing files..."
git add --force --all
git commit -m "Deployment fix" || echo "⚠️ No changes to commit."

# Push changes to GitHub
echo "🚀 Pushing to GitHub..."
git push origin main --force

# Run Build Process
echo "🏗️ Running build..."
npm install
npm run build || echo "⚠️ Build failed. Please check errors."

# CloudFront Invalidation
echo "🌍 Invalidating CloudFront cache..."
DISTRIBUTION_ID=$(aws cloudfront list-distributions --query "DistributionList.Items[0].Id" --output text)
if [ "$DISTRIBUTION_ID" == "None" ]; then
    echo "❌ No CloudFront distribution found! Check AWS authentication."
else
    echo "✅ Found CloudFront distribution: $DISTRIBUTION_ID"
    aws cloudfront create-invalidation --distribution-id $DISTRIBUTION_ID --paths "/*"
fi

echo "✅ Fix & Deploy Script Completed!"

