<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="BootStrapTester.HomePage" %>

<!DOCTYPE html>
    <head>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Tyler SOARS</title>
    <!--#include file="head.html"-->
</head>
<script>
    $(function () {
        $(".dial").knob();
    });
    </script>
</script>
<body>

    <form runat="server" action="Transaction.aspx">
    <div id="wrapper">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <!--#include file="sidebar.html"-->
        </div>
        <!-- /#sidebar-wrapper -->

<div class="container">

<div class="page-header">
    <h1>Welcome <small>to the Tyler School of Art Inventory System</small></h1>
</div>
                <!-- borrow purchase buttons -->
                <div style="display:none;">
                    <h3>Find Consumer</h3>
                <div id="findConsumer" class="input-group">
                    <asp:TextBox class="form-control" ID="txtTUID" Text="TUID" runat="server" style="float:left;margin-left:50px;"></asp:TextBox>
                    <asp:TextBox class="form-control inline-control" ID="txtLastName" Text="Last Name" runat="server"></asp:TextBox>
                </div>
                <div id="divTransButtons">
                    <asp:Button id="btnBorrow" Text="Borrow" value="borrow" class="btn btn-colorbutton transButton" runat="server"/>
                    <asp:Button id="btnPurchase" Text="Purchase" value="purchase" class="btn btn-colorbutton transButton" runat="server"/>
                </div>
                </div>

     <!-- due backs today -->
    <div class="dueTodayContainer">
    <h3>Due Back Today</h3>
    <div class="dialContainer">
        <input type="text" runat="server" class="dial" value="10" id="dialDueBacks" data-min="0" data-max="50" data-readOnly="true" data-fgColor="#8e2323" data-cgColor="black" data-bgColor="white" data-tickColor="black" data-thickness=".25" data-width="120">
    </div>
    <div class="tableContainer">
             <asp:GridView ID="gvDueBacks" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvDueBacks_SelectedIndexChanged">
                <Columns>
            <asp:TemplateField HeaderText="Return Item">
                    <ItemTemplate>
                         <asp:HyperLink ID="aReturn" runat="server" Text="Return" class="btn-danger linkButton" NavigateUrl='<%# Eval("ConsumerItemID", "Returns.aspx?return={0}") %>' />
                    </ItemTemplate>
            </asp:TemplateField>
                    <asp:BoundField DataField="ConsumerTUID" HeaderText="TUID" />
                    <asp:BoundField DataField="ItemNumber" HeaderText="Item #" />
                    <asp:BoundField DataField="ItemCheckOutDate" HeaderText="C/O Date" />
                    <asp:BoundField DataField="ItemReturnDate" HeaderText="Due Date" />
                    <asp:BoundField DataField="isReturned" HeaderText="Returned?" />
                    <asp:BoundField DataField="isDamaged" HeaderText="Damaged?" />
                  </Columns>
            </asp:GridView>
        </div>
       </div>
        <hr />
                     <!-- past due-->
    <div class="pastDueContainer">
    <h3>Past Due</h3>
    <div class="dialContainer">
        <input type="text" class="dial" runat="server" value="5" id="dialPastDue" data-min="0" data-max="50" data-readOnly="true" data-fgColor="#8e2323" data-cgColor="black" data-bgColor="white" data-tickColor="black" data-thickness=".25" data-width="120">
    </div>
    <div class="tableContainer">
             <asp:GridView ID="gvPastDue" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvDueBacks_SelectedIndexChanged">
                <Columns>
            <asp:TemplateField HeaderText="Return Item">
                    <ItemTemplate>
                         <asp:HyperLink ID="aReturn" runat="server" Text="Return" class="btn-danger linkButton" NavigateUrl='<%# Eval("ConsumerItemID", "Returns.aspx?return={0}") %>' />
                    </ItemTemplate>
            </asp:TemplateField>
                    <asp:BoundField DataField="ConsumerTUID" HeaderText="TUID" />
                    <asp:BoundField DataField="ItemNumber" HeaderText="Item #" />
                    <asp:BoundField DataField="ItemCheckOutDate" HeaderText="C/O Date" />
                    <asp:BoundField DataField="ItemReturnDate" HeaderText="Due Date" />
                    <asp:BoundField DataField="isReturned" HeaderText="Returned?" />
                    <asp:BoundField DataField="isDamaged" HeaderText="Damaged?" />
                  </Columns>
            </asp:GridView>
        </div>
       </div>



        </div>
            <!--#include file="footer.html"-->
    </div>
        </form>
    
</body>
</html>