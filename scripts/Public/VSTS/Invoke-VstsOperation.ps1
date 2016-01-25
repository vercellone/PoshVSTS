function Invoke-VstsOperation {
    Param(
        [string]$Instance,
        [string]$Path,
        [string]$ApiVersion,
        [Microsoft.PowerShell.Commands.WebRequestMethod]$Method,
        [hashtable]$Parameters=@{},
        $Body,
        [string]$ContentType='application/json'
    )
    $vstsInstance = Get-VstsInstance -Name $Instance

    $auth = DecryptSecureString $($vstsInstance.Authorization)

    $Parameters.Add('api-version', $ApiVersion)
    if($Parameters.Count -gt 0) {
        $Path += "?"
        $Path += ($Parameters.Keys | % { "$_=$($Parameters[$_])" }) -join "&"
    }
    $uri = New-Object -TypeName Uri ($vstsInstance.Uri, $path)
    
    if($Method -eq "Get") {
        Invoke-RestMethod -Uri $uri -Method $Method -Headers @{ Authorization = $auth }
    } else {
        if ($Method -eq "Patch") {
            $ContentType = 'application/json-patch+json'
        }
        Invoke-RestMethod -Uri $uri -Method $Method -Headers @{ Authorization = $auth } -ContentType $ContentType `
            -Body (ConvertTo-Json -InputObject $Body -Depth 10 -Compress) 
    }
}