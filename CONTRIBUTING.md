# Contributing to Geopolitical Conflict & Oil Markets Analysis

Thank you for your interest in contributing to this project! Here are guidelines for contributing.

## Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Assume good intentions

## How to Contribute

### Reporting Issues

1. **Check existing issues** to avoid duplicates
2. **Describe the problem** clearly
3. **Provide steps to reproduce** (if it's a bug)
4. **Include your environment** (OS, browser, R version)
5. **Add screenshots** if relevant

### Suggesting Enhancements

1. **Use issue tracker** to suggest features
2. **Explain the use case** and benefits
3. **Provide examples** if possible
4. **Consider impact** on existing functionality

### Pull Requests

#### Setup

```bash
# Clone the repository
git clone <your-fork-url>
cd R_Workshop_Project

# Create a feature branch
git checkout -b feature/your-feature-name
```

#### Making Changes

1. **Update R scripts** following existing code style
2. **Update HTML/CSS** maintaining design consistency
3. **Update documentation** for any changes
4. **Test thoroughly** before submitting

#### Commit Messages

Follow conventional commits:

```
feat: Add new feature
fix: Fix bug
docs: Update documentation
style: Format code
refactor: Restructure code
test: Add tests
chore: Update dependencies
```

#### Submitting a PR

1. Push your branch to your fork
2. Create a Pull Request with clear description
3. Reference related issues (#123)
4. Ensure CI passes (if applicable)
5. Address review feedback

## Development Setup

### Prerequisites

- R 4.0+
- Node.js 14+ (optional, for development)
- Git

### Installation

```bash
# Clone repository
git clone <repository-url>
cd R_Workshop_Project

# Install R dependencies
Rscript -e "install.packages(c('tidyverse', 'lubridate', 'scales', 'zoo', 'corrplot', 'gridExtra', 'jsonlite'))"
```

### Running Tests

```bash
# Run analysis
Rscript war_oil_analysis.R

# Generate dashboard
Rscript generate_interactive_dashboard.R

# View dashboard
open html_dashboard/interactive_dashboard.html
```

## Project Structure

```
R_Workshop_Project/
├── war_oil_analysis.R              # Main ETL pipeline
├── generate_interactive_dashboard.R # Dashboard generator
├── prepared_war_oil_data.csv       # Processed data
├── html_dashboard/
│   ├── dashboard_template.html     # Template with placeholders
│   ├── interactive_dashboard.html  # Generated dashboard
│   └── dashboard.html              # Basic dashboard
├── plots/                          # Generated visualizations
├── README.md                       # Project documentation
├── ADVANCED_FEATURES_GUIDE.md      # Advanced features guide
├── LICENSE                         # MIT License
├── .gitignore                      # Git ignore rules
└── CONTRIBUTING.md                 # This file
```

## Coding Standards

### R Code

- Use tidyverse style guide
- Add comments for complex logic
- Keep functions focused and small
- Use meaningful variable names
- Handle errors gracefully

Example:

```r
# Good
calculate_average_price <- function(data) {
  data %>%
    group_by(year) %>%
    summarise(avg_price = mean(avg_price, na.rm = TRUE))
}

# Avoid
calc_p <- function(d) {
  aggregate(d$price, by=list(d$year), FUN=mean)
}
```

### JavaScript Code

- Use const/let, not var
- Add comments for complex logic
- Keep functions small and focused
- Use meaningful variable names
- Follow Airbnb JavaScript style guide (generally)

Example:

```javascript
// Good
function updateChart1() {
    const sortedData = currentData.sort((a, b) => a.year - b.year);
    // ... chart rendering logic
}

// Avoid
function uc() {
    let d = currentData;
    d = d.sort((a,b)=>a.year-b.year);
    // ...
}
```

### HTML/CSS

- Use semantic HTML
- Keep CSS organized and commented
- Use CSS variables for consistency
- Maintain responsive design

## Documentation

### Code Comments

- Explain "why", not "what"
- Use clear, concise language
- Update comments when code changes

### README Updates

- Document new features
- Include usage examples
- Update file descriptions

### Commit Messages

Reference documentation changes in commits:

```
feat: Add timeline animation feature
- Implements year-by-year playback
- Adds play/pause/reset controls
- Updates ADVANCED_FEATURES_GUIDE.md
```

## Testing

### Manual Testing

Before submitting:

1. Test in Chrome, Firefox, Safari
2. Test on mobile (responsive design)
3. Test filters and interactions
4. Test chart updates
5. Check console for errors

### R Script Testing

```r
# Test data loading
source("war_oil_analysis.R")

# Check output files exist
file.exists("prepared_war_oil_data.csv")
file.exists("plots/chart_1.png")
```

## Release Process

1. Update version number
2. Update CHANGELOG (if applicable)
3. Create release notes
4. Tag release in git
5. Deploy to GitHub

## Questions?

- Check existing issues/discussions
- Review documentation
- Open a new discussion
- Reach out to maintainers

## Recognition

Contributors will be recognized in:
- CONTRIBUTORS.md file
- Release notes
- GitHub contributors page

Thank you for contributing! 🙏
