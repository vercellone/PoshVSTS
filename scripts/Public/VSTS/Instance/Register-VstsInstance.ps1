function Register-VstsInstance {
    param(
        [Alias("Name")]
		[Parameter(Mandatory=$true,Position=0)]
		[string]$Instance,

		[Parameter(Mandatory=$true,Position=1,ParameterSetName='Authorization')]
		[SecureString]$Authorization,

		[Parameter(Mandatory=$true,Position=1,ParameterSetName='Credential')]
        [pscredential]$Credential,

		[Parameter(Mandatory=$true,Position=1,ParameterSetName='Token')]
		[string]$Token,

		[Parameter(Position=2)]
		[Uri]$Uri="https://$Instance.visualstudio.com/DefaultCollection"
	)
	$path = Resolve-Path -Path "~\AppData\Roaming\PoshVSTS\Instances"
    MakeDirIfNotExists $path | Out-Null
    
    switch($PSCmdlet.ParameterSetName) {
        Credential {
			$Auth = 'Basic {0}' -f $([System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes("$($Credential.UserName):$(DecryptSecureString $Credential.Password)")))
			$Authorization = ConvertTo-SecureString -String $Auth -AsPlainText -Force
		}
        Token {
			$Auth = 'Basic {0}' -f $([System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes(":$Token")))
			$Authorization = ConvertTo-SecureString -String $Auth -AsPlainText -Force
        }
    }
    [pscustomobject]@{
		Name = $Instance
		Uri = $Uri
        Authorization =  ConvertFrom-SecureString -SecureString $Authorization
    } | ConvertTo-Json | Out-File -FilePath "$path\$Instance.json"
    #} | Export-CliXml -Path "$path\$Instance.xml"
}