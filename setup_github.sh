#!/bin/bash

# GitHub Repository Setup Script for R Workshop Project
# This script configures git and pushes your project to GitHub
# 
# Usage: chmod +x setup_github.sh && ./setup_github.sh

set -e

echo "╔══════════════════════════════════════════════════════════════════════════════╗"
echo "║              GitHub Repository Setup for R Workshop Project                 ║"
echo "╚══════════════════════════════════════════════════════════════════════════════╝"
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Step 1: Configure Git
echo -e "${BLUE}Step 1: Configuring Git${NC}"
echo "=================================================="
git config user.email "your.email@example.com"
git config user.name "Aditya Pal"
echo -e "${GREEN}✓ Git configured locally${NC}"
echo ""

# Step 2: Verify repository status
echo -e "${BLUE}Step 2: Checking Repository Status${NC}"
echo "=================================================="
if [ -d ".git" ]; then
    echo -e "${GREEN}✓ Git repository already initialized${NC}"
else
    echo -e "${YELLOW}Initializing git repository...${NC}"
    git init
    echo -e "${GREEN}✓ Git repository initialized${NC}"
fi
echo ""

# Step 3: Check for staged files
echo -e "${BLUE}Step 3: Staging Project Files${NC}"
echo "=================================================="
git add -A
echo -e "${GREEN}✓ All files staged${NC}"
echo ""

# Step 4: Create initial commit
echo -e "${BLUE}Step 4: Creating Initial Commit${NC}"
echo "=================================================="
if git diff --cached --quiet; then
    echo -e "${YELLOW}No changes to commit${NC}"
else
    git commit -m "Initial commit: Advanced analytics dashboard with 5 features

- Global Conflict Map visualization
- Event Annotations on timeline
- Timeline Animation playback (1983-2026)
- Oil Price Forecast with confidence bands
- Period Comparison analysis
- 6 interactive charts with real-time updates
- Responsive design with dark hacker theme
- Comprehensive documentation"
    echo -e "${GREEN}✓ Commit created${NC}"
fi
echo ""

# Step 5: Display next steps
echo -e "${BLUE}Step 5: Next Steps - Push to GitHub${NC}"
echo "=================================================="
echo ""
echo -e "${YELLOW}IMPORTANT: Manual Steps Required${NC}"
echo ""
echo "1. Create a new repository on GitHub:"
echo "   - Go to https://github.com/new"
echo "   - Repository name: R_Workshop_Project"
echo "   - Description: Advanced analytics dashboard analyzing geopolitical"
echo "                  conflicts and crude oil prices (1983-2026)"
echo "   - Choose Public or Private"
echo "   - DO NOT initialize with README or gitignore"
echo "   - Click 'Create repository'"
echo ""
echo "2. Add the remote and push:"
echo ""
echo -e "${BLUE}   git remote add origin https://github.com/adityapal2964/R_Workshop_Project.git${NC}"
echo -e "${BLUE}   git branch -M main${NC}"
echo -e "${BLUE}   git push -u origin main${NC}"
echo ""
echo "3. You may be prompted for authentication:"
echo "   - Use GitHub CLI: gh auth login"
echo "   - OR use Personal Access Token (if HTTPS)"
echo "   - OR use SSH key (recommended)"
echo ""
echo -e "${GREEN}Setup script complete!${NC}"
echo ""
echo "Repository Location:"
echo -e "${BLUE}   /Users/aditya/Desktop/R_Worshop_Project${NC}"
echo ""
echo "Current Git Status:"
git status
