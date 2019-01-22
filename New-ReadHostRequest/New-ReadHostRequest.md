---
external help file:
Module Name:
online version: https://github.com/PrudhommeWTF/Stuffs/blob/master/Write-LogEntry/New-ReadHostRequest.md
schema: 2.0.0
---

# New-ReadHostRequest

## SYNOPSIS
Request user input using Read-Host Cmdlet and allow admin to provide a default value in case nothing is specified.

## SYNTAX

```
New-ReadHostRequest [-Question] <String> [[-DefaultValue] <String>] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### EXAMPLE 1
```
New-ReadHostRequest -Question 'Specify a computername to taget' -DefaultValue 'TestComputer-01'
```

Will request for user input and in case of empty reply it will set the reply to 'TestComputer-01'.

## PARAMETERS

### -Question
Question to prompt for input.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DefaultValue
Specify a default value for the reply.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String
## OUTPUTS

### System.String
## NOTES
Author: Thomas Prud'homme (Blog: https://blog.prudhomme.wtf Tw: @Prudhomme_WTF).

## RELATED LINKS

[https://github.com/PrudhommeWTF/Stuffs/blob/master/Write-LogEntry/New-ReadHostRequest.md](https://github.com/PrudhommeWTF/Stuffs/blob/master/Write-LogEntry/New-ReadHostRequest.md)

