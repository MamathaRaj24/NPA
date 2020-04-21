<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Transfer_Details.aspx.cs"
    Inherits="Admin_Transfer_Details" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="Menu" TagName="menu" Src="~/Admin/AdminMenu.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="~/Header_New.ascx" %>
<%@ Register TagPrefix="Footer" TagName="footer" Src="~/Footer.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <link href="../Assests/Css/Jquery_UI.css" rel="stylesheet" type="text/css" />
    <script src="../Assests/Js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/footable.min.js" type="text/javascript"></script>
    <link href="../Assests/Css/dataTables.jqueryui.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/Css/footable.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        history.pushState(null, null, 'Transfer_Details.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Transfer_Details.aspx');
        });
        $(document).ready(function () {
            //             $('#GvHoliday').dataTable({
            //                 "bLengthChange": true,
            //                 "paging": true,
            //                 "sPaginationType": "full_numbers",
            //                 "aLengthMenu": [[25, 50, 75, -1], [25, 50, 75, "All"]],                   //For Different Paging  Style
            //                 // "scrollY": 400,                                     // For Scrolling
            //                 "jQueryUI": true                                      //Enabling JQuery UI(User InterFace)
            //             });
            $('.cal').datepicker({
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
                                <strong>Transfer Details</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                Designation From</label>
                                        </h4>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtDesigFrom" CssClass="form-control" placeholder="Designation From"
                                            autocomplete="Off" runat="server">
                                        </asp:TextBox>
                                    </div>
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                Office From
                                            </label>
                                        </h4>
                                    </div>
                                    <div class=" col-md-4">
                                        <asp:TextBox ID="txtOffFrom" CssClass="form-control" placeholder="Office From" autocomplete="Off"
                                            runat="server">
                                        </asp:TextBox>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                Designation To</label>
                                        </h4>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtDesigTo" CssClass="form-control" placeholder="Designation To"
                                            autocomplete="Off" runat="server">
                                        </asp:TextBox>
                                    </div>
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                Office To
                                            </label>
                                        </h4>
                                    </div>
                                    <div class=" col-md-4">
                                        <asp:TextBox ID="txtOffTo" CssClass="form-control" placeholder="Enter Office To"
                                            autocomplete="Off" runat="server">
                                        </asp:TextBox>
                                    </div>
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                Joining Date in New Office</label>
                                        </h4>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtJngDtNewOff" CssClass="form-control cal" placeholder="dd/mm/yy"
                                            autocomplete="Off" runat="server">
                                        </asp:TextBox>
                                    </div>
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                Order Number
                                            </label>
                                        </h4>
                                    </div>
                                    <div class=" col-md-4">
                                        <asp:TextBox ID="txtOdrNo" CssClass="form-control" placeholder="enter Order Number"
                                            autocomplete="Off" runat="server">
                                        </asp:TextBox>
                                    </div>
                                    <asp:HiddenField ID="HiddenField2" runat="server" />
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                Order Date</label>
                                        </h4>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtOrdDt" CssClass="form-control cal" placeholder="dd/mm/yy" autocomplete="Off"
                                            runat="server">
                                        </asp:TextBox>
                                    </div>
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                Whether Transferred after promotion(Yes/No)
                                            </label>
                                        </h4>
                                    </div>
                                    <div class=" col-md-4">
                                        <asp:DropDownList ID="ddlTransProm" CssClass="form-control" runat="server" AutoPostBack="true">
                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="YES" Value="Y"></asp:ListItem>
                                            <asp:ListItem Text="NO" Value="N"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <%--<asp:Button ID="btn_Update" runat="server" Text="Update" CssClass="btn btn-primary"
                                                OnClick="btn_Update_Click" />--%>
                                    <asp:Button ID="btn_Save" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btn_Save_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- .animated -->
            <div class="card-body card-block">
                <div class="row form-group">
                    <div class="col col-md-12">
                        <div class="table-responsive">
                            <asp:GridView ID="GvEmployee" runat="server" CssClass="table table-striped table-bordered dataTable no-footer"
                                GridLines="None" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="Designation From">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpID" runat="server" Text='<%# Bind("DesignationFrom") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Office From">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCurrentDesignation" runat="server" Text='<%# Bind("OfficeFrom") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Designation To">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFHname" runat="server" Text='<%# Bind("DesignationTo") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Office To">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQualification" runat="server" Text='<%# Bind("OfficeTo") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Office To">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQualification" runat="server" Text='<%# Bind("DOJ") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Order Dt">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQualification" runat="server" Text='<%# Bind("OrderDt") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Order Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQualification" runat="server" Text='<%# Bind("OrderNum") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Whether Transferred after promotionr">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQualification" runat="server" Text='<%# Bind("Transfer") %>'>
                                            </asp:Label>
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
    <asp:HiddenField ID="hf" runat="server" />
    <Footer:footer ID="footer" runat="server"></Footer:footer>
    </form>
</body>
</html>
