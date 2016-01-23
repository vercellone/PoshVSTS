function Unregister-VstsInstance{
    [cmdLetBinding()]
    param(
        [Alias("Name")]
        [Alias("Instance")]
        [Parameter(ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
        $InputObject
    )
    begin {
        $path = Resolve-Path -Path "~\AppData\Roaming\VSTS\Instances"
    }
    process {
        foreach ($item in $InputObject) {
            if ($item -is [String]) {
                Get-Item -Path "$path\$item.xml" -ErrorAction SilentlyContinue | Remove-Item 
            } elseif ($item.Path) {
                Get-Item -Path $item.Path -ErrorAction SilentlyContinue | Remove-Item
            }
        }
    }
}