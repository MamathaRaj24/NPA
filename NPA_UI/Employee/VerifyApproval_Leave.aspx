<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VerifyApproval_Leave.aspx.cs"
    Inherits="VerifyApproval_Leave" %>

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
    <link rel="stylesheet" type="text/css" href="../Assests/Css/Jquery_UI.css" />
    <script src="../Assests/Js/jquery.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/popper.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/main.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="../Assests/Js/jquery-ui.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/footable.min.js" type="text/javascript"></script>
    <link href="../Assests/Css/dataTables.jqueryui.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/Css/footable.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function Confirm(link) {
            if (confirm("Are you sure to delete the selected Leave Type?")) {
                return true;
            }
            else
                return false;
        }
    </script>
    <script type="text/javascript">
        history.pushState(null, null, 'VerifyApproval_Leave.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'VerifyApproval_Leave.aspx');
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
                                <strong>Approve Leaves</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col-md-12 text-center">
                                        <asp:GridView ID="GvLeave" runat="server" CssClass="footable" AutoGenerateColumns="False"
                                            OnRowCommand="GvLeave_RowCommand">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sl.No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Employee Code">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEmployeeCode" runat="server" Text='<%# Bind("EmployeeCode") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Employee Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEmployeeName" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Designation">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDesignation" runat="server" Text='<%# Bind("Designation") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Leave Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTypeName" runat="server" Text='<%# Bind("TypeName") %>'></asp:Label>
                                                        <asp:Label ID="lblLeaveType" runat="server" Visible="false" Text='<%# Bind("LeaveType") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="From Date/Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblfrmdt" runat="server" Text='<%# Bind("frmdt") %>'></asp:Label><br />
                                                        <asp:Label ID="lblP_HdayFrm" runat="server" Text='<%# Bind("P_HdayFrm") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="From Date/Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltodt" runat="server" Text='<%# Bind("todt") %>'></asp:Label><br />
                                                        <asp:Label ID="lblP_HdayTo" runat="server" Text='<%# Bind("P_HdayTo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="No. of days leave">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbldays" runat="server" Text='<%# Bind("noofdays") %>'></asp:Label><br />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Approve">
                                                    <ItemTemplate>
                                                        <asp:Button ID="btnApprove" runat="server" CommandArgument="A" CssClass="btn btn-info rounded"
                                                            Text="Approve" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Reject">
                                                    <ItemTemplate>
                                                        <asp:Button ID="btnReject" runat="server" Enabled='<%# Eval("Flag").ToString()=="1" ? true  :  false %>' CommandArgument="R" CssClass="btn btn-info rounded"
                                                            Text="Reject" />
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
    </div>
    </form>
</body>
</html>
