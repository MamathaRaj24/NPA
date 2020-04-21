<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sections.aspx.cs" Inherits="Admin_Sections" %>

<%@ Register TagPrefix="Menu" TagName="menu" Src="~/Admin/AdminMenu.ascx" %>
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
            if (confirm("Are you sure to delete the selected Section?")) {
                return true;
            }
            else
                return false;
        }
    </script>
    <script type="text/javascript">
        history.pushState(null, null, 'Sections.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Sections.aspx');
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
    <style>
        .right-panel .breadcrumbs
        {
            padding: 0px 0px;
        }
        .menutoggle > i
        {
            margin-top: 12px;
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
                                <strong>Section Master</strong>
                            </div>
                            <div class="card-body card-block">
                                <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Section</label></div>
                                    <div class="col-12 col-md-4">
                                        <%--  txtdisignation--txtSection--%>
                                        <asp:TextBox ID="txtSection" CssClass="form-control" autocomplete="Off" MaxLength="50"
                                            runat="server">
                                        </asp:TextBox>
                                        <%-- txtdisignation_FilteredTextBoxExtender-- txtSection_FilteredTextBoxExtender--%>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtSection_FilteredTextBoxExtender" runat="server"
                                            BehaviorID="txtSection_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtSection" ValidChars=" .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                        <%-- lbldsgnid--lblsectid--%>
                                        <asp:Label ID="lblsectid" runat="server" Visible="false"></asp:Label>
                                    </div>
                                </div>
                                <div class="row form-group">
                                </div>
                                <div class="row form-group offset-2">
                                    <asp:Button ID="BtnSave" class="btn btn-info" formnovalidate="formnovalidate" runat="server"
                                        Text="SAVE" OnClientClick=" return Hidebutton();" OnClick="BtnSave_Click" />
                                    <asp:Button ID="btnUpdate" CssClass="btn btn-primary" CausesValidation="false" runat="server"
                                        Text="UPDATE" Visible="false" OnClick="btnUpdate_Click" />
                                </div>
                                <div class="row form-group offset-4">
                                    <%--Gvdesignation--GvSection,Gvdesignation_RowCommand--GvSection_RowCommand--%>
                                    <asp:GridView ID="GvSection" runat="server" CssClass="table table-striped table-bordered"
                                        GridLines="None" AutoGenerateColumns="False" OnRowCommand="GvSection_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Section Name">
                                                <%-- lblDesgCode--lblSectid,lblDesgName--lblSectName--%>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSectid" runat="server" Visible="false" Text='<%# Bind("SectionID") %>'>
                                                    </asp:Label>
                                                    <asp:Label ID="lblSectName" runat="server" Text='<%# Bind("SectionName") %>'>
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
                                </form>
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
            <!-- .animated -->
        </div>
        <!-- .content -->
    </div>
    <!-- /#right-panel -->
    <!-- Right Panel -->
    <script src="../Assests/Js/jquery.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/popper.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/main.js" type="text/javascript"></script>
    </form>
</body>
</html>
