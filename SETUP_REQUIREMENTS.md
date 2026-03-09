# War vs Oil Prices Analysis Project - Setup Requirements

## ✓ Environment Status: READY

All required packages are installed and verified!

---

## System Requirements

- **Operating System**: macOS (verified)
- **R Version**: 4.5.2 or higher
- **R Location**: `/usr/local/bin/R` or system R
- **Architecture**: ARM64 (Apple Silicon native)

---

## Installed R Packages

### Core Data Manipulation & Analysis
| Package | Purpose | Version | Status |
|---------|---------|---------|--------|
| **dplyr** | Data wrangling & manipulation | ✓ | ✓ Installed |
| **tidyr** | Data tidying & reshaping | ✓ | ✓ Installed |
| **readr** | Fast CSV file reading | ✓ | ✓ Installed |

### Visualization & Graphics
| Package | Purpose | Status |
|---------|---------|--------|
| **ggplot2** | Advanced data visualization | ✓ Installed |
| **corrplot** | Correlation matrix visualization | ✓ Installed |
| **gridExtra** | Multi-panel plot composition | ✓ Installed |
| **scales** | Plot scaling & formatting | ✓ Installed |

### Time Series & Date Handling
| Package | Purpose | Status |
|---------|---------|--------|
| **lubridate** | Date/time parsing & manipulation | ✓ Installed |
| **zoo** | Time series & rolling functions | ✓ Installed |

---

## Data Files Required

Located in: `/Users/aditya/Desktop/R_Worshop_Project/data/`

1. **crude_oil_prices.zip**
   - Contains: Historical crude oil price data
   - Expected format: CSV with date and price columns
   - Required columns: Date, Price (or similar naming)

2. **deaths-in-armed-conflicts-based-on-where-they-occurred.zip**
   - Contains: Armed conflict events data
   - Expected format: CSV with dates and conflict metrics
   - Required columns: Year/Date, Deaths, Events

---

## Output Structure

```
R_Worshop_Project/
├── war_oil_analysis.R          ← Main analysis script
├── install_packages.R          ← Package installation
├── verify_setup.R              ← Environment verification
├── prepared_war_oil_data.csv   ← Output for Tableau (created after run)
├── plots/                      ← Generated visualization directory
│   ├── 01_oil_prices_timeline.png
│   ├── 02_conflict_events_timeline.png
│   ├── 03_price_by_conflict_boxplot.png
│   ├── 04_price_volatility_timeline.png
│   ├── 05_price_heatmap_year_month.png
│   ├── 06_correlation_heatmap.png
│   ├── 07_lag_analysis.png
│   ├── 08_deaths_vs_price_scatter.png
│   ├── 09_year_over_year_comparison.png
│   ├── 10_price_distribution.png
│   ├── 11_monthly_volatility_comparison.png
│   └── 12_cumulative_impact_analysis.png
└── data/
    ├── crude_oil_prices.zip
    └── deaths-in-armed-conflicts-based-on-where-they-occurred.zip
```

---

## How to Run the Analysis

### Option 1: Using Rscript (Recommended)
```bash
cd /Users/aditya/Desktop/R_Worshop_Project
Rscript war_oil_analysis.R
```

### Option 2: Using R Console
```r
setwd("/Users/aditya/Desktop/R_Worshop_Project")
source("war_oil_analysis.R")
```

### Option 3: Using RStudio
1. Open RStudio
2. Navigate to: File → Open Project → Select `R_Worshop_Project` folder
3. Open `war_oil_analysis.R`
4. Click "Run" or press Cmd+Enter

---

## Expected Runtime

- **Total execution time**: 5-15 minutes depending on system
  - Data extraction: ~30 seconds
  - Data cleaning & merging: ~1-2 minutes
  - Visualization generation: ~2-5 minutes
  - CSV export: ~30 seconds
  - Statistical analysis: ~1 minute

---

## Verification & Troubleshooting

### To Verify Installation:
```bash
Rscript verify_setup.R
```

### To Reinstall Packages:
```bash
Rscript install_packages.R
```

### Common Issues & Solutions:

**Issue**: "Package not found" error
```r
# Solution: Install individually
install.packages("package_name", 
                 repos="https://cran.r-project.org/",
                 dependencies=TRUE)
```

**Issue**: Zip extraction fails
```bash
# Manually extract in Terminal:
cd data/
unzip crude_oil_prices.zip
unzip deaths-in-armed-conflicts-based-on-where-they-occurred.zip
```

