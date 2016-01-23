function Get-VstsInstance {
    param(
		[Alias("Instance")]
        [Parameter(ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
        [string[]]$Name
	)
	begin {
		$path = Resolve-Path -Path "~\AppData\Roaming\VSTS\Instances"
	}
	process {
		if ([String]::IsNullOrWhitespace($Name)) {
			Get-ChildItem -Path $path -Filter '*.xml' | ForEach-Object {
				Get-VstsInstance -Instance $_.BaseName
			}
		} else {
			foreach($BaseName in $Name) {
				Import-CliXml -Path "$path\$BaseName.xml" -ErrorAction SilentlyContinue |
					Add-Member -MemberType NoteProperty -Name Path -Value "$path\$BaseName.xml" -PassThru
			}
		}
	}
}