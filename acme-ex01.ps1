#Skapa mapp för Exchange Media
New-Item -Path c:\ -Name temp -Type Directory

#Starta filöverföring Exchange
Start-BitsTransfer https://download.microsoft.com/download/2/D/B/2DB1EEA2-CD9B-48F1-8235-1C9B82D19D68/ExchangeServer2016-x64-cu6.iso -Destination C:\temp



#Installera server roller som krävs för Exchange 2016
Install-WindowsFeature NET-Framework-45-Features, RPC-over-HTTP-proxy, RSAT-Clustering, RSAT-Clustering-CmdInterface, RSAT-Clustering-Mgmt, RSAT-Clustering-PowerShell, Web-Mgmt-Console, WAS-Process-Model, Web-Asp-Net45, Web-Basic-Auth, Web-Client-Auth, Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression, Web-Http-Errors, Web-Http-Logging, Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext, Web-ISAPI-Filter, Web-Lgcy-Mgmt-Console, Web-Metabase, Web-Mgmt-Console, Web-Mgmt-Service, Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression, Web-Static-Content, Web-Windows-Auth, Web-WMI, Windows-Identity-Foundation, RSAT-ADDS

#Installera Office Unified Communications Managed API 4.0 Runtime 
Start-BitsTransfer https://download.microsoft.com/download/2/C/4/2C47A5C1-A1F3-4843-B9FE-84C0032C61EC/UcmaRuntimeSetup.exe -Destination C:\temp
C:\temp\UcmaRuntimeSetup.exe -q

#Montera Exchange Image i VM
reg add HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v "Mount ISO" /d "C:\temp\ExchangeServer2016-x64-cu6.iso"
