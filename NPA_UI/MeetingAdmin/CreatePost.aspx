<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreatePost.aspx.cs" Inherits="CreatePost" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="Menu" TagName="menu" Src="~/SectionHead/Menu.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="~/Header_New.ascx" %>
<%@ Register TagPrefix="Footer" TagName="footer" Src="~/Footer.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SVPNPA</title>
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
        history.pushState(null, null, 'CreatePost.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'CreatePost.aspx');
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

        $(document).ready(function () {
            $('#txtfrom').datepicker({
                dateFormat: 'dd/mm/yy',
                minDate: new Date(),
                changeMonth: true,
                changeYear: true,
                yearRange: "-0:+2"
            });
            $('#txtTo').datepicker({
                dateFormat: 'dd/mm/yy',
                minDate: new Date(),
                changeMonth: true,
                changeYear: true,
                yearRange: "-0:+1"
            });
        });
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
                                <strong>Create Post</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group text-left">
                                    <div class="col col-md-2">
                                        <label class="form-control-label text-left">
                                            Name of the Post</label>
                                    </div>
                                    <div class=" col-md-3">
                                        <asp:TextBox ID="txtPostName" CssClass="form-control" autocomplete="Off" MaxLength="50"
                                            runat="server" placeholder="Enter Post Name">
                                        </asp:TextBox>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Type of Post</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddlPostType" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row form-group text-left">
                                    <div class="col col-md-2 text-left">
                                        <label class="form-control-label text-left">
                                            Post Description</label>
                                    </div>
                                    <div class=" col-md-8">
                                        <asp:TextBox ID="txtPostDes" CssClass="form-control" TextMode="MultiLine" autocomplete="Off"
                                            MaxLength="1000" runat="server" placeholder="Enter Post Description">
                                        </asp:TextBox>
                                    </div>
                                </div>
                                <div class="row form-group text-left">
                                    <div class="col col-md-2">
                                        <label class="form-control-label text-left">
                                            EffectiveFrom</label>
                                    </div>
                                    <div class=" col-md-3">
                                        <asp:TextBox ID="txtfrom" CssClass="form-control" autocomplete="Off" runat="server"
                                            placeholder="EffectiveFrom">
                                        </asp:TextBox>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class="form-control-label text-left">
                                            Effective To</label>
                                    </div>
                                    <div class=" col-md-3">
                                        <asp:TextBox ID="txtTo" CssClass="form-control" autocomplete="Off" runat="server"
                                            placeholder="Effective To">
                                        </asp:TextBox>
                                    </div>
                                </div>
                                <div class="row form-group text-left">
                                    <div class="col col-md-2">
                                        <label class="form-control-label text-left">
                                            No of Posts Vacant</label>
                                    </div>
                                    <div class=" col-md-3">
                                        <asp:TextBox ID="txtnop" CssClass="form-control" autocomplete="Off" runat="server"
                                            placeholder="No.Of Posts">
                                        </asp:TextBox>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class="form-control-label text-left">
                                            Placement Location</label>
                                    </div>
                                    <div class=" col-md-3">
                                        <asp:TextBox ID="txtLocation" CssClass="form-control" autocomplete="Off" runat="server"
                                            placeholder="Placement Location">
                                        </asp:TextBox>
                                    </div>
                                </div>
                                <div class="row form-group text-left">
                                    <div class="col col-md-2">
                                        <label class="form-control-label text-left">
                                            Salary Per Month</label>
                                    </div>
                                    <div class=" col-md-3">
                                        <asp:TextBox ID="txtsal" CssClass="form-control" autocomplete="Off" runat="server"
                                            placeholder="Salary Per Month">
                                        </asp:TextBox>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class="form-control-label text-left">
                                            Age Limit</label>
                                    </div>
                                    <div class=" col-md-3">
                                        <asp:TextBox ID="txtage" CssClass="form-control" autocomplete="Off" runat="server"
                                            placeholder=" Age Limit">
                                        </asp:TextBox>
                                    </div>
                                </div>
                                <div class="row form-group text-left">
                                    <div class="col col-md-2">
                                        <label class="form-control-label text-left">
                                            Application Fee</label>
                                    </div>
                                    <div class=" col-md-3">
                                        <asp:RadioButtonList ID="rblFee" runat="server" RepeatDirection="Horizontal" 
                                            AutoPostBack="true" onselectedindexchanged="rblFee_SelectedIndexChanged">
                                            <asp:ListItem Text="Applicable" Value="1" />
                                            <asp:ListItem Text="Not Applicable" Selected="True" Value="0" />
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class="form-control-label text-left">
                                            Fee (In Rs.)</label>
                                    </div>
                                    <div class=" col-md-3">
                                        <asp:TextBox ID="txtFee" CssClass="form-control" autocomplete="Off" runat="server"
                                            Enabled="false" placeholder=" Fee (In Rs.)">
                                        </asp:TextBox>
                                    </div>
                                </div>
                                <div class="row form-group text-left">
                                    <div class="col col-md-2">
                                        <label class="form-control-label text-left">
                                            Required Qualification</label>
                                    </div>
                                    <div class=" col-md-3">
                                        <asp:DropDownList ID="ddlQalification" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Require Experience</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RadioButtonList ID="rblExp" runat="server" RepeatDirection="Horizontal" AutoPostBack="True"
                                            OnSelectedIndexChanged="rblExp_SelectedIndexChanged">
                                            <asp:ListItem Value="1">Yes</asp:ListItem>
                                            <asp:ListItem Value="0">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="row form-group text-left">
                                    <div class="col col-md-2">
                                        <label class="form-control-label text-left">
                                            Experience Details</label>
                                    </div>
                                    <div class=" col-md-8">
                                        <asp:TextBox ID="txtExp" CssClass="form-control" autocomplete="Off" MaxLength="250"
                                            Enabled="false" runat="server" placeholder="Enter  Experience Details" TextMode="MultiLine">
                                        </asp:TextBox>
                                    </div>
                                </div>
                                <div class="row form-group text-left">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Require Photo
                                        </label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RadioButtonList ID="rblphoto" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="1">Yes</asp:ListItem>
                                            <asp:ListItem Value="0">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Require Siganture Upload</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RadioButtonList ID="rblSign" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="1">Yes</asp:ListItem>
                                            <asp:ListItem Value="0">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="row form-group text-left">
                                    <div class="col col-md-12 text-left">
                                        <label class=" form-control-label">
                                            <asp:CheckBox ID="chk" runat="server" Font-Bold="true" Font-Size="Large" Text="Please bring original certificates for the interview" />
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-12">
                                        <div class="table-responsive">
                                            <asp:GridView ID="GVSection" runat="server" CssClass="table table-striped table-bordered dataTable no-footer"
                                                GridLines="None" AutoGenerateColumns="False" ShowFooter="true" OnRowDataBound="GVSection_RowDataBound"
                                                OnRowCommand="GVSection_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <FooterTemplate>
                                                            <asp:ImageButton ID="imgBtnAdd" runat="server" CommandName="Add" Height="30px" ImageUrl="~/Assests/images/add.jpg" />
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgBtnRemove" runat="server" CommandName="Remove" ImageUrl="~/Assests/images/hr.gif" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select Section">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="ddlSection" CssClass="form-control" runat="server" AutoPostBack="True"
                                                                OnSelectedIndexChanged="ddlSection_SelectedIndexChanged">
                                                                <asp:ListItem>--Select--</asp:ListItem>
                                                            </asp:DropDownList>
                                                            <asp:Label ID="lblSection" Visible="false" runat="server" Text='<%# Bind("Section") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select Items">
                                                        <ItemTemplate>
                                                            <asp:CheckBoxList ID="cblItems" runat="server" RepeatLayout="Table" RepeatColumns="6">
                                                            </asp:CheckBoxList>
                                                            <asp:Label ID="lblItem" Visible="false" runat="server" Text='<%# Bind("Items") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                <div class="row form-group text-left">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Disclaimer</label>
                                    </div>
                                    <div class="col-md-10">
                                        <asp:TextBox ID="txtdisclaimer" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="row form-group col col-md-12 text-center">
                                        <%-- <asp:Button ID="btn_Update" runat="server" Text="Update" 
                                        CssClass="btn btn-primary"  />--%>
                                        <asp:Button ID="btn_Save" runat="server" Text="Publish Post" CssClass="btn btn-primary"
                                            OnClick="btn_Save_Click" />
                                    </div>
                                </div>
                            </div>
                            <asp:HiddenField ID="hf" runat="server" />
                        </div>
                    </div>
                </div>
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
