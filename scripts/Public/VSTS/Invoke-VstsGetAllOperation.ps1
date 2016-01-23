function Invoke-VstsGetAllOperation {
    Param(
        [string]$Instance,
        [string]$Path,
        [string]$ApiVersion,
        [hashtable]$Parameters = @{},
        [int]$ChunkSize = 100
    )
    
    $skip = 0
    
    $Parameters['$top'] = $ChunkSize
    
    do
    {
        $Parameters['$skip'] = $skip
        
        $results = Invoke-VstsGetOperation -Instance $Instance -Path $Path -ApiVersion $ApiVersion -Parameters $Parameters
        
        $skip += $results.count;
        
        $results.value
    } while($results.count -eq $ChunkSize);
}