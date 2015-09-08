<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation = "false" CodeBehind="Transaction.aspx.cs" Inherits="BootStrapTester.Purchase" %>

<!DOCTYPE html>
<html lang="en">

    <head>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Transactions</title>
    <!--#include file="head.html"-->
        <script>
            function showItemNoSearch() {
                closeAll();
                $("#itemnosearch").css("display", "block");
                $("#hdnSearchItem").val("number");
            }
            function showItemDetailsSearch() {
                closeAll();
                $("#itemdetailssearch").css("display", "block");
                $("#hdnSearchItem").val("details");
            }
            function closeAll() {
                $('#tuidContainer').css("display", "none");
                $('#nameContainer').css("display", "none");
                $('#itemnosearch').css("display", "none");
                $('#itemdetailssearch').css("display", "none");
            }
        </script>
</head>

<body>


      <div id="wrapper">
        <form role="form" runat="server" action="">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <!--#include file="sidebar.html"-->
        </div>
        <!-- /#sidebar-wrapper -->
<div class="container">

<div id="divBorrowHeader" class="page-header" runat="server">
    <h1><asp:Label ID="lblPurchaseBorrow" runat="server">Borrow</asp:Label> Items<small><asp:Label ID="lblChangingHeader" runat="server"> Begin by searching for consumer </asp:Label></small></h1>
