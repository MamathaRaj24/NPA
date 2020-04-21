<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewAppliedPersons.aspx.cs"
    Inherits="SectionHead_ViewAppliedPersons" %>

<!DOCTYPE html>
<%@ Register TagPrefix="Menu" TagName="menu" Src="~/SectionHead/Menu.ascx" %>
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
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet'
        type='text/css' />
    <script src="../Assests/Js/jquery.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/popper.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/main.js" type="text/javascript"></script>

    <script type="text/javascript">
        history.pushState(null, null, 'ViewAppliedPersons.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'ViewAppliedPersons.aspx');
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
                                <strong>View Applied Persons</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group text-center">
                                    <div class="col col-md-3">
                                        <label class="form-control-label text-center">
                                            Name of the post</label>
                                    </div>
                                    <div class=" col-md-4">
                                        <asp:DropDownList ID="ddlPostType" CssClass="form-control" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlPostType_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row form-group text-center" runat="server" id="divcount" visible="false">
                                    <div class="col col-md-3">
                                        <label class="form-control-label text-center">
                                            Number of persons applied for the post</label>
                                    </div>
                                    <div class=" col-md-4">
                                        <asp:Label ID="lblCount" runat="server" Text="Label"></asp:Label>
                                    </div>
                                </div>
                                <div class="card-body card-block">
                                    <div class="row form-group">
                                        <div class="col-md-12 text-center">
                                            <asp:GridView ID="Gvpost" runat="server" AutoGenerateColumns="False" Visible="false"
                                                CssClass="table table-striped table-bordered" onrowcommand="Gvpost_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Application Id">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAppID" runat="server" Text='<%# Bind("Application_Id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Post Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPostName" runat="server" Text='<%# Bind("PostName") %>'></asp:Label>
                                                            <asp:Label ID="lblPost_ID" runat="server" Visible="false" Text='<%# Bind("Post_ID") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Gender">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblGender" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Caste">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCasteName" runat="server" Text='<%# Bind("CasteName") %>'></asp:Label><br />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="DOB">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDOB" runat="server" Text='<%# Bind("DOB") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="View">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkview" CommandName="View" runat="server">View</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:Label runat="server" ID="EmpType" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="content mt-3">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-lg-12">
                        <div id="DivData" runat="server">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:Label ID="lblSectionName" runat="server" Text=""></asp:Label>
        <div class="text-center">
            <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="btn btn-primary"
                Visible="false" />
        </div>
        <asp:HiddenField ID="hf" runat="server" />
    </div>
    <Footer:footer ID="footer" runat="server"></Footer:footer>
    </form>
</body>
</html>
