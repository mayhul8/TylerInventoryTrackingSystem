<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddWorker.aspx.cs" Inherits="BootStrapTester.AddWorker" %>

<!DOCTYPE html>
    <head>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>New Worker</title>
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
    <h1>Add a New Student Worker<small> to the Tyler School of Art Inventory System</small></h1>
    </div>
    <form runat="server">
        <div class="container">
    <div class="row">
            <div class="col-lg-6">

                <%-- Name Field --%>
                <div class="form-group">
                    <asp:Label id="lbName" Text="Worker Name *" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                            <!-- First Name -->
                        <asp:TextBox class="form-control" ID="txtFName" Placeholder="First Name" runat="server"></asp:TextBox>
                            <!-- Last Name -->
                        <asp:TextBox class="form-control" ID="txtLName" Placeholder="Last Name" runat="server"></asp:TextBox>
                        <br />
                    </div>
                </div>

                <%-- TuID Field --%>
                <div class="form-group">
                    <asp:Label id="lblTUID" Text="TUID *" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox class="form-control" ID="txtTUID" Placeholder="TUID" runat="server"></asp:TextBox>

                    </div>
                </div>

                <%-- Email Field --%>
                <div class="form-group">
                    <asp:Label id="lblEmail" Text="Email *" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox class="form-control" ID="txtEmail" Placeholder="Email Address" runat="server"></asp:TextBox>
                    </div>
                </div>

                <%-- Phone Number Field --%>
                <div class="form-group">
                    <asp:Label id="lblPhone" Text="Phone Number *" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox class="form-control" ID="txtPhone" Placeholder="Phone Number" runat="server" pattern="[\(]\d{3}[\)]\d{3}[\-]\d{4}" onchange="try{setCustomValidity('')}catch(e){}" onkeydown="javascript:backspacerDOWN(this,event);" onkeyup="javascript:backspacerUP(this,event);"></asp:TextBox>
                    </div>
                </div>

            <%-- Department Field --%>
             <div class="form-group">
            <asp:Label id="lblDepartment" Text="Department *" Font-Bold="true" runat="server"></asp:Label>
            <asp:DropDownList ID="ddlItemDepartment" class="form-control" role="menu" runat="server">
            </asp:DropDownList>
            
             </div>        
        <asp:CheckBox ID="chkIsAdmin" runat="server" Text="Is Admin?" />
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