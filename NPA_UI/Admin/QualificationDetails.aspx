<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QualificationDetails.aspx.cs"
    Inherits="Admin_QualificationDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="Menu" TagName="menu" Src="~/Admin/AdminMenu.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="~/Header_New.ascx" %>
<%@ Register TagPrefix="Footer" TagName="footer" Src="~/Footer.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SVPNPA</title>
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
    <script type="text/javascript">
        history.pushState(null, null, 'QualificationDetails.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'QualificationDetails.aspx');
        });
        $(document).ready(function () {

            $('.cal').datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                yearRange: "-80:+0"
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
                                <strong>Qualification Details</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                Employee Name</label>
                                        </h4>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlemployee" CssClass="form-control" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlemployee_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <asp:Panel ID="pnlfamily" runat="server" Visible="false">
                    <div class="animated fadeIn">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-header">
                                        <strong>Employee Name</strong> <strong>
                                            <asp:Label ID="lblemployeename" runat="server" CssClass="alert alert-primary" Visible="false"></asp:Label></strong>
                                    </div>
                                    <div class="card-body card-block">
                                        <div class="row form-group">
                                            <div class="col col-md-12">
                                                <div class="table-responsive">
                                                    <asp:GridView ID="GvQualification" runat="server" CssClass="table table-striped table-bordered dataTable no-footer"
                                                        GridLines="None" AutoGenerateColumns="False" ShowFooter="true" OnRowCommand="GvQualification_RowCommand"
                                                        OnRowDataBound="GvQualification_RowDataBound">
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <FooterTemplate>
                                                                    <asp:ImageButton ID="btnAdd" runat="server" formnovalidate ImageUrl="~/Assests/images/plus.png"
                                                                        CommandName="AddRows" />
                                                                </FooterTemplate>
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="btnDeletes" runat="server" formnovalidate ImageUrl="~/Assests/images/minus.png"
                                                                        CommandName="Remove" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Qualification">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblexam" runat="server" Visible="false" Text='<%# Bind("Exam") %>'> ></asp:Label>
                                                                    <asp:DropDownList ID="ddlqualification" runat="server" CssClass="form-control">
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Board/University">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtbruniersity" runat="server" CssClass="form-control" Text='<%# Bind("Board") %>'>></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Year of Passing">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtyearofpassing" runat="server" CssClass="form-control cal" Text='<%# Bind("Yearp") %>'>></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Percentage of Marks">
                                                                <ItemTemplate>
                                                                    <asp:TextBox ID="txtrelation" runat="server" CssClass="form-control" Text='<%# Bind("Marks") %>'>></asp:TextBox>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class=" col-md-8 text-center mb-4">
                                            <asp:Button ID="Btnsave" CssClass="btn btn-primary" runat="server" Visible="false"
                                                Text="Save" OnClick="Btnsave_Click" />
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-12">
                                            <div class="table-responsive">
                                                <asp:GridView ID="Gvempqualification" runat="server" CssClass="table table-striped table-bordered dataTable no-footer"
                                                    GridLines="None" AutoGenerateColumns="False" ShowFooter="true" DataKeyNames="Id"
                                                    AutoGenerateEditButton="true" AutoGenerateDeleteButton="true" OnRowCancelingEdit="Gvempqualification_RowCancelingEdit"
                                                    OnRowDataBound="Gvempqualification_RowDataBound" OnRowEditing="Gvempqualification_RowEditing"
                                                    OnRowUpdating="Gvempqualification_RowUpdating" OnRowDeleting="Gvempqualification_RowDeleting">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Qualification">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblexam" runat="server" Visible="false" Text='<%# Bind("Exam") %>'> ></asp:Label>
                                                                <asp:Label ID="lbqualificationname" runat="server" Text='<%# Bind("Qualification_Name") %>'> ></asp:Label>
                                                                <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Bind("Id") %>'> ></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:DropDownList ID="ddlqualification" runat="server" CssClass="form-control">
                                                                </asp:DropDownList>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Board/University">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblboard" runat="server" Text='<%# Bind("Board_University") %>'> ></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtbruniersity" runat="server" CssClass="form-control" Text='<%# Bind("Board_University") %>'>></asp:TextBox>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Year of Passing">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblyearofpass" runat="server" Text='<%# Bind("YearOfPassing") %>'> ></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtyearofpassing" runat="server" CssClass="form-control cal" Text='<%# Bind("YearOfPassing") %>'>></asp:TextBox>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Percentage of Marks">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblmarks" runat="server" Text='<%# Bind("Marks") %>'> ></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtmarks" runat="server" CssClass="form-control" Text='<%# Bind("Marks") %>'>></asp:TextBox>
                                                            </EditItemTemplate>
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
                </asp:Panel>
                <!-- .animated -->
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hf" runat="server" />
    <Footer:footer ID="footer" runat="server"></Footer:footer>
    </form>
</body>
</html>
