[![Build status](https://ci.appveyor.com/api/projects/status/u0h7op4yd8yud6cj?svg=true)](https://ci.appveyor.com/project/vercellone/poshvsts)

# VSTS
A PowerShell module for interacting with Visual Studio Team Services

## Build Definition Template

## Option

## Project

To get all projects in a VSTS instance:

```powershell
GIT P:\PoshVSO [master]> Get-VstsProject andrewgaspar.visualstudio.com


id          : 1acd195c-b542-44e4-b36a-8b0cb0440e71
name        : Git LIVE!
description : A tool for monitoring GitHub users, repos, and organizations from Windows.
url         : https://andrewgaspar.visualstudio.com/DefaultCollection/_apis/projects/1acd195c-b542-44e4-b36a-8b0cb0440e71
state       : wellFormed
revision    : 358049374

id          : 53d4c59d-b6cd-46e2-b642-af667cf60381
name        : Blog
description : This is my personal website, primarily my blog.
url         : https://andrewgaspar.visualstudio.com/DefaultCollection/_apis/projects/53d4c59d-b6cd-46e2-b642-af667cf60381
state       : wellFormed
revision    : 358049357
```
## Team

```powershell
GIT F:\Projects\PoshVSO [master ≡]> Get-VstsProjectTeam andrewgaspar.visualstudio.com "Blog"


id          : 8ff104e0-9844-4ead-8ca5-d8251e1d79c1
name        : Blog Team
url         : https://andrewgaspar.visualstudio.com/DefaultCollection/_apis/projects/53d4c59d-b6cd-46e2-b642-af667cf60381/teams/8ff104e0-9844-4ead-8ca5-d8251e1d79c1
description : The default project team.
identityUrl : https://andrewgaspar.vssps.visualstudio.com/_apis/Identities/8ff104e0-9844-4ead-8ca5-d8251e1d79c1
```

## WorkItem