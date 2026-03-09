# ============================================================================
# Advanced Interactive HTML Dashboard Generator
# War vs Oil Prices Analysis - with Date Range Filtering
# March 9, 2026
# ============================================================================

# Install required packages if needed
required_packages <- c('jsonlite', 'dplyr', 'readr')

for (pkg in required_packages) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat(sprintf("Installing %s...\n", pkg))
    install.packages(pkg, repos = "https://cran.r-project.org/", quiet = TRUE)
  }
}

cat("\n✓ All packages loaded\n\n")

# ============================================================================
# Load the prepared data
# ============================================================================

data <- read_csv("prepared_war_oil_data.csv")

cat("Data loaded: ", nrow(data), " rows, ", ncol(data), " columns\n\n")

# ============================================================================
# Create Advanced Interactive HTML Dashboard
# ============================================================================

cat("Generating advanced interactive dashboard with filters...\n\n")

# Create output directory
if (!dir.exists("html_dashboard")) {
  dir.create("html_dashboard")
}

# Get year range
min_year <- min(data$year, na.rm = TRUE)
max_year <- max(data$year, na.rm = TRUE)

# Convert data to JSON
data_json <- jsonlite::toJSON(data)

# Read the HTML template
html_content <- paste(readLines("html_dashboard/dashboard_template.html"), collapse = "\n")

# Replace placeholders with actual data
html_content <- gsub("DATA_JSON_PLACEHOLDER", data_json, html_content, fixed = TRUE)
html_content <- gsub("MIN_YEAR_PLACEHOLDER", as.character(min_year), html_content, fixed = TRUE)
html_content <- gsub("MAX_YEAR_PLACEHOLDER", as.character(max_year), html_content, fixed = TRUE)

# ============================================================================
# Write HTML file
# ============================================================================

output_file <- "html_dashboard/interactive_dashboard.html"
writeLines(html_content, output_file)

cat(sprintf("\n✅ Advanced Interactive HTML Dashboard created: %s\n", output_file))
cat(sprintf("   File size: %.1f KB\n", file.size(output_file) / 1024))

# ============================================================================
# Summary
# ============================================================================

cat(strrep("=", 70), "\n")
cat("✅ ADVANCED INTERACTIVE DASHBOARD GENERATION COMPLETE!\n")
cat(strrep("=", 70), "\n\n")

cat("📁 Output Files:\n")
cat("   ✓ html_dashboard/interactive_dashboard.html (Advanced dashboard)\n")
cat("   ✓ html_dashboard/dashboard.html (Basic dashboard - still available)\n\n")

cat("🌐 How to View:\n")
cat("   Option 1 (Direct): open html_dashboard/interactive_dashboard.html\n")
cat("   Option 2 (Server): Rscript serve_dashboard.R\n")
cat("            Then visit: http://localhost:8000/interactive_dashboard.html\n\n")

cat("✨ New Features:\n")
cat("   ✓ Date range filtering (Start/End Year)\n")
cat("   ✓ Conflict status filter (All/Conflict/Non-Conflict)\n")
cat("   ✓ Minimum price filter\n")
cat("   ✓ Dynamic chart updates in real-time\n")
cat("   ✓ Live statistics cards\n")
cat("   ✓ Interactive data table\n")
cat("   ✓ Loading spinners for smooth UX\n")
cat("   ✓ Record count indicator\n")
cat("   ✓ Apply & Reset buttons\n")
cat("   ✓ Responsive design (desktop/tablet/mobile)\n\n")

cat("📊 Available Filters:\n")
cat("   • Start Year: Choose from ", min_year, " to ", max_year, "\n", sep = "")
cat("   • End Year: Choose from ", min_year, " to ", max_year, "\n", sep = "")
cat("   • Conflict Status: All years, Conflict years, or Non-Conflict years\n")
cat("   • Minimum Price: Filter by minimum oil price\n\n")

cat("🎯 Interactive Elements:\n")
cat("   ✓ 6 dynamic charts that update instantly\n")
cat("   ✓ Real-time statistics cards\n")
cat("   ✓ Filtered data table\n")
cat("   ✓ Hover tooltips with exact values\n")
cat("   ✓ Zoom, pan, download capabilities\n")
cat("   ✓ Color-coded visualizations\n\n")

cat(strrep("=", 70), "\n")
