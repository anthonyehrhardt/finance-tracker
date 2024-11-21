<table border="1">
    <thead>
        <tr>
            <th>Date</th>
            <th>Description</th>
            <th>Amount</th>
            <th>Category</th>
        </tr>
    </thead>
    <tbody>
        <cfset transactions = []>
        <cflock timeout="10" throwontimeout="yes" type="readOnly">
            <cffile action="read" file="data/transactions.csv" variable="csvContent">
        </cflock>
        <cfloop list="#csvContent#" index="line" delimiters="#chr(10)#">
            <cfif trim(line) neq "">
                <cfset row = listToArray(line, ",")>
                <cfset arrayAppend(transactions, row)>
                <tr>
                    <cfloop array="#row#" index="cell">
                        <td>#cell#</td>
                    </cfloop>
                </tr>
            </cfif>
        </cfloop>
    </tbody>
</table>
