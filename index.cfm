<!DOCTYPE html>
<html>
<head>
    <title>Personal Finance Tracker</title>
    <!---<script src="charts/Chart.min.js"></script>--->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>
<body>
    <h1>Personal Finance Tracker</h1>
    <cfinclude template="includes/transactionForm.cfm">
    <cfinclude template="includes/transactionTable.cfm">
    <canvas id="chart" width="300" height="200"></canvas>
   

    <script src="includes/chartData.js"></script>
</body>
</html>
