<%@ page import="com.jomariabejo.jakartaeewebappims.repository.CustomerRepository" %>
<%@ page import="com.jomariabejo.jakartaeewebappims.repository.SupplierRepository" %>
<%@ page import="com.jomariabejo.jakartaeewebappims.repository.ProductRepository" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <jsp:include page="_links.jsp"></jsp:include>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
    }

    .container {
        margin-top: 20px;
    }

    .card {
        border: 1px solid #ccc;
        border-radius: 10px;
    }

    .card-header {
        background-color: #007BFF;
        color: #fff;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
    }

    .card-body ul {
        list-style: none;
        padding: 0;
    }

    .card-body li {
        margin-bottom: 10px;
    }

    .card-body span {
        font-weight: bold;
    }
</style>
<body>

<jsp:include page="_nav.jsp"></jsp:include>


<div class="container mt-4">
    <div class="row">
        <div class="col-md-6 col-lg-4">
            <!-- Card 1 -->
            <div class="card text-white bg-danger mb-3">
                <div class="card-header bg-danger">Customer</div>
                <div class="card-body">
                    <p class="card-text">
                        <i class="fas fa-users fa-5x"
                           style=" display: flex; gap: 4rem; justify-content: space-between; width: 100%;">
                            <% CustomerRepository customerRepository = new CustomerRepository(); %>
                            <%= customerRepository.getCustomerCount()%>
                        </i>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-4">
            <!-- Card 2 -->
            <div class="card text-white bg-warning mb-3">
                <div class="card-header bg-warning">Supplier</div>
                <div class="card-body">
                    <p class="card-text">
                        <i class="fas fa-truck fa-5x"
                           style="display: flex; gap: 4rem; justify-content: space-between; width: 100%;">
                            <% SupplierRepository supplierRepository = new SupplierRepository(); %>
                            <%= supplierRepository.getSupplierCount()%>
                        </i>
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-4">
            <!-- Card 2 -->
            <div class="card text-white bg-dark mb-3">
                <div class="card-header bg-dark">Products</div>
                <div class="card-body">
                    <p class="card-text">
                        <i class="fas fa-motorcycle fa-5x"
                           style="display: flex; gap: 4rem; justify-content: space-between; width: 100%;">
                            <% ProductRepository productRepository = new ProductRepository(); %>
                            <%= productRepository.getProductCount()%>
                        </i>
                    </p>
                </div>
            </div>
        </div>

    </div>
</div>

<%-- Purchased Brand Trend--%>
<canvas id="PurchasedBrandTrend"></canvas>


<!-- Main Content Area -->
<div class="container mt-4">
    <!-- Inventory Overview -->
    <div class="row">
        <!-- Inventory Overview Card -->
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4>Inventory Overview</h4>
                </div>
                <div class="card-body">
                    <ul>
                        <li>Total number of products in inventory: <span id="totalProducts">100</span></li>
                        <li>Total inventory value: <span id="totalValue">10,000</span></li>
                        <li>Number of products in different categories:</li>
                        <ul>
                            <li>Category 1: <span id="category1Count">25</span></li>
                            <li>Category 2: <span id="category2Count">30</span></li>
                            <!-- Add more categories as needed -->
                        </ul>
                        <li>Current stock levels for critical products:</li>
                        <ul>
                            <li>Product 1: <span id="product1Stock">10</span></li>
                            <li>Product 2: <span id="product2Stock">5</span></li>
                            <!-- Add more critical products as needed -->
                        </ul>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Sales and Orders Card -->
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4>Sales and Orders</h4>
                </div>
                <div class="card-body">
                    <ul>
                        <li>Total number of open orders: <span id="totalOrders">50</span></li>
                        <li>Order status breakdown:</li>
                        <ul>
                            <li>Pending: <span id="pendingOrders">15</span></li>
                            <li>Processing: <span id="processingOrders">20</span></li>
                            <li>Shipped: <span id="shippedOrders">15</span></li>
                            <!-- Add more order statuses as needed -->
                        </ul>
                        <li>Recent sales trends and revenue: <span id="recentRevenue">5,000</span></li>
                    </ul>
                    <!-- Add a graph here to show sales over time -->
                    <div id="salesGraph" style="height: 250px;"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container mt-4">
    <!-- Suppliers and Purchasing -->
    <div class="row">
        <!-- Suppliers and Purchasing Card -->
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4>Suppliers and Purchasing</h4>
                </div>
                <div class="card-body">
                    <ul>
                        <li>Number of active suppliers: <span id="activeSuppliers">10</span></li>
                        <li>List of recent purchase invoices:</li>
                        <ul>
                            <li><a href="#">Invoice #1234</a></li>
                            <li><a href="#">Invoice #1235</a></li>
                            <li><a href="#">Invoice #1236</a></li>
                            <!-- Add more recent invoices as needed -->
                        </ul>
                        <li>Total amount spent on purchases: <span id="totalPurchases">25,000</span></li>
                    </ul>
                    <!-- Add a graph here to show purchasing trends over time -->
                    <div id="purchasingGraph" style="height: 250px;"></div>
                </div>
            </div>
        </div>

        <!-- Customers and Sales Card -->
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4>Customers and Sales</h4>
                </div>
                <div class="card-body">
                    <ul>
                        <li>Number of registered customers: <span id="registeredCustomers">500</span></li>
                        <li>List of recent sales invoices:</li>
                        <ul>
                            <li><a href="#">Invoice #5678</a></li>
                            <li><a href="#">Invoice #5679</a></li>
                            <li><a href="#">Invoice #5680</a></li>
                            <!-- Add more recent invoices as needed -->
                        </ul>
                        <li>Total revenue generated from sales: <span id="totalRevenue">50,000</span></li>
                    </ul>
                    <!-- Add a graph here to show sales trends by customer -->
                    <div id="salesByCustomerGraph" style="height: 250px;"></div>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="_scripts.jsp"></jsp:include>


<script>

    /**
     * Setup Chart.js
     */
    var ctxL = document.getElementById("PurchasedBrandTrend").getContext('2d');
    var myLineChart = new Chart(ctxL, {
        type: 'line',
        data: {
            labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
            datasets: [{
                label: "Honda",
                data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                backgroundColor: [
                    'rgba(105, 0, 132, .2)',
                ],
                borderColor: [
                    'rgba(200, 99, 132, .7)',
                ],
                borderWidth: 2
            },
                {
                    label: "Yamaha",
                    data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                    backgroundColor: [
                        'rgba(0, 137, 132, .2)',
                    ],
                    borderColor: [
                        'rgba(0, 10, 130, .7)',
                    ],
                    borderWidth: 2
                }, {
                    label: "Suzuki",
                    data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                    backgroundColor: [
                        'rgba(0, 137, 132, .2)',
                    ],
                    borderColor: [
                        'rgba(0, 10, 130, .7)',
                    ],
                    borderWidth: 2
                }, {
                    label: "Kawasaki",
                    data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                    backgroundColor: [
                        'rgba(0, 137, 132, .2)',
                    ],
                    borderColor: [
                        'rgba(0, 10, 130, .7)',
                    ],
                    borderWidth: 2
                },

            ]
        },
        options: {
            responsive: true,
            title: 'Purchased Brand Trend',
        }
    });
</script>
</body>
</html>
