<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employee_Registration.aspx.cs"
    Inherits="Admin_Employee_Registration" %>

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
        history.pushState(null, null, 'Employee_Registration.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Employee_Registration.aspx');
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
                                <strong>Employee Registration</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Employee Code</label><span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtEmpCode" place CssClass="form-control" autocomplete="Off" runat="server"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server"
                                            BehaviorID="txtEmpCode_FilteredTextBoxExtender" FilterType="Numbers" TargetControlID="txtEmpCode">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Name of the Employee</label><span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtEmpName" CssClass="form-control" placeholder="Enter Name ofEmployee"
                                            autocomplete="Off" runat="server">
                                        </asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtEmpName_FilteredTextBoxExtender1" runat="server"
                                            BehaviorID="txtEmpName_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtEmpName" ValidChars=" .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Surname</label><span class="mandatory">*</span>
                                    </div>
                                    <div class=" col-md-4">
                                        <asp:TextBox ID="txtSurName" CssClass="form-control" runat="server" placeholder=" Enter Surname"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtSurName_FilteredTextBoxExtender" runat="server"
                                            BehaviorID="txtSurName_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtSurName" ValidChars=" .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Father / Husband name</label><span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtHusFatName" CssClass="form-control" runat="server" placeholder="Enter Father / Husband name"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtHusFatName_FilteredTextBoxExtender" runat="server"
                                            BehaviorID="txtHusFatName_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtHusFatName" ValidChars=" .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Mother's name
                                        </label>
                                        <span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtMotherName" CssClass="form-control" runat="server" placeholder="Enter Mother's name"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtMotherName_FilteredTextBoxExtender" runat="server"
                                            BehaviorID="txtMotherName_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtMotherName" ValidChars=" .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Nationality
                                        </label>
                                        <span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlNational" CssClass="form-control" runat="server">
                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="INDIAN" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="OTHERS" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Gender
                                        </label>
                                        <span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlGender" CssClass="form-control" runat="server">
                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                                            <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Date Of Birth
                                        </label>
                                        <span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtDOB" CssClass="form-control cal" AutoComplete="off" runat="server"
                                            placeholder="dd/mm/yyyy"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Category
                                        </label>
                                        <span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server">
                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="OC" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="BC" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="SC" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="ST" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="OTHERS" Value="5"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Religion
                                        </label>
                                        <span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddlReligion" CssClass="form-control" runat="server">
                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="HINDU" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="CHRISTAIN" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="MUSLIM" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="OTHERS" Value="5"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Mother Tongue</label><span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtMotherTng" CssClass="form-control" runat="server" placeholder="Enter Mother Tongue"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtMotherTng_FilteredTextBoxExtender" runat="server"
                                            BehaviorID="txtMotherTng_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtMotherTng" ValidChars=" .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Marital Status
                                        </label>
                                        <span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:RadioButtonList ID="rdbMrgSta" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="Married">Yes</asp:ListItem>
                                            <asp:ListItem Value="UnMarried">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <div class="row form-group">
                                            <div class="col col-md-2">
                                                <label class=" form-control-label">
                                                    Differently Abled</label><span class="mandatory">*</span>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:RadioButtonList ID="rdbDiffAbled" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                                                    OnSelectedIndexChanged="rdbDiffAbled_SelectedIndexChanged">
                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                    <asp:ListItem Value="0">No</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                            <div class="col col-md-2">
                                                <label class=" form-control-label">
                                                    % of Disability
                                                </label>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:TextBox ID="txtDisability" CssClass="form-control" autocomplete="Off" runat="server">
                                                </asp:TextBox>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server"
                                                    BehaviorID="txtDisability_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                    TargetControlID="txtDisability" ValidChars="/ .,()-">
                                                </ajaxToolkit:FilteredTextBoxExtender>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="rdbDiffAbled" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Identification Marks 1</label><span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtIdentMarkOne" CssClass="form-control" placeholder="Enter Identification Marks 1"
                                            autocomplete="Off" runat="server">
                                        </asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtIdentMarkOne_FilteredTextBoxExtender"
                                            runat="server" BehaviorID="txtIdentMarkOne_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtIdentMarkOne" ValidChars="/ .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class="form-control-label">
                                            Identification Marks 2</label><span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtIdentMarkTwo" CssClass="form-control" autocomplete="Off" placeholder="Enter Identification Marks "
                                            runat="server">
                                        </asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                            BehaviorID="txtIdentMarkTwo_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtIdentMarkTwo" ValidChars="/ .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                </div>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <div class="row form-group">
                                            <div class="col col-md-2">
                                                <label class=" form-control-label">
                                                    Home State</label><span class="mandatory">*</span>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="ddlHomeSate" CssClass="form-control" AutoPostBack="true" runat="server"
                                                    OnSelectedIndexChanged="ddlHomeSate_SelectedIndexChanged1">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col col-md-2">
                                                <label class=" form-control-label">
                                                    Home District</label><span class="mandatory">*</span>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="ddlHomeDistrict" CssClass="form-control" runat="server">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="ddlHomeSate" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            LTC Home Town</label><span class="mandatory">*</span>
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
                                        <label class=" form-control-label">
                                            Nearest Railway Station</label><span class="mandatory">*</span>
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
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <div class="row form-group">
                                            <div class="col col-md-2">
                                                <label class=" form-control-label">
                                                    State</label><span class="mandatory">*</span>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="ddlState" CssClass="form-control" runat="server" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlState_SelectedIndexChanged1">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col col-md-2">
                                                <label class=" form-control-label">
                                                    District</label><span class="mandatory">*</span>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="ddlPresentDistrict" CssClass="form-control" runat="server">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="ddlState" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Full Address</label><span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtPrAddress" placeholder="Enter  Full Address" TextMode="MultiLine"
                                            CssClass="form-control" runat="server">
                                        </asp:TextBox>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Pin code</label><span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtPinCode" placeholder="Enter Pin code" MaxLength="6" CssClass="form-control"
                                            autocomplete="Off" runat="server">
                                        </asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtPinCode_FilteredTextBoxExtender" runat="server"
                                            BehaviorID="txtPinCode_FilteredTextBoxExtender" FilterType="Numbers" TargetControlID="txtPinCode">
                                        </ajaxToolkit:FilteredTextBoxExtender>
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
                        <div class="card">
                            <div class="card-header">
                                <strong>Permanent Address</strong>
                                <asp:CheckBox ID="chkSame" AutoPostBack="true" runat="server" OnCheckedChanged="chkSame_CheckedChanged" />
                                (Check if Same As Present Address)
                            </div>
                            <div class="card-body card-block">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <div class="row form-group">
                                            <div class="col col-md-2">
                                                <label class=" form-control-label">
                                                    State</label><span class="mandatory">*</span>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="ddlPerState" CssClass="form-control" runat="server" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlPerState_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </div>
                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                            <div class="col col-md-2">
                                                <label class=" form-control-label">
                                                    District</label><span class="mandatory">*</span>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:DropDownList ID="ddlPerDistrict" CssClass="form-control" runat="server">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="ddlPerState" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Full Address</label><span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtPermAddress" placeholder="Enter Full Address" CssClass="form-control"
                                            autocomplete="Off" runat="server">
                                        </asp:TextBox>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Pin code</label><span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtPerPinCode" MaxLength="6" placeholder="Enter Pin code" CssClass="form-control"
                                            autocomplete="Off" runat="server">
                                        </asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server"
                                            BehaviorID="txtPinCode_FilteredTextBoxExtender" FilterType="Numbers" TargetControlID="txtPinCode">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                </div>
                                <div class="row form-group">
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
                        <div class="card">
                            <div class="card-header">
                                <strong>Contact Details</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            E Mail</label><span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtempemail" placeholder="Enter E Mail" CssClass="form-control"
                                            MaxLength="50" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtempemail"
                                            ValidationGroup="g1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ForeColor="Red" ErrorMessage="Give valid Email Id" Font-Size="Smaller"></asp:RegularExpressionValidator>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtempemail_FilteredTextBoxExtender" runat="server"
                                            BehaviorID="txtempemail_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers, custom"
                                            TargetControlID="txtempemail" ValidChars=" .,()-@">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Phone No</label><span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtPhNo" placeholder="Enter Phone No" CssClass="form-control" autocomplete="Off"
                                            MaxLength="10" runat="server">
                                        </asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtPhNo_FilteredTextBoxExtender" runat="server"
                                            BehaviorID="txtPhNo_FilteredTextBoxExtender" FilterType="Numbers" TargetControlID="txtPhNo">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Mobile
                                        </label>
                                        <span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtMobile" placeholder="Enter Mobile No" CssClass="form-control"
                                            autocomplete="Off" MaxLength="10" runat="server">
                                        </asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtMobile_FilteredTextBoxExtender4" runat="server"
                                            BehaviorID="txtMobile_FilteredTextBoxExtender" FilterType="Numbers" TargetControlID="txtMobile">
                                        </ajaxToolkit:FilteredTextBoxExtender>
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
                        <div class="card">
                            <div class="card-header">
                                <strong>Identity</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Aadhar Number</label><span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtAdharNum" placeholder="Enter Aadhar Number" CssClass="form-control"
                                            MaxLength="12" autocomplete="Off" runat="server">
                                        </asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtAdharNum_FilteredTextBoxExtender" runat="server"
                                            BehaviorID="txtAdharNum_FilteredTextBoxExtender" FilterType="Numbers" TargetControlID="txtAdharNum"
                                            ValidChars="/ .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            PAN Number</label><span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtPanNum" placeholder="Enter PAN Number" CssClass="form-control"
                                            MaxLength="12" autocomplete="Off" runat="server">
                                        </asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtPanNum_FilteredTextBoxExtender" runat="server"
                                            BehaviorID="txtPanNum_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtPanNum" ValidChars="/ .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
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
                        <div class="card">
                            <div class="card-header">
                                <strong>Photo and Signature</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Photo of Employee</label><span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:FileUpload ID="fluPhoto" CssClass="form-control" runat="server" />
                                        <span style="color: #FF0000;"><strong>(.JPG .PNG Only.&nbsp; Max length 2MB Only)</strong></span>
                                        <br />
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Signature of Employee</label><span class="mandatory">*</span>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:FileUpload ID="fluSig" CssClass="form-control" runat="server" />
                                        <span style="color: #FF0000;"><strong>(.JPG&nbsp; Max length 2MB Only)</strong></span>
                                        <br />
                                    </div>
                                </div>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col-md-4">
                                        <asp:Image ID="Img1" Visible="false" runat="server" />
                                    </div>
                                    <div class="col col-md-4">
                                        <asp:Image ID="Img2" Visible="false" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <asp:Button ID="BtnSave" class="btn btn-primary" runat="server" Text="SAVE" OnClick="BtnSave_Click1" />
                            <asp:Button ID="BtnUpdate" class="btn btn-primary" runat="server" Text="UPDATE" OnClick="BtnUpdate_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-body card-block">
                <div class="row form-group">
                    <div class="col col-md-12">
                        <div class="table-responsive">
                            <asp:GridView ID="GvEmployee" runat="server" OnRowCommand="GvEmployee_RowCommand"
                                CssClass="table table-striped table-bordered dataTable no-footer" GridLines="None"
                                AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="Employee Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpID" runat="server" Text='<%# Bind("EmpCode") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblEmployee_ID" Visible="false" runat="server" Text='<%# Bind("Employee_ID") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Employee Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpName" runat="server" Text='<%# Bind("EmpName") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Employee Father Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFName" runat="server" Text='<%# Bind("EmpFname") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Details" Visible="false">
                                        <ItemTemplate>
                                            <%--<asp:Label ID="lblSurName" runat="server" Visible="false" Text='<%# Bind("SurName") %>'>
                                            </asp:Label>--%>
                                            <asp:Label ID="lblEmpFname" runat="server" Visible="false" Text='<%# Bind("EmpFname") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblNationalitys" runat="server" Visible="false" Text='<%# Bind("Nationalitys") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblGENDER" runat="server" Visible="false" Text='<%# Bind("GENDER") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblDOB" runat="server" Visible="false" Text='<%# Bind("DOB") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblCommunity" runat="server" Visible="false" Text='<%# Bind("Community") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblCasteName" runat="server" Visible="false" Text='<%# Bind("CasteName") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblReligion" runat="server" Visible="false" Text='<%# Bind("Religion") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblMrgStatus" runat="server" Visible="false" Text='<%# Bind("MrgStatus") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblDifferentAbled" runat="server" Visible="false" Text='<%# Bind("DifferentAbled") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblDisabilty_Percentage" runat="server" Visible="false" Text='<%# Bind("Disabilty_Percentage") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblIdentMarkOne" runat="server" Visible="false" Text='<%# Bind("IdentMarkOne") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblIdentMarkTwo" runat="server" Visible="false" Text='<%# Bind("IdentMarkTwo") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblHomeSate" runat="server" Visible="false" Text='<%# Bind("HomeSate") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblHomeDistrict" runat="server" Visible="false" Text='<%# Bind("HomeDistrict") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblLTCHomeTown" runat="server" Visible="false" Text='<%# Bind("LTCHomeTown") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblPerStateCode" runat="server" Visible="false" Text='<%# Bind("PerStateCode") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblPerDistCode" runat="server" Visible="false" Text='<%# Bind("PerDistCode") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblPerAddress" runat="server" Visible="false" Text='<%# Bind("PerAddress") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblStateCode" runat="server" Visible="false" Text='<%# Bind("StateCode") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblDistCode" runat="server" Visible="false" Text='<%# Bind("DistCode") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblAddress" runat="server" Visible="false" Text='<%# Bind("Address") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblPinCode" runat="server" Visible="false" Text='<%# Bind("PinCode") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblphone" runat="server" Visible="false" Text='<%# Bind("phone") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Employee Mother Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMotherName" runat="server" Text='<%# Bind("MotherName") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Employee Mother Toung">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMotherTng" runat="server" Text='<%# Bind("MotherTng") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Near RailwayStation ">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNearRailStation" runat="server" Text='<%# Bind("NearRailStation") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mobile">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMobile" runat="server" Text='<%# Bind("Mobile") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="AdharCard">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAadhar" runat="server" Text='<%# Bind("Aadhar") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Pan Card">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPanNo" runat="server" Text='<%# Bind("PanNo") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Pincode">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPerPinCode" runat="server" Text='<%# Bind("PerPinCode") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Photo">
                                        <ItemTemplate>
                                            <asp:Image ID="lblPhcontent" runat="server" ImageUrl=' <%# GetImage(Eval("Phcontent"))%>'>
                                            </asp:Image>
                                             <asp:Label ID="lblPhfileNm" runat="server" Visible="false" Text='<%# Bind("PhfileNm") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblPhfileType" runat="server" Visible="false" Text='<%# Bind("PhfileType") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Signature">
                                        <ItemTemplate>
                                            <asp:Image ID="lblSigcontent" runat="server" ImageUrl=' <%# GetImage(Eval("Sigcontentt"))%>'>
                                            </asp:Image>
                                             <asp:Label ID="lblSigfileNme" runat="server" Visible="false" Text='<%# Bind("SigfileNme") %>'>
                                            </asp:Label>
                                            <asp:Label ID="lblSigfileTypee" runat="server" Visible="false" Text='<%# Bind("SigfileTypee") %>'>
                                            </asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Update" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnEdit" Enabled='<%# Eval("Freeze").ToString()=="1" ? false  :  true %>' runat="server" formnovalidate="formnovalidate" CommandName="Edt"
                                                Text="Edit"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnDelete" runat="server" Enabled='<%# Eval("Freeze").ToString()=="1" ? false  :  true %>' formnovalidate="formnovalidate" CommandName="Dlt"
                                                OnClientClick="return Confirm(this)" Text="Delete"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Freeze">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnFreeze" runat="server" Enabled='<%# Eval("Freeze").ToString()=="1" ? false  :  true %>' formnovalidate="formnovalidate" CommandName="frz"
                                                Text="Freeze"></asp:LinkButton>
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
