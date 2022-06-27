<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- End of Sidebar -->
<%@include file="./admin_includes/left.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

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
                        <h1 class="h3 mb-0 text-gray-800">Create Product</h1>
                    </div>

                    <form method="post" action="<%=request.getContextPath()%>/edit_product">
                        <input type="hidden" name="id" value="${product.getId()}" />
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Tên Sản Phẩm</label>
                            <input type="text" name="productName" class="form-control" id="exampleFormControlInput1"
                                placeholder="Điện thoại ..." value="${product.getProductName()}" required> 
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Giá cũ</label>
                            <input type="text" name="oldPrice" class="form-control" id="exampleFormControlInput1"
                                   placeholder="999999.0" value=${String.format("%.1f", product.getOldPrice())} required> 
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Giá mới</label>
                            <input type="text" name="newPrice" class="form-control" id="exampleFormControlInput1"
                                   placeholder="999999.9" value=${String.format("%.1f", product.getNewPrice())} required> 
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Url image</label>
                            <input type="text" name="productImage" class="form-control" id="exampleFormControlInput1"
                                placeholder="Url image" value=${product.getProductImage()} required> 
                        </div>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>
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




</body>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-datepicker.js"></script>
<script src="../js/main.js"></script>
</html>