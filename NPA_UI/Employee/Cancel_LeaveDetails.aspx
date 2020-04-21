<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cancel_LeaveDetails.aspx.cs"
    Inherits="Employee_Cancel_LeaveDetails" %>

<%@ Register TagPrefix="Menu" TagName="menu" Src="~/Employee/EmployeeMenu.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="~/Header_New.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SVPNPA</title>
    <link rel="icon" href="../Assests/images/sv.png" type="image/x-icon" />
    <script src="../Assests/Js/jquery.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery-ui.js" type="text/javascript"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../Assests/Css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/themify-icons/css/themify-icons.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/flag-icon-css/css/flag-icon.min.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/Css/cs-skin-elastic.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/Css/style.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/Css/Jquery_UI.css" rel="stylesheet" type="text/css" />
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet'
        type='text/css' />
    <script type="text/javascript">
        history.pushState(null, null, 'Cancel_LeaveDetails.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Cancel_LeaveDetails.aspx');
        });
        function DisableBackButton() {
            window.history.forward()
        }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }

        window.history.forward(1);
        function noBack() {
            window.history.forward();
        }
    </script>
    
    <script type="text/javascript">
        $(document).ready(function () {
            $('.calFrom').datepicker({
                dateFormat: 'dd/mm/yy',
                minDate: new Date(),
                changeMonth: true,
                changeYear: true,
                numberOfMonths: 1,
               
            });

            $('.calTo').datepicker({
                dateFormat: 'dd/mm/yy',
                minDate: new Date(),
                changeMonth: true,
                changeYear: true,
                numberOfMonths: 1,
               
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <Menu:menu ID="menu" runat="server" />
    <div id="right-panel" class="right-panel">
        <Header_New:header ID="Header1" runat="server" />
        <div class="breadcrumbs">
            <div class="col-md-6 text-left">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1 style="float: left">
                            <font color="#fff">Logged In As:<asp:Label ID="lblUser" runat="server"></asp:Label></font></h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 text-right">
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
                        <div class="card">
                            <div class="card-header">
                                <strong>Cancelled Leave Details</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col-md-12 text-center">
                                        <asp:GridView ID="GvLeave" runat="server" CssClass="table table-striped table-bordered dataTable no-footer"
                                            AutoGenerateColumns="False" OnRowCommand="GvLeave_RowCommand">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sl.No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Application ID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblApplication" runat="server" Text='<%# Bind("ApplicationId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Leave Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblleavetype" runat="server" Text='<%# Bind("lvType") %>'></asp:Label><br />
                                                        <asp:Label ID="lblStatus" runat="server" Visible="false" Text='<%# Bind("Status") %>'></asp:Label>
                                                         <asp:Label ID="lblleavetypecd"  Visible="false" runat="server" Text='<%# Bind("TypeID") %>'></asp:Label>
                                                        <asp:Label ID="lblleavetypes" runat="server" Text='<%# Bind("TypeName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                               <%-- <asp:TemplateField HeaderText="Leave Types">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblleavetypecd"  Visible="false" runat="server" Text='<%# Bind("TypeID") %>'></asp:Label>
                                                        <asp:Label ID="lblleavetypes" runat="server" Text='<%# Bind("TypeName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="From">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFrom" runat="server" Text='<%# Bind("FD") %>'></asp:Label><br />
                                                        <asp:Label ID="lblTo" runat="server" Text='<%# Bind("TD") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                             <%--   <asp:TemplateField HeaderText="To">
                                                    <ItemTemplate>
                                                        
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Number of Days">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNodays" runat="server" Text='<%# Bind("NoDays") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="leaves">
                                                    <ItemTemplate>
                                                        <asp:RadioButtonList ID="rbLeaves" runat="server" RepeatDirection="Horizontal" AutoPostBack="true"
                                                            OnSelectedIndexChanged="rbLeaves_SelectedIndexChanged">
                                                            <asp:ListItem Value="T">Total</asp:ListItem>
                                                            <asp:ListItem Value="P">Partial</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="From">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtFrom" Enabled="false" CssClass="form-control calFrom" autocomplete="Off" AutoPostBack="true"
                                                             runat="server" placeholder="From date" OnTextChanged="GVFromdate_TextChanged">
                                                        </asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="To">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtTo" Enabled="false" CssClass="form-control calTo" autocomplete="Off" MaxLength="50"
                                                            AutoPostBack="true" OnTextChanged="GVtxtToDate_TextChanged" 
                                                            runat="server" placeholder="To date">
                                                        </asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- <asp:TemplateField HeaderText="Cancellation Remarks">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtxReasons" runat="server"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnView" runat="server" CommandName="cncl" Text="Cancel"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-md-12 text-center">
                                        <asp:GridView ID="GDView" runat="server" CssClass="table table-striped table-bordered dataTable no-footer"
                                            AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Status Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStatusname" runat="server" Text='<%# Bind("StatusName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Status Updated On">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStatusUpdate" runat="server" Text='<%# Bind("StatusUpdatedOn") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
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
        <div class="content mt-3">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                        </div>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <!-- .animated -->
        </div>
    </div>
    </form>
</body>
</html>
