param (
    [string]$Message = "Hello from Jenkins!"
)

# Get timestamp for logging
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Generate HTML content
$htmlContent = @"
<!DOCTYPE html>
<html>
<head>
    <title>Jenkins Job Output</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; background-color: #f4f4f4; }
        .container { margin-top: 50px; padding: 20px; background: white; border-radius: 10px; box-shadow: 0px 0px 10px #ccc; display: inline-block; }
        h1 { color: #0073e6; }
        p { font-size: 18px; }
        .timestamp { font-size: 14px; color: gray; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Jenkins Job Report</h1>
        <p>Message: <strong>$Message</strong></p>
        <p class="timestamp">Generated at: $timestamp</p>
    </div>
</body>
</html>
"@

# Save the file
$outputFile = "output.html"
$htmlContent | Out-File -Encoding utf8 $outputFile

# Print the output location
Write-Host "`nReport generated: file://$(Resolve-Path $outputFile)`n" -ForegroundColor Green

