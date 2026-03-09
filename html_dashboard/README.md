# Interactive HTML Dashboard - War vs Oil Prices

## Overview
This interactive HTML dashboard provides a comprehensive visual analysis of the relationship between armed conflict events and crude oil prices from 1983 to 2026.

## Quick Start

### Option 1: Open Directly in Browser
```bash
open html_dashboard/dashboard.html
# or
firefox html_dashboard/dashboard.html
```

### Option 2: Use Local Server (Recommended)
```bash
Rscript serve_dashboard.R
# Then open: http://localhost:8000/dashboard.html
```

## Dashboard Features

### 1. Oil Prices Timeline
- Time series visualization of average oil prices
- Shows price trends across 43 years
- Hover to see exact prices and dates

### 2. Conflict Deaths by Year
- Bar chart showing total deaths from armed conflicts
- Identifies years with highest conflict impact
- Interactive tooltips with death counts

### 3. Deaths vs Oil Price Scatter
- Relationship between conflict intensity and oil prices
- Log scale for deaths (handles wide value ranges)
- Bubble size represents number of conflicts
- Shows potential correlation patterns

### 4. Price Distribution
- Box plots comparing conflict vs non-conflict years
- Shows mean, median, quartiles, and outliers
- Reveals higher average prices during conflict years

### 5. Price Volatility Trend
- 3-year rolling standard deviation
- Identifies periods of market instability
- Often correlates with geopolitical tensions

### 6. Year-by-Year Comparison
- Color-coded bar chart of prices by year
- Warmer colors = higher prices
- Easy identification of expensive vs cheap years

## Key Findings

**Geopolitical Risk Premium**
- Conflict years average: $50.32/barrel
- Non-conflict years average: $33.81/barrel
- **Difference: $16.51 (49% higher during conflicts)**

**Correlation Analysis**
- Price vs Conflicts: 0.2304 (moderate positive correlation)
- Suggests geopolitical factors influence oil markets

**Historical Periods**
- 1983-1992: Post-Cold War fluctuations
- 2000-2008: Oil boom and Iraq War
- 2008-2009: Financial crisis impact
- 2010-2020: OPEC dynamics and regional conflicts

## Data Dictionary

| Field | Description | Type |
|-------|-------------|------|
| date | ISO 8601 date format | Date |
| year | Calendar year | Integer |
| avg_price | Average oil price (USD/barrel) | Numeric |
| total_deaths | Total deaths from conflicts | Integer |
| conflict_period | 1=conflict year, 0=non-conflict | Binary |
| price_volatility | 3-year rolling std dev | Numeric |
| n_conflicts | Number of conflict events | Integer |
| conflict_lag_1y/3y/5y | Prior year conflict indicators | Binary |

## Technical Details

- **Technology**: HTML5 + Plotly.js + Bootstrap
- **Interactivity**: Hover tooltips, zoom, pan, download
- **Responsive**: Works on desktop, tablet, mobile
- **No Server Required**: Pure client-side visualization

## How to Customize

### Edit Colors
Open `dashboard.html` and modify:
- `#1f77b4` = Blue (Oil price)
- `#d62728` = Red (Conflicts)
- `#ff7f0e` = Orange (Volatility)

### Add More Data
1. Update `prepared_war_oil_data.csv`
2. Re-run: `Rscript generate_html_dashboard.R`
3. Dashboard automatically regenerates

### Create Additional Charts
Edit `generate_html_dashboard.R` to add new Plotly visualizations

## Browser Compatibility

- Chrome/Chromium ✓
- Firefox ✓
- Safari ✓
- Edge ✓
- Mobile browsers ✓

## Performance

- Dashboard size: ~50-100 KB
- Load time: <1 second
- Supports zooming and panning
- Real-time interactivity

## Support & Documentation

- Plotly.js docs: https://plotly.com/javascript/
- Bootstrap docs: https://getbootstrap.com/docs/
- R code: See generate_html_dashboard.R

## License & Attribution

Data sources:
- Oil Prices: Our World in Data (OWID)
- Conflict Data: OWID Armed Conflicts Database

Dashboard created: March 9, 2026

