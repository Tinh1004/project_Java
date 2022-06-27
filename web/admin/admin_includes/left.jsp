<%-- 
    Document   : left
    Created on : Jun 23, 2022, 8:48:54 AM
    Author     : Admin
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Admin</title>
        <!-- Custom fonts for this template-->
        <link href="https://web-co-van-hoc-tap.herokuapp.com/assetsAdmin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="https://web-co-van-hoc-tap.herokuapp.com/assetsAdmin/css/sb-admin-2.css"  rel="stylesheet">
        <link href="https://web-co-van-hoc-tap.herokuapp.com/assetsAdmin/css/sb-admin-2.min.css" rel="stylesheet">
        <link href="https://web-co-van-hoc-tap.herokuapp.com/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style_1.css">

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="user_admin">
                    <div class="sidebar-brand-text mx-3">Admin</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="<%=request.getContextPath()%>/user_admin">
                        <span>Dashboard</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Interface
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="<%=request.getContextPath()%>/admin_create_product" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <span>Create Product</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="<%=request.getContextPath()%>/AdminUserServlet" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <span>Manage Users</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="<%=request.getContextPath()%>/AdminOrderServlet" data-toggle="collapse" data-target="#collapseTwo"
                       aria-expanded="true" aria-controls="collapseTwo">
                        <span>Manage Orders</span>
                    </a>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">
            </ul>