function Get-VstsArea {
    Param(
        [Parameter(Mandatory=$True)]
        [string]$Instance,
        [string]$Area = "*",
        [string]$ApiVersion = "1.0"
	)
        
    Get-VstsOption -Instance $Instance -Area $Area | Select-Object -Property Area -Unique
}