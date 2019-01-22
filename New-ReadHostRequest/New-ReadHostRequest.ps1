Function New-ReadHostRequest {
    <#
        .SYNOPSIS
        Request user input using Read-Host Cmdlet and allow admin to provide a default value in case nothing is specified.

        .PARAMETER Question
        Question to prompt for input.

        .PARAMETER DefaultValue
        Specify a default value for the reply.

        .EXAMPLE
        New-ReadHostRequest -Question 'Specify a computername to taget' -DefaultValue 'TestComputer-01'
        
        Will request for user input and in case of empty reply it will set the reply to 'TestComputer-01'.

        .NOTES
        Author: Thomas Prud'homme (Blog: https://blog.prudhomme.wtf Tw: @Prudhomme_WTF).

        .LINK
        https://github.com/PrudhommeWTF/Stuffs/blob/master/New-ReadHostRequest/New-ReadHostRequest.md

        .INPUTS
        System.String

        .OUTPUTS
        System.String
    #>
    Param(
        [Parameter(
            Mandatory = $true
        )]
        [String]$Question,

        [String]$DefaultValue
    )

    if ($DefaultValue) {
        $Prompt = "$Question [$DefaultValue]"
    } else {
        $Prompt = $Question
    }

    $Reply = Read-Host -Prompt $Prompt
    if ([String]::IsNullOrWhiteSpace($Reply) -and $DefaultValue) {
        $Reply = $DefaultValue
    }
    Write-Output -InputObject $Reply
}
