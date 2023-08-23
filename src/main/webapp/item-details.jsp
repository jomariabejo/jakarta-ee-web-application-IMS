<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Display Item Details</title>
    <jsp:include page="_links.jsp"/>
</head>
<body>
<jsp:include page="_nav.jsp"/>

<div class="container mt-5">
    <h1>Item Details</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Brand</th>
            <th>Price</th>
        </tr>
        </thead>
        <tbody>
        <script>console.log("Good morning...")</script>
        <c:set var="productList"
               value="<%= new com.jomariabejo.jakartaeewebappims.service.ItemDetailsService().getProducts() %>"/>

        <% int productCounter = 0; %>
        <c:forEach var="product" items="${productList}" varStatus="loop">
            <tr>
                <td>${product.productID}</td>
                <td>${product.name}</td>
                <td>${product.productDescription}</td>
                <td>${product.brand}</td>
                <td>${product.price}</td>
            </tr>
            <%
            try {
            Thread.sleep(1000);
            } catch (InterruptedException e) {
            e.printStackTrace();
            }
            %>
            <% productCounter++; %>
            <script>console.log(<%="ProductCounter = " + productCounter %>)</script>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
