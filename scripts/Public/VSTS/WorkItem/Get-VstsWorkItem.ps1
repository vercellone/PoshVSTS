function Get-VstsWorkItem
{
    [OutputType([System.Object])]
    Param(
        [Parameter(Mandatory=$True, Position=0)]
        [string]$Instance,

        [Alias("Name")]
        [Parameter(Mandatory=$True, Position=1,ParameterSetName="Id",ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
        [string[]]$Id,

        [Alias("Where")]
        [Parameter(Mandatory=$False, Position=1,ParameterSetName="Query")]
        [String[]]$Conditions
    )
    begin {
        if ($PSCmdlet.ParameterSetName -eq 'Query') {
            $query = "SELECT id FROM WorkItems"
            #$query = "SELECT [System.AreaPath],[System.TeamProject],[System.IterationPath],[System.WorkItemType],[System.State],[System.Reason],[System.AssignedTo],[System.CreatedDate],[System.CreatedBy],[System.ChangedDate],[System.ChangedBy],[System.Title] FROM WorkItems"
            if ($Conditions.Count -gt 0) 
            {
                    $query += " WHERE "
                    $query += $Conditions -join ' AND '
            }
            # Query Vsts for Work Items
            $Id = Invoke-VstsOperation -Instance $Instance -Path "_apis/wit/wiql" -Method Post -ApiVersion "1.0" -Body @{ query = $query } | Select-Object -ExpandProperty WorkItems | Select-Object -ExpandProperty id -Unique
        }
    }
    process {
        foreach ($itemid in $Id) {
            Invoke-VstsGetOperation -Instance $Instance -Path "_apis/wit/workItems/$itemid" -ApiVersion "2.1"
        }
    }
}