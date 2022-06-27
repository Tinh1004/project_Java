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
                <h1 class="h3 mb-0 text-gray-800">Manage Users</h1>

            </div>
            <!-- Content Row -->
            <div class="container">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">EMAIL</th>
                            <th scope="col">ROLE</th>
                            <th></th>
                            <th scope="col">Cancel</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${users != null}">
                                <c:forEach var="user" items="${users}">
                                    <tr>
                                        <td>${user.getUserName()}</td>
                                        <td>${user.getUserEmail()}</td>
                                        <td>
                                            ${user.isUserRole() ? "admin" : "user"}
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${user.isUserRole()}">
                                                    <td></td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>
                                                        <a class="btn btn-sm btn-danger text-white" href="AdminDeleteUserServlet?id=${user.getId()}">Cancel</a>
                                                    </td>
                                                </c:otherwise>
                                            </c:choose>
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