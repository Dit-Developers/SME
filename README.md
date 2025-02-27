# Software Metadata Extractor

## Overview
This PowerShell script extracts detailed metadata from any software file, including version details, digital signature information, and cryptographic hashes.

## Features

✅ Extracts file properties (size, last modified date, full path, etc.).  
✅ Retrieves version information (file version, product version, company name, etc.).  
✅ Checks digital signatures for authenticity.  
✅ Computes MD5 and SHA-256 hashes for integrity verification.  

## Prerequisites

- Windows operating system with PowerShell installed.  
- A valid software file (`.exe`, `.dll`, etc.).  

## Usage

### Run the Script
1. Open PowerShell and navigate to the script's directory.  
2. Execute the script with:  
   ```powershell
   .\software_metadata.ps1 -FilePath "C:\Path\To\Your\Software.exe" ```
3.If no file path is provided, the script will prompt for input.

##Example Output
```bash 
   __  __      _        _        
  |  \/  |    | |      | |       
  | \  / | ___| |_ __ _| |_ ___  
  | |\/| |/ _ \ __/ _` | __/ _ \ 
  | |  | |  __/ || (_| | ||  __/ 
  |_|  |_|\___|\__\__,_|\__\___| 
                                
       Software Metadata Extractor
       Developed by Muhammad Sudais Usmani
       https://msuport.vercel.app

Extracting metadata for: C:\Path\To\Your\Software.exe

File Properties:
Name: Software.exe
Full Path: C:\Path\To\Your\Software.exe
Size: 15.2 MB
Last Modified: 2025-02-27

Version Info:
File Version: 1.0.0.0
Product Version: 1.0.0
Product Name: Example Software
Company: Example Corp

Digital Signature Info:
Signature Status: Valid (Signed)
Signer: CN=Example Software Inc.
Issuer: CN=Example Certification Authority

File Hashes:
MD5: 5D41402ABC4B2A76B9719D911017C592
SHA-256: E99A18C428CB38D5F260853678922E03ABD83327AEE28A9D9363E23C4ADFF5C6

Metadata extraction completed!
```
## Repository  
Find this script on GitHub: [Software Metadata Extractor](#)

## Author  
**Muhammad Sudais Usmani**  
🌐 [msuport.vercel.app](https://msuport.vercel.app)

