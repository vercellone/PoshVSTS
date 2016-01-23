function Invoke-VstsOperation {
    Param(
        [string]$Instance,
        [string]$Path,
        [string]$ApiVersion,
        [Microsoft.PowerShell.Commands.WebRequestMethod]$Method,
        [hashtable]$Parameters = @{},
        [hashtable]$Body = [hashtable]@{} 
    )
    
	$vstsInstance = Get-VstsInstance -Name $Instance

    $auth = DecryptSecureString (ConvertTo-SecureString $vstsInstance.Authorization)

    $Parameters['api-version'] = $ApiVersion
	if($Parameters.Count -gt 0) {
        $Path += "?"
        $Path += ($Parameters.Keys | % { "$_=$($Parameters[$_])" }) -join "&"
    }
	$uri = New-Object -TypeName Uri ($vstsInstance.Uri, $path)
    
    if($Method -eq "Get") {
        Invoke-RestMethod -Uri $uri -Method $Method -Headers @{ Authorization = $auth }
    } else {
        Invoke-RestMethod -Uri $uri -Method $Method -Headers @{ Authorization = $auth } -ContentType "application/json" `
			-Body ($Body | ConvertTo-Json -Depth 10 -Compress) 
    }
}