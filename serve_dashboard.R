#!/usr/bin/env Rscript

# Simple local web server for the dashboard
library(servr)

cat("
")
cat(strrep("=", 70), "
")
cat("🌐 Local Dashboard Server
")
cat(strrep("=", 70), "

")

cat("Starting local web server...
")
cat("📍 Dashboard URL: http://localhost:8000/dashboard.html

")
cat("Press Ctrl+C to stop the server
")
cat("Open your browser to: http://localhost:8000/dashboard.html

")

# Serve the html_dashboard directory
servr::httd("html_dashboard/", port = 8000, browser = TRUE)

