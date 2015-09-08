<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="BootStrapTester.AddCategory" %>

<!DOCTYPE html>
    <head>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Add Category</title>
    <!--#include file="head.html"-->


</head>

<body>


    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <!--#include file="sidebar.html"-->
        </div>
        <!-- /#sidebar-wrapper -->

<div class="container">

<div class="page-header">
    <h1>Add a new Category<small>to the Tyler School of Art Inventory System</small></h1>
    </div>
    <form runat="server">
        <div class="container">
    <div class="row">
            <div class="col-lg-6">
                <%-- New Department Name --%>
                <div class="form-group">
                    <asp:Label id="lblDepartment" Text="Department Name*" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                        
                        <asp:DropDownList ID="ddlDepartment" runat="server">
                        </asp:DropDownList>
                        
                        </div>
                </div>
                <%-- New Category Name --%>
                <div class="form-group">
                    <asp:Label id="lblCategoryName" Text="Category Name*" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox class="form-control" ID="txtNewCategory" Placeholder="Category Name" runat="server"></asp:TextBox>
                        </div>
                </div>

         <%-- Submit --%>
                <div class="form-group">
                   
                    <div class="input-group">
                        <asp:Button id="btnSubmit" Text="Submit" class="btn btn-colorbutton pull-right" runat="server" OnClick="btnSubmit_Click"/> 
                        </div>
                </div>
                </div>
        </div>
            </div>
        </form>
 
</div>
    </div>
    </body>
</html>