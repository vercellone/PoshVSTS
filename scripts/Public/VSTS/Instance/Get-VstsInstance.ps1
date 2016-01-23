function Get-VstsInstance {
    param(
        [Alias("Instance")]
        [Parameter(ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
        [string[]]$Name
    )
    begin {
        $path = Resolve-Path -Path "~\AppData\Roaming\VSTS\Instances" -ErrorAction SilentlyContinue 
    }
    process {
        if ([String]::IsNullOrWhitespace($Name)) {
            Get-ChildItem -Path $path -Filter '*.xml' -ErrorAction SilentlyContinue | ForEach-Object {
                Get-VstsInstance -Instance $_.BaseName
            }
        } else {
            foreach($BaseName in $Name) {
                if (Test-Path "$path\$BaseName.xml" -ErrorAction SilentlyContinue) {
                    Import-CliXml -Path "$path\$BaseName.xml"  |
                        Add-Member -MemberType NoteProperty -Name Path -Value "$path\$BaseName.xml" -PassThru
                }
            }
        }
    }
}