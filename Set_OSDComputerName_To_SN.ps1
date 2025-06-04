<#
  .SYNOPSIS
  Set_OSDComputerName_To_SN.ps1

  .DESCRIPTION
  Sets $OSDComputerName task sequence variable (For SCCM OSD)

  .EXAMPLE
    
  .NOTES
  Version:        0.1
  Author:         David Synck
  Creation Date:  1/23/2025
  Modified Date:  1/23/2025
  Purpose/Change: Initial coding / testing
  Link:           
#>

Clear-Host

Set-StrictMode -Version latest

# Set-PSDebug -trace 2

$SerialNumber = (Get-WmiObject -Class Win32_BIOS | Select-Object SerialNumber).SerialNumber
$Last8 = $SerialNumber.substring($SerialNumber.length-8)
$OSDComputerName = "DT" + "-" + $Last8
$TSEnv = New-Object -COMObject Microsoft.SMS.TSEnvironment 
$TSEnv.Value("OSDComputerName") = "$OSDComputerName"

# Set-PSDebug -Off

Set-StrictMode -Off
