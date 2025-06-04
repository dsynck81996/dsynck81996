<#
  .SYNOPSIS
  Stu_Profile_CleanUp_2024.ps1

  .DESCRIPTION
  Correctly removes student user accounts, including registry entries. Modified for "new-style" student accounts

  .EXAMPLE
    
  .NOTES
  Version:        0.1
  Author:         David Synck (modified from original script found on the web)
  Creation Date:  11/10/2022
  Modified Date:  6/6/2024
  Purpose/Change: Initial coding / testing

                  6/6/2024 - This script now handles removing both "old style" and "new style" student accounts
#>

Set-StrictMode -Version 1.0

# Set-PSDebug -trace 2

# "-match" is one of the Powershell comparison operators asking "Does this string match a regex pattern ?"
# "\S" - match a capital "S"
# "\d" - match any decimal digit
# The doubled backslashes in the match string are necessary, because otherwise Powershell tries to interpret the "\U" in "C:\Users"
# as a regex pattern.

$profiles = Get-CimInstance -class Win32_UserProfile | Where-Object {((!$_.Special) -and ($_.LocalPath -match "C:\\Users\\\S\d\d\d\d\d\d"))}

Write-Host("$profiles") -ForegroundColor "DarkYellow" -BackgroundColor "DarkRed"

Write-Host("`n")
Write-Host("`n")

if ($profiles -ne " ") {
    Write-Host("Deleting Student Profile/s `n") -ForegroundColor "DarkYellow" -BackgroundColor "DarkRed"
    Try {$profiles | Remove-CimInstance}
    Catch {
        Write-Host("Error encountered deleting profile/s. Possibly, profile is 'in use' `n")
        Continue
    }
}

Clear-Host

# "-match" is one of the Powershell comparison operators asking "Does this string match a regex pattern ?"
# "\w+" - match any letters
# "\d" - match any decimal digit
# The doubled backslashes in the match string are necessary, because otherwise Powershell tries to interpret the "\U" in "C:\Users"
# as a regex pattern.

$profiles = Get-CimInstance -class Win32_UserProfile | Where-Object {((!$_.Special) -and ($_.LocalPath -match "C:\\Users\\\w+\d\d\d"))}

Write-Host("$profiles") -ForegroundColor "DarkYellow" -BackgroundColor "DarkRed"

Write-Host("`n")
Write-Host("`n")

if ($profiles -ne " ") {
    Write-Host("Deleting Student Profile/s `n") -ForegroundColor "DarkYellow" -BackgroundColor "DarkRed"
    Try {$profiles | Remove-CimInstance}
    Catch {
        Write-Host("Error encountered deleting profile/s. Possibly, profile is 'in use' `n")
        Continue
    }
}

# Set-PSDebug -Off

Set-StrictMode -Off

Clear-Host
