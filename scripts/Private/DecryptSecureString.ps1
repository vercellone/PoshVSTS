function DecryptSecureString {
    Param([SecureString]$sstr)
    
    $ptr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($sstr)
    $str = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($ptr)
    [System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($ptr)
    
    $str
}