<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Join.aspx.cs" Inherits="Employee_Join" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="Menu" TagName="menu" Src="~/Employee/EmployeeMenu.ascx" %>
<%@ Register TagPrefix="Footer" TagName="footer" Src="~/Footer.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="~/Header_New.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        $(document).ready(function () {
            $('#txtFromdate').datepicker({
                dateFormat: 'dd/mm/yy',
                minDate: new Date(),
                changeMonth: true,
                changeYear: true,
                yearRange: "-0:+2"
            });

            $('#UpldLeavdoc').change(
                function () {
                    var fileExtension = ['pdf', 'doc'];
                    if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) == -1) {
                        alert("Only '.pdf','.doc' format's is allowed.");
                        this.value = ''; // Clean field
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
    <Menu:menu ID="menu" runat="server" />
    <div id="right-panel" class="right-panel">
        <Header_New:header ID="Header1" runat="server" />
        <div class="breadcrumbs">
            <div class="col-md-6 text-left">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1 style="float: left">
                            <font color="#fff">Logged In As:<asp:Label ID="lblUser" runat="server"></asp:Label></font></h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 text-right">
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
                                <strong>Joining Formalities</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col-md-12 text-center">
                                        <asp:GridView ID="GVJoin" runat="server" CssClass="table table-striped table-bordered dataTable no-footer"
                                            AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sl.No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Application Id">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblApplicationId" runat="server" Text='<%# Bind("ApplicationId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblType" runat="server" Text='<%# Bind("lvType") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Leave Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblleavetyCd" runat="server" Text='<%# Bind("LeaveType") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="lblLeave" runat="server" Text='<%# Bind("TypeName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Period">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFrom" runat="server" Text='<%# Bind("FromDate") %>'></asp:Label>
                                                        TO
                                                        <asp:Label ID="lblTo" runat="server" Text='<%# Bind("ToDate") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Leave Prefix">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPrefix" runat="server" Text='<%# Bind("Prefix") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Leave Suffix ">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSuffix" runat="server" Text='<%# Bind("Postfix") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Select to Join">
                                                    <ItemTemplate>
                                                        <asp:RadioButton ID="rbJoin" runat="server" AutoPostBack="true" OnCheckedChanged="rbJoin_CheckedChanged" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="row form-group" runat="server" id="divmain" visible="false">
                                    <div class="col-md-12 text-center">
                                        <div class="row form-group">
                                            <div class="col col-md-4">
                                                <h4>
                                                    <label class=" form-control-label">
                                                        I hereby report myself from the duty on
                                                    </label>
                                                </h4>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-2">
                                                <asp:TextBox ID="txtFromdate" CssClass="form-control" autocomplete="Off" MaxLength="10"
                                                    AutoPostBack="true" runat="server" placeholder="from date">
                                                </asp:TextBox>
                                                <ajax:FilteredTextBoxExtender ID="txtFromdate_FilteredTextBoxExtender3" ValidChars="/"
                                                    FilterType="Numbers,Custom" runat="server" BehaviorID="txtFromdate_FilteredTextBoxExtender"
                                                    TargetControlID="txtFromdate">
                                                </ajax:FilteredTextBoxExtender>
                                            </div>
                                            <div class="col col-md-2">
                                                <asp:DropDownList ID="ddlFrom" CssClass="form-control" runat="server" AutoPostBack="true">
                                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="Full day" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Fore Noon" Value="0.5"></asp:ListItem>
                                                    <asp:ListItem Text="After Noon" Value="0.5"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-2 text-left">
                                                <h4>
                                                    <label class=" form-control-label">
                                                        Upload File</label>
                                                </h4>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:FileUpload ID="UpldLeavdoc" runat="server" />
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col-md-12 text-center">
                                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-info rounded"
                                                    OnClick="btnSubmit_Click" />
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
            <!-- .animated -->
        </div>
        <!-- .content -->
        <div class="content mt-3">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                        </div>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <!-- .animated -->
        </div>
    </div>
    </form>
</body>
</html>
