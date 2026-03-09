#!/usr/bin/env Rscript

# Environment Setup Verification Script
cat("\n")
cat(strrep("=", 70), "\n")
cat("R PROJECT ENVIRONMENT VERIFICATION\n")
cat(strrep("=", 70), "\n\n")

# Check R version
cat("1. R VERSION\n")
cat("   R Version: ", paste0(R.version$major, ".", R.version$minor), "\n")
cat("   Platform: ", R.version$platform, "\n\n")

# Required packages
required_packages <- c(
  'tidyverse',    # Data wrangling and visualization
  'ggplot2',      # Advanced plotting
  'gridExtra',    # Multi-panel plots
  'corrplot',     # Correlation visualization
  'scales',       # Scaling and formatting
  'lubridate',    # Date handling
  'zoo',          # Rolling averages and time series
  'readr',        # Reading CSV files
  'dplyr'         # Data manipulation
)

cat("2. REQUIRED PACKAGES\n")
cat("   Checking", length(required_packages), "packages...\n\n")

all_installed <- TRUE
for (pkg in required_packages) {
  installed <- require(pkg, character.only = TRUE, quietly = TRUE)
  status <- ifelse(installed, "✓ INSTALLED", "✗ MISSING")
  cat(sprintf("   %-15s : %s\n", pkg, status))
  if (!installed) all_installed <- FALSE
}

cat("\n3. DATA FILES\n")
data_path <- "data"
if (dir.exists(data_path)) {
  cat(sprintf("   ✓ Data directory exists: %s\n", data_path))
  files <- list.files(data_path)
  if (length(files) > 0) {
    for (f in files) {
      cat(sprintf("     - %s\n", f))
    }
  } else {
    cat("     WARNING: No files found in data directory\n")
  }
} else {
  cat(sprintf("   ✗ Data directory not found: %s\n", data_path))
}

cat("\n4. OUTPUT DIRECTORIES\n")
output_dirs <- c("plots")
for (dir in output_dirs) {
  if (dir.exists(dir)) {
    cat(sprintf("   ✓ %s directory exists\n", dir))
  } else {
    cat(sprintf("   → Creating %s directory...\n", dir))
    dir.create(dir, showWarnings = FALSE)
    cat(sprintf("   ✓ %s directory created\n", dir))
  }
}

cat("\n5. SUMMARY\n")
if (all_installed) {
  cat("   ✓ All packages installed successfully!\n")
  cat("   ✓ Environment ready for analysis\n")
  cat("   ✓ You can now run: Rscript war_oil_analysis.R\n")
} else {
  cat("   ✗ Some packages are missing\n")
  cat("   → Run: install.packages(c('tidyverse', 'ggplot2', 'gridExtra',\n")
  cat("                              'corrplot', 'scales', 'lubridate',\n")
  cat("                              'zoo', 'readr', 'dplyr'))\n")
}

cat("\n")
cat(strrep("=", 70), "\n\n")

# If all packages installed, load them
if (all_installed) {
  invisible(lapply(required_packages, library, character.only = TRUE, quietly = TRUE))
  cat("All packages loaded into memory. Ready to proceed!\n\n")
}
