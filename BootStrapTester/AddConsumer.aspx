<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddConsumer.aspx.cs" Inherits="BootStrapTester.AddStudent" %>

<!DOCTYPE html>
<html lang="en">

<body>
<head>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Add Consumer</title>
    <!--#include file="head.html"-->

    <!--<script type="text/javascript" lang="javascript">
        function NewConsumer() {
            alert("Consumer Successfully Added!");
        }
    </script> -->
</head>



    <div id="wrapper">
        <form role="form" runat="server">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <!--#include file="sidebar.html"-->
        </div>
        <!-- /#sidebar-wrapper -->

<div class="container">

<div class="page-header">
    <h1>New Consumer <small>Add Consumer Information Below</small></h1>
</div>

<!-- Registration form - START -->
<div class="container formcontainer">
                <div class="well well-sm"><strong><span class="glyphicon glyphicon-asterisk"></span>Required Field</strong></div>

                <%-- Name Field --%>
                <div class="form-group namegroup full">
                    <asp:Label id="lblName" Text="Consumer Name *" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                            <!-- First Name -->
                        <asp:TextBox class="form-control" ID="txtFName" Placeholder="First Name" runat="server"></asp:TextBox>
                            <!-- Last Name -->
                        <asp:TextBox class="form-control inline-control" ID="txtLName" Placeholder="Last Name" runat="server"></asp:TextBox>
                        <br />
                    </div>
                </div>

                <%-- TuID Field --%>
                <div class="form-group">
                    <asp:Label id="lblTUID" Text="TUID *" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox class="form-control" ID="txtTUID" Placeholder="TUID" runat="server"></asp:TextBox>
                        <br />
                    </div>
                </div>

                <%-- Email Field --%>
                <div class="form-group">
                    <asp:Label id="lblEmail" Text="Email *" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox class="form-control" ID="txtEmail" Placeholder="Email Address" runat="server"></asp:TextBox>
                        <br />
                    </div>
                </div>

                <%-- Phone Number Field --%>
                <div class="form-group">
                    <asp:Label id="lblPhone" Text="Phone Number *" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox class="form-control" ID="txtPhone" Placeholder="Phone Number" runat="server" pattern="[\(]\d{3}[\)]\d{3}[\-]\d{4}" onchange="try{setCustomValidity('')}catch(e){}" onkeydown="javascript:backspacerDOWN(this,event);" onkeyup="javascript:backspacerUP(this,event);"></asp:TextBox>
                        <br />
                    </div>
                </div>

                <br /> 
        <asp:Button id="btnAddStudent" Text="Submit" class="btn btn-colorbutton pull-right" runat="server"/>
       </div>
            
                <br />                 
</div>
            </form>
<!-- Registration form - END -->

</div>

</body>
</html>