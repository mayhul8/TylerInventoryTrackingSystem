<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Returns.aspx.cs" Inherits="BootStrapTester.Returns" %>

<!DOCTYPE html>
<html lang="en">

    <head>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Returns</title>
    <!--#include file="head.html"-->

    <script type="text/javascript" lang="javascript">
        function ReturnItem() {
            alert("Item Successfully Returned!");
        }
    </script>

</head>

<body>


      <div id="wrapper">
        <form id="Form1" role="form" runat="server">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <!--#include file="sidebar.html"-->
        </div>
        <!-- /#sidebar-wrapper -->
<div class="container">

<div class="page-header">
    <h1>Return Items <small> Begin by searching for consumer</small></h1>
</div>
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="well well-sm"><strong><span class="glyphicon glyphicon-asterisk"></span>Required Field</strong></div>

        <%-- Search Name --%>
            <div class="form-group">
                <asp:Label id="lblName" Text="Last Name" Font-Bold="true" runat="server"></asp:Label>
                <div class="input-group">
                    <asp:TextBox class="form-control" ID="txtLName" Text="Enter Last Name" runat="server"></asp:TextBox>
                    <br />
                </div>
            </div>
    <br />
                <%-- Search TUID --%>
            <div class="form-group">
                <asp:Label id="lblTUID" Text="TUID" Font-Bold="true" runat="server"></asp:Label>
                <div class="input-group">
                    <asp:TextBox class="form-control" ID="txtTUID" Text="Enter TUID" runat="server"></asp:TextBox>
                    <br />
                </div>

            </div>
            <br />
            <div class="form-group">
                <div class="input-group">
                    <asp:Button id="btnSearch" Text="Submit" class="btn btn-colorbutton pull-right" runat="server" OnClick="btnSearch_Click"/>
            </div></div>

    <%-- Consumers to choose --%>
    <div class="form-group">
        <div class="input-group">
            <asp:GridView ID="gvConsumers" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvConsumers_SelectedIndexChanged">
                  <Columns>
                      <asp:CommandField ButtonType="Button" HeaderText="Select Consumer" ShowCancelButton="False" ShowSelectButton="True" />
                      <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                      <asp:BoundField DataField="TUID" HeaderText="TUID" />
                  </Columns>
              </asp:GridView>
        </div></div>

    <%-- Item Serial Number --%>
            <div class="form-group">
                <div class="input-group">
                    <br />
                </div>
            </div>

    <%-- Item Name --%>     <%-- Department --%>     <%-- Category Field --%>
        <div class="form-group">
            <asp:Label id="lblNameTitle" Font-Bold="True" runat="server" Visible="False"></asp:Label>
            
        </div>

    <div class="form-group">
          <asp:GridView ID="gvItems" runat="server" AutoGenerateColumns="False" >
              <Columns>
                  <asp:TemplateField HeaderText="Return Item">
                      <ItemTemplate>
                          <asp:CheckBox ID="chkReturn" runat="server" />
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:BoundField DataField="SearchSerialNumber" HeaderText="Serial Number" />
                  <asp:BoundField DataField="SearchItemName" HeaderText="Item Name" />
                  <asp:BoundField DataField="SearchDepartment" HeaderText="Department" />
                  <asp:BoundField DataField="SearchCategory" HeaderText="Category" />
                  <asp:TemplateField HeaderText="Comments">
                      <ItemTemplate>
                          <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine"></asp:TextBox>
                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>
          </asp:GridView>
      </div>

      <div class="form-group">
        <asp:Button ID="btnReturn" runat="server" class="btn btn-colorbutton pull-right" Text="Return" OnClientClick="ReturnItem()" Visible="False" OnClick="btnReturn_Click"/>
      </div>

      </div></div>
        </div>
</div>
    </form>
    </div>
      
      
</body>
</html>
