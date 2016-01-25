function Remove-VstsWorkItem {
    Param(
        [Parameter(Mandatory=$True)]
        [string]$Instance,
        [Parameter(Mandatory=$True,ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
        [string]$Id
    )
    Invoke-VstsOperation -Instance $Instance -Path "_apis/wit/workItems/$Id" -ApiVersion "1.0" -Method Delete
}