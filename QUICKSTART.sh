#!/bin/bash
# Quick Start Guide - War vs Oil Prices Analysis

echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║   WAR vs OIL PRICES - ANALYSIS PROJECT                       ║"
echo "║   Quick Start Guide                                           ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}📋 PREREQUISITE CHECK${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check R installation
if command -v Rscript &> /dev/null; then
    R_VERSION=$(Rscript -e "cat(paste0(R.version\$major, '.', R.version\$minor))" 2>/dev/null)
    echo -e "${GREEN}✓${NC} R is installed (v$R_VERSION)"
else
    echo -e "${YELLOW}✗${NC} R is not installed"
    echo "  → Install from: https://www.r-project.org/"
    exit 1
fi

# Check working directory
if [ -d "/Users/aditya/Desktop/R_Worshop_Project" ]; then
    echo -e "${GREEN}✓${NC} Project directory found"
else
    echo -e "${YELLOW}✗${NC} Project directory not found"
    exit 1
fi

# Check data files
if [ -f "/Users/aditya/Desktop/R_Worshop_Project/data/crude_oil_prices.zip" ] && \
   [ -f "/Users/aditya/Desktop/R_Worshop_Project/data/deaths-in-armed-conflicts-based-on-where-they-occurred.zip" ]; then
    echo -e "${GREEN}✓${NC} Data files present"
else
    echo -e "${YELLOW}!${NC} Warning: Some data files may be missing"
fi

echo ""
echo -e "${BLUE}🔧 INSTALLATION STEPS${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Step 1: Navigate to project directory"
echo "  $ cd /Users/aditya/Desktop/R_Worshop_Project"
echo ""
echo "Step 2: Install R packages (if needed)"
echo "  $ Rscript install_packages.R"
echo ""
echo "Step 3: Verify installation"
echo "  $ Rscript verify_setup.R"
echo ""
echo -e "${BLUE}🚀 RUNNING THE ANALYSIS${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Execute the main analysis script:"
echo -e "  ${GREEN}\$ Rscript war_oil_analysis.R${NC}"
echo ""
echo "Expected output:"
echo "  - 12 high-quality PNG visualizations in plots/ directory"
echo "  - prepared_war_oil_data.csv (Tableau-ready output)"
echo "  - Console statistics and summary"
echo ""

echo -e "${BLUE}📊 AFTER ANALYSIS${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "1. Check output files:"
echo "   ls -lh prepared_war_oil_data.csv plots/"
echo ""
echo "2. Import to Tableau:"
echo "   - Open Tableau Public/Desktop"
echo "   - File → Data Source"
echo "   - Select: prepared_war_oil_data.csv"
echo "   - Build visualizations using pre-computed fields"
echo ""

echo -e "${BLUE}📁 PROJECT STRUCTURE${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "R_Worshop_Project/"
echo "├── war_oil_analysis.R           (Main analysis script)"
echo "├── install_packages.R           (Package installer)"
echo "├── verify_setup.R               (Environment checker)"
echo "├── SETUP_REQUIREMENTS.md        (Detailed documentation)"
echo "├── QUICKSTART.sh                (This file)"
echo "├── data/"
echo "│   ├── crude_oil_prices.zip"
echo "│   └── deaths-in-armed-conflicts-*.zip"
echo "├── prepared_war_oil_data.csv    (Generated output)"
echo "└── plots/                       (Generated visualizations)"
echo "    ├── 01_oil_prices_timeline.png"
echo "    ├── 02_conflict_events_timeline.png"
echo "    └── ... (10 more visualizations)"
echo ""

echo -e "${BLUE}🛠️  TROUBLESHOOTING${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Problem: 'Package not found' error"
echo "Solution: $ Rscript install_packages.R"
echo ""
echo "Problem: 'Cannot open file' error"
echo "Solution: Check that you're in correct directory:"
echo "          $ pwd  # Should be /Users/aditya/Desktop/R_Worshop_Project"
echo ""
echo "Problem: 'Permission denied' error"
echo "Solution: $ chmod +x /Users/aditya/Desktop/R_Worshop_Project/*.R"
echo ""
echo "Problem: Zip extraction fails"
echo "Solution: Manually extract:"
echo "          $ cd data/"
echo "          $ unzip crude_oil_prices.zip"
echo "          $ unzip deaths-in-armed-conflicts*.zip"
echo ""

echo -e "${BLUE}📚 DOCUMENTATION${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "For detailed information, see:"
echo "  cat SETUP_REQUIREMENTS.md"
echo ""
echo "To check system status:"
echo "  Rscript verify_setup.R"
echo ""

echo -e "${GREEN}✓ Ready to proceed!${NC}"
echo ""
echo "Next command:"
echo -e "${GREEN}cd /Users/aditya/Desktop/R_Worshop_Project && Rscript war_oil_analysis.R${NC}"
echo ""
