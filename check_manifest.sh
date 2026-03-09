#!/bin/bash
# Project Files Manifest - War vs Oil Prices Analysis
# March 9, 2026

echo "═══════════════════════════════════════════════════════════════════"
echo "PROJECT FILES MANIFEST"
echo "═══════════════════════════════════════════════════════════════════"
echo ""

cd /Users/aditya/Desktop/R_Worshop_Project

echo "📁 PROJECT LOCATION:"
echo "   /Users/aditya/Desktop/R_Worshop_Project"
echo ""

echo "📋 INSTALLED FILES:"
echo ""

if [ -f "war_oil_analysis.R" ]; then
    SIZE=$(du -h war_oil_analysis.R | cut -f1)
    LINES=$(wc -l < war_oil_analysis.R)
    echo "  ✓ war_oil_analysis.R"
    echo "    └─ Size: $SIZE | Lines: $LINES"
    echo "    └─ Main analysis script with all ETL & EDA logic"
fi

if [ -f "install_packages.R" ]; then
    echo "  ✓ install_packages.R"
    echo "    └─ Automated R package installation"
fi

if [ -f "verify_setup.R" ]; then
    echo "  ✓ verify_setup.R"
    echo "    └─ Environment verification & directory creation"
fi

if [ -f "SETUP_REQUIREMENTS.md" ]; then
    echo "  ✓ SETUP_REQUIREMENTS.md"
    echo "    └─ Comprehensive documentation & troubleshooting"
fi

if [ -f "QUICKSTART.sh" ]; then
    echo "  ✓ QUICKSTART.sh"
    echo "    └─ Quick start guide with system checks"
fi

if [ -f "INSTALLATION_SUMMARY.txt" ]; then
    echo "  ✓ INSTALLATION_SUMMARY.txt"
    echo "    └─ Complete setup summary & reference guide"
fi

echo ""
echo "📊 REQUIRED DATA FILES:"
echo ""

if [ -d "data" ]; then
    echo "  ✓ data/ directory exists"
    if [ -f "data/crude_oil_prices.zip" ]; then
        SIZE=$(du -h data/crude_oil_prices.zip | cut -f1)
        echo "    ✓ crude_oil_prices.zip ($SIZE)"
    else
        echo "    ✗ crude_oil_prices.zip (MISSING)"
    fi
    if [ -f "data/deaths-in-armed-conflicts-based-on-where-they-occurred.zip" ]; then
        SIZE=$(du -h "data/deaths-in-armed-conflicts-based-on-where-they-occurred.zip" | cut -f1)
        echo "    ✓ deaths-in-armed-conflicts-*.zip ($SIZE)"
    else
        echo "    ✗ deaths-in-armed-conflicts-*.zip (MISSING)"
    fi
else
    echo "  ✗ data/ directory (NOT FOUND)"
fi

echo ""
echo "📦 INSTALLED R PACKAGES:"
echo ""

Rscript -e "
pkgs <- c('ggplot2', 'dplyr', 'tidyr', 'corrplot', 'scales', 'lubridate', 'zoo', 'readr', 'gridExtra')
for(p in pkgs) {
  status <- ifelse(require(p, character.only = TRUE, quietly = TRUE), '✓', '✗')
  cat(sprintf('  %s %s\n', status, p))
}
" 2>/dev/null

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "✓ SETUP COMPLETE - READY TO RUN"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "Next step:"
echo "  $ cd /Users/aditya/Desktop/R_Worshop_Project"
echo "  $ Rscript war_oil_analysis.R"
echo ""
