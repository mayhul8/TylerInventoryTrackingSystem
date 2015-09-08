<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BootStrapTester.Login" EnableEventValidation="false" %>

<!DOCTYPE html>
<html lang="en">

<body>
<head>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Tyler SOARS</title>
    <!--#include file="head.html"-->

    <link href="css/logo-nav.css" rel="stylesheet">
    <style>        .navbar-brand img {
            width: 80px;
            height:auto;
        }
        .form-group input{
        width:100% !important;
        }
    </style>
</head>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">
                    <img src="http://upload.wikimedia.org/wikipedia/commons/7/71/TUOwls_logo.png" alt="" height="20" width="20">
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>



    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>Bootstrap Login Form</title>
    <meta name="generator" content="Bootply" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
    <link href="css/styles.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <!--login modal-->
        <div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="text-center">Login</h1>
                    </div>
                    <div class="modal-body">
                        <form class="form col-md-12 center-block">
                            <div class="form-group">
                                <label for="inputEmail" class="sr-only">Email address</label>
                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" placeholder="Email address"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password"></asp:TextBox>
                            </div>
                            <div class="form-group">     
                                <asp:Button ID="btnSubmit" runat="server" Text="Sign In" CssClass="btn btn-primary btn-lg btn-block" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnForgotPassword" runat="server" Text="Forgot Password?" CssClass="btn btn-primary btn-lg btn-block" />
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <div class="col-md-12">
                            
                            <asp:Label ID="lblError" runat="server" Text=""></asp:Label>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- script references -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>