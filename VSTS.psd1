@{

# Script module or binary module file associated with this manifest.
RootModule = 'VSTS.psm1'

# Version number of this module.
ModuleVersion = '1.0.0.0'

# ID used to uniquely identify this module
GUID = 'bd4390dc-a8ad-4bce-8d69-f53ccf8e4163'

# Author of this module
Author = 'Jason Vercellone,Andrew Gaspar'

# Company or vendor of this module
CompanyName = 'Jason Vercellone'

# Copyright statement for this module
Copyright = '(c) 2016. All rights reserved.'

# Description of the functionality provided by this module
Description = 'A #VSTS REST API module'

# Minimum version of the Windows PowerShell engine required by this module
# PowerShellVersion = ''

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = ''

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module
# (gci ~\Source\Repos\PoshVSTS\scripts\*.ps1 -Recurse | ? Name -like *-Vsts* | select -exp Name | % { "'{0}'" -f ($_ -replace '.ps1','') }  ) -join ',' | clip
FunctionsToExport = @('Get-VstsBuildTemplate','Set-VstsBuildTemplate','Get-VstsInstance','Register-VstsInstance','Unregister-VstsInstance','Get-VstsArea','Get-VstsOption','Get-VstsProject','New-VstsProject','Remove-VstsProject','Rename-VstsProject','Set-VstsProject','Get-VstsProjectTeam','Get-VstsProjectTeamMember','Get-VstsWorkItem','Invoke-VstsGetAllOperation','Invoke-VstsGetOperation','Invoke-VstsOperation')

# Cmdlets to export from this module
#CmdletsToExport = @()

# Variables to export from this module
#VariablesToExport = @()

# Aliases to export from this module
AliasesToExport = '*'

# List of all modules packaged with this module.
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()
# List of all files packaged with this module 
#FileList = @('VSTS.psd1', 'VSTS.psm1', 'BuildUrl.ps1','DecryptSecureString.ps1','GetAuth.ps1','MakeDirIfNotExists.ps1','RedeemCredentials.ps1','StoreCredentials.ps1','Invoke-VstsGetAllOperation.ps1','Invoke-VstsGetOperation.ps1','Invoke-VstsOperation.ps1','Get-VstsCredentials.ps1','Remove-VstsCredentials.ps1','Set-VstsCredentials.ps1','Get-VstsProject.ps1')

# Private data to pass to the module specified in RootModule/ModuleToProcess
# PrivateData = ''

# HelpInfo URI of this module
# HelpInfoURI = ''

}

