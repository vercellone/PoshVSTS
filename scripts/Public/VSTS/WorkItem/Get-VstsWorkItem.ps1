function Get-VstsWorkItem
{
    Param(
        [Parameter(Mandatory=$True, Position=0)]
        [string]$Instance,
        [Parameter(Mandatory=$True, Position=1)]
        [string]$Id
    )
    
    Invoke-VstsGetOperation -Instance $Instance -Path "_apis/wit/workItems/$Id" -ApiVersion "2.1"
}