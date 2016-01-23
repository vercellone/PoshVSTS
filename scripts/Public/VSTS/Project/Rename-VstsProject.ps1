function Rename-VstsProject {
    Param(
        [Parameter(Mandatory=$True)]
        [string]$Instance,
        [Parameter(Mandatory=$True,ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
        [string]$Id,
        [Parameter(Mandatory=$True)]
        [string]$Name
    )
    
    Set-VstsProject -Instance $Instance -Id $Id -Name $Name
}