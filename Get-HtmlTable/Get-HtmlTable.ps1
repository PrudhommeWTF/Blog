Function Get-HtmlTable {
    #requires -version 3.0
    <#
        .SYNOPSIS
        Get a PowerShell Object from an HTML Table.

        .DESCRIPTION
        Query Web Page to get HTML Table within and return it has a PowerShell Object.

        .PARAMETER Url
        Url to get HTML Table from.

        .PARAMETER TableIndex
        Index of the table to get from the Web Page.

        .PARAMETER Header
        Allows you to force PowerShell Object property names.

        .PARAMETER FirstDataRow
        Index of the row to start gathering data from the HTML Table.

        .PARAMETER UseDefaultCredentials
        Indicates that the cmdlet uses the credentials of the current user to send the web request.

        .EXAMPLE
        Get-HtmlTable -Url 'https://www.w3schools.com/html/html_tables.asp'

        Will return a PowerShell Object of the first HTML Table found in the Webpage 'https://www.w3schools.com/html/html_tables.asp'.

        Company                      Contact          Country
        -------                      -------          -------
        Alfreds Futterkiste          Maria Anders     Germany
        Centro comercial Moctezuma   Francisco Chang  Mexico
        Ernst Handel                 Roland Mendel    Austria
        Island Trading               Helen Bennett    UK
        Laughing Bacchus Winecellars Yoshi Tannamuri  Canada
        Magazzini Alimentari Riuniti Giovanni Rovelli Italy

        .EXAMPLE
        Get-HtmlTable -Url 'https://www.w3schools.com/html/html_tables.asp' -TableIndex 1

        Will return a PowerShell Object of the second HTML Table found in the Webpage'https://www.w3schools.com/html/html_tables.asp'.

        Tag        Description
        ---        -----------
        <table>    Defines a table
        <th>       Defines a header cell in a table
        <tr>       Defines a row in a table
        <td>       Defines a cell in a table
        <caption>  Defines a table caption
        <colgroup> Specifies a group of one or more columns in a table for formatting
        <col>      Specifies column properties for each column within a <colgroup> element
        <thead>    Groups the header content in a table
        <tbody>    Groups the body content in a table
        <tfoot>    Groups the footer content in a table

        .EXAMPLE
        Get-HtmlTable -Url 'https://www.w3schools.com/html/html_tables.asp' -TableIndex 0 -Header Header,Header1,Header2

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

        .EXAMPLE
        Get-HtmlTable -Url 'https://www.w3schools.com/html/html_tables.asp' -TableIndex 0 -Header Header,Header1,Header2 -FirstDataRow 3

        Will return a PowerShell Object of the first HTML Table found in the Webpage 'https://www.w3schools.com/html/html_tables.asp', and change the Headers to Header,Header1,Header2, and start gathering data at row index 3.

        Header                       Header1          Header2
        ------                       -------          -------
        Ernst Handel                 Roland Mendel    Austria
        Island Trading               Helen Bennett    UK
        Laughing Bacchus Winecellars Yoshi Tannamuri  Canada
        Magazzini Alimentari Riuniti Giovanni Rovelli Italy

        .NOTES
        Author: Thomas Prud'homme (Blog: https://blog.prudhomme.wtf Tw: @Prudhomme_WTF).

        .LINK
        https://blog.prudhomme.wtf/

        .INPUTS
        System.String

        .OUTPUTS
        System.IO.File
     #>
    Param(
        [Parameter(
            Mandatory = $true
        )]
        [String]$Url,

        [Int]$TableIndex = 0,

        [String[]]$Header,

        [Int]$FirstDataRow = 0,

        [Switch]$UseDefaultCredentials
    )

    #Request Url HTML Output
    $RequestPage = Invoke-WebRequest -Uri $Url -UseDefaultCredentials:$UseDefaultCredentials
    
    #Get the wanted table
    $HtmlTable = $RequestPage.ParsedHtml.getElementsByTagName('table')[$tableIndex]
    
    #Eventually restrict outputed data
    $PropertyNames = $Header

    #Create the Objects
    for ($idx = $FirstDataRow; $idx -lt @($HtmlTable.rows).count; $idx++) {
        $CurrentRow     = $HtmlTable.rows[$idx]
        $AvailableCells = @($CurrentRow.cells)        

        #Replace Headers by PropertyNames if needed
        if(!$PropertyNames) {
            if($AvailableCells[0].tagName -eq 'th') {
                $PropertyNames = @($AvailableCells | ForEach-Object -Process {
                    $_.InnerText -replace ' ',$null
                })
            } else  {
                $PropertyNames =  @(1..($AvailableCells.Count + 2) | ForEach-Object {
                    "P$_"
                })
            }
            continue
        }        

        #Creating Ordered Object to ensure Columns are the same from the Webpage
        $OrderedOutput = [Ordered]@{}

        #Adding entries within the Ordered Object
        [Int]$NotSpecifiedCounter = 0
        for($Counter = 0; $Counter -lt $AvailableCells.Count; $Counter++) {
            $PropertyName = $PropertyNames[$Counter]

            #If no more Property Name available add a placeholder value
            if(!$PropertyName) {
                $NotSpecifiedCounter++
                $PropertyName= "[NotSpecified_$NotSpecifiedCounter]"
            }
            $OrderedOutput.$PropertyName= $AvailableCells[$Counter].InnerText
        }

        New-Object -TypeName PSObject -Property $OrderedOutput
    }
}