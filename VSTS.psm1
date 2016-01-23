$ScriptPath = Split-Path $MyInvocation.MyCommand.Path

#region Load Public Functions

try {
    Get-ChildItem "$ScriptPath\scripts\Public" -Filter *.ps1 -Recurse| Select -Expand FullName | ForEach {
        $Function = Split-Path $_ -Leaf
        . $_
    }
} catch {
    Write-Warning ("{0}: {1}" -f $Function,$_.Exception.Message)
    Continue
}

#endregion

#region Load Private Functions

try {
    Get-ChildItem "$ScriptPath\scripts\Private" -Filter *.ps1 -Recurse | Select -Expand FullName | ForEach {
        $Function = Split-Path $_ -Leaf
        . $_
    }
} catch {
    Write-Warning ("{0}: {1}" -f $Function,$_.Exception.Message)
    Continue
}

#endregion

Export-ModuleMember -Alias * -Function '*-Vsts*'