<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<nav class="colorlib-nav" role="navigation">
    <div class="top-menu">
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-9">
                    <div id="colorlib-logo"><a href="home">MyShop</a></div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 text-left menu-1">
                    <ul>
                        <li class="active"><a href="home">Home</a></li>
                        <li class="has-dropdown">
                            <a href="home">Smart Phone</a>
                            <ul class="dropdown">
                                <li><a href="home">Samsung</a></li>
                                <li><a href="home">Nokia</a></li>
                                <li><a href="home">IPhone</a></li>
                                <li><a href="home"></a></li>
                                <li><a href="home">Wishlist</a></li>
                            </ul>
                        </li>
                        <li><a href="home">About</a></li>
                        <li><a href="home">Contact</a></li>

                         <c:choose>
                            <c:when test="${auth.isUserRole()}">
                                <li><a href="<%=request.getContextPath()%>/user_admin">Admin</a></li>
                            </c:when>
                        </c:choose>

                        <li class="cart"><a href="<%=request.getContextPath()%>/cart"><i class="icon-shopping-cart"></i> Cart [${carts.size() == null ? '0' : carts.size() }]</a></li>
                        <li class="cart"><a href="<%=request.getContextPath()%>/orders">orders</a></li>

                        <c:choose>
                            <c:when test="${auth == null}">
                                <div>
                                    <li class="cart"><a href="<%=request.getContextPath()%>/login">login</a></li>
                                    <li class="cart"><a href="<%=request.getContextPath()%>/register">register</a></li>
                                </div>
                            </c:when>
                            <c:otherwise>

                                <div>
                                    <li class="cart"><a href="<%=request.getContextPath()%>/logout">logout</a></li>
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="sale">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 offset-sm-2 text-center">
                    <div class="row">
                        <div class="owl-carousel2">
                            <div class="item">
                                <div class="col">
                                    <h3><a href="home">Our biggest sale yet 50% off all Smart phone</a></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>

