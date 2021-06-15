New-NetFirewallRule -DisplayName "Allow inbound 32650" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 32650 -Profile Domain;
New-NetFirewallRule -DisplayName "Allow inbound 32650" -Direction Inbound -Protocol TCP -Action Allow -LocalPort 32650 -Profile Any;
$hostM = "Hostname=" + (hostname)
$ipNet2 = "ListenIP=" + (Get-NetIPAddress -AddressFamily IPV4 -InterfaceAlias "Ethernet 2").IPAddress;
New-Item "C:\ProgramData\zabbix\zabbix_agentd.conf" -ItemType File;

Add-Content C:\ProgramData\zabbix\zabbix_agentd.conf "Server=172.28.128.1";
Add-Content C:\ProgramData\zabbix\zabbix_agentd.conf "ServerActive=172.28.128.1";
Add-Content C:\ProgramData\zabbix\zabbix_agentd.conf "ListenPort=32650";
Add-Content C:\ProgramData\zabbix\zabbix_agentd.conf -Value $ipNet2;
Add-Content C:\ProgramData\zabbix\zabbix_agentd.conf -Value $hostM;
Add-Content C:\ProgramData\zabbix\zabbix_agentd.conf "UserParameter=release, windows, Windows";
Add-Content C:\ProgramData\zabbix\zabbix_agentd.conf "HostMetadataItem=release";
Add-Content C:\ProgramData\zabbix\zabbix_agentd.conf "LogFile=zabbix_agentd.log";
cp C:\ProgramData\zabbix\zabbix_agentd.conf c:\;
cd 'C:\Program Files\Zabbix Agent\'; .\zabbix_agentd.exe -f;
