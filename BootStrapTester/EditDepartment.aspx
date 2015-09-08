<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditDepartment.aspx.cs" Inherits="BootStrapTester.EditDepartment" %>


<!DOCTYPE html>
<html lang="en">

<body>
<head>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Edit Department</title>
    <!--#include file="head.html"-->

</head>

    <div id="wrapper">
        <form id="Form1" role="form" runat="server">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <!--#include file="sidebar.html"-->
        </div>
        <!-- /#sidebar-wrapper -->


        <br /> 

<div class="container">

<div class="page-header">
    <h1>Edit Departments<small> Select department to deactivate</small></h1>
</div>

<div class="container">
    <div class="row">
            <div class="col-lg-6">

    <div class="form-group">
            <asp:Label id="lblDepartment" Text="Department *" Font-Bold="true" runat="server"></asp:Label>
            <asp:DropDownList ID="ddlDepartment" class="form-control" role="menu" runat="server">
                      </asp:DropDownList>
            
        </div>



          <div class="input-group-btn">
            <asp:Button id="btnDeactivate" Text="Deactivate" class="btn btn-colorbutton pull-right" runat="server" OnClick="btnDeactivate_Click"/>
            <asp:Button ID="btnActivate" runat="server" class="btn btn-colorbutton pull-right" OnClick="btnActivate_Click" Text="Activate" />
          </div>
        
    </div>
        </div>
    </div>
</div>
      </form>

    </div>
    <!-- .container-fluid -->
  
</body>
</html>
