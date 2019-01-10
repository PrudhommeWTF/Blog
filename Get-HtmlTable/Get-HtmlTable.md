---
external help file:
Module Name:
online version:
schema: 2.0.0
---

# Get-HtmlTable

## SYNOPSIS
Get a PowerShell Object from an HTML Table.

## SYNTAX

```
Get-HtmlTable [-Url] <String> [[-TableIndex] <Int32>] [[-Header] <String[]>] [[-FirstDataRow] <Int32>]
 [-UseDefaultCredentials] [<CommonParameters>]
```

## DESCRIPTION
Query Web Page to get HTML Table within and return it has a PowerShell Object.

## EXAMPLES

### EXAMPLE 1
```
Get-HtmlTable -Url 'https://www.w3schools.com/html/html_tables.asp'
```

Will return a PowerShell Object of the first HTML Table found in the Webpage 'https://www.w3schools.com/html/html_tables.asp'.

Company                      Contact          Country
-------                      -------          -------
Alfreds Futterkiste          Maria Anders     Germany
Centro comercial Moctezuma   Francisco Chang  Mexico
Ernst Handel                 Roland Mendel    Austria
Island Trading               Helen Bennett    UK
Laughing Bacchus Winecellars Yoshi Tannamuri  Canada
Magazzini Alimentari Riuniti Giovanni Rovelli Italy

### EXAMPLE 2
```
Get-HtmlTable -Url 'https://www.w3schools.com/html/html_tables.asp' -TableIndex 1
```

Will return a PowerShell Object of the second HTML Table found in the Webpage'https://www.w3schools.com/html/html_tables.asp'.

Tag        Description
---        -----------
\<table\>    Defines a table
\<th\>       Defines a header cell in a table
\<tr\>       Defines a row in a table
\<td\>       Defines a cell in a table
\<caption\>  Defines a table caption
\<colgroup\> Specifies a group of one or more columns in a table for formatting
\<col\>      Specifies column properties for each column within a \<colgroup\> element
\<thead\>    Groups the header content in a table
\<tbody\>    Groups the body content in a table
\<tfoot\>    Groups the footer content in a table

### EXAMPLE 3
```
Get-HtmlTable -Url 'https://www.w3schools.com/html/html_tables.asp' -TableIndex 0 -Header Header,Header1,Header2
```

Will return a PowerShell Object of the first HTML Table found in the Webpage 'https://www.w3schools.com/html/html_tables.asp', and change the Headers to Header,Header1,Header2.

Header                       Header1          Header2
------                       -------          -------
Company                      Contact          Country
Alfreds Futterkiste          Maria Anders     Germany
Centro comercial Moctezuma   Francisco Chang  Mexico
Ernst Handel                 Roland Mendel    Austria
Island Trading               Helen Bennett    UK
Laughing Bacchus Winecellars Yoshi Tannamuri  Canada
Magazzini Alimentari Riuniti Giovanni Rovelli Italy

### EXAMPLE 4
```
Get-HtmlTable -Url 'https://www.w3schools.com/html/html_tables.asp' -TableIndex 0 -Header Header,Header1,Header2 -FirstDataRow 3
```

Will return a PowerShell Object of the first HTML Table found in the Webpage 'https://www.w3schools.com/html/html_tables.asp', and change the Headers to Header,Header1,Header2, and start gathering data at row index 3.

Header                       Header1          Header2
------                       -------          -------
Ernst Handel                 Roland Mendel    Austria
Island Trading               Helen Bennett    UK
Laughing Bacchus Winecellars Yoshi Tannamuri  Canada
Magazzini Alimentari Riuniti Giovanni Rovelli Italy

## PARAMETERS

### -FirstDataRow
Index of the row to start gathering data from the HTML Table.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Header
Allows you to force PowerShell Object property names.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TableIndex
Index of the table to get from the Web Page.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Url
Url to get HTML Table from.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseDefaultCredentials
Indicates that the cmdlet uses the credentials of the current user to send the web request.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### List of input types that are accepted by this function.
## OUTPUTS

### List of output types produced by this function.
## NOTES
Place additional notes here.

## RELATED LINKS

[URLs to related sites
The first link is opened by Get-Help -Online Get-HtmlTable]()

