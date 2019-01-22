---
external help file:
Module Name:
online version: https://github.com/PrudhommeWTF/Stuffs/blob/master/Write-LogEntry/Write-LogEntry.md
schema: 2.0.0
---

# Write-LogEntry

## SYNOPSIS
Write formated entry in the PowerShell Host and a file.

## SYNTAX

### Info (Default)
```
Write-LogEntry -Info <String> -LogFile <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Warning
```
Write-LogEntry -Warning <String> -LogFile <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Debugging
```
Write-LogEntry -Debugging <String> -LogFile <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

### ErrorMessage
```
Write-LogEntry -ErrorMessage <String> [-ErrorRecord <ErrorRecord>] -LogFile <String> [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### Success
```
Write-LogEntry -Success <String> -LogFile <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Function to write message within the PowerShell Host and persist it into a select file.

## EXAMPLES

### EXAMPLE 1
```
Write-LogEntry -Info 'Test log entry' -LogFile 'C:\Logs\TestLogFile.log'
```

Will output in Write-Verbose and in specified log file the specified Info string.

### EXAMPLE 2
```
Write-LogEntry -Warning 'Test log entry' -LogFile 'C:\Logs\TestLogFile.log'
```

Will output in Write-Warning and in specified log file the specified Info string.

### EXAMPLE 3
```
Write-LogEntry -Debugging 'Test log entry' -LogFile 'C:\Logs\TestLogFile.log'
```

Will output in Write-Debug and in specified log file the specified Info string.

### EXAMPLE 4
```
Write-LogEntry -ErrorMessage 'Test log entry' -ErrorRecord Value -LogFile 'C:\Logs\TestLogFile.log'
```

Will output using Write-Host (sadly) with a red foreground and in specified log file the specified Info string.

### EXAMPLE 5
```
Write-LogEntry -Success 'Test log entry' -LogFile 'C:\Logs\TestLogFile.log'
```

Will output using Write-Host (sadly) with a green foreground and in specified log file the specified Info string.

## PARAMETERS

### -Info
Message to write as basic information.
It will be displayed as Verbose in the PowerShell Host.

```yaml
Type: String
Parameter Sets: Info
Aliases: Message

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Warning
Message to write as a warning information.
It will be displayed as Warning in the PowerShell Host.

```yaml
Type: String
Parameter Sets: Warning
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Debugging
Message to write as a debugging information.
It will be displayed as Debug in the PowerShell Host

```yaml
Type: String
Parameter Sets: Debugging
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ErrorMessage
Message to write as error information.
It will be de displayed as an Error message in the PowerShell Host.

```yaml
Type: String
Parameter Sets: ErrorMessage
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Success
Message to write as a success information.
It will be displayed in grenn as a successfull message in the PowerShell Host.

```yaml
Type: String
Parameter Sets: Success
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ErrorRecord
Used to complete the ErrorMessage parameter with the Error Object that may have been generated.
This information will be displayed in the persistance file.

```yaml
Type: ErrorRecord
Parameter Sets: ErrorMessage
Aliases: Record

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -LogFile
Specify the file to write messages in.

```yaml
Type: String
Parameter Sets: (All)
Aliases: File, Location

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
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

### System.IO.File
## NOTES
Author: Thomas Prud'homme (Blog: https://blog.prudhomme.wtf Tw: @Prudhomme_WTF).

## RELATED LINKS

[https://github.com/PrudhommeWTF/Stuffs/blob/master/Write-LogEntry/Write-LogEntry.md](https://github.com/PrudhommeWTF/Stuffs/blob/master/Write-LogEntry/Write-LogEntry.md)

