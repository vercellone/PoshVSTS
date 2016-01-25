function Set-VstsWorkItem
{
    [OutputType([System.Object])]
    Param(
        [Parameter(Mandatory=$True,Position=0)]
        [string]$Instance,

        [Alias("Name")]
        [Parameter(Mandatory=$True,Position=1,ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
        [string]$Id,

        [Alias("Name")]
        [Parameter(Mandatory=$True,Position=2,ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
        [string]$Title
    )
    Invoke-VstsOperation -Instance $Instance -Path "_apis/wit/workItems/$Id" -ApiVersion "2.0-preview" -Method Patch -Body @{
        op = "add"
        path = "/fields/System.Title"
        value = $Title
    }
}