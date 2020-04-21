<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DistrictMaster.aspx.cs" Inherits="Admin_DistrictMaster" %>

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
    <link href="../Assests/Css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/themify-icons/css/themify-icons.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/flag-icon-css/css/flag-icon.min.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/Css/cs-skin-elastic.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/Css/style.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/Css/Jquery_UI.css" rel="stylesheet" type="text/css" />
    <script src="../Assests/Js/jquery.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery-ui.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/popper.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/main.js" type="text/javascript"></script>
    <script type="text/javascript">
        history.pushState(null, null, 'DistrictMaster.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'DistrictMaster.aspx');
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
                                <strong>District Master</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            State Code</label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlstate" CssClass="form-control" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlstate_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:Label ID="lblDistcode" runat="server" Visible="false"></asp:Label>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Distrcit Code-LG
                                        </label>
                                    </div>
                                    <div class=" col-md-4">
                                        <asp:TextBox ID="txtdistcodelg" CssClass="form-control" placeholder="Enter District Code-LG"
                                            autocomplete="Off" runat="server">
                                        </asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtdistcodelg_FilteredTextBoxExtender" runat="server"
                                            BehaviorID="txtdistcodelg_FilteredTextBoxExtender" FilterType="Numbers" TargetControlID="txtdistcodelg">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            District Name</label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtdistname" CssClass="form-control cal" AutoComplete="off" runat="server"
                                            placeholder="Enter District Name"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row  text-center mb-5">
                                    <asp:Button ID="btn_Update" runat="server" Text="Update" Visible="false" CssClass="btn btn-primary"
                                        OnClick="btn_Update_Click" />
                                    <asp:Button ID="btn_Save" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btn_Save_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-body card-block">
                <div class="row form-group">
                    <div class="col col-md-12">
                        <div class="table-responsive">
                            <asp:GridView ID="Gvdistrict" runat="server" CssClass="table table-striped table-bordered dataTable no-footer"
                                GridLines="None" AutoGenerateColumns="False" AllowPaging="true" OnRowCommand="Gvdistrict_RowCommand"
                                OnPageIndexChanging="Gvdistrict_PageIndexChanging">
                                <Columns>
                                    <asp:TemplateField HeaderText="State Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstatename" runat="server" Text='<%# Bind("State") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblstatecode" Visible="false" runat="server" Text='<%# Bind("StateCode") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="District Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldistcode" runat="server" Visible="false" Text='<%# Bind("DistCode") %>'> </asp:Label>
                                            <asp:Label ID="lbldistname" runat="server" Text='<%# Bind("DistName") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lbldistcodelg" runat="server" Visible="false" Text='<%# Bind("DistCode_LG") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Active">
                                        <ItemTemplate>
                                            <asp:Label ID="lblactive" runat="server" Text='<%# Bind("Active") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Update" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnEdit" runat="server" formnovalidate="formnovalidate" CommandName="Edt"
                                                Text="Edit"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnDelete" runat="server" formnovalidate="formnovalidate" CommandName="Dlt"
                                                OnClientClick="return Confirm(this)" Text="Delete"></asp:LinkButton>
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
