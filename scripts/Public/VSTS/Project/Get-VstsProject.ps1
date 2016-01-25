function Get-VstsProject {
    [CmdletBinding(DefaultParameterSetName="Query")]
    Param(
        [Parameter(Position=0, Mandatory=$True)]
        [string]$Instance,

        [Parameter(Mandatory=$True,Position=1,ParameterSetName="Instance",ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
        [string]$Id,

        [Parameter(ParameterSetName="Instance")]
        [switch]$IncludeCapabilities,

        [Parameter(ParameterSetName="Query")]
        [ValidateSet("WellFormed", "CreatePending", "Deleting", "New", "All")]
        [string]$StateFilter = "WellFormed",

        [Parameter(ParameterSetName="Query")]
        [int]$ChunkSize = 10
    )
    switch($PSCmdlet.ParameterSetName) {
        Query {
            Invoke-VstsGetAllOperation -Instance $Instance -Path "_apis/projects" -ApiVersion "1.0" -Paramters @{ stateFilter = $StateFilter } -ChunkSize $ChunkSize 
        }
        Instance {
            $Parameters = @{}
            if($IncludeCapabilities) {
                $Parameters.includeCapabilities = 'true'
            }
            Invoke-VstsGetOperation -Instance $Instance -Path "_apis/projects/$Id" -Apiversion "1.0" -Parameters $Parameters
        }
    }
}