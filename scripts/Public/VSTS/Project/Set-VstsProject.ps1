function Set-VstsProject {
    Param(
        [string]$Name,
        [string]$Description,
        [Parameter(Mandatory=$True, Position=0)]
        [string]$Instance,

        [Parameter(Mandatory=$True,Position = 1,ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
        [string]$Id
    )
    if(!($Name -or $Description)) {
        return;
    }
    
    $body = @{}
    if($Name){
        $body.name = $Name
    }
    if($Description) {
        $body.description = $Description
    }
    
    Invoke-VstsOperation -Instance $Instance -Path "_apis/projects/$Id" -ApiVersion "2.0-preview" -Method Patch -Body $body
}