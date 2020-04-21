<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employee_LeaveDetails.aspx.cs"
    Inherits="Employee_Employee_LeaveDetails" %>

<%@ Register TagPrefix="Menu" TagName="menu" Src="~/Employee/EmployeeMenu.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="~/Header_New.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SVPNPA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
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
    <script type="text/javascript">
        history.pushState(null, null, 'Employee_LeaveDetails.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Employee_LeaveDetails.aspx');
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
            $('#GvLeave').dataTable({
                "bLengthChange": true,
                "paging": true,
                "sPaginationType": "full_numbers",
                "aLengthMenu": [[25, 50, 75, -1], [25, 50, 75, "All"]],                   //For Different Paging  Style
                // "scrollY": 400,                                     // For Scrolling
                "jQueryUI": true                                      //Enabling JQuery UI(User InterFace)
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
                                <strong>Employee Leave Details</strong>
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
                                                <asp:TemplateField HeaderText="Number of Days">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNodays" runat="server" Text='<%# Bind("NoDays") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Leave Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblleavetype" runat="server" Text='<%# Bind("lvType") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="View Details">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnView" runat="server" CommandName="View" Text="View"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-md-12 text-center">
                                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered dataTable no-footer"
                                            AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:BoundField DataField="TypeName" HeaderText="Leave Type" />
                                                <asp:BoundField DataField="FromDate" HeaderText="From Date" />
                                                <asp:BoundField DataField="FromType" HeaderText=" " />
                                                <asp:BoundField DataField="ToDate" HeaderText="To Date" />
                                                <asp:BoundField DataField="ToType" HeaderText=" " />
                                                <asp:BoundField DataField="Nod" HeaderText="NoOf Days " />
                                                <asp:BoundField DataField="ExtendedNod" HeaderText="Extended No of days " />
                                                <asp:BoundField DataField="CancelFrm" HeaderText="Cancel From " />
                                                <asp:BoundField DataField="CancelTo" HeaderText="Cancel To " />
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
