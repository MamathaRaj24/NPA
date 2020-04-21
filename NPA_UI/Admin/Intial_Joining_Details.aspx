<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Intial_Joining_Details.aspx.cs"
    Inherits="Admin_Intial_Joining_Details" %>

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
        history.pushState(null, null, 'Intial_Joining_Details.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Intial_Joining_Details.aspx');
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
                                <strong>Intial Joining Details</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Employee Name</label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlemployee" CssClass="form-control" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlemployee_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="animated fadeIn">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-header">
                                                <strong>Select Employee </strong><strong>
                                                    <asp:Label ID="lblemployeename" runat="server" CssClass="alert alert-primary" Visible="false"></asp:Label></strong>
                                            </div>
                                            <div class="card-body card-block">
                                                <div class="row form-group">
                                                    <div class="col col-md-12">
                                                        <div class="card-body card-block">
                                                            <div class="row form-group">
                                                                <div class="col col-md-2">
                                                                    <label class=" form-control-label">
                                                                        State
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <asp:DropDownList ID="ddlState" CssClass="form-control" required runat="server">
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="col col-md-2">
                                                                    <label class=" form-control-label">
                                                                        Office Name
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <asp:TextBox ID="txtOfficeNm" CssClass="form-control" required runat="server" placeholder=" Enter Office Name"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col col-md-2">
                                                                    <label class=" form-control-label">
                                                                        Designation
                                                                    </label>
                                                                </div>
                                                                <div class=" col-md-4">
                                                                    <asp:DropDownList ID="ddlDesignation" CssClass="form-control" required runat="server" >
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="col col-md-2">
                                                                    <label class=" form-control-label">
                                                                        Date of Joining</label>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <asp:TextBox ID="txtDoJ" AutoComplete="Off" CssClass="form-control cal" required runat="server"
                                                                        placeholder="dd/mm/yyyy"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <%-- <div class="row form-group">
                                                                <div class="col col-md-2">
                                                                    <label class=" form-control-label">
                                                                        <asp:HiddenField ID="HiddenField1" runat="server" />
                                                                        Whether Confirmed
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <asp:RadioButtonList ID="rdbDependent" runat="server" AutoPostBack="true" RepeatDirection="Horizontal">
                                                                        <asp:ListItem Value="Yes">Yes</asp:ListItem>
                                                                        <asp:ListItem Value="No">No</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </div>
                                                                <div class="col col-md-2">
                                                                    <label class=" form-control-label">
                                                                        If Yes,Date of Confirmation
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <asp:TextBox ID="txtDocon" AutoComplete="Off" CssClass="form-control cal" runat="server"
                                                                        placeholder="dd/mm/yyyy"></asp:TextBox>
                                                                </div>
                                                            </div>--%>
                                                            <div class="row form-group">
                                                                <div class="col col-md-2">
                                                                    <label class=" form-control-label">
                                                                        Order Number
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <asp:TextBox ID="txtConOrdNum" CssClass="form-control" runat="server" required placeholder=" Enter Confirmation Order Number"></asp:TextBox>
                                                                    <ajaxToolkit:FilteredTextBoxExtender ID="txtConOrdNum_FilteredTextBoxExtender" runat="server"
                                                                        BehaviorID="txtConOrdNum_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                                        TargetControlID="txtConOrdNum" ValidChars=" .,()-">
                                                                    </ajaxToolkit:FilteredTextBoxExtender>
                                                                </div>
                                                                <div class="col col-md-2">
                                                                    <label class=" form-control-label">
                                                                        Order Date
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <asp:TextBox ID="txtCOrDt" AutoComplete="Off" CssClass="form-control cal" required runat="server"
                                                                        placeholder="dd/mm/yyyy"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col col-md-2">
                                                                    <label class=" form-control-label">
                                                                        Appointing Authority
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <asp:TextBox ID="txtAppAut" CssClass="form-control" runat="server" required placeholder=" Enter Appointing Authority"></asp:TextBox>
                                                                    <ajaxToolkit:FilteredTextBoxExtender ID="txtAppAut_FilteredTextBoxExtender" runat="server"
                                                                        BehaviorID="txtAppAut_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                                        TargetControlID="txtAppAut" ValidChars=" .,()-">
                                                                    </ajaxToolkit:FilteredTextBoxExtender>
                                                                </div>
                                                                <div class="col col-md-2">
                                                                    <label class=" form-control-label">
                                                                        Mode of Recruitment
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <asp:TextBox ID="txtModeRec" CssClass="form-control" required runat="server" placeholder=" Enter Mode of Recruitment"></asp:TextBox>
                                                                    <ajaxToolkit:FilteredTextBoxExtender ID="txtModeRec_FilteredTextBoxExtender" runat="server"
                                                                        BehaviorID="txtModeRec_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                                        TargetControlID="txtModeRec" ValidChars=" .,()-">
                                                                    </ajaxToolkit:FilteredTextBoxExtender>
                                                                </div>
                                                                <%-- <div class="col col-md-2">
                                                                    
                                                                        <label class=" form-control-label">
                                                                            Class
                                                                        </label>
                                                                   
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <asp:DropDownList ID="ddlClass" CssClass="form-control" runat="server" AutoPostBack="true">
                                                                    </asp:DropDownList>
                                                                </div>--%>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col col-md-2">
                                                                    <label class=" form-control-label">
                                                                        Officer Type
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <asp:DropDownList ID="rdbOffType" runat="server" required CssClass="form-control">
                                                                        <asp:ListItem Value="">-Select-</asp:ListItem>
                                                                        <asp:ListItem Value="GZ">Gazetted</asp:ListItem>
                                                                        <asp:ListItem Value="NGO">Non-Gazetted</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <div class="col col-md-2">
                                                                    <label class=" form-control-label">
                                                                        Pay Commission
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <asp:DropDownList ID="ddlPayComm" required CssClass="form-control" runat="server" >
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="row form-group">
                                                                <div class="col col-md-2">
                                                                    <label class=" form-control-label">
                                                                        Pay Scale
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <asp:TextBox ID="txtPayScale" CssClass="form-control" required placeholder="Enter Pay Scale "
                                                                        autocomplete="Off" runat="server">
                                                                    </asp:TextBox>
                                                                    <ajaxToolkit:FilteredTextBoxExtender ID="txtPayScale_FilteredTextBoxExtender" runat="server"
                                                                        BehaviorID="txtPayScale_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                                        TargetControlID="txtPayScale" ValidChars=" .,()-">
                                                                    </ajaxToolkit:FilteredTextBoxExtender>
                                                                </div>
                                                                <div class="col col-md-2">
                                                                    <label class=" form-control-label">
                                                                        Basic Pay
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <asp:TextBox ID="txtBasicPay" CssClass="form-control" required placeholder="Enter   Basic Pay"
                                                                        autocomplete="Off" runat="server">
                                                                    </asp:TextBox>
                                                                    <ajaxToolkit:FilteredTextBoxExtender ID="txtBasicPay_FilteredTextBoxExtender" runat="server"
                                                                        BehaviorID="txtBasicPay_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                                        TargetControlID="txtBasicPay" ValidChars=" .,()-">
                                                                    </ajaxToolkit:FilteredTextBoxExtender>
                                                                </div>
                                                            </div>
                                                            <div class="text-center">
                                                                <asp:Button ID="Btn_Edit" runat="server" Text="Edit" CssClass="btn btn-outline-danger" OnClick="btn_Edit_Click" />
                                                                <asp:Button ID="btn_Update" runat="server" Text="Update" CssClass="btn btn-danger" OnClick="btn_Update_Click" />
                                                                <asp:Button ID="btn_Save" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btn_Save_Click" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
