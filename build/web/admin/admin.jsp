<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- End of Sidebar -->
<%@include file="./admin_includes/left.jsp" %>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

            <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">
                <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                <li class="nav-item dropdown no-arrow d-sm-none">
                    <!-- Dropdown - Messages -->
                    <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                         aria-labelledby="searchDropdown">
                        <form class="form-inline mr-auto w-100 navbar-search">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small"
                                       placeholder="Search for..." aria-label="Search"
                                       aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </li>
            </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>

            </div>

            <!-- Content Row -->
            <div class="row">
                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                        <a href="<%=request.getContextPath()%>/user_admin">Product</a>
                                        </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${produts.size()}</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1"> <a href="<%=request.getContextPath()%>/AdminUserServlet">User</a>
                                        </div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${numberUser}</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-info shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                        <a href="<%=request.getContextPath()%>/AdminOrderServlet">Order</a>
                                    </div>
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto">
                                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${numberOrder}</div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Pending Requests Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                        ...</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">...</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-comments fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="colorlib-product">
                <div class="container">
                    <div class="row row-pb-lg">
                        <div class="col-md-12">
                            <div class="product-name d-flex">
                                <div class="one-forth text-left px-4">
                                    <span>Product Details</span>
                                </div>
                                <div class="one-eight text-center">
                                    <span>Old Price</span>
                                </div>
                                <div class="one-eight text-center">
                                    <span>New Price</span>
                                </div>
                                <div class="one-eight text-right">
                                    <span>Action</span>
                                </div>
                            </div>
                            <c:choose>
                                <c:when test="${(produts != null && produts.size() > 0)}">
                                    <c:forEach var="product" items="${produts}">
                                        <div class="product-cart d-flex">
                                            <div class="one-forth">
                                                <div class="product-img" style="background-image: url('${product.getProductImage()}');">
                                                </div>
                                                <div class="display-tc">
                                                    <h3> <a href="DetailProductServlet?id=${product.getId()}">${product.getProductName()}</a></h3>
                                                </div>
                                            </div>
                                            <div class="one-eight text-center">
                                                <div class="display-tc">
                                                    <span class="price text-decoration-line-through" style="text-decoration: line-through">${String.format("%.1f", product.getOldPrice())}₫</span>
                                                </div>
                                            </div>
                                            <div class="one-eight text-center">
                                                <div class="display-tc">
                                                    <span class="price">${String.format("%.1f", product.getNewPrice())}₫</span>
                                                </div>
                                            </div>
                                            <div class="one-eight text-right">
                                                <div class="display-tc p-3" >
                                                    <a href="edit_product?id=${product.getId()}" >edit</a>
                                                </div>
                                                <div class="display-tc" >
                                                    <a href="delete_product?id=${product.getId()}" class="closed"></a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Content Row -->

        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

    <!-- Footer -->
    <footer class="sticky-footer bg-white">
        <div class="container my-auto">
            <div class="copyright text-center my-auto">
                <span>Copyright &copy; Your Website 2021</span>
            </div>
        </div>
    </footer>
    <!-- End of Footer -->
</div>
<!-- End of Content Wrapper -->
</div>

<!-- End of Page Wrapper -->
</body>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-datepicker.js"></script>
<script src="../js/main.js"></script>
</html>