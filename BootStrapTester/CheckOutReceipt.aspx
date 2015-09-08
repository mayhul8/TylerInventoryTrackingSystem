<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckOutReceipt.aspx.cs" Inherits="BootStrapTester.CheckOutReceipt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<body>
<head>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Add Consumer</title>
    <!--#include file="head.html"-->
</head>


    <div id="wrapper">
        <form id="Form1" role="form" runat="server">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <!--#include file="sidebar.html"-->
        </div>
        <!-- /#sidebar-wrapper -->

<div class="container printContain">

<div class="page-header">
</div>

<!-- Registration form - START -->
<div class="container">
    <img src="http://upload.wikimedia.org/wikipedia/commons/7/71/TUOwls_logo.png" alt="" height="50" width="50">
    <div class="row">
            <div class="col-lg-6">
        <asp:Label ID="lblTitle" runat="server" Font-Size="32pt" style="z-index: 1; left: 226px; top: 36px; position: absolute" Text="Tyler School of Art"></asp:Label>
        <asp:GridView ID="gvFinal" runat="server" style="z-index: 1; left: 69px; top: 135px; position: absolute; height: 133px; width: 634px" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="SearchItemName" HeaderText="Item Name" />
                <asp:BoundField DataField="SearchItemPrice" HeaderText="Item Price" />
                <asp:BoundField DataField="SearchLateFee" HeaderText="Late Fee" />
                <asp:BoundField DataField="SearchDueDate" HeaderText="Due Date" />
                <asp:BoundField DataField="ItemAccessories" HeaderText="Accessories" />
                <asp:BoundField DataField="ItemComments" HeaderText="Comments" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblComments" runat="server" style="z-index: 1; left: 34px; top: 327px; position: absolute" Text="This is where the comments for the order as a whole will be kept. <br/> They can be as long as needed to ensure everything asked of the consumer is in pain sight"></asp:Label>
        <asp:Label ID="lblSignature" runat="server" style="z-index: 1; left: 55px; top: 447px; position: absolute" Text="Signature"></asp:Label>
        <asp:Label ID="lblSigLine" runat="server" style="z-index: 1; left: 37px; top: 525px; position: absolute" Text="______________________________________"></asp:Label>
        <asp:Button ID="btnPrint" runat="server" OnClientClick="javascript:window.print();" style="z-index: 1; left: 390px; top: 541px; position: absolute" Text="Print" />
        </div>
        </div>
        </div>
    </div>
                </form>
        </div>
</body>
</html>
