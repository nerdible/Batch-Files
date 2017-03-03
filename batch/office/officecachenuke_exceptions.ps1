#Powershell script to delete files with exceptions

#Delete files in Roaming Excel
get-childitem $Env:USERPROFILE\Appdata\Roaming\Microsoft\Excel -exclude "xlstart*","excel15.xlb","excel14.xlb" -recurse | foreach ($_) {remove-item $_.fullname -recurse -force -confirm:$false}

#Delete files in Roaming Word
get-childitem $Env:USERPROFILE\Appdata\Roaming\Microsoft\Excel -exclude "startup*","listgal.dat" -recurse | foreach ($_) {remove-item $_.fullname -recurse -force -confirm:$false}

#Delete files in Roaming Outlook
gci $Env:USERPROFILE\Appdata\Roaming\Microsoft\Outlook -exclude *.xml -recurse | foreach ($_) {remove-item $_.fullname -recurse -force -confirm:$false}
