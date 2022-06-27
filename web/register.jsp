<%-- 
    Document   : login
    Created on : Jun 20, 2022, 2:06:51 PM
    Author     : Admin
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <link rel="stylesheet" href="./css/style_login.css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <body class="img js-fullheight" style="background-image: url(images/bg.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Register</h2>
                    </div>

                </div>

                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div>
                            <p style="color: yellow">${registerFailed}</p>
                        </div>
                        <div class="login-wrap p-0">
                            <form action="register" method="POST" class="signin-form">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="userName" placeholder="User Name" required>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" name="userEmail" placeholder="User Email" required>
                                </div>
                                <div class="form-group">
                                    <input id="password-field" type="password" name="userPassword" class="form-control" placeholder="Password" required>
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3">Register</button>
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="text-md-right">
                                        <a href="login" style="color: #fff">Login</a>
                                    </div>
                                </div>
                            </form>
                            <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
                            <div class="social d-flex text-center">
                                <a href="#" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-facebook mr-2"></span> Facebook</a>
                                <a href="#" class="px-2 py-2 ml-md-1 rounded"><span class="ion-logo-twitter mr-2"></span> Twitter</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>