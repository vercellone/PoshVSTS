function Remove-VstsProject {
    Param(
        [Parameter(Mandatory=$True)]
        [string]$Instance,
        [Parameter(Mandatory=$True,ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
        [string]$Id
    )
    
    Invoke-VstsOperation -Instance $Instance -Path "_apis/projects/$Id" -ApiVersion "1.0" -Method Delete
}
