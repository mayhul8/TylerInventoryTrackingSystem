<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditWorker.aspx.cs" Inherits="BootStrapTester.EditWorker" %>


<!DOCTYPE html>
<html lang="en">

<body>
<head>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Edit Consumer</title>
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
    <h1>Edit Worker Information <small> Select category to search</small></h1>
</div>
<div class="container">
    <div class="row">
            <div class="col-lg-6">

   <div class="form-group">
             <asp:GridView ID="gvWorkers" runat="server" AutoGenerateColumns="False">
                 <Columns>
                     <asp:TemplateField HeaderText="Select Worker">
                         <ItemTemplate>
                             <asp:Button ID="btnSelect" runat="server" OnClick="btnSelect_Click1" Text="Select" />
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:BoundField DataField="WorkerID" HeaderText="Worker ID" />
                     <asp:BoundField DataField="WorkerFirstName" HeaderText="First Name" />
                     <asp:BoundField DataField="WorkerLastName" HeaderText="Last Name" />
                     <asp:BoundField DataField="WorkerTUID" HeaderText="TU ID" />
                     <asp:BoundField DataField="WorkerEmail" HeaderText="Email" />
                 </Columns>
             </asp:GridView>
        </div>
    
    <p>
    <asp:Label ID="lblFname" runat="server" Text="First Name" Visible="False"></asp:Label>
    </p>
    <asp:TextBox ID="txtFname" runat="server" Visible="False"></asp:TextBox>
    <p>
    <asp:Label ID="lblLname" runat="server" Text="Last Name" Visible="False"></asp:Label>
        </p>
        <p>
    <asp:TextBox ID="txtLname" runat="server" Visible="False"></asp:TextBox>
            </p>
             <p>
    <asp:Label ID="lbltuID" runat="server" Text="TUID" Visible="False"></asp:Label>
                        </p>
                        <p>
    <asp:TextBox ID="txttuID" runat="server" Visible="False"></asp:TextBox>
                            </p>
            <p>
    <asp:Label ID="lblEmail" runat="server" Text="Email" Visible="False"></asp:Label>
                </p>
                <p>
    <asp:TextBox ID="txtEmail" runat="server" Visible="False"></asp:TextBox>
                    </p>
                <p>
                    <asp:Label ID="lblPhone" runat="server" Text="Phone Number" Visible="False"></asp:Label>
                    </p>
                <p>
                    <asp:TextBox ID="txtPhone" runat="server" Visible="False"></asp:TextBox>
                    </p>
                <p>
                    <asp:CheckBox ID="chkIsAdmin" runat="server" Text="Is Admin?" Visible="False" />
                </p>
    <p>
    <asp:Label ID="lblDepartment" runat="server" Text="Department" Visible="false"></asp:Label>
        </p>
                <p>
    <asp:DropDownList ID="ddlDepartment" runat="server" Visible="false">
    </asp:DropDownList>
                    
                    </p>
    <asp:Button ID="btnSubmit" runat="server" Text="Submit Changes" Visible="false" OnClick="btnSubmit_Click" />

    </div>
        </div>
    </div>
</div>
      </form>

    </div>
    <!-- .container-fluid -->
  
    
  
    
  
    
  
</body>
</html>

