Function Test-ShouldProcess {
    [CmdletBinding(
        SupportsShouldProcess = $true
    )]
    Param()
    if ($PSCmdlet.ShouldProcess("Target","Operation")) {
        #Actions performed without whatif switch
        Write-Host "If"
        Get-Service
    } else {
        #Actions performed with whatif switch
        Write-Host "Else"
        Get-Process
    }
}