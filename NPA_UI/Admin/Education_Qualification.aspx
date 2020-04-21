<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Education_Qualification.aspx.cs"
    Inherits="Admin_Education_Qualification" %>

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
        history.pushState(null, null, 'Education_Qualification.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Education_Qualification.aspx');
        });
        $(document).ready(function () {

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
                                <strong>Educationl Qualification</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                Qualification</label>
                                        </h4>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlQualification" CssClass="form-control" runat="server" AutoPostBack="true">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                Discipline
                                            </label>
                                        </h4>
                                    </div>
                                    <div class=" col-md-4">
                                        <asp:DropDownList ID="ddlDiscipline" CssClass="form-control" runat="server" AutoPostBack="true">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                Board/University</label>
                                        </h4>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtBoardUniver" CssClass="form-control" placeholder="Enter Board/University"
                                            autocomplete="Off" runat="server">
                                        </asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtBoardUniver_FilteredTextBoxExtender"
                                            runat="server" BehaviorID="txtBoardUniver_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtBoardUniver" ValidChars=" .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                Year of Passing
                                            </label>
                                        </h4>
                                    </div>
                                    <div class=" col-md-4">
                                        <asp:TextBox ID="txtyrPass" CssClass="form-control cal" AutoComplete="off" runat="server"
                                            placeholder="dd/mm/yyyy"></asp:TextBox>
                                    </div>
                                    <asp:HiddenField ID="HiddenField1" runat="server" />
                                </div>
                            </div>
                            <div class="form-control text-center">
                                <%--<asp:Button ID="btn_Update" runat="server" Text="Update" CssClass="btn btn-primary"
                                                OnClick="btn_Update_Click" />--%>
                                <asp:Button ID="btn_Save" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btn_Save_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- .animated -->
        </div>
        <div class="card-body card-block">
            <div class="row form-group">
                <div class="col col-md-12">
                    <div class="table-responsive">
                        <asp:GridView ID="GvEmployee" runat="server" CssClass="table table-striped table-bordered dataTable no-footer"
                            GridLines="None" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Qualification">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmpID" runat="server" Visible="false" Text='<%# Bind("Qualification_Code") %>'>
                                        </asp:Label>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Qualification_Name") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Discipine">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFHname" runat="server" Visible="false" Text='<%# Bind("Discipline_Code") %>'>
                                        </asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Discipline_Name") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="University">
                                    <ItemTemplate>
                                        <asp:Label ID="lblQualification" runat="server" Text='<%# Bind("University") %>'>
                                        </asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Year Of Passing">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCurrentDesignation" runat="server" Text='<%# Bind("yearOfPass") %>'>
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
    <asp:HiddenField ID="hf" runat="server" />
    <Footer:footer ID="footer" runat="server"></Footer:footer>
    </form>
</body>
</html>
