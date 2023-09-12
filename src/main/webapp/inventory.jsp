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
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Motorph Inventory</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <jsp:include page="_links.jsp"></jsp:include>
</head>

<body>

<form action="DeleteStock" method="get">
    <div class="modal fade" id="deleteConfirmationModal" tabindex="-1" role="dialog"
         aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteConfirmationModalLabel">Confirmation</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger" id="confirmDeleteButton">Delete</button>
                </div>
            </div>
        </div>
    </div>
</form>

<% InventoryRepository inventoryRepository1 = new InventoryRepository();
    List<InventoryData> list = inventoryRepository1.getInventoryData();
%>
<div class="container mt-4">
    <div class="row justify-content-between align-items-center">
        <div class="col-md-auto">
            <h2 class="mb-4">Inventory Data</h2>
            <button class="btn btn-primary mb-5" id="showFormButton">Add new data</button>
        </div>
<%--        <div class="col-md-auto">--%>
<%--            <div class="input-group"><input type="text" class="form-control" placeholder="Search..." aria-label="Search"--%>
<%--                                            aria-describedby="basic-addon2">--%>
<%--                <div class="input-group-append">--%>
<%--                    <button class="btn btn-outline-secondary" type="button">Search</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>
    <form id="dataForm" class="mt-4" style="display: none;" action="InsertStock" method="post">
        <div class="form-group">
            <label for="dateEntered">Date Entered:</label>
            <input id="dateEntered" type="text" class="form-control" name="dateEntered" placeholder="yyyy-MM-dd"
                   pattern="\d{4}-\d{2}-\d{2}" title="Please use the yyyy-MM-dd format">
        </div>
        <div class="form-group">
            <label for="stockLabel">Stock Label:</label>
            <select class="form-control" id="stockLabel" name="stockLabel">
                <option value="Old">Old</option>
                <option value="New">New</option>
            </select>
        </div>
        <div class="form-group">
            <label for="brand">Brand:</label>
            <select class="form-control" id="brand" name="brand">
                <option value="Honda">Honda</option>
                <option value="Kawasaki">Kawasaki</option>
                <option value="Kymco">Kymco</option>
                <option value="Suzuki">Suzuki</option>
                <option value="Yamaha">Yamaha</option>
            </select>
        </div>
        <div class="form-group">
            <label for="engineNumber">Engine Number:</label>
            <input type="text" class="form-control" id="engineNumber" name="engineNumber">
        </div>
        <div class="form-group">
            <label for="status">Status:</label>
            <select class="form-control" id="status" name="status">
                <option value="Onhand">Onhand</option>
                <option value="Sold">Sold</option>
            </select></div>
        <button type="submit" class="btn btn-primary mr-1" id="saveButton">Save</button>
        <button type="button" class="btn btn-danger" id="cancelButton">Cancel</button>
    </form>
    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="bg-light">
            <%--            Column Headers--%>
            <tr>
                <th>ID</th>
                <th>Date Entered</th>
                <th>Stock Label</th>
                <th>Brand</th>
                <th>Engine Number</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            </thead>
            <%--            Column Data--%>
            <% for (InventoryData stock : list) {
            %>
            <tr>
                <td><%=stock.getDataID() %>
                </td>
                <td><%=stock.getDateEntered() %>
                </td>
                <td><%=stock.getStockLabel() %>
                </td>
                <td><%=stock.getBrand() %>
                </td>
                <td><%=stock.getEngineNumber() %>
                </td>
                <td><%=stock.getStatus() %>
                </td>
                <td>
                    <a href="updatestock/stock?
                        jamesgosling=true
                        &dataID=<%= stock.getDataID() %>
                        &date=<%= stock.getDateEntered() %>
                        &stocklbl=<%= stock.getStockLabel() %>
                        &brand=<%= stock.getBrand() %>
                        &engineNumber=<%= stock.getEngineNumber() %>
                        &status=<%= stock.getStatus() %>"
                           class="btn btn-warning mr-1">Edit
                    <script>console.log(<%= stock.getDataID()%>)</script>
                    </a>
                    <a class="btn btn-danger"
                       onclick="confirmDelete(<%= stock.getDataID() %>)">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</div>
<jsp:include page="_footer.jsp"></jsp:include>
<%--JavaScript Default Scripts--%>
<jsp:include page="_scripts.jsp"></jsp:include>
<script>
    const showFormButton = document.getElementById('showFormButton');
    const dataForm = document.getElementById('dataForm');
    const saveButton = document.getElementById('saveButton');
    const cancelButton = document.getElementById('cancelButton');
    const dataIDField = document.getElementById('dataID');

    showFormButton.addEventListener('click', function () {
        if (dataForm.style.display === 'block') {
            dataForm.style.display = 'none';
        } else {
            dataForm.style.display = 'block';
        }
    });

    // JavaScript validation
    saveButton.addEventListener('click', function (event) {
        const dateEntered = document.getElementById('dateEntered').value;
        const engineNumber = document.getElementById('engineNumber').value;

        if (dateEntered.trim() === '' || engineNumber.trim() === '') {
            alert('Please fill in all required fields.');
            event.preventDefault();
        }
    });

    cancelButton.addEventListener('click', function () {
        dataForm.style.display = 'none';
    });


    const confirmDelete = function (id) {
        const deleteConfirmationModal = document.getElementById('deleteConfirmationModal');
        const confirmDeleteButton = document.getElementById('confirmDeleteButton');

        confirmDeleteButton.setAttribute('data-id', id);

        const modalBody = deleteConfirmationModal.querySelector('.modal-body');
        modalBody.textContent = `Are you sure you want to delete data id: ` + id + `?`;

        $(deleteConfirmationModal).modal('show');
    }

    document.getElementById('confirmDeleteButton').addEventListener('click', function () {
        const idToDelete = this.getAttribute('data-id');
        console.log("Deleting ID: " + idToDelete);
        $('#deleteConfirmationModal').modal('hide');
        window.location.href = "/DeleteStockConfirmed?id="+idToDelete
    });
</script>
</body>

</html>