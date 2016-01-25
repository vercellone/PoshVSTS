function Remove-VstsBuildTemplate {
    Param(
        [Parameter(Position=0, Mandatory=$True)]
        [string]$Instance,

        [Alias("Name")]
        [Alias("TemplateName")]
        [Parameter(Mandatory=$True,Position=1,ParameterSetName="Id",ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
        [string]$Id,

        [Alias("ProjectId")]
        [Alias("ProjectName")]
        [Parameter(Mandatory=$true,Position=2,ValueFromPipelineByPropertyName=$true)]
        [string]$Project
    )
    process {
        foreach($itemid in $Id) {
            Invoke-VstsOperation -Instance $Instance -Path "$Project/_apis/build/definitions/templates/$itemid" -ApiVersion "2.0" -Method Delete
        }
    }
}
