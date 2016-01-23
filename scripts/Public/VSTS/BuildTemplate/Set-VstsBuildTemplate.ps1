function Set-VstsBuildTemplate {
 	Param(
	        [Parameter(Position=0, Mandatory=$True)]
	        [string]$Instance,

	        [Parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
	        [Alias('Template')]
	        [PSObject]
	        $InputObject,

	        [Alias("Name")]
	        [Alias("TemplateName")]
		[Parameter(ValueFromPipelineByPropertyName=$true)]
		[string]
	        $Id,

		[Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
		[string]
	        $Project
	)
	process {
	    foreach($template in $InputObject) {
			if ([String]::IsNullOrWhiteSpace($Id)) {
				$Id = $template.name
			}
		    Invoke-VstsOperation -Instance $Instance -Path "$Project/_apis/build/definitions/templates/$Id" -ApiVersion "2.0" -Method Put -Body $template
		}
	}
}
