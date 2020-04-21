<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Recruitment.aspx.cs" Inherits="Recruitment" %>

<%@ Register TagPrefix="Menu" TagName="menu" Src="~/Menu.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="Header_New.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SVPNPA</title>
    <link rel="icon" href="../Assests/images/sv.png" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Assests/Css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Assests/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="Assests/themify-icons/css/themify-icons.css" rel="stylesheet" type="text/css" />
    <link href="Assests/flag-icon-css/css/flag-icon.min.css" rel="stylesheet" type="text/css" />
    <link href="Assests/Css/cs-skin-elastic.css" rel="stylesheet" type="text/css" />
    <link href="Assests/Css/style.css" rel="stylesheet" type="text/css" />
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet'
        type='text/css' />
    <link href="Assests/Css/TopMenu.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Assests/Js/jquery.min.js"></script>
    <script src="Assests/Js/jquery-ui.js" type="text/javascript"></script>
    <link href="Assests/Css/Jquery_UI.css" rel="stylesheet" type="text/css" />
    <script src="Assests/Js/Verhoeff.js" type="text/javascript"></script>
    <script src="Assests/Js/Jquery_FormValidation_Engine_1.js" type="text/javascript"></script>
    <script src="Assests/Js/JQuery_FormValidation_Engines.js" type="text/javascript"></script>
    <link href="Assests/Css/ValidationEngine.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('#txtDOB').datepicker({
                dateFormat: 'dd-mm-yy',
                changeMonth: true,
                changeYear: true,
                yearRange: "-50:+0"
            });

            $('#btn_Save').click(function () {
                $("#form1").validationEngine('attach', { promptPosition: "topRight" });
                var idNo4 = $('#txtAadhaar').val();
                if (idNo4.length < 12 && idNo4 != '') {
                    alert("Invalid Aadhar No");
                    $("#txtAadhaar").focus();
                    return false;
                }
                if (idNo4.verhoeffCheck() == false) {

                    alert("Invalid Aadhar No");
                    $("#txtAadhaar").focus();
                    return false;
                }
            });

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <Header_New:header ID="Header1" runat="server" />
    <Menu:menu ID="menu" runat="server" />
    <div class="sufee-login d-flex align-content-center flex-wrap">
        <div class="container-fluid">
            <br />
            <br />
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="card">
                        <div class="card-header">
                            <strong>RECRUITMENT FOR THE POST-</strong>
                            <asp:Label ID="lblPostName" runat="server"></asp:Label><br />
                            <strong>Description-</strong>
                            <asp:Label ID="lblDesc" runat="server"></asp:Label><br />
                            <div class="row form-group">
                                <div class="col-md-6 text-left">
                                    <strong>Last Date-</strong>
                                    <asp:Label ID="lbldate" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-6 text-right">
                                    <strong>Post Type-</strong>
                                    <asp:Label ID="lblPostType" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="content mt-3">
                            <div class="animated fadeIn">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card">
                                      <span class="text-danger"> Note:All Fields are mandatory</span> 
                                            <div class="card-header clr">
                                                <strong>Personal Details </strong>
                                            </div>
                                            <div class="card-body card-block">
                                                <div class="row form-group">
                                                    <div class="col col-md-2 text-left">
                                                        <label class=" form-control-label">
                                                            Name(in full)</label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:TextBox ID="txtName" CssClass="form-control" runat="server" autocomplete="Off"
                                                            placeholder="Name"> </asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtName_FilteredTextBoxExtender" runat="server"
                                                            BehaviorID="txtName_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,custom"
                                                            TargetControlID="txtName" ValidChars=" .">
                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                    </div>
                                                    <div class="col col-md-2 text-left">
                                                        <label class=" form-control-label">
                                                            Father's Name</label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:TextBox ID="txtFName" CssClass="form-control" runat="server" autocomplete="Off"
                                                            placeholder="Father's Name"> </asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtFName_FilteredTextBoxExtender" runat="server"
                                                            BehaviorID="txtFName_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,custom"
                                                            TargetControlID="txtFName" ValidChars=" .">
                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                    </div>
                                                    <div class="col col-md-2 text-left">
                                                        <label class=" form-control-label">
                                                            Date of Birth(As Per 10th Marks Sheet)</label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:TextBox ID="txtDOB" CssClass="form-control" runat="server" autocomplete="Off"
                                                            placeholder="Date of Birth" AutoPostBack="true" 
                                                            ontextchanged="txtDOB_TextChanged"  > </asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtDOB_FilteredTextBoxExtender" runat="server"
                                                            BehaviorID="txtDOB_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                            TargetControlID="txtDOB" ValidChars="/-">
                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                        <asp:Label ID="lblAge" runat="server" Visible="false"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-2 text-left">
                                                        <label class=" form-control-label">
                                                            Caste/Community</label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:DropDownList ID="ddlCaste" runat="server" CssClass="form-control">
                                                        </asp:DropDownList>
                                                        <%-- <asp:TextBox ID="txtCaste" CssClass="form-control" runat="server" autocomplete="Off"
                                                            placeholder="Caste/Community"> </asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtCaste_FilteredTextBoxExtender1" runat="server"
                                                            BehaviorID="txtCaste_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                            TargetControlID="txtCaste" ValidChars=" .,()-">
                                                        </ajaxToolkit:FilteredTextBoxExtender>--%>
                                                    </div>
                                                    <div class="col col-md-2 text-left">
                                                        <label class=" form-control-label">
                                                            Nationality</label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:DropDownList ID="ddlNationality" runat="server" CssClass="form-control">
                                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                                            <asp:ListItem Value="1">Indian</asp:ListItem>
                                                            <asp:ListItem Value="2">Others</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <%-- <asp:TextBox ID="txtNationality" CssClass="form-control" runat="server" autocomplete="Off"
                                                            placeholder="Nationality"> </asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNationality_FilteredTextBoxExtender2"
                                                            runat="server" BehaviorID="txtNationality_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                            TargetControlID="txtNationality" ValidChars=" .,()-">
                                                        </ajaxToolkit:FilteredTextBoxExtender>--%>
                                                    </div>
                                                    <div class="col col-md-2 text-left">
                                                        <label class=" form-control-label">
                                                            Gender</label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:RadioButtonList ID="rbGender" runat="server" RepeatDirection="Horizontal">
                                                            <asp:ListItem Value="1">Male</asp:ListItem>
                                                            <asp:ListItem Value="2">Female</asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-2 text-left">
                                                        <label class=" form-control-label">
                                                            Religion</label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:DropDownList ID="ddlReligion" runat="server" CssClass="form-control">
                                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                                            <asp:ListItem Value="1">Hindu</asp:ListItem>
                                                            <asp:ListItem Value="2">Christian</asp:ListItem>
                                                            <asp:ListItem Value="3">Muslim</asp:ListItem>
                                                            <asp:ListItem Value="4">Others</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <%-- <asp:TextBox ID="txtReligion" CssClass="form-control" runat="server" autocomplete="Off"
                                                            placeholder="Religion"> </asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtReligion_FilteredTextBoxExtender" runat="server"
                                                            BehaviorID="txtReligion_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                            TargetControlID="txtReligion" ValidChars=" .,()-">
                                                        </ajaxToolkit:FilteredTextBoxExtender>--%>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-header clr">
                                                <strong>Address Details </strong>
                                            </div>
                                            <div class="card-body card-block">
                                                <div class="row form-group">
                                                    <div class="col col-md-2 text-left">
                                                        <label class=" form-control-label">
                                                            Address(Full)</label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:TextBox ID="txtAdd" CssClass="form-control" runat="server" autocomplete="Off"
                                                            TextMode="MultiLine" placeholder="Address"> </asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtAdd_FilteredTextBoxExtender" runat="server"
                                                            BehaviorID="txtAdd_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                            TargetControlID="txtAdd" ValidChars=" .,()-:/\">
                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                    </div>
                                                    <div class="col col-md-2 text-left">
                                                        <label class=" form-control-label">
                                                            Permanent Address</label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:TextBox ID="txtPAdd" CssClass="form-control" runat="server" autocomplete="Off"
                                                            TextMode="MultiLine" placeholder="Permanent Address"> </asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtPAdd_FilteredTextBoxExtender2" runat="server"
                                                            BehaviorID="txtPAdd_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                            TargetControlID="txtPAdd" ValidChars=" .,()-:/\">
                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                    </div>
                                                    <div class="col col-md-2 text-left">
                                                        <label class=" form-control-label">
                                                            Phone/Mobile Number</label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:TextBox ID="txtMob" CssClass="form-control" runat="server" autocomplete="Off"
                                                            MaxLength="10" placeholder="Phone/Mobile Number"> </asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtMob_FilteredTextBoxExtender" runat="server"
                                                            BehaviorID="txtMob_FilteredTextBoxExtender" FilterType="Numbers,custom" TargetControlID="txtMob"
                                                            ValidChars="">
                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-2 text-left">
                                                        <label class=" form-control-label">
                                                            Email</label>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:TextBox ID="txtEmail" CssClass="form-control validate[custom[email]]" runat="server"
                                                            autocomplete="Off" placeholder="Email"> </asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtEmail_FilteredTextBoxExtender" runat="server"
                                                            BehaviorID="txtEmail_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                            TargetControlID="txtEmail" ValidChars=".@">
                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                    </div>
                                                    <div class="col-md-2 text-left">
                                                        Aadhaar Number
                                                    </div>
                                                    <div class="col-md-2">
                                                        <asp:TextBox ID="txtAadhaar" MaxLength="12" class="form-control" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                                                        <ajax:FilteredTextBoxExtender ID="txtAadhaar_FilteredTextBoxExtender1" runat="server"
                                                            Enabled="True" TargetControlID="txtAadhaar" FilterType="Numbers">
                                                        </ajax:FilteredTextBoxExtender>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-header clr">
                                                <strong>Qualification Details</strong>
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
                                                                            <%--  <asp:Label ID="lblexam" runat="server" Visible="false" Text='<%# Bind("Exam") %>'> ></asp:Label>--%>
                                                                            <asp:Label ID="lblQualiCd" runat="server" Visible="false" Text='<%# Bind("Qualification_Code") %>'> ></asp:Label>
                                                                            <asp:DropDownList ID="ddlqualification" runat="server" CssClass="form-control">
                                                                            </asp:DropDownList>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Percentage of Marks">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtPerMarks" runat="server" MaxLength="4" CssClass="form-control"
                                                                                Text='<%# Bind("Percentage_Marks") %>'>></asp:TextBox>
                                                                            <ajaxToolkit:FilteredTextBoxExtender ID="txtPerMarks_FilteredTextBoxExtender" runat="server"
                                                                                BehaviorID="txtPerMarks_FilteredTextBoxExtender" FilterType="Numbers,custom"
                                                                                TargetControlID="txtPerMarks" ValidChars=".">
                                                                            </ajaxToolkit:FilteredTextBoxExtender>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Year of Passing">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtyearofpassing" runat="server" CssClass="form-control" MaxLength="4"
                                                                                Text='<%# Bind("Year_of_Passing") %>'>></asp:TextBox>
                                                                            <ajaxToolkit:FilteredTextBoxExtender ID="txtyearofpassing_FilteredTextBoxExtender"
                                                                                runat="server" BehaviorID="txtyearofpassing_FilteredTextBoxExtender" FilterType="Numbers,custom"
                                                                                TargetControlID="txtyearofpassing" ValidChars="-">
                                                                            </ajaxToolkit:FilteredTextBoxExtender>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Board/University">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="txtbruniersity" runat="server" CssClass="form-control" Text='<%# Bind("University") %>'>></asp:TextBox>
                                                                            <ajaxToolkit:FilteredTextBoxExtender ID="txtbruniersity_FilteredTextBoxExtender"
                                                                                runat="server" BehaviorID="txtbruniersity_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                                                TargetControlID="txtbruniersity" ValidChars=" .-">
                                                                            </ajaxToolkit:FilteredTextBoxExtender>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="Exp" runat="server" visible="false">
                                                <div class="card-header clr">
                                                    <strong>Experiance Details</strong>
                                                </div>
                                                <div class="card-body card-block">
                                                    <div class="row form-group">
                                                        <div class="col col-md-12">
                                                            <div class="table-responsive">
                                                                <asp:GridView ID="GVExp" runat="server" CssClass="table table-striped table-bordered dataTable no-footer"
                                                                    GridLines="None" AutoGenerateColumns="False" ShowFooter="true" OnRowCommand="GVExp_RowCommand">
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
                                                                        <asp:TemplateField HeaderText="Post Name">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtPostName" runat="server" CssClass="form-control" Text='<%# Bind("Post_Name") %>'>></asp:TextBox>
                                                                                <ajaxToolkit:FilteredTextBoxExtender ID="txtPostName_FilteredTextBoxExtender" runat="server"
                                                                                    BehaviorID="txtPostName_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                                                    TargetControlID="txtPostName" ValidChars=" ">
                                                                                </ajaxToolkit:FilteredTextBoxExtender>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="No.of years experiance">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtExp" runat="server" CssClass="form-control" Text='<%# Bind("Exp") %>'>></asp:TextBox>
                                                                                <ajaxToolkit:FilteredTextBoxExtender ID="txtExp_FilteredTextBoxExtender" runat="server"
                                                                                    BehaviorID="txtExp_FilteredTextBoxExtender" FilterType="Numbers,custom" TargetControlID="txtExp"
                                                                                    ValidChars=".">
                                                                                </ajaxToolkit:FilteredTextBoxExtender>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Govt./Private">
                                                                            <ItemTemplate>
                                                                                <asp:TextBox ID="txtSector" runat="server" CssClass="form-control" Text='<%# Bind("Sector") %>'>></asp:TextBox>
                                                                                <ajaxToolkit:FilteredTextBoxExtender ID="txtSector_FilteredTextBoxExtender" runat="server"
                                                                                    BehaviorID="txtSector_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                                                    TargetControlID="txtSector" ValidChars="">
                                                                                </ajaxToolkit:FilteredTextBoxExtender>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                       <%-- <div class="col-md-6">
                                                            <strong>
                                                                <asp:CheckBox ID="chk" runat="server" Text="Please bring original certificates for the interview" />
                                                            </strong>
                                                        </div>--%>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-header clr">
                                                <strong>Document Uploads</strong>
                                            </div>
                                            <div class="card-body card-block">
                                                <div class="row form-group">
                                                    <div class="col col-md-2 text-left">
                                                        <label class=" form-control-label">
                                                            Photo Upload</label>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:FileUpload ID="fluPhoto" runat="server" />
                                                    </div>
                                                    <div class="col col-md-2 text-left">
                                                        <label class=" form-control-label">
                                                            Signature Upload</label>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <asp:FileUpload ID="fluSig" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body card-block">
                                            <div class="col-md-12 text-left">
                                              Disclaimer:  <strong>
                                                  <asp:CheckBox ID="chkDisclaimer" runat="server" />  <asp:Label ID="lblDisclaimer" runat="server" Text="Label"></asp:Label></strong>
                                            </div>
                                        </div>
                                        <div class="row form-group col-md-3 offset-6">

                                            <asp:Button ID="btn_Save" runat="server" Text="Submit" CssClass="btn btn-primary"
                                                OnClick="btn_Save_Click" />
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
    </div>
    <asp:HiddenField ID="hf" runat="server" />
    <div class="container-fluid">
        <div class="row" style="padding-top: 5%;">
            <div class="col-md-12
    text-center" style="background-color: #4a93a0; color: White; padding: 10px">
                Site Designed, Developed and Hosted by NIC (TS), Hyderabad.<img src="Assests/images/nic-logo.png"
                    alt="Nic Logo" />
            </div>
        </div>
    </div>
    <script src="Assests/Js/jquery.min.js" type="text/javascript"></script>
    <script src="Assests/Js/popper.min.js" type="text/javascript"></script>
    <script src="Assests/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="Assests/Js/bootstrap.min.js" type="text/javascript"></script>
    <script src="Assests/Js/main.js" type="text/javascript"></script>
    </form>
</body>
</html>
