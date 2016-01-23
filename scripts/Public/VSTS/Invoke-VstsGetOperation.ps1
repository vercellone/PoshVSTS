function Invoke-VstsGetOperation {
    Param(
        [string]$Instance,
        [string]$Path,
        [string]$ApiVersion,
        [hashtable]$Parameters = @{}
    )
    Invoke-VstsOperation -Instance $Instance -Path $Path -ApiVersion $ApiVersion -Method Get -Parmameters $Parameters
}