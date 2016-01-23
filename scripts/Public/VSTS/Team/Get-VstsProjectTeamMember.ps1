function Get-VstsProjectTeamMember {
    [CmdletBinding(DefaultParameterSetName="Name")]
    Param(
        [Parameter(Mandatory=$True, Position=0)]
        [string]$Instance,

        [Alias("ProjectId")]
        [Alias("ProjectName")]
        [Parameter(Mandatory=$True, Position=1)]
        [string]$Project,
        
    [Parameter(Mandatory=$True, Position=2,ParameterSetName="Name",ValueFromPipelineByPropertyName=$True)]
        [Alias("TeamId")]
    [Alias("TeamName")]
    [Alias("Name")]
        [string]$Team,

        [int]$ChunkSize = 100
    )
    
    Invoke-VstsGetAllOperation -Instance $Instance -Path "_apis/projects/$Project/teams/$Team/members" -ApiVersion "1.0" -ChunkSize $ChunkSize
}