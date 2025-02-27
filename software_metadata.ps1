param (
    [string]$FilePath
)

# Banner
$Banner = @"
   __  __      _        _        
  |  \/  |    | |      | |       
  | \  / | ___| |_ __ _| |_ ___  
  | |\/| |/ _ \ __/ _` | __/ _ \ 
  | |  | |  __/ || (_| | ||  __/ 
  |_|  |_|\___|\__\__,_|\__\___| 
                                
       Software Metadata Extractor
       Developed by Muhammad Sudais Usmani
       https://msuport.vercel.app
"@
Write-Host $Banner -ForegroundColor Cyan

# Validate File Path
if (-not $FilePath) {
    $FilePath = Read-Host "Enter the full path of the software file"
}

if (-not (Test-Path $FilePath)) {
    Write-Host "Error: File does not exist!" -ForegroundColor Red
    exit
}

# Function to Extract Metadata
function Get-SoftwareMetadata {
    param (
        [string]$File
    )

    Write-Host "`nExtracting metadata for: $File" -ForegroundColor Yellow

    # Get File Properties
    $FileInfo = Get-Item $File
    Write-Host "`nFile Properties:" -ForegroundColor Cyan
    Write-Host "Name: $($FileInfo.Name)"
    Write-Host "Full Path: $($FileInfo.FullName)"
    Write-Host "Size: $([math]::Round($FileInfo.Length / 1MB, 2)) MB"
    Write-Host "Last Modified: $($FileInfo.LastWriteTime)"

    # Get Version Info
    $VersionInfo = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($File)
    Write-Host "`nVersion Info:" -ForegroundColor Cyan
    Write-Host "File Version: $($VersionInfo.FileVersion)"
    Write-Host "Product Version: $($VersionInfo.ProductVersion)"
    Write-Host "Product Name: $($VersionInfo.ProductName)"
    Write-Host "Company: $($VersionInfo.CompanyName)"

    # Check Digital Signature
    Write-Host "`nDigital Signature Info:" -ForegroundColor Cyan
    $sig = Get-AuthenticodeSignature -FilePath $File
    if ($sig.Status -eq "Valid") {
        Write-Host "Signature Status: Valid (Signed)" -ForegroundColor Green
        Write-Host "Signer: $($sig.SignerCertificate.Subject)"
        Write-Host "Issuer: $($sig.SignerCertificate.Issuer)"
    } else {
        Write-Host "Signature Status: Not Signed or Invalid" -ForegroundColor Red
    }

    # Get Hashes
    Write-Host "`nFile Hashes:" -ForegroundColor Cyan
    $md5 = Get-FileHash -Path $File -Algorithm MD5
    $sha256 = Get-FileHash -Path $File -Algorithm SHA256
    Write-Host "MD5: $($md5.Hash)"
    Write-Host "SHA-256: $($sha256.Hash)"

    Write-Host "`nMetadata extraction completed!" -ForegroundColor Green
}

# Execute the Function
Get-SoftwareMetadata -File $FilePath
