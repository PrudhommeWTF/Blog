Function Write-LogEntry {
    <#
        .SYNOPSIS
        Write formated entry in the PowerShell Host and a file.

        .DESCRIPTION
        Function to write message within the PowerShell Host and persist it into a select file.

        .PARAMETER Info
        Message to write as basic information.
        It will be displayed as Verbose in the PowerShell Host.

        .PARAMETER Warning
        Message to write as a warning information.
        It will be displayed as Warning in the PowerShell Host.

        .PARAMETER Debugging
        Message to write as a debugging information.
        It will be displayed as Debug in the PowerShell Host

        .PARAMETER ErrorMessage
        Message to write as error information.
        It will be de displayed as an Error message in the PowerShell Host.

        .PARAMETER Success
        Message to write as a success information.
        It will be displayed in grenn as a successfull message in the PowerShell Host.

        .PARAMETER ErrorRecord
        Used to complete the ErrorMessage parameter with the Error Object that may have been generated.
        This information will be displayed in the persistance file.

        .PARAMETER LogFile
        Specify the file to write messages in.

        .NOTES
        Author: Thomas Prud'homme (Blog: https://blog.prudhomme.wtf Tw: @Prudhomme_WTF).

        .LINK
        https://github.com/PrudhommeWTF/Stuffs/blob/master/Write-LogEntry/Write-LogEntry.md

        .INPUTS
        System.String

        .OUTPUTS
        System.IO.File
    #>
    [CmdletBinding(
        DefaultParameterSetName = 'Info', 
        SupportsShouldProcess   = $true, 
        ConfirmImpact           = 'Medium',
        HelpUri                 = 'https://github.com/PrudhommeWTF/Stuffs/blob/master/Write-LogEntry/Write-LogEntry.md'
    )]
    Param(
        [Parameter(
            Mandatory                       = $true, 
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName                = 'Info'
        )]
        [ValidateNotNullOrEmpty()]
        [Alias('Message')]
        [String]$Info,
 
        [Parameter(
            Mandatory                       = $true, 
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName                = 'Warning'
        )]
        [ValidateNotNullOrEmpty()]
        [String]$Warning,
 
        [Parameter(
            Mandatory                       = $true, 
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName                = 'Debugging'
        )]
        [ValidateNotNullOrEmpty()]
        [String]$Debugging,
 
        [Parameter(
            Mandatory                       = $true, 
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName                = 'ErrorMessage'
        )]
        [ValidateNotNullOrEmpty()]
        [String]$ErrorMessage,
 
        [Parameter(
            Mandatory                       = $true, 
            ValueFromPipelineByPropertyName = $true,
            ParameterSetName                = 'Success'
        )]
        [ValidateNotNullOrEmpty()]
        [String]$Success,
 
        [Parameter( 
            ValueFromPipeline               = $true,
            ValueFromPipelineByPropertyName = $true, 
            ValueFromRemainingArguments     = $false, 
            ParameterSetName                = 'ErrorMessage'
        )]
        [ValidateNotNullOrEmpty()]
        [Alias('Record')]
        [Management.Automation.ErrorRecord]$ErrorRecord,
 
        [Parameter(
            ValueFromPipelineByPropertyName = $true
        )]
        [Alias('File', 'Location')]
        [String]$LogFile
    )
    if (!(Test-Path -Path $LogFile)) {
         try {
            $null = New-Item -Path $LogFile -ItemType File -Force
         }
         catch {
            Write-Error -Message 'Error creating log file'
            break
         }
    }
    
    try {
        $Mutex = [Threading.Mutex]::OpenExisting('Global\AZEOMutex')
    }
    catch {
        $Mutex = New-Object -TypeName 'Threading.Mutex' -ArgumentList $false, 'Global\AZEOMutex'
    }
    
    Switch ($PSBoundParameters.Keys) {
         'ErrorMessage' {
            $null = $Mutex.WaitOne()
 
            Add-Content -Path $LogFile -Value "$([DateTime]::Now) [ERROR]: $ErrorMessage"
 
            if ($PSBoundParameters.ContainsKey('ErrorRecord')) {
                $Message = '{0} ({1}: {2}:{3} char:{4})' -f $ErrorRecord.Exception.Message,
                                                            $ErrorRecord.FullyQualifiedErrorId,
                                                            $ErrorRecord.InvocationInfo.ScriptName,
                                                            $ErrorRecord.InvocationInfo.ScriptLineNumber,
                                                            $ErrorRecord.InvocationInfo.OffsetInLine
 
                Add-Content -Path $LogFile -Value "$([DateTime]::Now) [ERROR]: $Message"
            }
 
            $null = $Mutex.ReleaseMutex()
            Continue
         }
         'Info' {
            Write-Verbose -Message "[$([DateTime]::Now)] $Info"

            $null = $Mutex.WaitOne()
 
            Add-Content -Path $LogFile -Value "$([DateTime]::Now) [INFO]: $Info"
                
            $null = $Mutex.ReleaseMutex()
            Continue
         }
         'Debugging' {
            Write-Debug -Message "$Debugging"
 
            $null = $Mutex.WaitOne()
                
            Add-Content -Path $LogFile -Value "$([DateTime]::Now) [DEBUG]: $Debugging"
                
            $null = $Mutex.ReleaseMutex()
            Continue
         }
         'Warning' {
            Write-Warning -Message "[$([DateTime]::Now)] $Warning"
 
            $null = $Mutex.WaitOne()
                
            Add-Content -Path $LogFile -Value "$([DateTime]::Now) [WARNING]: $Warning"
                
            $null = $Mutex.ReleaseMutex()
            Continue
         }
         'Success' {
            Write-Host -Object "SUCCESS: [$([DateTime]::Now)] $Success" -ForegroundColor Green
 
            $null = $Mutex.WaitOne()
                
            Add-Content -Path $LogFile -Value "$([DateTime]::Now) [SUCCESS]: $Success"
                
            $null = $Mutex.ReleaseMutex()
            Continue
         }
    }
}
