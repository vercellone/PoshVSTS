function Get-VstsBuildTemplate {
    [CmdletBinding(DefaultParameterSetName="Query")]
    Param(
        [Parameter(Position=0, Mandatory=$True)]
        [string]$Instance,

        [Alias("BuildTemplateName")]
        [Alias("Name")]
        [Alias("TemplateName")]
        [Parameter(Mandatory=$True,Position=1,ParameterSetName="Instance",ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
        [string]$Id,

        [Alias("ProjectId")]
        [Alias("ProjectName")]
        [Parameter(Mandatory=$true,Position=2,ValueFromPipelineByPropertyName=$true)]
        [string]$Project,

        [Parameter(ParameterSetName="Query")]
        [int]$ChunkSize = 10
    )
    switch($PSCmdlet.ParameterSetName) {
        Query {
            Invoke-VstsGetOperation -Instance $Instance -Path "$Project/_apis/build/definitions/templates" -ApiVersion "2.0"
            # build templates don't support $ChunkSize (top/skip)
            #Invoke-VstsGetAllOperation -Instance $Instance -Path "$Project/_apis/build/definitions/templates" -ApiVersion "2.0" -ChunkSize $ChunkSize
        }
        Instance {
           Invoke-VstsGetOperation -Instance $Instance -Path "$Project/_apis/build/definitions/templates/$Id" -ApiVersion "2.0"
        }
    }
}