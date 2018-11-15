$folders = Get-ChildItem \\cbskwdfs\Repository
foreach ($folder in $folders.name){
    If (Test-Path \\cbskwdfs\Repository\$folder\Desktop\Applications -pathType container -eq $True) {
        Copy-Item -Path "\\FileLocation\Repository\ratajczyk.V2\Desktop\Applications\KilllNotes.exe" -Destination "\\FileLocation\Repository\$folder\Desktop\Application" -Recurse
    }  
    Else {
        Copy-Item -Path "\\FileLocation\Repository\ratajczyk.V2\Desktop\Applications\KilllNotes.exe" -Destination "\\FileLocation\Repository\$folder\Desktop" -Recurse
    } 
}
