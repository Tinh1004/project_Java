<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyShop</title>
        <%@include file="./includes/head.jsp" %>
    </head>
    <<link rel="stylesheet" href="css/detail.css"/>
    <body>
        <%@include file="./includes/navbar.jsp" %>
<div class="container">
    <div class="card">
        <div class="card-body">
            <h3 class="card-title">${product.getProductName()}</h3>
            <div class="row">
                <div class="col-lg-5 col-md-5 col-sm-6">
                    <div class="white-box text-center"><img src="${product.getProductImage()}" class="img-responsive"></div>
                </div>
                <div class="col-lg-7 col-md-7 col-sm-6">
                    <h4 class="box-title mt-5">Product description</h4>
                    <p>Lorem Ipsum available,but the majority have suffered alteration in some form,by injected humour,or randomised words which don't look even slightly believable.but the majority have suffered alteration in some form,by injected humour</p>

                    <h2 class="mt-5" >
                        
                        <span style="text-decoration: line-through; color: grey; font-size: 24px;"> ${String.format("%.1f", product.getOldPrice())}₫</span>
                        <br>${String.format("%.1f", product.getNewPrice())}₫
                    </h2>

                    <a class="btn btn-primary btn-rounded" href="<%=request.getContextPath()%>/OrderNowServlet?id=${product.getId()}&quantity=1">Buy Now</a>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <h3 class="box-title mt-5">Thông số kỹ thuật</h3>
                    <div class="table-responsive">
                        <table class="table table-striped table-product">
                            <tbody>
                                <tr>
                                    <td width="390">Màn hình:</td>
                                    <td>IPS LCD full HD+ 2400x1080; 6.43"; 90hz; 1000 nit; Glass 3</td>
                                </tr>
                                <tr>
                                    <td>CPU:</td>
                                    <td>	Snapdragon 680; 2.4Ghz; Adreno 610</td>
                                </tr>
                                <tr>
                                    <td>RAM:</td>
                                    <td>4GB</td>
                                </tr>
                                <tr>
                                    <td>Camera sau:</td>
                                    <td>50MP + 8MP + 2MP + 2MP; Full HD -60fps; Đèn Flash; HDR, góc rộng</td>
                                </tr>
                                <tr>
                                    <td>Camera trước:</td>
                                    <td>13MP</td>
                                </tr>
                                <tr>
                                    <td>Bộ nhớ trong:</td>
                                    <td>64GB</td>
                                </tr>
                                <tr>
                                    <td>Pin:</td>
                                    <td>5000mah; Li-ion; Super charge 33W</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        <%@include file="./includes/footer.jsp" %>
    </body>
    <!-- Bootstrap core JS-->
</html>