</div>

    <div class="container">


                <div id="divSearchConsumer" runat="server">
        <%-- Search Name --%>
            <h3>Find Student</h3>
                <div id="findStudent" class="input-group">
                    <div id="tuidContainer" class="consumerInputs" runat="server">
                    <asp:TextBox class="form-control inline-control clear inputmargins" ID="txtTUID" placeholder="TUID" runat="server"></asp:TextBox>
                    </div>
                    <hr class="verticleLine"/>
                    <div id="nameContainer" class="consumerInputs" runat="server">
                    <asp:TextBox class="form-control inline-control clear inputmargins" ID="txtLastName" placeholder="Last Name" runat="server"></asp:TextBox>
                     <asp:TextBox class="form-control inline-control clear inputmargins" ID="txtFirstName" placeholder="First Name" runat="server"></asp:TextBox>
                    </div>
                </div>
                        <br />
            <div id="divTransButtons">
                    <asp:HiddenField ID="hdnSearch" Value="" runat="server"/>
                    <asp:Button id="btnSearch" Text="Search" class="btn btn-colorbutton pull-left inputmargins" runat="server" OnClick="btnSearch_Click"/>
                    <br />
                    <a href="AddConsumer.aspx" id="btnAddStudent" class="btn btn-colorbutton pull-left inputmargins" style="position:relative;">Add New Consumer</a>
            </div>
            <div class="clear"></div>
                    <br />
            </div>

               


                <div id="divConsumerList" runat="server">
    <%-- Consumers to choose --%>
    <div class="form-group">
        <div class="input-group">
            <asp:GridView ID="gvConsumers" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvConsumers_SelectedIndexChanged">
                  <Columns>
                      <asp:CommandField ButtonType="Button" HeaderText="Select Consumer" ShowCancelButton="False" ShowSelectButton="True" />
                      <asp:BoundField DataField="ConsumerTUID" HeaderText="TUID" />
                      <asp:BoundField DataField="ConsumerLastName" HeaderText="Last Name" />
                      <asp:BoundField DataField="ConsumerFirstName" HeaderText="First Name" />
                      <asp:BoundField DataField="isRestricted" HeaderText="Is Restricted?" />
                  </Columns>
              </asp:GridView>
        </div></div>
                    </div>


    <div id="divSearchItem" runat="server">
    <%-- Item Number --%>

         <a href="javascript:showItemNoSearch();" id="btnItemNoSeach" class="btn btn-colorbutton pull-left inputmargins" style="position:relative;">Search by Item #</a>
         <a href="javascript:showItemDetailsSearch();" id="btnItemDetailsSearch" class="btn btn-colorbutton pull-left inputmargins" style="position:relative;">Search by Item Details</a>
                    
        <br />

        <div id="itemnosearch" runat="server" class="itemInputs">
            <div class="form-group">
                <asp:Label id="lblItemNo" Text="Item Number" Font-Bold="True" runat="server"></asp:Label>
                <div class="input-group">
                    <asp:TextBox class="form-control" ID="txtItemNo" placeholder="Item Number" runat="server"></asp:TextBox>
                    <br />
                </div>
            </div>
        </div>

        <div id="itemdetailssearch" runat="server" class="itemInputs">
    <%-- Item Name --%>
            <div class="form-group">
                <asp:Label id="lblItemName" Text="Item Name" Font-Bold="True" runat="server"></asp:Label>
                <div class="input-group">
                    <asp:TextBox class="form-control" ID="txtItemName" placeholder="Item Name" runat="server"></asp:TextBox>
                    <br />
                </div>
            </div>

     <%-- Department --%>
        <div class="form-group">
            <asp:Label id="lblDepartment" placeholder="Department" Text="Department" Font-Bold="True" runat="server"></asp:Label>
            <asp:DropDownList ID="ddlItemDepartment" class="form-control" role="menu" runat="server">
                      </asp:DropDownList>
            
        </div>

     <%-- Category Field --%>
        <div class="form-group">
            <asp:Label id="lblCategory" placeholder="Category" Text="Category" Font-Bold="True" runat="server"></asp:Label>
            <asp:DropDownList ID="ddlCategory" class="form-control" role="menu" runat="server">
                      </asp:DropDownList>
            
        </div>
    </div>

        <div class="form-group">
            <asp:HiddenField ID="hdnSearchItem" Value="" runat="server"/>
            <asp:Button ID="btnItemSearch" runat="server" Text="Search" OnClick="btnItemSearch_Click" />
        </div>
   </div>

        <div id="divShoppingCart" runat="server">
              <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" ShowFooter="True" style="z-index: 1; left: 826px; top: 54px; position: absolute; height: 133px; width: 187px">
                <Columns>
                    <asp:BoundField DataField="ItemName" HeaderText="Checkout Cart" />
                </Columns>
              </asp:GridView>
        </div>

    <div id="divItemsList" runat="server">
    <div class="form-group">
          <asp:GridView ID="gvItems" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvItems_SelectedIndexChanged">
              <Columns>
                  <asp:CommandField ButtonType="Button" HeaderText="Select Item" ShowCancelButton="False" ShowSelectButton="True" />
                  <asp:BoundField DataField="ItemNumber" HeaderText="Serial Number" />
                  <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                  <asp:BoundField DataField="DepartmentID" HeaderText="Department" />
                  <asp:BoundField DataField="CategoryID" HeaderText="Category" />
              </Columns>
          </asp:GridView>
      </div>
      <asp:Button ID="btnCheckout" OnClick="btnCheckOut_Click" runat="server" type="submit" style="z-index: 1; left: 873px; top: 275px; position: absolute" Text="Check Out" Visible="False" />
      </div>


    <div id="divReviewCart" runat="server">
    <div class="form-group">
    <asp:GridView ID="gvReviewCart" runat="server" AutoGenerateColumns="False">
          <Columns>
              <asp:CommandField ButtonType="Button" HeaderText="Delete Item" SelectText="Delete" ShowCancelButton="False" ShowSelectButton="True" />
              <asp:CommandField ButtonType="Button" HeaderText="Edit Item" SelectText="Edit" ShowCancelButton="False" ShowSelectButton="True" />
              <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
              <asp:BoundField DataField="DueDate" HeaderText="Due Date" />
              <asp:BoundField DataField="ItemPrice" HeaderText="Item Price" />
              <asp:BoundField DataField="LateFee" HeaderText="Late Fee" />
              <asp:TemplateField HeaderText="Accessories">
                  <ItemTemplate>
                      <asp:TextBox ID="txtAccessories" runat="server"></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Comments">
                  <ItemTemplate>
                      <asp:TextBox ID="txtItemComments" runat="server"></asp:TextBox>
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
      </asp:GridView>
        </div>

        <div class="form-group">  
        <asp:Label ID="lblOrderComments" runat="server" Text="Comments?"></asp:Label>
        <br />
        <asp:TextBox ID="txtOrderComments" runat="server" TextMode="MultiLine"></asp:TextBox>
        <br /><br />
              <asp:Button ID="btnCheckOutFinal" runat="server" Text="Check Out" OnClick="btnCheckOutFinal_Click" />      

        </div>
        </div>
        </div>
                   

        </div>
    </form>
    </div>
      
      
      
      
      
</body>
</html>
