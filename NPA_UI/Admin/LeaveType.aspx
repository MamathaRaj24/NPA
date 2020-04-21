<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LeaveType.aspx.cs" Inherits="Admin_LeaveType" %>

<%@ Register TagPrefix="Menu" TagName="menu" Src="~/Admin/AdminMenu.ascx" %>
<%@ Register TagPrefix="Footer" TagName="footer" Src="~/Footer.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="~/Header_New.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
            if (confirm("Are you sure to delete the selected Leave Type?")) {
                return true;
            }
            else
                return false;
        }
    </script>
    <script type="text/javascript">
        history.pushState(null, null, 'LeaveType.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'LeaveType.aspx');
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
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <Menu:menu ID="menu" runat="server" />
    <div id="right-panel" class="right-panel">
        <Header_New:header ID="Header1" runat="server" />
        <div class="breadcrumbs">
            <div class="col-sm-6 text-left">
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
                                <strong>Leave Type Master</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Leave Type Name</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtLTName" CssClass="form-control" autocomplete="Off" MaxLength="50"
                                            runat="server">
                                        </asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtLTName_FilteredTextBoxExtender" runat="server"
                                            BehaviorID="txtLTName_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtLTName" ValidChars=" .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                        <asp:Label ID="lblLID" runat="server" Visible="false"></asp:Label>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Applicable for</label>
                                    </div>
                                    <div class=" col-md-3">
                                        <asp:DropDownList ID="ddlApplicable" CssClass="form-control" runat="server">
                                            <asp:ListItem Text="--Select--"></asp:ListItem>
                                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                            <asp:ListItem Text="Both" Value="Both"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Linked With Baby Birth</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RadioButtonList ID="rblBirth" runat="server" CssClass="form-control" RepeatDirection="Horizontal"
                                            AutoPostBack="True" OnSelectedIndexChanged="rblBirth_SelectedIndexChanged">
                                            <asp:ListItem Value="1">Yes </asp:ListItem>
                                            <asp:ListItem Value="0">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            No of Children Considered</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtnob" CssClass="form-control" autocomplete="Off" MaxLength="1"
                                            Enabled="false" runat="server" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Leaves per Child(No of Days)</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtEach" CssClass="form-control" autocomplete="Off" MaxLength="3"
                                            Enabled="false" runat="server" />
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Min Leaves At a Time(No of Days)</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtMinLvs" CssClass="form-control" autocomplete="Off" MaxLength="3"
                                            Enabled="false" runat="server" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Applies For</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="rdbAppliesFor" runat="server" CssClass="form-control">
                                            <asp:ListItem Value=" ">-Select-</asp:ListItem>
                                            <asp:ListItem Value="Half Yearly">Half Yearly </asp:ListItem>
                                            <asp:ListItem Value="Per Annum">Per Annum </asp:ListItem>
                                            <asp:ListItem Value="For Whole Service">For Whole Service</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            No.of leaves (No of Days)</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtNoOfLeaves" CssClass="form-control" autocomplete="Off" MaxLength="3"
                                            runat="server">
                                        </asp:TextBox>
                                        <ajax:FilteredTextBoxExtender ID="txtNoOfLeaves_FilteredTextBoxExtender2" FilterType="Numbers"
                                            runat="server" BehaviorID="txtNoOfLeaves_FilteredTextBoxExtender" TargetControlID="txtNoOfLeaves">
                                        </ajax:FilteredTextBoxExtender>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Max at a Time (No of Days)</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtMax" CssClass="form-control" autocomplete="Off" MaxLength="3"
                                            runat="server">
                                        </asp:TextBox>
                                        <ajax:FilteredTextBoxExtender ID="txtMax_FilteredTextBoxExtender1" FilterType="Numbers"
                                            runat="server" BehaviorID="txtMax_FilteredTextBoxExtender" TargetControlID="txtMax">
                                        </ajax:FilteredTextBoxExtender>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Status At the End Of Year</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RadioButtonList ID="rblLvType" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="L">Lapses </asp:ListItem>
                                            <asp:ListItem Value="A">Appends To Next Year</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Requires Joining</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RadioButtonList ID="rbRequiresJoining" runat="server" CssClass="form-control" RepeatDirection="Horizontal">
                                            
                                            <asp:ListItem Value="1">Yes </asp:ListItem>
                                            <asp:ListItem Value="0">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                           Can be Extended</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:RadioButtonList ID="rbExtended" runat="server" CssClass="form-control" RepeatDirection="Horizontal">
                                            <asp:ListItem Value="1">Yes </asp:ListItem>
                                            <asp:ListItem Value="0">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-md-12 text-center">
                                        <asp:Button ID="BtnSave" class="btn btn-info rounded" formnovalidate="formnovalidate"
                                            runat="server" Text="SAVE" OnClientClick=" return Hidebutton();" OnClick="BtnSave_Click" />
                                        <asp:Button ID="btnUpdate" CssClass="btn btn-info rounded" CausesValidation="false"
                                            runat="server" Text="UPDATE" Visible="false" OnClick="btnUpdate_Click" /></div>
                                </div>
                                <div class="row form-group">
                                    <asp:GridView ID="GvLeaves" runat="server" CssClass="table table-striped table-bordered"
                                        GridLines="None" AutoGenerateColumns="False" OnRowCommand="GvLeaves_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Sl.No">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Leave Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblLeaveCode" runat="server" Visible="false" Text='<%# Bind("TypeID") %>'>
                                                    </asp:Label>
                                                    <asp:Label ID="lblLeaveName" runat="server" Text='<%# Bind("TypeName") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Applicable For">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblapplicable" runat="server" Text='<%# Bind("ApplicableFor") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Applies For">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblappliesfor" runat="server" Text='<%# Bind("AppliesFor") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="No. of leaves">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNoleaves" runat="server" Text='<%# Bind("No_leaves") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Max at a Time">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMaxNo" runat="server" Text='<%# Bind("MaxAt_A_Time") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Linked With Baby Birth">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbllink" runat="server" Text='<%# Bind("LinkedWithBirth") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" No of Children Considered">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblnoc" runat="server" Text='<%# Bind("NoC_Considered") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText=" Leaves per Child">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblnocs" runat="server" Text='<%# Bind("LeavedAtEachBirth") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Min Leaves At A Time">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMinLeaves" runat="server" Text='<%# Bind("MinLeaves") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Year End Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblYrEndStatus" runat="server" Text='<%# Bind("YrEndStatus") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Requires Joining">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReqJoining" runat="server" Text='<%# Bind("RequiresJoining") %>'>
                                                    </asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Extended">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblExtended" runat="server" Text='<%# Bind("Extended") %>'>
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="hf" runat="server" />
            <footer:footer id="footer" runat="server"></footer:footer>
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
