function New-VstsProject {
    Param(
        [Parameter(Mandatory=$True)]
        [string]$Instance,

        [Parameter(Mandatory=$True)]
        [string]$Name,

        [Parameter(Mandatory=$True)]
        [string]$Description,

        [Parameter(Mandatory=$True)]
        [ValidateSet("Git", "Tfvc")]
        [string]$SourceControlType,

        [Parameter(Mandatory=$True)]
        [string]$TemplateTypeId
    )
    Invoke-VstsOperation -Instance $Instance -Path "_apis/projects" -ApiVersion "2.0-preview" -Method Post -Body (@{
        name = $Name
        description = $Description
        capabilities = @{
            versioncontrol = @{
                sourceControlType = $SourceControlType
            }
            processTemplate = @{
                templateTypeId = $TemplateTypeId
            }
        }
    })
}