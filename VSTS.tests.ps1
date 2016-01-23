$scriptroot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)

Import-Module (Join-Path $scriptroot 'PoshVSTS\VSTS.psm1') -Force

if ($null -eq (Get-VstsInstance -Name dyneia)) {
	$token = [Environment]::GetEnvironmentVariable("VSTSToken",'Process')
	if ($null -ne $token) {
		Register-VstsInstance -Instance "dyneia" -token $token
	}
}
Describe "BuildTemplate" {
	InModuleScope VSTS {
		$Instance = "dyneia"
		$Projects = @()
		'Automation','DataIntegration','DSI' | % { $Projects += @{Id = $_} }

		Context "Get" {
			It "Gets all build definition templates for Project '<Id>'" -TestCases $Projects {
				param($Id)
				
				$templates = Get-VstsBuildTemplate -Instance $Instance -Project $Id
				#$templates | Select-Object -ExpandProperty  | 
				$templates |
					Measure-Object | 
					Select-Object -ExpandProperty Count | 
					Should Not Be 0
			}
			$Templates = @()
			$Templates += @{Project='Automation';Id='PowerShellModule'}
			$Templates += @{Project='DataIntegration';Id='PowerShellModule'}
			It "Gets a build definition for Project '<Project>' by Id '<Id>'" -TestCases $Templates {
				param($Project,$Id)
				
				Get-VstsBuildTemplate -Instance $Instance -Project $Project -Id $Id | 
					Select-Object -ExpandProperty Name | 
					Should Be $Id
			}
		}
	}
}

Describe "Option" {
	InModuleScope VSTS {
		$Instance = "dyneia"
		Context "Get" {
			It "Get Areas" {
				Get-VstsArea -Instance $Instance | 
					Measure-Object | 
					Select-Object -ExpandProperty Count | 
					Should Not Be 0
			}
		}
	}
}

Describe "Project" {
	InModuleScope VSTS {
		$Instance = "dyneia"
		$Projects = @()
		'Automation','DataIntegration','DSI' | % { $Projects += @{Id = $_} }

		Context "Get" {
			It "Lists all projects" {
				Get-VstsProject -Instance $Instance -Id DataIntegration | 
					Measure-Object | 
					Select-Object -ExpandProperty Count | 
					Should Not Be 0
			}
			It "Gets a project by Id '<Id>'" -TestCases $Projects {
				param($Id)
				
				Get-VstsProject -Instance $Instance -Id $Id | 
					Select-Object -ExpandProperty Name | 
					Should Be $Id
			}
		}
	}
}

Describe "Team" {
	InModuleScope VSTS {
		$Instance = "dyneia"
		$Projects = @()
		'Automation','DataIntegration','DSI' | % { $Projects += @{Id = $_} }

		Context "Get" {
			It "Lists all '<Id>' teams " -TestCases $Projects {
				param($Id)
				
				Get-VstsProjectTeam -Instance $Instance -Project $Id |
					Measure-Object | 
					Select-Object -ExpandProperty Count | 
					Should Not Be 0
			}
			It "Lists all members of all '<Id>' teams" -TestCases $Projects {
				param($Id)
				
				Get-VstsProjectTeam -Instance $Instance -Project $Id | 
					Get-VstsProjectTeamMember -Instance $Instance -Project $Id
					Select-Object -ExpandProperty Name | 
					Should Be $Name
			}
			It "Lists all members of a team" {
				Get-VstsProjectTeamMember -Instance $Instance -Project $Projects[1].Id -Team "$($Projects[1].Id) Team"
					Select-Object -ExpandProperty Name | 
					Should Be $Name
			}
		}
	}
}

Describe "WorkItem" {
	InModuleScope VSTS {
		$Instance = "dyneia"
		$WorkItems = @()
		'4443','4449','4163' | % { $WorkItems += @{Id = $_} }
		Context "Get" {
			It "Gets a workitem by Id '<Id>'" -TestCases $WorkItems {
				param($Id)
				
				Get-VstsWorkItem -Instance $Instance -Id $Id | 
					Select-Object -ExpandProperty id | 
					Should Be $Id
			}
		}
	}
}