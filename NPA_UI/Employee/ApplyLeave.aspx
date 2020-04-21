<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApplyLeave.aspx.cs" Inherits="Employee_ApplyLeave" %>

<%@ Register TagPrefix="Menu" TagName="menu" Src="~/Employee/EmployeeMenu.ascx" %>
<%@ Register TagPrefix="Footer" TagName="footer" Src="~/Footer.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="~/Header_New.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
            $('#txtToDate').datepicker({
                dateFormat: 'dd/mm/yy',
                 minDate: new Date(),
                changeMonth: true,
                changeYear: true,
                yearRange: "-0:+1"
            });
        });

        $(document).ready(function () {           
            $('.calFrom').datepicker({
                dateFormat: 'dd/mm/yy',
                minDate: new Date(),
                changeMonth: true,
                changeYear: true,
                numberOfMonths: 1,
               
            });

            $('.calTo').datepicker({
                dateFormat: 'dd/mm/yy',
                minDate: new Date(),
                changeMonth: true,
                changeYear: true,
                numberOfMonths: 1,
               
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
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1 style="float: left">
                            <font color="#fff">Logged In As:<asp:Label ID="lblUser" runat="server"></asp:Label></font></h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
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
                                <strong>Apply for a Leave</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col-md-12 text-center">
                                        <h4>
                                            <asp:RadioButtonList ID="RBLeave" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                                                OnSelectedIndexChanged="RBLeave_SelectedIndexChanged">
                                                <asp:ListItem Value="S" Selected="True">Single Leave Type</asp:ListItem>
                                                <asp:ListItem Value="C">Combination of Leave Type</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </h4>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-2 text-left">
                                        <h4>
                                            <label class=" form-control-label">
                                                Reasons</label></h4>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtReason" CssClass="form-control" runat="server" autocomplete="Off"
                                            placeholder="Reasons">
                                        </asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtReason_FilteredTextBoxExtender" runat="server"
                                            BehaviorID="txtReason_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtReason" ValidChars=" .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                </div>
                                <div class="row form-group" id="SLdiv" runat="server" visible="true">
                                    <div class="col-md-12">
                                        <div class="row form-group">
                                            <div class="col col-md-2">
                                                <h4>
                                                    <label class=" form-control-label">
                                                        Leave Type</label></h4>
                                            </div>
                                            <div class="col col-md-3">
                                                <asp:DropDownList ID="ddlLeave" CssClass="form-control" runat="server" AutoPostBack="true"
                                                    OnSelectedIndexChanged="ddlLeave_SelectedIndexChanged">
                                                    <asp:ListItem Text="--Select leave Type--" Value="0"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col col-md-2 text-right">
                                                <h4>
                                                    <label class=" form-control-label">
                                                        Leave Balance</label></h4>
                                            </div>
                                            <div class="col col-md-2 text-left">
                                                <asp:Label ID="txtLeaveBalance" runat="server" placeholder="Leave Balance">
                                                </asp:Label>
                                            </div>
                                            <div class="col col-md-1 text-right">
                                                <h4>
                                                    <label class=" form-control-label">
                                                        Max at a time</label></h4>
                                            </div>
                                            <div class="col col-md-2 text-center">
                                                <asp:Label ID="txtMax" runat="server" placeholder="Max at a time">
                                                </asp:Label>
                                            </div>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-2">
                                                <h4>
                                                    <label class=" form-control-label">
                                                        From date</label></h4>
                                            </div>
                                            <div class="col col-md-2">
                                                <asp:TextBox ID="txtFromdate" CssClass="form-control" autocomplete="Off" MaxLength="10"
                                                    AutoPostBack="true" runat="server" placeholder="from date" OnTextChanged="txtFromdate_TextChanged">
                                                </asp:TextBox>
                                                <ajax:FilteredTextBoxExtender ID="txtFromdate_FilteredTextBoxExtender3" ValidChars="/"
                                                    FilterType="Numbers,Custom" runat="server" BehaviorID="txtFromdate_FilteredTextBoxExtender"
                                                    TargetControlID="txtFromdate">
                                                </ajax:FilteredTextBoxExtender>
                                            </div>
                                            <div class="col col-md-2">
                                                <asp:DropDownList ID="ddlFrom" CssClass="form-control" runat="server" AutoPostBack="true"
                                                    Enabled="false" OnSelectedIndexChanged="ddlFrom_SelectedIndexChanged">
                                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="Full day" Value="1"></asp:ListItem>
                                                    <asp:ListItem Text="Fore Noon" Value="0.5"></asp:ListItem>
                                                    <asp:ListItem Text="After Noon" Value="0.5"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col col-md-2">
                                                <h4>
                                                    <label class="form-control-label">
                                                        To date</label></h4>
                                            </div>
                                            <div class="col col-md-2">
                                                <asp:TextBox ID="txtToDate" CssClass="form-control" autocomplete="Off" MaxLength="10"
                                                    AutoPostBack="true" runat="server" placeholder="to date" OnTextChanged="txtToDate_TextChanged">
                                                </asp:TextBox>
                                                <ajax:FilteredTextBoxExtender ID="txtToDate_FilteredTextBoxExtender3" ValidChars="/"
                                                    FilterType="Numbers,Custom" runat="server" BehaviorID="txtToDate_FilteredTextBoxExtender"
                                                    TargetControlID="txtToDate">
                                                </ajax:FilteredTextBoxExtender>
                                            </div>
                                            <div class="col col-md-2">
                                                <asp:DropDownList ID="ddlTo" CssClass="form-control" runat="server" AutoPostBack="true"
                                                    Enabled="false" OnSelectedIndexChanged="ddlTo_SelectedIndexChanged">
                                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="Fore Noon" Value="0.5"></asp:ListItem>
                                                    <asp:ListItem Text="Full day" Value="1"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row form-group" id="CML" runat="server" visible="false">
                                    <div class="col col-md-12">
                                        <asp:GridView ID="GvLeave" runat="server" CssClass="table table-striped table-bordered"
                                            GridLines="None" AutoGenerateColumns="False" ShowFooter="true" OnRowDataBound="GvLeave_RowDataBound"
                                            OnRowCommand="GvLeave_RowCommand">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <FooterTemplate>
                                                        <asp:ImageButton ID="imgBtnAdd" runat="server" CommandName="Add" Height="30px" ImageUrl="~/Assests/images/plus.png" />
                                                    </FooterTemplate>
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgBtnRemove" runat="server" CommandName="Remove" ImageUrl="~/Assests/images/hr.gif" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Leave Type">
                                                    <ItemTemplate>
                                                        <asp:DropDownList ID="ddlLeave" CssClass="form-control" runat="server" AutoPostBack="true"
                                                            OnSelectedIndexChanged="ddlLeaveSelectedIndexChanged">
                                                            <asp:ListItem Text="--Select leave Type--" Value="0"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:Label ID="lblLeaveCode" runat="server" Visible="false" Text='<%# Bind("LeaveType") %>'>
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Leave Balance">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLeaveBalance" runat="server" Text='<%# Bind("LeaveBalance") %>'>
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Max Leaves">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMaxLeaves" runat="server" Text='<%# Bind("LeaveMax") %>'>
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="From Date">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtFromdate" CssClass="form-control calFrom" autocomplete="Off"
                                                            AutoPostBack="true" Text='<%# Bind("FromDate") %>' runat="server" placeholder="from date"
                                                            OnTextChanged="GVFromdate_TextChanged">
                                                        </asp:TextBox>
                                                        <asp:DropDownList ID="ddlGFrom" CssClass="form-control" Enabled="false" runat="server"
                                                            AutoPostBack="true" OnSelectedIndexChanged="GVddlFrom_SelectedIndexChanged">
                                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="Full day" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="Fore Noon" Value="0.5"></asp:ListItem>
                                                            <asp:ListItem Text="After Noon" Value="0.5"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:Label ID="lblfromtype" runat="server" Visible="false" Text='<%# Bind("FromType") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="To Date">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtTodate" CssClass="form-control calTo" autocomplete="Off" MaxLength="50"
                                                            AutoPostBack="true" OnTextChanged="GVtxtToDate_TextChanged" Text='<%# Bind("ToDate") %>'
                                                            runat="server" placeholder="To date">
                                                        </asp:TextBox>
                                                        <asp:DropDownList ID="ddlTo" CssClass="form-control" runat="server" Enabled="false"
                                                            AutoPostBack="true" OnSelectedIndexChanged="GVddlTo_SelectedIndexChanged">
                                                            <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                            <asp:ListItem Text="Fore Noon" Value="0.5"></asp:ListItem>
                                                            <asp:ListItem Text="Full day" Value="1"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:Label ID="lbltotype" runat="server" Visible="false" Text='<%# Bind("ToType") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="No. of Leaves applied">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblnol" runat="server" Text='<%# Bind("nol") %>'> </asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="lblTotLeavs" runat="server"> </asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="row form-group" id="divTotal" runat="server">
                                    <div class="col col-md-3 text-left">
                                        <label class="form-control-label font-weight-bold" style="color: Green">
                                            Total Number of Leaves Applied :</label>
                                    </div>
                                    <div class="col col-md-2">
                                        <asp:Label ID="lblNoofdaysLeave" runat="server" Text="0" Font-Bold="true" Font-Size="Large"></asp:Label>
                                    </div>
                                </div>
                                <div class="row form-group" id="Prefix" runat="server" visible="false">
                                    <div class="col col-md-2 text-left">
                                        <label class="form-control-label font-weight-bold">
                                            Prefix :</label>
                                    </div>
                                    <div class="col col-md-4">
                                        <asp:Label ID="lblPrefix" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="YellowGreen"></asp:Label>
                                        <asp:Label ID="Label1" runat="server" Font-Bold="true" Font-Size="Large" Visible="false"></asp:Label>
                                    </div>
                                    <div class="col col-md-2 text-left">
                                        <label class="form-control-label font-weight-bold">
                                            Suffix:</label>
                                    </div>
                                    <div class="col col-md-4">
                                        <asp:Label ID="lblPostFix" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="YellowGreen"></asp:Label>
                                        <asp:Label ID="lblPostDube" runat="server" Font-Bold="true" Font-Size="Large" Visible="false"></asp:Label>
                                    </div>
                                </div>
                                <div class="form-group" id="AddrressDiv" runat="server">
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-left">
                                            <h4>
                                                <label class=" form-control-label">
                                                    Station Leave Required</label></h4>
                                        </div>
                                        <div class="col-md-4">
                                            <h4>
                                                <asp:RadioButtonList ID="rbLeaveRequired" runat="server" AutoPostBack="true" RepeatDirection="Horizontal"
                                                    OnSelectedIndexChanged="rbLeaveRequired_SelectedIndexChanged">
                                                    <asp:ListItem Value="1">Yes</asp:ListItem>
                                                    <asp:ListItem Value="0">No</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </h4>
                                        </div>
                                    </div>
                                    <div class="row form-group" id="divStation" runat="server" visible="false">
                                        <div class="col col-md-3 text-left">
                                            <h4>
                                                <label class=" form-control-label">
                                                    Address During Leave Period</label></h4>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtAddLeave" CssClass="form-control" autocomplete="Off" placeholder="Address"
                                                runat="server" TextMode="MultiLine">
                                            </asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                                BehaviorID="txtAddLeave_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                TargetControlID="txtAddLeave" ValidChars=" .,()-">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-left">
                                            <h4>
                                                <label class=" form-control-label">
                                                    Upload Files</label></h4>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:FileUpload ID="UpldLeavdoc" runat="server" />
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3 text-left">
                                            <h4>
                                                <label class=" form-control-label">
                                                    Remarks</label></h4>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtRemarks" CssClass="form-control" autocomplete="Off" placeholder="Remarks"
                                                runat="server">
                                            </asp:TextBox>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                                BehaviorID="txtRemarks_FilteredTextBoxExtender" FilterType="UppercaseLetters,LowercaseLetters,Numbers,custom"
                                                TargetControlID="txtRemarks" ValidChars=" .,()-">
                                            </ajaxToolkit:FilteredTextBoxExtender>
                                        </div>
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
        <asp:HiddenField ID="hf" runat="server" />
        <Footer:footer ID="footer1" runat="server"></Footer:footer>
    </div>
    <script src="../Assests/Js/jquery.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/popper.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/main.js" type="text/javascript"></script>
    </form>
</body>
</html>
