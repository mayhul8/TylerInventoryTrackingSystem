<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemHistory.aspx.cs" Inherits="BootStrapTester.ItemHistory" %>

<!DOCTYPE html>
<html lang="en">

    <head>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Item History</title>
    <!--#include file="head.html"-->
</head>

<body>


      <form id="form1" runat="server">


      <div id="wrapper">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <!--#include file="sidebar.html"-->
        </div>
        <!-- /#sidebar-wrapper -->
<div class="container">

<div id="lblTitle" class="page-header" runat="server">
    <h1>Item History<small> Begin by searching for item</small></h1>
</div>
    <div class="container">
        <div class="row">
            <div class="col-lg-6">


        
    <div id="divSearchItem" runat="server">
        <%-- Item Serial Number --%>
            <div class="form-group">
                <asp:Label id="lblSerial" Text="Serial Number" Font-Bold="True" runat="server"></asp:Label>
                <div class="input-group">
                    <asp:TextBox class="form-control" ID="txtSerial" Text="Serial Number" runat="server"></asp:TextBox>
                    <br />
                </div>
            </div>

    <%-- Item Name --%>
            <div class="form-group">
                <asp:Label id="lblItemName" Text="Item Name" Font-Bold="True" runat="server"></asp:Label>
                <div class="input-group">
                    <asp:TextBox class="form-control" ID="txtItemName" Text="Item Name" runat="server"></asp:TextBox>
                    <br />
                </div>
            </div>

     <%-- Department --%>
        <div class="form-group">
            <asp:Label id="lblDepartment" Text="Department" Font-Bold="True" runat="server"></asp:Label>
            <asp:DropDownList ID="ddlItemDepartment" class="form-control" role="menu" runat="server">
                          <asp:ListItem Enabled="False">Department <span class="caret"></span></asp:ListItem>
                          <asp:ListItem Value="Metals">Metals</asp:ListItem>
                          <asp:ListItem Value="Photography">Photography</asp:ListItem>
                          <asp:ListItem Value="Architecture">Architecture</asp:ListItem>
                          <asp:ListItem Value="Sculptures">Sculptures</asp:ListItem>
                          <asp:ListItem Value="ComputerServices">Computer Services</asp:ListItem>
                      </asp:DropDownList>
            
        </div>

     <%-- Category Field --%>
        <div class="form-group">
            <asp:Label id="lblCategory" Text="Category" Font-Bold="True" runat="server"></asp:Label>
            <asp:DropDownList ID="ddlCategory" class="form-control" role="menu" runat="server">
                          <asp:ListItem Enabled="False">Department <span class="caret"></span></asp:ListItem>
                          <asp:ListItem Value="Camera">Camera</asp:ListItem>
                          <asp:ListItem Value="Paint">Paint</asp:ListItem>
                          <asp:ListItem Value="Fabric">Fabric</asp:ListItem>
                          <asp:ListItem Value="Metal">Metal</asp:ListItem>
                      </asp:DropDownList>
            
        </div>

        <div class="form-group">
            <asp:Button ID="btnItemSearch" runat="server" Text="Search" OnClick="btnItemSearch_Click" />
        </div>
   </div>

    <div id="divItemsList" runat="server">
    <div class="form-group">
          <asp:GridView ID="gvItems" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvItems_SelectedIndexChanged">
              <Columns>
                  <asp:CommandField ButtonType="Button" HeaderText="Select Item" ShowCancelButton="False" ShowSelectButton="True" />
                  <asp:BoundField DataField="SearchSerialNumber" HeaderText="Serial Number" />
                  <asp:BoundField DataField="SearchItemName" HeaderText="Item Name" />
                  <asp:BoundField DataField="SearchDepartment" HeaderText="Department" />
                  <asp:BoundField DataField="SearchCategory" HeaderText="Category" />
              </Columns>
          </asp:GridView>
          <asp:Label ID="lblSelectedItem" runat="server" Font-Size="24pt"></asp:Label>
        <br /><br />
      </div>
      <asp:Button ID="btnCheckout" runat="server" type="submit" style="z-index: 1; left: 873px; top: 275px; position: absolute" Text="Check Out" Visible="False" />
      </div>

        <asp:GridView ID="gvHistory" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="TUIDSet" HeaderText="TUID" />
            <asp:BoundField DataField="WorkerSet" HeaderText="Borrowed From" />
            <asp:BoundField DataField="StartDateSet" HeaderText="From" />
            <asp:BoundField DataField="EndDateSet" HeaderText="To" />
            <asp:BoundField DataField="NotesSet" HeaderText="Notes" />
        </Columns>
    </asp:GridView>
                <br />
    <asp:Button ID="btnAgain" class="btn btn-colorbutton pull-right" runat="server" OnClick="btnAgain_Click" Text="Search Again" Visible="False" />
      

        </div>
                   

      </div></div>
        </div>
    </div>
      
          </form>
      
</body>
</html>