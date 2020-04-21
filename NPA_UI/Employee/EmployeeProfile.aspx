<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmployeeProfile.aspx.cs"
    Inherits="Employee_EmployeeProfile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="Menu" TagName="menu" Src="~/Employee/EmployeeMenu.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="~/Header_New.ascx" %>
<%@ Register TagPrefix="Footer" TagName="footer" Src="~/Footer.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SVPNPA</title>
    <link rel="icon" href="../Assests/images/sv.png" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../Assests/Css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/themify-icons/css/themify-icons.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/flag-icon-css/css/flag-icon.min.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/Css/cs-skin-elastic.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/Css/style.css" rel="stylesheet" type="text/css" />
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet'
        type='text/css' />
    <style type="text/css">
        .gvcss td
        {
            padding: 5px;
        }
        
        .OrderHistory_RowSeparator
        {
            margin: 0px 0px 25px 0px;
            padding-left: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <Menu:menu ID="menu" runat="server" />
    <div id="right-panel" class="right-panel">
        <Header_New:header ID="Header1" runat="server" />
        <div class="breadcrumbs">
            <div class="col-sm-6">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1 style="float: left">
                            <font color="#fff">Logged In As:<asp:Label ID="lblUser" runat="server"></asp:Label></font></h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="page-header float-right">
                    <div class="page-title">
                        <h1 style="float: right">
                            <font color="#fff">Date:<asp:Label ID="lblDate" runat="server"></asp:Label></font></h1>
                    </div>
                </div>
            </div>
        </div>
        <div class="content mt-3">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row form-group">
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header">
                                        <strong>Employee Profile</strong>
                                    </div>
                                    <div class="card-body card-block">
                                        <div class="row form-group">
                                            <div class="col col-md-12  text-left">
                                                <h4>
                                                    <label class=" form-control-label">
                                                        Employee Name:</label>
                                                    <asp:Label ID="lblEname" runat="server"></asp:Label></h4>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-12 text-left">
                                                <h4>
                                                    <label class="form-control-label text-center">
                                                        Designation:</label>
                                                    <asp:Label ID="lblDesg" runat="server"></asp:Label></h4>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-12  text-left">
                                                <h4>
                                                    <label class=" form-control-label">
                                                        Section:</label>
                                                    <asp:Label ID="lblSect" runat="server"></asp:Label></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header">
                                        <strong>Contact Details</strong>
                                    </div>
                                    <div class="card-body card-block">
                                        <div class="row form-group">
                                            <div class="col col-md-12 text-left">
                                                <h4>
                                                    <label class="form-control-label text-center">
                                                        Mobile No.:</label>
                                                    <%-- </div><div class=" col-md-4">--%>
                                                    <asp:Label ID="lblMob" runat="server"></asp:Label></h4>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-12 text-left">
                                                <h4>
                                                    <label class=" form-control-label">
                                                        Mail ID:</label>
                                                    <asp:Label ID="lblMail" runat="server"></asp:Label></h4>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-12 text-left">
                                                <h4>
                                                    <label class=" form-control-label">
                                                        Address:</label>
                                                    <asp:Label ID="lblAddress" runat="server"></asp:Label></h4>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card" id="LeaveBalance" runat="server" visible="false">
                            <div class="card-header">
                                <strong>Leave Balance</strong>
                            </div>
                            <br />
                            <div class="row form-group">
                                <div class="col-md-12 text-center">
                                    <asp:GridView ID="GvLBalance" runat="server" CssClass="table table-striped table-bordered"
                                        GridLines="None" AutoGenerateColumns="False" ShowFooter="true">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                           <%-- <asp:TemplateField HeaderText="Employee">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLeaveCode" runat="server" Visible="false" Text='<%# Bind("EmpId") %>'>
                                                    </asp:Label>
                                                    <asp:Label ID="lblLeaveName" runat="server" Text='<%# Bind("EmpName") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Leave Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLeaveCode" runat="server" Visible="false" Text='<%# Bind("LeaveTypeId") %>'>
                                                    </asp:Label>
                                                    <asp:Label ID="lblLeaveName" runat="server" Text='<%# Bind("TypeName") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Leave Balance">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLeaveBalance" runat="server" Text='<%# Bind("LeaveBalance") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div class="card" id="ReportingOfficers" runat="server" visible="false">
                          <%--  <div class="card-header">
                               
                            </div>--%>
                            <br />
                            <div class="row form-group">
                                <div class="container">
                                    <div class="col-md-12 text-center" style="display: inline">
                                        <asp:DataList ID="gvReportingOfficers" runat="server" RepeatDirection="Vertical"
                                            RepeatLayout="Table" RepeatColumns="4" CssClass="" CellPadding="5" CellSpacing="5">
                                            <SeparatorTemplate>
                                                <h4 class="OrderHistory_RowSeparator">
                                                </h4>
                                            </SeparatorTemplate>
                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td style="padding:40px">
                                                            <table>
                                                            <tr>
                                                            <td><h4>Forwarding Officer</h4></td>
                                                            </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Image ID="ImgRB" runat="server" CommandName="GO" ImageUrl="~/Assests/images/user_icon.png"
                                                                            src='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("Phcontent"))  %>'
                                                                            Width="180px" Height="180px" Style="width: 150px; height: 100px; box-shadow: green 0px 0px 28px 1px;
                                                                            border-radius: 4%;" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="lblEmployeeName" runat="server" Text='<%# Bind("FO") %>'></asp:Label><br/>
                                                                      
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td></td>
                                                        <td style="padding:40px">
                                                            <table>
                                                              <tr>
                                                            <td><h4>Recommanding Officer</h4></td>
                                                            </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Image ID="Image1" runat="server" CommandName="GO" ImageUrl="~/Assests/images/user_icon.png"
                                                                            src='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("SanPhoto"))  %>'
                                                                            Width="180px" Height="180px" Style="width: 150px; height: 100px; box-shadow: green 0px 0px 28px 1px;
                                                                            border-radius: 4%;" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("RO") %>'></asp:Label><br />
                                                                      
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                         <td></td>
                                                        <td style="padding:40px">
                                                            <table>
                                                              <tr>
                                                            <td><h4>Sanction Officer</h4></td>
                                                            </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Image ID="Image2" runat="server" CommandName="GO" ImageUrl="~/Assests/images/user_icon.png"
                                                                            src='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("SanPhoto"))  %>'
                                                                            Width="180px" Height="180px" Style="width: 150px; height: 100px; box-shadow: green 0px 0px 28px 1px;
                                                                            border-radius: 4%;" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("SO") %>'></asp:Label><br />
                                                                      
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="hf" runat="server" />
            <!-- .animated -->
        </div>
        <!-- .content -->
    </div>
    <!-- /#right-panel -->
    <!-- Right Panel -->
    <script src="../Assests/Js/jquery.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/popper.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/main.js" type="text/javascript"></script>
    </form>
</body>
</html>
