<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Designation.aspx.cs" Inherits="Admin_Designation" %>

<%@ Register TagPrefix="Menu" TagName="menu" Src="~/Admin/AdminMenu.ascx" %>
<%@ Register TagPrefix="Footer" TagName="footer" Src="../Footer.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="~/Header_New.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    <script type="text/javascript">
        function Confirm(link) {
            if (confirm("Are you sure to delete the selected Designation?")) {
                return true;
            }
            else
                return false;
        }
    </script>
    <script type="text/javascript">
        history.pushState(null, null, 'Designation.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Designation.aspx');
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
    <script type="text/javascript" language="javascript">
        function Hidebutton() {
            $('#<%=BtnSave.ClientID %>').hide();
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
            <div class="col-sm-6 text-left">
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
                                <strong>Designation Master</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Designation</label></div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtdisignation" CssClass="form-control" autocomplete="Off" MaxLength="50"
                                            runat="server">
                                        </asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtdisignation_FilteredTextBoxExtender"
                                            runat="server" BehaviorID="txtdisignation_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtdisignation" ValidChars=" .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                        <asp:Label ID="lbldsgnid" runat="server" Visible="false"></asp:Label>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Hirarchy Order</label></div>
                                    <div class=" col-md-4">
                                        <asp:TextBox ID="txtcadre" CssClass="form-control" autocomplete="Off" MaxLength="50"
                                            runat="server">
                                        </asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtcadre_FilteredTextBoxExtender1" runat="server"
                                            BehaviorID="txtcadre_FilteredTextBoxExtender1" FilterType="Numbers" TargetControlID="txtcadre" />
                                        <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-12 text-center">
                                        <asp:Button ID="BtnSave" class="btn btn-info rounded" formnovalidate="formnovalidate"
                                            runat="server" Text="SAVE" OnClientClick=" return Hidebutton();" OnClick="BtnSave_Click" />
                                        <asp:Button ID="btnUpdate" CssClass="btn btn-info rounded" CausesValidation="false"
                                            runat="server" Text="UPDATE" Visible="false" OnClick="btnUpdate_Click" /></div>
                                </div>
                                <div class="row form-group offset-4">
                                    <asp:GridView ID="Gvdesignation" runat="server" CssClass="table table-striped table-bordered"
                                        GridLines="None" AutoGenerateColumns="False" OnRowCommand="Gvdesignation_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Designation Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDesgCode" runat="server" Visible="false" Text='<%# Bind("DesignationID") %>'>
                                                    </asp:Label>
                                                    <asp:Label ID="lblDesgName" runat="server" Text='<%# Bind("Designation") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Hirarchy Order">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcadre" runat="server" Text='<%# Bind("Cadre") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnedit" runat="server" CommandName="edt" Text="Edit" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="btnDel" runat="server" CommandName="dlt" OnClientClick="return Confirm(this)"
                                                        Text="Delete" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <%--  <div class="card-footer">
                                <asp:button id="BtnSave" class="btn btn-primary" formnovalidate="formnovalidate"
                                    runat="server" text="SAVE" onclientclick=" return Hidebutton();" onclick="BtnSave_Click" />
                                <asp:button id="btnUpdate" cssclass="btn btn-primary" causesvalidation="false" runat="server"
                                    text="UPDATE" visible="false" onclick="btnUpdate_Click" />
                                <%-- <button type="submit" class="btn btn-primary btn-sm">
                                    <i class="fa fa-dot-circle-o"></i>Save
                                </button>--%>
                            <%--<button type="reset" class="btn btn-danger btn-sm">
                                    <i class="fa fa-ban"></i>Reset
                                </button>--%>
                            <%-- </div>--%>
                        </div>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="hf" runat="server" />
            <Footer:footer ID="footer" runat="server"></Footer:footer>
        </div>
    </div>
    <script src="../Assests/Js/jquery.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/popper.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/main.js" type="text/javascript"></script>
    </form>
</body>
</html>
