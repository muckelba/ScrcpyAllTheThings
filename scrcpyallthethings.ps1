adb start-server #start the ADB server 

Import-Csv .\devices.csv | Foreach-Object { 
    adb connect $_.ip
    Start-Job -Name $_.name -ScriptBlock {scrcpy -s $args[0] --window-title $args[1] -b4m -m1024} -ArgumentList $_.ip, $_.name
}
