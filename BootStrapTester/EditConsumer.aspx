<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditStudent.aspx.cs" Inherits="BootStrapTester.EditStudent" %>

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
        <form role="form" runat="server">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <!--#include file="sidebar.html"-->
        </div>
        <!-- /#sidebar-wrapper -->


        <br /> 

<div class="container">

<div class="page-header">
    <h1>Edit Consumer Information <small> Select category to search</small></h1>
</div>

<div class="container">
    <div class="row">
            <div class="col-lg-6">

                <%-- Name Labels Field --%>
                <div class="form-group">                    
                    <div class="input-group">
                            <!-- First Name -->
                        <asp:Label id="lblSearchFName" Text="First Name *" Font-Bold="true" runat="server"></asp:Label>
                            <!-- Last Name -->
                        <asp:Label id="lblSearchLName" Text="Last Name *" Font-Bold="true" runat="server"></asp:Label>
                        <br />
                    </div>
                </div>

                <%-- Name  Field --%>
                <div class="form-group">                    
                    <div class="input-group">
                            <!-- First Name -->
                        <asp:TextBox class="form-control" ID="txtSearchFName" Placeholder="First Name" runat="server"></asp:TextBox>
                            <!-- Last Name -->
                        <asp:TextBox class="form-control inline-control" ID="txtSearchLName" Placeholder="Last Name" runat="server"></asp:TextBox>
                        <br />
                    </div>
                </div>

                <%-- TuID Field --%>
                <div class="form-group">
                    <asp:Label id="lblSearchTUID" Text="TUID *" Font-Bold="true" runat="server"></asp:Label>
                    <div class="input-group">
                        <asp:TextBox class="form-control" ID="txtSearchTUID" Placeholder="TUID" runat="server"></asp:TextBox>
                        <br />
                    </div>
                </div>

          <br />

          <div class="input-group-btn">
            <asp:Button id="btnFindStudent" Text="Search" class="btn btn-colorbutton pull-right" runat="server" OnClick="btnFindStudent_Click"/>
          </div>

                <asp:GridView ID="gvConsumers" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField HeaderText="Select">
                <ItemTemplate>
                    <asp:Button ID="btnSelect" runat="server" OnClick="btnSelect_Click"  Text="Select" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ConsumerID" HeaderText="ID" />
            <asp:BoundField DataField="ConsumerFirstName" HeaderText="First Name" />
            <asp:BoundField DataField="ConsumerLastName" HeaderText="Last Name" />
            <asp:BoundField DataField="ConsumerTUID" HeaderText="TUID" />
            <asp:BoundField DataField="ConsumerEmail" HeaderText="Email" />
        </Columns>
    </asp:GridView>
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
    <asp:Label ID="lblEmail" runat="server" Text="Email" Visible="False"></asp:Label>
                </p>
                <p>
    <asp:TextBox ID="txtEmail" runat="server" Visible="False"></asp:TextBox>
                    </p>
                    <p>
    <asp:Label ID="lbltuID" runat="server" Text="TUID" Visible="False"></asp:Label>
                        </p>
                        <p>
    <asp:TextBox ID="txttuID" runat="server" Visible="False"></asp:TextBox>
                            </p>
  
    <p>
        <asp:Button ID="btnComplete" class="btn btn-colorbutton pull-right" runat="server" OnClick="btnComplete_Click" Text="Save Changes" Visible="False" />
    </p>
  
        
    </div>
        </div>
    </div>
</div>
      </form>

    </div>
    <!-- .container-fluid -->
  
    
</body>
</html>
