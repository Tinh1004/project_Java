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
                <h1 class="h3 mb-0 text-gray-800">Manage Orders</h1>
            </div>
            <!-- Content Row -->
            <div class="container">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Date</th>
                            <th scope="col">Product Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">User Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${orders != null}">
                                <c:forEach var="order" items="${orders}">
                                    <tr>
                                        <td>${order.getO_date()}</td>
                                        <td>${order.getProductName()}</td>
                                        <td>
                                            ${String.format("%.1f", Double.parseDouble(order.getNewPrice()))}₫
                                        </td>
                                        <td>
                                            ${order.getQuantiry()}
                                        </td>
                                        <td>
                                            ${order.getUserName()}
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td scope="col" colspan="5">Không có data ...</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
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