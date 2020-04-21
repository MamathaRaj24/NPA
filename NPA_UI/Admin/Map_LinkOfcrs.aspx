<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Map_LinkOfcrs.aspx.cs"
    Inherits="Map_LinkOfcrs" %>

<%@ Register TagPrefix="Menu" TagName="menu" Src="~/Admin/AdminMenu.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="~/Header_New.ascx" %>
<%@ Register TagPrefix="Footer" TagName="footer" Src="~/Footer.ascx" %>
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
        history.pushState(null, null, 'Map_LinkOfcrs.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Map_LinkOfcrs.aspx');
        });
        $(document).ready(function () {
            $('#GVMapOfc').dataTable({
                "bLengthChange": true,
                "paging": true,
                "sPaginationType": "full_numbers",
                "aLengthMenu": [[25, 50, 75, -1], [25, 50, 75, "All"]],                   //For Different Paging  Style
                // "scrollY": 400,                                     // For Scrolling
                "jQueryUI": true                                      //Enabling JQuery UI(User InterFace)
            });
            $('.calfrm').datepicker({
                dateFormat: 'dd/mm/yy',
                maxDate: new Date(),
                changeMonth: true,
                changeYear: true,
                yearRange: "-10:+0"
            });
            $('.calto').datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                yearRange: "-0:+10"
            });
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
    <style type="text/css">
        .ui-widget-header
        {
            border: 1px solid #4aa078;
            background: #4aa078 url(images/ui-bg_gloss-wave_35_f6a828_500x100.png) 50% 50% repeat-x;
            color: #ffffff;
            font-weight: bold;
        }
        .ui-state-highlight, .ui-widget-content .ui-state-highlight, .ui-widget-header .ui-state-highlight
        {
            border: 1px solid #4aa078;
            background: #4aa078 url("images/ui-bg_highlight-soft_75_ffe45c_1x100.png") 50% top repeat-x;
            color: #363636;
        }
        .ui-state-hover, .ui-widget-content .ui-state-hover, .ui-widget-header .ui-state-hover, .ui-state-focus, .ui-widget-content .ui-state-focus, .ui-widget-header .ui-state-focus
        {
            border: 1px solid #4aa078;
            background: #4aa078 url("images/ui-bg_glass_100_fdf5ce_1x400.png") 50% 50% repeat-x;
            font-weight: bold;
            color: black;
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
                <div class="col-sm-4">
                    <div class="page-header float-left">
                        <div class="page-title">
                            <h1 style="float: left">
                                <font color="#fff">Logged In As:<asp:Label ID="lblUser" runat="server"></asp:Label></font></h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2">
                </div>
                <div class="col-sm-4">
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
                                    <strong>Map Link Officer</strong>
                                </div>
                                <div class="card-body card-block">
                                    <div class="row form-group text-center">
                                        <div class="col col-md-2">
                                            <label class=" form-control-label">
                                                Select Designation</label>
                                        </div>
                                        <div class="col-12 col-md-4">
                                            <asp:DropDownList ID="ddlCurrentDesignation" CssClass="form-control" runat="server"
                                                AutoPostBack="true" OnSelectedIndexChanged="ddlCurrentDesignation_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-12 text-center">
                                        <asp:GridView ID="GVMapOfc" runat="server" CssClass="footable" AutoGenerateColumns="false"
                                            OnRowDataBound="GVMapOfc_RowDataBound">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sl.No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Employee">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEmpID" runat="server" Visible="false" Text='<%# Bind("Employee_ID") %>' />
                                                        <asp:Label ID="lblEmpCode" runat="server" CssClass="text-primary" Text='<%# Bind("EmpCode") %>' />-
                                                     <asp:Label ID="lblEmployeeName" runat="server" CssClass="text-primary" Text='<%# Bind("EmpName") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Designation">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDesignation" runat="server" Text='<%# Bind("Designation") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- <asp:TemplateField HeaderText="Section">
                                                <ItemTemplate>
                                                    <asp:DropDownList ID="ddlSection" CssClass="form-control" runat="server">
                                                        <asp:ListItem>--Select--</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:Label ID="lblSection" Visible="false" runat="server" Text='<%# Bind("Section") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField> --%>
                                                <asp:TemplateField HeaderText="Farwarding Officer">
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="ddlforwording" CssClass="form-control" runat="server"
                                                            OnSelectedIndexChanged="ddlforwording_SelectedIndexChanged">
                                                            <asp:ListItem>--Select--</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:Label ID="lblforwardingofcr" Visible="false" runat="server" Text='<%# Bind("Forwording_Officer") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Recommending Officer">
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="ddlao" CssClass="form-control"
                                                            runat="server" OnSelectedIndexChanged="ddlao_SelectedIndexChanged">
                                                            <asp:ListItem>--Select--</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:Label ID="lblao" Visible="false" runat="server" Text='<%# Bind("Recommended_Officer") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sanctioning Autharity">
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="ddlsanctionautharity"
                                                            CssClass="form-control" runat="server"
                                                            OnSelectedIndexChanged="ddlsanctionautharity_SelectedIndexChanged">
                                                            <asp:ListItem>--Select--</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:Label ID="lblsanction" Visible="false" runat="server" Text='<%# Bind("Sanction_Authority") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Link Officer">
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="ddllink" CssClass="form-control"
                                                            runat="server" OnSelectedIndexChanged="ddllink_SelectedIndexChanged">
                                                            <asp:ListItem>--Select--</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:Label ID="lbllink" Visible="false" runat="server" Text='<%# Bind("Link_Officer") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Select">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="ChkSelect" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-md-12 text-center">
                                        <asp:Button ID="BtnSave" Visible="false" class="btn btn-info" formnovalidate="formnovalidate"
                                            runat="server" Text="SAVE" OnClick="BtnSave_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:HiddenField ID="hf" runat="server" />
                <Footer:footer ID="footer" runat="server"></Footer:footer>
            </div>
        </div>
    </form>
</body>
</html>
