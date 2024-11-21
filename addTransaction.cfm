<cfparam name="form.date" default="">
<cfparam name="form.description" default="">
<cfparam name="form.amount" default="">
<cfparam name="form.category" default="">

<cfset newEntry = "#form.date#,#form.description#,#form.amount#,#form.category#">
<cflock timeout="10" throwontimeout="yes" type="exclusive">
    <cffile action="append" file="data/transactions.csv" output="#newEntry##chr(10)#">
</cflock>

<cflocation url="index.cfm" addToken="false">
