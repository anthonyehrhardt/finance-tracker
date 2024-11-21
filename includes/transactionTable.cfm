<form action="addTransaction.cfm" method="post">
    <label>Date: <input type="date" name="date" required></label><br>
    <label>Description: <input type="text" name="description" required></label><br>
    <label>Amount: <input type="number" name="amount" step="0.01" required></label><br>
    <label>Category: 
        <select name="category">
            <option value="Income">Income</option>
            <option value="Expense">Expense</option>
        </select>
    </label><br>
    <button type="submit">Add Transaction</button>
</form>
