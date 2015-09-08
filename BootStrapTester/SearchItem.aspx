<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchItem.aspx.cs" Inherits="BootStrapTester.SearchItem" %>

<!DOCTYPE html>
<html lang="en">

<body>
<head>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Edit Item</title>
    <!--#include file="head.html"-->
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
    <h1>Edit Item <small>Search by Category or Serial Number</small></h1>
</div>

    <div class="container formcontainer">
             <%-- Search Category --%>
             <div class="form-group">
                <asp:Label id="lblSCategory" Text="Category" Font-Bold="true" runat="server"></asp:Label>
                <div class="input-group">
                    <asp:DropDownList ID="ddlSCategory" class="form-control" role="menu" runat="server">
                          <asp:ListItem Enabled="False">Category <span class="caret"></span></asp:ListItem>
                          <asp:ListItem Value="Camera">Camera</asp:ListItem>
                          <asp:ListItem Value="Paint">Paint</asp:ListItem>
                          <asp:ListItem Value="Fabric">Fabric</asp:ListItem>
                          <asp:ListItem Value="Metal">Metal</asp:ListItem>
                      </asp:DropDownList>
                </div>
             </div>

              <%-- Search Serial --%>
              <div class="form-group">
                <asp:Label id="lblSSerial" Text="Serial Number" Font-Bold="true" runat="server"></asp:Label>
                <div class="input-group">
                    <asp:TextBox class="form-control" ID="txtSSerial" Text="" runat="server"></asp:TextBox>
              </div>
              </div>

              <%-- Search name --%>
              <div class="form-group">
                <asp:Label id="lblName" Text="Item Name" Font-Bold="true" runat="server"></asp:Label>
                <div class="input-group">
                    <asp:TextBox class="form-control" ID="lblSName" Text="" runat="server"></asp:TextBox>
               </div>
              </div>
         
              <div class="clear"></div> 

              <div class="form-group">
                <div class="input-group">
                    <asp:Button id="btnSearch" Text="Submit" class="btn btn-colorbutton pull-right" runat="server" OnClick="btnSearch_Click"/>        
               </div>
              </div>

    <%-- Consumers to choose --%>
    <div class="form-group">
        <div class="input-group">
            <asp:GridView ID="gvSItems" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvSItems_SelectedIndexChanged">
                  <Columns>
                      <asp:TemplateField HeaderText="Select Item" ShowHeader="False">
                          <ItemTemplate>
                              <asp:Button ID="btnSelect" runat="server" CausesValidation="False" CommandName="Select" OnClick="btnSelect_Click" Text="Select" />
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:BoundField DataField="Category" HeaderText="Category" />
                      <asp:BoundField DataField="SNumber" HeaderText="Serial Number" />
                  </Columns>
              </asp:GridView>
            
        </div></div>

    <%-- Item Serial Number --%>
            <div class="form-group">
                <asp:Label id="lblSerial" Text="Serial Number" Font-Bold="True" runat="server" Visible="False"></asp:Label>
                <div class="input-group">
                    <asp:TextBox class="form-control" ID="txtSerial" Text="" runat="server" Visible="False"></asp:TextBox>
                </div>
            </div>

    <%-- Item Name --%>
            <div class="form-group">
                <asp:Label id="lblItemName" Text="Item Name" Font-Bold="True" runat="server" Visible="False"></asp:Label>
                <div class="input-group">
                    <asp:TextBox class="form-control" ID="txtItemName" Text="" runat="server" Visible="False"></asp:TextBox>
                </div>
            </div>

     <%-- Department --%>
        <div class="form-group">
            <asp:Label id="lblDepartment" Text="Department" Font-Bold="True" runat="server" Visible="False"></asp:Label>
            <asp:DropDownList ID="ddlItemDepartment" class="form-control" role="menu" runat="server" Visible="False">
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
            <asp:Label id="lblCategory" Text="Category" Font-Bold="True" runat="server" Visible="False"></asp:Label>
            <asp:DropDownList ID="ddlCategory" class="form-control" role="menu" runat="server" Visible="False">
                          <asp:ListItem Enabled="False">Department <span class="caret"></span></asp:ListItem>
                          <asp:ListItem Value="Camera">Camera</asp:ListItem>
                          <asp:ListItem Value="Paint">Paint</asp:ListItem>
                          <asp:ListItem Value="Fabric">Fabric</asp:ListItem>
                          <asp:ListItem Value="Metal">Metal</asp:ListItem>
                      </asp:DropDownList>
            
        </div>

        <%-- Fee Field --%>
                <div class="form-group">
                    <asp:Label id="lblFees" Text="Item Fees" Font-Bold="true" runat="server" Visible="False"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox class="form-control" ID="InputLateFee" Text="Late Fee" runat="server" Visible="False"></asp:TextBox>  
                        <asp:TextBox class="form-control inline-control" ID="InputReplaceFee" Text="Replace Fee" runat="server" Visible="False"></asp:TextBox>  
                        </div>
                </div>

        <%-- Comment Field --%>
                <div class="form-group">
                    <asp:Label id="lblComment" Text="Comments" Font-Bold="true" runat="server" Visible="False"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox class="form-control" TextMode="Multiline" ID="txtComment" Text="" runat="server" Visible="False"></asp:TextBox>  
                    </div>

                </div>

        <div class="form-group">
            <asp:Button ID="btnComplete" runat="server" class="btn btn-colorbutton pull-right" Text="Complete" Visible="False" OnClick="btnComplete_Click" />
        </div>

</div>
</div>
    </form>
    </div>
      
      
      
      
      
</body>
</html>
