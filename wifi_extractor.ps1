"" | Out-String
 Write-Host "*************************************************************************************************************" -ForegroundColor Green
 Write-Host "                                  	 WIFI Extractor V 1.0  "    -ForegroundColor Red        
 Write-Host "*************************************************************************************************************" -ForegroundColor Green
"" | Out-String

 Write-Output (" Hello " + $env:USERNAME  + ", below you can find a list of the all ever connected from this pc wireless networks and their passwords!" ) 
"" | Out-String


# Create variable for totals of all risk count
Write-Output ("[+] Extracting SSID's... ")
$wlans= netsh wlan show profiles |select-string  -Pattern ": " -SimpleMatch | foreach $_.Line {echo ($_.Line -split ": ")[1]}

Write-Output ("[+] Preparing list... ")
$list=foreach($line in $wlans){netsh wlan show profile name=$line key=clear |findstr "name Key Content"}

"" | Out-String
 Write-Output ("[+] Number discovered Wifi's is/are:  " + $wlans.count) # count entities
"" | Out-String
Write-Output ("Results below for Wifi SSIDs and Passwords? ")
"" | Out-String
$list
"" | Out-String
 Write-Output ("Do you want to get details for additional processing in text file? ")
 $reply = Read-Host -Prompt "Continue?[y/n]"
if ( $reply -match "[yY]" ) { 
 Write-Output (" Please find details in wifilist.txt on following location:") 
 "" | Out-String
 Write-Output "*************************************************************************************************************"
 Get-Location
 Write-Output "*************************************************************************************************************"
 "" | Out-String
 $list | Out-File -FilePath wifilist.txt 
}
Write-Output ("Enjoy!!! ") 
 