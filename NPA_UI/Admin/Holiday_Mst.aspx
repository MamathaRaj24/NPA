<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Holiday_Mst.aspx.cs" Inherits="Admin_Holiday_Mst" %>

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
        $(document).ready(function () {


            var y = $("#ddlyear option:selected").text();
            var m = $("#DropDownList1 option:selected").text();
            //alert(y);
            //alert("  month  " + m);

            $('.cal').datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                defaultDate: new Date(1,m,y)
            });
        });
    </script>
    <script type="text/javascript">
        history.pushState(null, null, 'Holiday_Mst.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Holiday_Mst.aspx');
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
                                <strong>Holiday Master</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group text-center">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Select year</label>
                                    </div>
                                    <div class="col-12 col-md-4">
                                        <asp:DropDownList ID="ddlyear" CssClass="form-control" runat="server" >
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Select Month</label>
                                    </div>
                                    <div class="col-12 col-md-4">
                                        <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-12">
                                    <asp:GridView ID="GvHoliday" runat="server" CssClass="table table-striped table-bordered dataTable no-footer"
                                        AutoGenerateColumns="false" ShowFooter="true" OnRowCommand="GvHoliday_RowCommand"
                                        OnRowDataBound="GvHoliday_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField>
                                                <FooterTemplate>
                                                    <asp:ImageButton ID="btnAdd" runat="server" ImageUrl="../Assests/images/plus.png"
                                                        formnovalidate CommandName="AddRows" />
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="btnDeletes" runat="server" formnovalidate ImageUrl="../Assests/images/minus.png"
                                                        CommandName="Remove" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sl.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldate" runat="server" Visible="false" />
                                                    <asp:TextBox ID="txtholidayDate" runat="server" Text='<%# Bind("HolidayDate") %>'
                                                        CssClass="form-control cal" AutoPostBack="true" OnTextChanged="txtholidayDate_TextChanged" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Holiday Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblholidaytype" runat="server" Visible="false" Text='<%# Bind("HolidayType") %>'
                                                        CssClass="text-primary" />
                                                    <asp:DropDownList ID="ddlholidaytype" CssClass="form-control" runat="server">
                                                        <asp:ListItem Value="0">-Select-</asp:ListItem>
                                                        <asp:ListItem Value="GT">Gazetted</asp:ListItem>
                                                        <asp:ListItem Value="RS">Restricted</asp:ListItem>
                                                    </asp:DropDownList>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Description">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="txtdesc" runat="server" autocomplete="off" Text='<%# Bind("Description") %>'
                                                        CssClass="form-control" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col-md-12 text-center">
                                <asp:Button ID="BtnSave" Visible="false" class="btn btn-info" runat="server" Text="SAVE"
                                    OnClick="BtnSave_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="hf" runat="server" />
            <Footer:footer ID="footer" runat="server"></Footer:footer>
        </div>
        <script src="../Assests/Js/jquery.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/popper.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/main.js" type="text/javascript"></script>
    </div>
    </form>
</body>
</html>
