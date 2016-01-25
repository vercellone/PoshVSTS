function Get-VstsProjectTeam {
    [CmdletBinding(DefaultParameterSetName="Name")]
    Param(
        [Parameter(Mandatory=$True, Position=0)]
        [string]$Instance,

        [Parameter(Mandatory=$True, Position=1)]
        [Alias("ProjectId")]
        [Alias("ProjectName")]
        [string]$Project,

        [Alias("TeamName")]
        [Parameter(Position=2,ParameterSetName="Name")]
        [string]$Name = "*",

        [Alias("TeamId")]
        [Parameter(Position=2,ParameterSetName="Id")]
        [guid]$Id,

        [int]$ChunkSize = 100
    )
    $team = "*"
    switch($PSCmdlet.ParameterSetName) {
        Id {
            $team = $Id
        }
        Name {
            $team = $Name
        }
    }
    if(!$team.Contains("*")) {
        Invoke-VstsGetOperation -Instance $Instance -Path "_apis/projects/$Project/teams/$team" -ApiVersion "2.0-preview"
    } else {
        Invoke-VstsGetAllOperation -Instance $Instance -Path "_apis/projects/$Project/teams" -ApiVersion "2.0-preview" -ChunkSize $ChunkSize |
            Where-Object { $_.Name -like $team }
    }
}