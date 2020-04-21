<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Details_AppliedPerson.aspx.cs"
    Inherits="Details_AppliedPerson" %>

<%@ Register TagPrefix="Menu" TagName="menu" Src="~/SectionHead/Menu.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="~/Header_New.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
        history.pushState(null, null, 'Details_AppliedPerson.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Details_AppliedPerson.aspx');
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
        <Header_New:header ID="Header2" runat="server" />
        <div class="content mt-3">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="container-fluid">
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-lg-12 text-center">
                                    <div class="card">
                                        <div class="card-header">
                                            <strong>RECRUITMENT FOR THE POST-</strong>
                                            <asp:Label ID="lblPostName" runat="server"></asp:Label><br />
                                        </div>
                                        <div class="content mt-3">
                                            <div class="animated fadeIn">
                                                <div class="row">
                                                    <div class="col-lg-12 text-right">
                                                        <asp:Button ID="btnback" runat="server" CssClass="btn btn-warning" Text="Back" OnClick="btnback_Click" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="card">
                                                            <div class="card-header clr">
                                                                <strong>Personal Details </strong>
                                                            </div>
                                                            <div class="card-body card-block">
                                                                <div class="row">
                                                                    <div class="col-lg-12">
                                                                        <div class="card">
                                                                            <div class="card-header">
                                                                                <strong>Applied Person Details-
                                                                                    <asp:Label ID="lblapliid" runat="server" CssClass="alert alert-info" />
                                                                                </strong>
                                                                            </div>
                                                                            <div class="card-body card-block">
                                                                                <div class="row form-group">
                                                                                    <div class="col col-md-2">
                                                                                        <label class=" form-control-label">
                                                                                            Name:</label>
                                                                                    </div>
                                                                                    <div class="col-md-2">
                                                                                        <asp:Label ID="lblName" runat="server" Font-Bold="true">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                    <div class="col col-md-2">
                                                                                        <label class=" form-control-label">
                                                                                            Father's/Husband's Name:</label>
                                                                                    </div>
                                                                                    <div class="col-md-2">
                                                                                        <asp:Label ID="lblFName" runat="server" Font-Bold="true">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                    <div class="col col-md-2">
                                                                                        <label class=" form-control-label">
                                                                                            Date of Birth:</label>
                                                                                    </div>
                                                                                    <div class=" col-md-2">
                                                                                        <asp:Label ID="lblDob" runat="server" Font-Bold="true">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row form-group">
                                                                                    <div class="col col-md-2">
                                                                                        <label class=" form-control-label">
                                                                                            Caste:</label>
                                                                                    </div>
                                                                                    <div class="col-md-2">
                                                                                        <asp:Label ID="lblCaste" runat="server" Font-Bold="true">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                    <div class="col col-md-2">
                                                                                        <label class=" form-control-label">
                                                                                            Nationality:</label>
                                                                                    </div>
                                                                                    <div class="col-md-2">
                                                                                        <asp:Label ID="lblNationality" runat="server" Font-Bold="true"></asp:Label>
                                                                                    </div>
                                                                                    <div class="col col-md-2">
                                                                                        <label class=" form-control-label">
                                                                                            Gender:</label>
                                                                                    </div>
                                                                                    <div class="col-md-2">
                                                                                        <asp:Label ID="lblGender" runat="server" Font-Bold="true">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row form-group">
                                                                                    <div class="col col-md-2">
                                                                                        <label class=" form-control-label">
                                                                                            Address(Full):</label>
                                                                                    </div>
                                                                                    <div class="col-md-2">
                                                                                        <asp:Label ID="lblAddress" runat="server" Font-Bold="true">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                    <div class="col col-md-2">
                                                                                        <label class=" form-control-label">
                                                                                            Permanent Address:</label>
                                                                                    </div>
                                                                                    <div class="col-md-2">
                                                                                        <asp:Label ID="lblPAddress" runat="server" Font-Bold="true">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                    <div class="col col-md-2">
                                                                                        <label class=" form-control-label">
                                                                                            Mobile Number:</label>
                                                                                    </div>
                                                                                    <div class="col-md-2">
                                                                                        <asp:Label ID="lblMob" runat="server" Font-Bold="true">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row form-group">
                                                                                    <div class="col col-md-2">
                                                                                        <label class=" form-control-label">
                                                                                            Email:</label>
                                                                                    </div>
                                                                                    <div class="col-md-2">
                                                                                        <asp:Label ID="lblEmail" runat="server" Font-Bold="true">
                                                                                        </asp:Label>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="card-body card-block">
                                                                <div class="row form-group">
                                                                    <div class="col col-md-12">
                                                                        <div class="table-responsive">
                                                                            <asp:GridView ID="GvQualification" runat="server" CssClass="table table-striped table-bordered dataTable no-footer"
                                                                                AutoGenerateColumns="False">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="Qualification">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblQualification_Name" runat="server" Text='<%# Bind("Qualification_Name") %>'> ></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Percentage of Marks">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblPercentage_Marks" runat="server" Text='<%# Bind("Percentage_Marks") %>'> ></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Year of Passing">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblYear_of_Passing" runat="server" Text='<%# Bind("Year_of_Passing") %>'> ></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="Board/University">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblUniversity" runat="server" Text='<%# Bind("University") %>'> ></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <div class="card-header clr">
                                                                    <strong>Experiance Details</strong>
                                                                </div>
                                                                <div class="card-body card-block">
                                                                    <div class="row form-group">
                                                                        <div class="col col-md-12">
                                                                            <div class="table-responsive">
                                                                                <asp:GridView ID="GVExp" runat="server" CssClass="table table-striped table-bordered dataTable no-footer"
                                                                                    AutoGenerateColumns="False">
                                                                                    <Columns>
                                                                                        <asp:TemplateField HeaderText="Post Name">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblPost_Name" runat="server" Text='<%# Bind("Post_Name") %>'> ></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="No.of years experiance">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblExp" runat="server" Text='<%# Bind("Exp") %>'> ></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                        <asp:TemplateField HeaderText="Govt./Private">
                                                                                            <ItemTemplate>
                                                                                                <asp:Label ID="lblSector" runat="server" Text='<%# Bind("Sector") %>'> ></asp:Label>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="card-header clr">
                                                                <strong>Document Uploads</strong>
                                                            </div>
                                                            <div class="card-body card-block">
                                                                <div class="row form-group">
                                                                    <div class="col col-md-2 text-left">
                                                                        <h4>
                                                                            <label class=" form-control-label">
                                                                                Photo Upload</label></h4>
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <asp:Image ID="ImgPhoto" Height="150" Width="150" runat="server" />
                                                                    </div>
                                                                    <div class="col col-md-2 text-left">
                                                                        <h4>
                                                                            <label class=" form-control-label">
                                                                                Signature Upload</label></h4>
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <asp:Image ID="ImgSign" Height="150" Width="150" runat="server" />
                                                                    </div>
                                                                </div>
                                                                <div class="row form-group">
                                                                    <div class="col-md-6 text-right">
                                                                    </div>
                                                                    <div class="col-md-6 text-left">
                                                                        <asp:RadioButtonList ID="rdbType" TextAlign="Right" RepeatDirection="Horizontal"
                                                                            runat="server">
                                                                            <asp:ListItem Text="Approve" Value="A"></asp:ListItem>
                                                                            <asp:ListItem Text="Reject" Value="R"></asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </div>
                                                                </div>
                                                                <div class="row form-group">
                                                                    <div class="col-md-6 text-right">
                                                                        Remarks
                                                                    </div>
                                                                    <div class="col-md-6 text-left">
                                                                        <asp:TextBox ID="txtRemarks" TextMode="MultiLine" MaxLength="250" runat="server"></asp:TextBox>
                                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                                                            BehaviorID="txtRemarks_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,custom"
                                                                            TargetControlID="txtRemarks" ValidChars=". ">
                                                                        </ajaxToolkit:FilteredTextBoxExtender>
                                                                    </div>
                                                                </div>
                                                                <div class="row form-group">
                                                                    <div class="col-md-12 text-center">
                                                                        <asp:Button ID="btnAccept" runat="server" Text="Submit" CssClass="btn btn-success rounded"
                                                                            OnClick="btnAccept_Click" />
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
    </div>
    <script src="Assests/Js/jquery.min.js" type="text/javascript"></script>
    <script src="Assests/Js/popper.min.js" type="text/javascript"></script>
    <script src="Assests/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="Assests/Js/bootstrap.min.js" type="text/javascript"></script>
    <script src="Assests/Js/main.js" type="text/javascript"></script>
    </form>
</body>
</html>
