<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyShop</title>
        <%@include file="./includes/head.jsp" %>
    </head>
    <body>
        <div id="page">
            <%@include file="./includes/navbar.jsp" %>
            <div class="colorlib-product">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 offset-sm-2 text-center colorlib-heading">
                            <h2>Best Sellers</h2>
                        </div>
                    </div>
                    <div class="row row-pb-md">
                        <c:forEach var="productItem" items="${produts}">
                            <div class="col-lg-3 mb-4 text-center">
                                <div class="product-entry border">
                                    <a href="DetailProductServlet?id=${productItem.getId()}" class="prod-img">
                                        <img src=${productItem.getProductImage()} class="img-fluid" alt="Free html5 bootstrap 4 template">
                                    </a>
                                    <div class="desc">
                                        <h2><a href="DetailProductServlet?id=${productItem.getId()}">${productItem.getProductName()}</a></h2>
                                            <c:choose>
                                                <c:when test="${!(productItem.getOldPrice() == '')}">
                                                <span class="text-muted text-decoration-line-through" style="text-decoration: line-through">${String.format("%.1f", productItem.getOldPrice())}₫</span><br/>
                                            </c:when>
                                        </c:choose>
                                        <span class="price">${String.format("%.1f", productItem.getNewPrice())}₫</span>
                                    </div>
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center">
                                            <a class="btn btn-outline-dark mt-auto" href="<%=request.getContextPath()%>/add-cart?id=${productItem.getId()}">Add to cart</a>
                                            <a class="btn btn-outline-secondary mt-auto" href="<%=request.getContextPath()%>/OrderNowServlet?id=${productItem.getId()}&quantity=1">Buy now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        
                    </div>
                    <div class="row">
                            <div class="col-md-12 text-center">
                                <p><a href="#" class="btn btn-primary btn-lg">Shop All Products</a></p>
                            </div>
                        </div>
                </div>

            </div>


            <%@include file="./includes/footer.jsp" %>
