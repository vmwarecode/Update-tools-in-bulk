Add-PSSnapin Vmware* -ErrorAction SilentlyContinue
Set-PowerCLIConfiguration -ProxyPolicy NoProxy -Confirm:$false

echo "Connect to ESX Server..."
Connect-VIServer -Server "10.1.2.3" -User "root" -Password 'pwd'
Get-VM | where { $_.PowerState -eq ?PoweredOn? -and $_.Guest.IPAddress -ne $null -and $_.Guest.ToolsVersion -ne $null -and $_.Guest.ToolsVersion -ne ""} |  update-tools -RunAsync:$false 
Disconnect-VIServer -Server * -Force -Confirm:$false