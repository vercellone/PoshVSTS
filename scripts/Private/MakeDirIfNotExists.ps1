function MakeDirIfNotExists($path) {
    $dir = Get-Item -ErrorAction SilentlyContinue $path
    if($null -eq $dir) {
        mkdir $path
    } else {
        $dir
    }
}