# Install Required Packages for War-Oil Analysis Project

options(repos = c(CRAN = "https://cran.r-project.org/"))

cat("\n")
cat(strrep("=", 70), "\n")
cat("INSTALLING REQUIRED R PACKAGES\n")
cat(strrep("=", 70), "\n\n")

# Core packages needed
core_packages <- c(
  'ggplot2',      # Advanced plotting
  'dplyr',        # Data manipulation
  'tidyr',        # Data tidying
  'corrplot',     # Correlation matrix visualization
  'scales',       # Scaling and formatting for plots
  'lubridate',    # Date and time handling
  'zoo',          # Time series and rolling functions
  'readr',        # Fast CSV reading
  'gridExtra'     # Multi-panel plots
)

cat("Installing packages...\n\n")

installed_count <- 0
already_installed_count <- 0

for (pkg in core_packages) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat(sprintf("→ Installing %s...", pkg))
    tryCatch(
      {
        install.packages(pkg, 
                        repos = "https://cran.r-project.org/", 
                        dependencies = FALSE,
                        quiet = TRUE)
        cat(" ✓ SUCCESS\n")
        installed_count <- installed_count + 1
      },
      error = function(e) {
        cat(" ✗ FAILED\n")
      }
    )
  } else {
    cat(sprintf("✓ %s already installed\n", pkg))
    already_installed_count <- already_installed_count + 1
  }
}

cat("\n")
cat(strrep("=", 70), "\n")
cat("INSTALLATION SUMMARY\n")
cat(strrep("=", 70), "\n")
cat(sprintf("Newly installed: %d\n", installed_count))
cat(sprintf("Already installed: %d\n", already_installed_count))
cat(sprintf("Total packages: %d\n\n", length(core_packages)))

# Verification
cat("VERIFICATION\n")
cat(strrep("-", 70), "\n")

all_loaded <- TRUE
for (pkg in core_packages) {
  if (require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat(sprintf("✓ %-20s (loaded successfully)\n", pkg))
  } else {
    cat(sprintf("✗ %-20s (FAILED TO LOAD)\n", pkg))
    all_loaded <- FALSE
  }
}

cat("\n")
if (all_loaded) {
  cat("✓✓✓ SUCCESS! All packages are installed and ready ✓✓✓\n")
  cat("\nYou can now run your analysis:\n")
  cat("  Rscript war_oil_analysis.R\n\n")
} else {
  cat("⚠ WARNING: Some packages failed to load. Please check manually.\n\n")
}

cat(strrep("=", 70), "\n\n")
