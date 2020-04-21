<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_ApplicationSection.aspx.cs"
    Inherits="SectionHead_Add_ApplicationSection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="Menu" TagName="menu" Src="~/SectionHead/Menu.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="~/Header_New.ascx" %>
<%@ Register TagPrefix="Footer" TagName="footer" Src="~/Footer.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SVPNPA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" href="../Assests/images/sv.png" type="image/x-icon" />
    <link href="../Assests/Css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/themify-icons/css/themify-icons.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/flag-icon-css/css/flag-icon.min.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/Css/cs-skin-elastic.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/Css/style.css" rel="stylesheet" type="text/css" />
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet'
        type='text/css' />
    <script src="../Assests/Js/jquery.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/popper.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/main.js" type="text/javascript"></script>
    <script type="text/javascript">
        history.pushState(null, null, 'Add_ApplicationSection.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Add_ApplicationSection.aspx');
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
                                <strong>Add Application Section</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Section Name</label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtSectionname" CssClass="form-control" AutoComplete="off" runat="server"
                                            placeholder="Enter Section Name"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtSectionname_FilteredTextBoxExtender"
                                            runat="server" BehaviorID="txtSectionname_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtSectionname" ValidChars=" .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                        <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <asp:Button ID="btn_Update" runat="server" Text="Update" CssClass="btn btn-primary"
                                        OnClick="btn_Update_Click" />
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
                    <div class="col col-md-6">
                        <div class="table-responsive">
                            <asp:GridView ID="GVSection" runat="server" CssClass="table table-striped table-bordered dataTable no-footer"
                                GridLines="None" AutoGenerateColumns="False" OnRowCommand="GVSection_RowCommand">
                                <Columns>
                                   <%-- <asp:TemplateField HeaderText="Section number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsectioncode" runat="server" Text='<%# Bind("SectionID") %>'> </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:TemplateField HeaderText="Section Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsectionname" runat="server" Text='<%# Bind("SectionName") %>'></asp:Label>
                                            <asp:Label ID="lblsectioncode" runat="server" Visible="false" Text='<%# Bind("SectionID") %>'> </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Update/Delete" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edt" Text="Edit"></asp:LinkButton>&nbsp|&nbsp
                                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Dlt" Text="Delete"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="hf" runat="server" />
            <Footer:footer ID="footer" runat="server"></Footer:footer>
    </form>
</body>
</html>
