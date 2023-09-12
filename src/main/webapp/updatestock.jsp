<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jomariabejo.jakartaeewebappims.model.InventoryData" %>
<%@ page import="com.jomariabejo.jakartaeewebappims.repository.InventoryRepository" %>
<%@ page import="java.util.List" %>
<%--
Created by IntelliJ IDEA.
User: jomar
Date: 8/25/2023
Time: 11:43 AM To change this template use File | Settings | File Templates.
--%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Stock</title>
    <!-- Add external CSS libraries -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.17.0/font/bootstrap-icons.css">
</head>
<body>
<div class="container mt-4">
    <form action="UpdateStockSubmit" method="post">
        <div style="display: none;" class="form-group">
            <label for="id">dataID:</label>
            <input type="text" class="form-control" id="id" name="id" value="${dataID}">
        </div>
        <div class="form-group">
            <label for="engineNumber">Engine Number:</label>
            <input type="text" class="form-control" id="engineNum" name="engineNumber" value="${engineNumber}">
        </div>
        <!-- Date Entered -->
        <div class="form-group">
            <label for="dateEntered">Date Entered: (YYYY-MM-DD)</label>
            <input id="dateEntered" type="text" class="form-control" name="dateEntered" placeholder="ex: 2023-02-28"
                   pattern="\d{4}-\d{2}-\d{2}" title="Please use the yyyy-MM-dd format" value="${dateEntered}">
        </div>
        <!-- Stock Label -->
        <div class="form-group">
            <label for="stockLabel">Stock Label:</label>
            <select class="form-control" id="stockLabel" name="stockLabel">
                <option value="Old" ${stockLabel == 'Old' ? 'selected' : ''}>Old</option>
                <option value="New" ${stockLabel == 'New' ? 'selected' : ''}>New</option>
            </select>
        </div>
        <!-- Brand -->
        <div class="form-group">
            <label for="brand">Brand:</label>
            <select class="form-control" id="brand" name="brand">
                <option value="Honda" ${brand == 'Honda' ? 'selected' : ''}>Honda</option>
                <option value="Kawasaki" ${brand == 'Kawasaki' ? 'selected' : ''}>Kawasaki</option>
                <option value="Kymco" ${brand == 'Kymco' ? 'selected' : ''}>Kymco</option>
                <option value="Suzuki" ${brand == 'Suzuki' ? 'selected' : ''}>Suzuki</option>
                <option value="Yamaha" ${brand == 'Yamaha' ? 'selected' : ''}>Yamaha</option>
            </select>
        </div>
        <!-- Engine Number -->
        <div class="form-group">
            <label for="engineNumber">Engine Number:</label>
            <input type="text" class="form-control" id="engineNumber" name="engineNumber" value="${engineNumber}">
        </div>
        <!-- Status -->
        <div class="form-group">
            <label for="status">Status:</label>
            <select class="form-control" id="status" name="status">
                <option value="Onhand" ${status == 'Onhand' ? 'selected' : ''}>Onhand</option>
                <option value="Sold" ${status == 'Sold' ? 'selected' : ''}>Sold</option>
            </select>
        </div>
            <div>
                <a id="update-button" onclick="updateHref()" href="/UpdateStockSubmit?" class="btn btn-primary">Update</a>
                <a href="/inventory.jsp" class="btn btn-danger" id="btn-cancel">Cancel</a>
            </div>

    </form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    function updateHref() {
        var id = document.getElementById("id").value;
        var engineNumber = document.getElementById("engineNumber").value;
        var dateEntered = document.getElementById("dateEntered").value;
        var stockLabel = document.getElementById("stockLabel").value;
        var brand = document.getElementById("brand").value;
        var status = document.getElementById("status").value;

        var newHref = "/UpdateStockSubmit?init=true&id=" + id +
            "&engineNumber=" + engineNumber +
            "&dateEntered=" + dateEntered +
            "&stockLabel=" + stockLabel +
            "&brand=" + brand +
            "&status=" + status;

        document.getElementById("update-button").href = newHref;
    }

    document.getElementById("id").addEventListener("input", updateHref);
    document.getElementById("engineNumber").addEventListener("input", updateHref);
    document.getElementById("dateEntered").addEventListener("input", updateHref);
    document.getElementById("stockLabel").addEventListener("input", updateHref);
    document.getElementById("brand").addEventListener("input", updateHref);
    document.getElementById("status").addEventListener("input", updateHref);
</script>
</body>
</html>
