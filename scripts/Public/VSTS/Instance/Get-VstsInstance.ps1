function Get-VstsInstance {
    param(
		[Alias("Instance")]
        [Parameter(ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
        [string[]]$Name
	)
	begin {
		$path = Resolve-Path -Path "~\AppData\Roaming\PoshVSTS\Instances"
	}
	process {
		if ([String]::IsNullOrWhitespace($Name)) {
#			Get-ChildItem -Path $path -Filter '*.xml' | ForEach-Object {
			Get-ChildItem -Path $path -Filter '*.json' | ForEach-Object {
				Get-VstsInstance -Instance $_.BaseName
			}
		} else {
			foreach($BaseName in $Name) {
				Get-Content -Path "$path\$BaseName.json" -ErrorAction SilentlyContinue | ConvertFrom-Json | 
					Add-Member -MemberType NoteProperty -Name Path -Value "$path\$BaseName.json" -PassThru
				#Import-CliXml -Path "$path\$BaseName.xml" -ErrorAction SilentlyContinue |
				#	Add-Member -MemberType NoteProperty -Name Path -Value "$path\$BaseName.xml" -PassThru
			}
		}
	}
}