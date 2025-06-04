<#
Filename: Update_X1_Yoga_BIOS.ps1

Author: David M. Synck

Purpose: Update Lenovo X1 Yoga BIOS to latest version 1.57 (hopefully, without turning it into a brick)

Last Change: 1/6/2023
#>

Clear-Host

Set-StrictMode -Version 1.0

# Set-PSDebug -trace 2

# I didn't write the "isOnPower" function below.
# I grabbed it from the following web page - https://www.nyxshima.com/get-battery-and-ac-power-adapter-connection-status-via-powershell/
Function isOnPower {
	try{
        $power = (Get-CimInstance -Class BatteryStatus -Namespace root\wmi).PowerOnLine
        $final = $False
        Foreach ($p in $power)
        {
			if ($p -like "True") {$final = $True}
        }
        return $final
    }
    catch{return 1}
}

$BIOSVersion = (Get-CimInstance -Class Win32_BIOS).Version

$OnACPower = isOnPower("")

$BatteryLevel = (Get-CimInstance -Class Win32_Battery).EstimatedChargeRemaining

If ($OnACPower -like "False") {
	Exit
}
ElseIf ($OnACPower -like "True" -and $BatteryLevel -le 49) {
	Exit
}
ElseIf ($OnACPower -like "True" -and $BatteryLevel -ge 50 -and $BIOSVersion -notlike "Lenovo - 1570" -and $BIOSVersion -notlike "Lenovo - 1580") {
	New-Item -name "Lenovo_X1_BIOS" -path "C:\gisd\install" -itemType "directory"
	$Target_Dir = "C:\gisd\install\Lenovo_X1_BIOS"
	ROBOCOPY . $Target_Dir *.* /s
	Set-Location -Path $Target_Dir
    CMD /C ".\WINUPTP.exe -s"
    CMD /C "shutdown.exe /r /t 0"
}
Else {
	Exit
}

# Set-PSDebug -Off

Set-StrictMode -Off
