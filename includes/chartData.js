fetch("data/transactions.csv")
    .then(response => response.text())
    .then(data => {
        // Split CSV into rows, skipping the header
        const rows = data.split("\n").slice(1).filter(row => row.trim());

        // Calculate totals by category
        const categories = {};
        rows.forEach(row => {
            const [date, description, amount, category] = row.split(",");
            const value = parseFloat(amount);

            if (!isNaN(value)) {
                categories[category] = (categories[category] || 0) + value;
            }
        });

        // Prepare data for the chart
        const chartData = {
            labels: Object.keys(categories), // Category names
            datasets: [{
                label: "Total Amount by Category",
                data: Object.values(categories), // Totals for each category
                backgroundColor: ["#4caf50", "#f44336", "#2196f3", "#ffeb3b"], // Customize colors
                borderColor: "#ddd",
                borderWidth: 1,
            }]
        };

        // Render the chart
        const ctx = document.getElementById("chart").getContext("2d");
        new Chart(ctx, {
            type: "bar", // Use 'bar' or 'pie'
            data: chartData,
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: "top",
                    },
                    tooltip: {
                        callbacks: {
                            label: function (tooltipItem) {
                                return `${tooltipItem.label}: $${tooltipItem.raw.toFixed(2)}`;
                            }
                        }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: "Amount ($)",
                        },
                    },
                },
            }
        });
    })
    .catch(error => console.error("Error loading or parsing CSV data:", error));
