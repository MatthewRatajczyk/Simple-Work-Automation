$Over1KB = New-Object System.Collections.Generic.List[System.Object]
$Under1KB = New-Object System.Collections.Generic.List[System.Object]

$files = Get-ChildItem -Path C:\Users\Ratajczyk\Desktop\TESTENVIORMENT -Recurse "~*"
for ($i=0; $i -lt $files.Count; $i++) {    
    Write-Host $files[$i]
    if (($files[$i]).length -gt 1kb) {$Over1KB.Add($files[$i])} else{$Under1KB.Add($files[$i])}
}

$Over1KB | Select-Object -Property Mode, LastWriteTime, @{N='SizeInKb';E={$_.Length/1kb}}, Name | Out-File  C:\Users\Ratajczyk\Desktop\Over1KB.txt  
$Under1KB | Select-Object -Property Mode, LastWriteTime, @{N='SizeInKb';E={$_.Length/1kb}}, Name | Out-File  C:\Users\Ratajczyk\Desktop\Under1KB.txt 

$path = "C:\Users\Ratajczyk\Desktop\TESTENVIORMENT"
#Get-ChildItem $path -Filter ~* -recurse |?{$_.PSIsContainer -eq $false -and $_.length -lt 1kb}|?{Remove-Item $_.fullname }