<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewItem.aspx.cs" Inherits="BootStrapTester.AddNewItem" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Add Item</title>
    <!--#include file="head.html"-->
</head>

<body>

    <div id="wrapper">
        <form role="form" runat="server">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <!--#include file="sidebar.html"-->
        </div>
        <!-- /#sidebar-wrapper -->

<div class="container">

<div class="page-header">
    <h1>New Item <small>Add Item Information Below</small></h1>
</div>

<!-- Registration form - START -->
<div class="container formcontainer">
                <div class="well well-sm"><strong><span class="glyphicon glyphicon-asterisk"></span>Required Field</strong></div>

                <%-- Name Field --%>
                <div class="form-group full">
                    <asp:Label id="lblName" Text="Item Name *" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox class="form-control" ID="txtName" placeholder="Name" runat="server"></asp:TextBox>    
                    </div>
                </div>

                <%-- Department Field --%>
        <div class="form-group">
            <asp:Label id="lblDepartment" Text="Department *" AutoPostBack="True" Font-Bold="true" runat="server"></asp:Label>
            <asp:DropDownList ID="ddlItemDepartment" class="form-control" AutoPostBack="true" role="menu" runat="server" OnSelectedIndexChanged="ddlItemDepartment_SelectedIndexChanged">
                      </asp:DropDownList>
            
        </div>
                <div class="form-group right">
                    <div class="control-labels">
                <asp:Label id="lblCategory" Text="Category *" Font-Bold="true" runat="server"></asp:Label>
                      <asp:DropDownList ID="ddlItemCategory" class="form-control" role="menu" runat="server">
                      </asp:DropDownList>
                
                    </div>
                    </div>

                <%-- item number Field --%>
                <div class="form-group left">
                   <asp:Label id="lblItemNumber" Text="Item Number *" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox class="form-control inline-control" ID="txtItemNumber" placeholder="Serial Number" runat="server"></asp:TextBox>  
                        </div>
                </div>


                    <%-- Serial Field --%>
               <div class="form-group">
                    <asp:Label id="lblSerialNumber" class="inline-label" Text="Serial Number" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox class="form-control inline-control" ID="txtSerialNumber" placeholder="Serial Number" runat="server"></asp:TextBox>  
                        </div>
                </div>


                        <%-- Room Field --%>
               <div class="form-group">
                    <asp:Label id="lblRoom" class="inline-label" Text="Room Number" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox class="form-control inline-control" ID="txtRoom" placeholder="Room Number" runat="server"></asp:TextBox>  
                        </div>
                </div>

                <%-- Building Field --%>
                <div class="form-group">
                    <asp:Label id="lblBuilding" Text="Building" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox class="form-control" ID="txtBuilding" placeholder="Building Name" runat="server" TextMode="Number"></asp:TextBox>  
                        </div>
                </div>

                    <%-- Fee Field --%>
                <div class="form-group">
                    <asp:Label id="lblFees" Text="Late Fee *" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox class="form-control" ID="txtInputLateFee" placeholder="Late Fee" runat="server" TextMode="Number"></asp:TextBox>  
                        </div>
                </div>

                    <%-- replace Fee Field --%>
                <div class="form-group">
                    <asp:Label id="lblReplaceFee" class="inline-label" Text="Replacement Fee *" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox class="form-control inline-control" ID="txtInputReplaceFee" placeholder="Replace Fee" runat="server" TextMode="Number"></asp:TextBox>  
                        </div>
                </div>

                <%-- Comment Field --%>
                <div class="form-group full">
                    <asp:Label id="lblComment" Text="Comments" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox class="form-control" TextMode="Multiline" ID="txtComment" Text="" runat="server"></asp:TextBox>  
                    </div>
                    <br />
                    <asp:Button id="btnAddNewItem" Text="Submit" class="btn btn-colorbutton pull-right" runat="server" OnClick="btnAddNewItem_Click"/>

                </div>
                <br /> 
        
                
        
              </div>
    </div>
        </form>
    </div>
<!-- Registration form - END -->


</body>
</html>