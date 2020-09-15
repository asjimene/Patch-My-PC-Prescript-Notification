## Creates the Prescripts for Patch My PC using the SupportedProducts List found in the Patch My PC Installation Directory.

# Set the timeout for the prescript, this is the amount of time the user has to act on the notification before it is
# ignored automatically
$PrescriptTimeout = 60

[xml]$SupportedProducts = Get-Content $((Get-PSDrive -PSProvider FileSystem) | Foreach-Object {(Get-Item "$($_.Root)\*\Patch My PC\Patch My PC Publishing Service\SupportedProducts.xml" | Select-Object -First 1)})

$PrescriptTemplate = Get-Content "$PSScriptRoot\Prescript-CloseApp.ps1"
New-Item -ItemType Directory "$PSScriptRoot\Prescripts" -Force -ErrorAction SilentlyContinue
foreach ($vendor in $SupportedProducts.SupportedProducts.Vendor) {
	foreach ($product in ($vendor.Product | where {$null -ne $_.KillProcessList})) {
		Write-Host "Creatig Prescript for $($product.name)"
		$PrescriptToExport = $PrescriptTemplate.Replace("%APPNAME%",$product.name).Replace("%PROCESSLIST%", $(($product.KillProcessList).Replace("|",'","'))).Replace("%TIMEOUT%",$PrescriptTimeout)
		$PrescriptToExport | Out-File "$PSScriptRoot\Prescripts\$($product.name)-prescript.ps1" -Encoding oem -Force
	}
}