**Issue**: Permission denied when creating directories
```bash
# Ensure write permissions:
chmod 755 /Users/aditya/Desktop/R_Worshop_Project
```

---

## After Running the Analysis

### Next Steps for Tableau:

1. **Open Tableau**
   - Tableau Public (free): https://public.tableau.com
   - Tableau Desktop (licensed)

2. **Connect to Data**
   - File → New → Data Source
   - Select: `prepared_war_oil_data.csv`

3. **Available Fields for Visualization**
   ```
   Dimensions:
   - date (continuous or discrete)
   - year, month, year_month_chr
   - conflict_period (binary indicator)
   
   Measures:
   - avg_price, min_price, max_price
   - price_change, price_change_pct
   - price_volatility
   - n_events, deaths
   - conflict_lag_1m, conflict_lag_3m, conflict_lag_6m
   ```

4. **Build Dashboard**
   - Create 10+ interactive visualizations
   - Add filters for year/month/conflict status
   - Apply parameters for dynamic filtering
   - Combine into single dashboard

---

## Data Dictionary

### Output File: `prepared_war_oil_data.csv`

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `date` | Date | ISO 8601 format | 2020-01-01 |
| `year` | Integer | Calendar year | 2020 |
| `month` | Integer | Month (1-12) | 1 |
| `year_month_chr` | Text | Year-Month format | 2020-01 |
| `avg_price` | Numeric | Average oil price USD/bbl | 62.45 |
| `min_price` | Numeric | Monthly minimum price | 58.20 |
| `max_price` | Numeric | Monthly maximum price | 65.80 |
| `price_change` | Numeric | Month-over-month change (USD) | +3.25 |
| `price_change_pct` | Numeric | Month-over-month % change | +5.45 |
| `price_volatility` | Numeric | 3-month rolling std dev | 2.15 |
| `n_events` | Integer | # of conflict events in month | 42 |
| `deaths` | Integer | Total deaths from conflicts | 1,250 |
| `conflict_period` | Binary | 1=conflict month, 0=no conflict | 1 |
| `conflict_indicator` | Binary | Conflict occurred indicator | 1 |
| `conflict_lag_1m` | Binary | Conflict 1-month prior | 1 |
| `conflict_lag_3m` | Binary | Conflict 3-months prior | 0 |
| `conflict_lag_6m` | Binary | Conflict 6-months prior | 0 |

---

## Analysis Outputs Explained

### 12 Visualizations Generated:

1. **Oil Prices Timeline** - Overall price trend with conflict overlays
2. **Conflict Events Timeline** - Frequency of armed conflicts over time
3. **Price by Conflict Status** - Box plot comparing prices during/outside conflicts
4. **Price Volatility** - Shows market instability during geopolitical tensions
5. **Heatmap (Year × Month)** - Identifies seasonal patterns and hotspots
6. **Correlation Matrix** - Relationships between all key variables
7. **Lag Analysis** - Impact delay (0-6 month lags) of conflicts on prices
8. **Deaths vs Price** - Scatter plot of conflict intensity vs oil costs
9. **Year-over-Year** - Seasonal comparison across recent years
10. **Price Distribution** - Statistical distributions for conflict vs non-conflict
11. **Monthly Volatility** - Seasonal volatility patterns
12. **Cumulative Impact** - Long-term perspective with dual-axis

### Key Statistics Calculated:

- Average price during conflict months
- Average price during non-conflict months
- Price difference (conflict premium)
- Correlation between conflicts and prices
- Lag effects (1, 3, 6-month delays)
- Rolling volatility metrics
- Trend analysis by year/month

---

## Performance Tips

### To Speed Up Analysis:
- Close other applications to free up RAM
- Run during off-peak hours (can use background processing)
- For large datasets, filter by date range in the script

### To Optimize Output:
- Adjust PNG resolution in visualization code (default: 300 dpi)
- Reduce plot dimensions if needed
- Enable parallel processing for data operations

---

## Support & Resources

- **R Documentation**: `?package_name` or `help(function_name)`
- **ggplot2 Guide**: https://ggplot2.tidyverse.org/
- **dplyr Documentation**: https://dplyr.tidyverse.org/
- **Tableau Help**: https://www.tableau.com/support/help

---

## License & Attribution

**Data Sources:**
- Oil Prices: Our World in Data (OWID)
- Armed Conflicts: OWID Armed Conflicts Database

This analysis script is designed for educational and research purposes.

---

**Last Updated**: March 9, 2026
**Project Status**: ✓ READY TO RUN
**All Dependencies**: ✓ INSTALLED & VERIFIED
