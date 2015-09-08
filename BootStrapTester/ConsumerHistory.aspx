<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsumerHistory.aspx.cs" Inherits="BootStrapTester.ConsumerHistory" %>

<!DOCTYPE html>
<html lang="en">

    <head>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Consumer History</title>
    <!--#include file="head.html"-->
         <script>
                    function showTUID() {
                        closeAll();
                        $('#tuidContainer').css("display", "block");
                        $("#hdnSearch").val("tuid");
                    }
                    function showLastName() {
                        closeAll();
                        $('#nameContainer').css("display", "block");
                        $("#hdnSearch").val("name");
                    }
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


      <form id="form1" runat="server">


      <div id="wrapper">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <!--#include file="sidebar.html"-->
        </div>
        <!-- /#sidebar-wrapper -->
<div class="container">

<div id="lblTitle" class="page-header" runat="server">
    <h1>Consumer History<small> Begin by searching for consumer</small></h1>
</div>
    <div class="container">
        <div class="row">
            <div class="col-lg-6">


        
<div id="divSearchConsumer" runat="server">
        <%-- Search Name --%>
            <h3>Find Student</h3>
                <div id="findStudent" class="input-group">
                    <a href="javascript:showTUID();" id="btnShowTUID" class="btn btn-colorbutton pull-left inputmargins" style="position:relative;">Search by TUID</a>
                    <a href="javascript:showLastName();" id="btnShowLastName" class="btn btn-colorbutton pull-left inputmargins" style="position:relative;">Search by Name</a>
                    <div id="tuidContainer" class="consumerInputs" runat="server">
                    <asp:TextBox class="form-control inline-control clear inputmargins" ID="txtTUID" placeholder="TUID" runat="server"></asp:TextBox>
                    </div>
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
            <asp:GridView ID="gvConsumer" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvConsumers_SelectedIndexChanged">
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


        <asp:GridView ID="gvHistory" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="ItemNumber" HeaderText="Item Number" />
            <asp:BoundField DataField="UserID" HeaderText="Item" />
            <asp:BoundField DataField="ItemCheckOutDate" HeaderText="Loan Date" />
            <asp:BoundField DataField="ItemReturnDate" HeaderText="Return Date" />
            <asp:BoundField DataField="isReturned" HeaderText="Return Date" />
            <asp:BoundField DataField="isDamaged" HeaderText="Return Date" />
            <asp:BoundField DataField="DamageNotes" HeaderText="Notes" />
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
