<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateEmployee_Registration.aspx.cs"
    Inherits="Admin_UpdateEmployee_Registration" %>

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
        history.pushState(null, null, 'UpdateEmployee_Registration.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'UpdateEmployee_Registration.aspx');
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
                                <strong>Update Employee Registration </strong>
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
                                        <asp:DropDownList ID="ddlemployee" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <div class=" col-md-4">
                                        <asp:Button ID="Btnget" CssClass="btn btn-primary" runat="server" Text="GetData"
                                            OnClick="Btnget_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:Panel ID="empanle" runat="server" Visible="false">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <strong>Update Employee Registration</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                Marital Status
                                            </label>
                                        </h4>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:RadioButtonList ID="rdbMrgSta" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="Married">Yes</asp:ListItem>
                                            <asp:ListItem Value="UnMarried">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                     
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                LTC Home Town</label></h4>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtLicHomeTwn" CssClass="form-control" placeholder="Enter LTC Home Town"
                                            autocomplete="Off" runat="server">
                                        </asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtLicHomeTwn_FilteredTextBoxExtender" runat="server"
                                            BehaviorID="txtLicHomeTwn_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtLicHomeTwn" ValidChars="/ .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                Nearest Railway Station</label></h4>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtNrRailStn" CssClass="form-control" placeholder="Enter  Nearest Railway Station"
                                            autocomplete="Off" runat="server">
                                        </asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNrRailStn_FilteredTextBoxExtender" runat="server"
                                            BehaviorID="txtNrRailStn_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtNrRailStn" ValidChars="/ .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- .animated -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <strong>Present Address </strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                State</label></h4>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlState" CssClass="form-control" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                District</label></h4>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlPresentDistrict" CssClass="form-control" runat="server"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddlPresentDistrict_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <h4>
                                            <label class=" form-control-label">
                                                Pin code</label></h4>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtPinCode" placeholder="Enter Pin code" MaxLength="6" CssClass="form-control"
                                            autocomplete="Off" runat="server">
                                        </asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtPinCode_FilteredTextBoxExtender" runat="server"
                                            BehaviorID="txtPinCode_FilteredTextBoxExtender" FilterType="Numbers,custom" TargetControlID="txtPinCode"
                                            ValidChars="/ .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <asp:Button ID="BtnUpdate" CssClass="btn btn-primary" CausesValidation="false" runat="server"
                                    Text="UPDATE" Visible="false" OnClick="BtnUpdate_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
    <asp:HiddenField ID="hf" runat="server" />
    <Footer:footer ID="footer" runat="server"></Footer:footer>
    </form>
</body>
</html>
