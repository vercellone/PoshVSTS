function Get-VstsOption {
    Param(
        [Parameter(Mandatory=$True)]
        [string]$Instance,
        [string]$Area = "*",
        [string]$ResourceName = "*",
        [string]$ApiVersion = "1.0"
    )
    
    (Invoke-VstsOperation -Instance $Instance -Path "_apis" -ApiVersion $ApiVersion -Method Options).value | 
        Where-Object { ($_.area -like $Area) -and ($_.resourceName -like $ResourceName) }
}