<#
  .SYNOPSIS
  Adobe Products Uninstaller

  .DESCRIPTION
  This script removes all Adobe products including Acrobat (all versions), Adobe CC 2019, Adobe CC 2020, Adobe CC 2022, Adobe CC 2023, Adobe CC 2024,  
  Adobe CS6 (including Dreanweaver and Premier Pro), and miscellaneous other versions of Adobe products that have been requested in the past.

  .EXAMPLE
    
  .NOTES
  Version:        1.4
  Author:         David Synck
  Creation Date:  20 April 2023
  Modified Date:  03 June 2025
  Purpose/Change: Initial version
                  Commented out removal of Adobe CS6 products
                  Re-enabled removal of CS6 products becuase we are removing it in labs with Adobe CC
                  Also removed "Ladder Code"

                  6/3/2025 - Commented out CC 2019 and CC 2020
                  6/3/2025 - Commented out Photoshop version 22.5.6, Photoshop version 24.7.1, After Effects W/ Maxon Cinema 4D version 23.5, and XD version 45.0.62
                  6/2/2025 - Added removal of Media Encoder 2025
                  6/2/2025 - Added removal of Bridge 2024
                  6/2/2025 - Added removal of Audition 2025
                  6/2/2025 - Added removal of CC 2024
                  1/8/2025 - Added removal of CC "All Apps" 2020
                  1/8/2025 - Added removal of CC "All Apps" 2019
                  6/4/2024 - Added removal of Photoshop version 22.5.6
                  6/4/2024 - Added removal of Photoshop version 24.7.1 (deployed to collection "Photoshop. See removal notes below")
                  6/4/2024 - Added removal of After Effects W/ Maxon Cinema 4D version 23.5
                  6/4/2024 - Added removal of XD version 45.0.62
                  6/3/2024 - Added removal of CC "All Apps" 2023
                  6/3/2024 - Added removal of CC "All Apps" 2022
  Link:           
#>

$ErrorActionPreference = 'SilentlyContinue'

# First, get all the unknown package TagID's (for Acrobat), based on regex package name/s

$var0 = (Get-Package -Name "*Acrobat*" -AllVersions -Force -ErrorAction $ErrorActionPreference).TagID

# Next, start the uninstall process, package by package

Try {
    $process00 = Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/uninstall {$var0} /qn" -PassThru
    $process00.WaitForExit()
}
Catch {
    Write-Host "Hit an error or package doesn't exist"
}

<#
# Remove Adobe CC 2019 "All Apps", if found anywhere

Try {
    $process1 = Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/uninstall {C219029D-864F-42EB-BB7F-8CD86482C7DC} /qn" -PassThru
    $process1.WaitForExit()
}
Catch {
    Write-Host "Hit an error or package doesn't exist"
}

# Remove Adobe CC 2020 "All Apps", if found anywhere

Try {
    $process1 = Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/uninstall {FACBB8C7-B306-46A4-BE6E-64D7ACCF7153} /qn" -PassThru
    $process1.WaitForExit()
}
Catch {
    Write-Host "Hit an error or package doesn't exist"
}
#>

# Remove Adobe CC 2022 "All Apps", if found anywhere

Try {
    $process01 = Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/uninstall {08cf4373-6196-45ec-ab75-abf5e866119d} /qn" -PassThru
    $process01.WaitForExit()
}
Catch {
    Write-Host "Hit an error or package doesn't exist"
}

# Remove Adobe CC 2023 "All Apps"

Try {
    $process02= Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/uninstall {70378fc6-ef90-428e-a17d-7d6f99127559} /qn" -PassThru
    $process02.WaitForExit()
}
Catch {
    Write-Host "Hit an error or package doesn't exist"
}

# Remove Adobe CC 2024 "All Apps"

Try {
    $process03 = Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/uninstall {f96321a7-f597-42c7-b9a2-f2938f6a4d30} /qn" -PassThru
    $process03.WaitForExit()
}
Catch {
    Write-Host "Hit an error or package doesn't exist"
}

<#

# Remove Adobe XD version 45.0.62

Try {
    $process1 = Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/uninstall {7500F526-586E-4441-8FCD-BDCF36D1AEED} /qn" -PassThru
    $process1.WaitForExit()
}
Catch {
    Write-Host "Hit an error or package doesn't exist"
}

# Remove Photoshop version 22.5.6

Try {
    $process1 = Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/uninstall {C62AE839-DD04-463A-8E25-C4F16D8263F5} /qn" -PassThru
    $process1.WaitForExit()
}
Catch {
    Write-Host "Hit an error or package doesn't exist"
}

# Remove Photoshop version 24.7.1 
# (This was to replace a Compass 2023 incompatible version in labs SGHS-116, NGHS-121, SHS-154, SHS-156, and SHS-164)

Try {
    $process1 = Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/uninstall {F465F226-9BEC-436E-B664-43DCC2FB2007} /qn" -PassThru
    $process1.WaitForExit()
}
Catch {
    Write-Host "Hit an error or package doesn't exist"
}

# Remove After Effects W/ Maxon Cinema 4D version 23.5

Try {
    $process1 = Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/uninstall {FF838A65-478F-4C63-83FA-91B2DF022DA8} /qn" -PassThru
    $process1.WaitForExit()
}
Catch {
    Write-Host "Hit an error or package doesn't exist"
}

#>

# Remove Audition 2025

Try {
    $process04 = Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/uninstall {268c2dc8-af46-43b4-b36a-63348da82b6f} /qn" -PassThru
    $process04.WaitForExit()
}
Catch {
    Write-Host "Hit an error or package doesn't exist"
}

# Remove Bridge 2024

Try {
    $process05 = Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/uninstall {35ea22b0-3774-47df-a6c0-baee7125db20} /qn" -PassThru
    $process05.WaitForExit()
}
Catch {
    Write-Host "Hit an error or package doesn't exist"
}

# Remove Media Encoder 2025

Try {
    $process06 = Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/uninstall {2cfeabae-c4ae-4954-9008-afb20233711a} /qn" -PassThru
    $process06.WaitForExit()
}
Catch {
    Write-Host "Hit an error or package doesn't exist"
}

# Lastly, we also need to remove Acrobat Pro X, CS6 Design Web Premium, CS6 Dreamweaver, and CS6 Premier Pro, if they are installed

# Remove Acrobat Pro X

Try {
    $process07 = Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/uninstall {AC76BA86-1033-F400-7760-000000000005} /qn" -PassThru
    $process07.WaitForExit()
}
Catch {
    Write-Host "Hit an error or package doesn't exist"
}

# Remove Adobe CS6

Try {
    $process08 = Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/uninstall {670F2DCF-BE94-4889-9D32-5ECD083C6BD9} /qn" -PassThru
    $process08.WaitForExit()
}
Catch {
    Write-Host "Hit an error or package doesn't exist"
}

# Remove CS6 Dreamweaver

Try {
    $process09 = Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/uninstall {58B8BC87-C890-4EDE-AA7B-A634E9089D55} /qn" -PassThru
    $process09.WaitForExit()
}
Catch {
    Write-Host "Hit an error or package doesn't exist"
}

# Remove CS6 Premier Pro

Try {
    $process10 = Start-Process C:\Windows\System32\msiexec.exe -ArgumentList "/uninstall {A92911D4-680A-40F8-9477-2DAA9EB63498} /qn" -PassThru
    $process10.WaitForExit()
}
Catch {
    Write-Host "Hit an error or package doesn't exist"
}

Exit-PSSession
