function New-VstsWorkItem
{
    [OutputType([System.Object])]
    Param(
        [Parameter(Mandatory=$True,Position=0)]
        [string]$Instance,

        [Alias("Name")]
        [Parameter(Mandatory=$True,Position=1,ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
        [string]$Title,

        [Parameter(Mandatory=$true,Position=2,ValueFromPipelineByPropertyName=$true)]
        [string]$Project,

        [Parameter(Mandatory=$true,Position=3,ValueFromPipelineByPropertyName=$true)]
        [string]$Type
    )
    Invoke-VstsOperation -Instance $Instance -Path "$Project/_apis/wit/workItems/`$$Type" -ApiVersion "1.0" -Method Patch -Body @(
        @{
            op = "add"
            path = "/fields/System.Title"
            value = $Title
        }
    )
}