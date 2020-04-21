<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LeaveBalance.aspx.cs" Inherits="Admin_LeaveBalance" %>

<%@ Register TagPrefix="Menu" TagName="menu" Src="~/Admin/AdminMenu.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="~/Header_New.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>SVPNPA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
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
    <link rel="stylesheet" type="text/css" href="../Assests/Css/Jquery_UI.css" />
    <script src="../Assests/Js/jquery.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/popper.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/main.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="../Assests/Js/jquery-ui.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/footable.min.js" type="text/javascript"></script>
    <link href="../Assests/Css/dataTables.jqueryui.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/Css/footable.min.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">

        history.pushState(null, null, 'LeaveBalance.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'LeaveBalance.aspx');
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
                <div class="col-sm-2">
                    <div class="page-header float-left">
                        <div class="page-title">
                            <h1 style="float: left">
                                <font color="#fff">Logged In As:<asp:Label ID="lblUser" runat="server"></asp:Label></font></h1>
                        </div>
                    </div>
                </div>
                <div class="col-sm-10">
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
                                    <strong>Leave Balance</strong>
                                </div>
                                <div class="card-body card-block">
                                    <div class="row form-group text-center">
                                        <div class="col col-md-2">
                                            <label class=" form-control-label">
                                                Select Employee</label>
                                        </div>
                                        <div class="col-12 col-md-4">
                                            <asp:DropDownList ID="ddlEmp" CssClass="form-control" runat="server" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlEmp_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col col-md-2 text-right">
                                            <label class="form-control-label text-center">
                                                As on Date</label>
                                        </div>
                                        <div class=" col-md-4">
                                            <b>
                                                <asp:Label ID="lblDJoin" runat="server">01-01-2020</asp:Label>
                                            </b>
                                        </div>
                                    </div>
                                    <div class="row form-group offset-2" id="Grid1" runat="server">
                                        <asp:GridView ID="GvLBalance" runat="server" CssClass="table table-striped table-bordered"
                                            GridLines="None" AutoGenerateColumns="False" ShowFooter="true">
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
                                                <asp:TemplateField HeaderText="Max Leaves">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblmax" runat="server" Text='<%# Bind("NOL") %>'>
                                                        </asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Leave Balance">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtLeaveBal" CssClass="form-control" MaxLength="3" runat="server"></asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="StvExtender" FilterType="Numbers" runat="server"
                                                            TargetControlID="txtLeaveBal" ValidChars=".-+ " />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                    <div class="row form-group offset-2" runat="server" id="button1">
                                        <asp:Button ID="BtnSave" class="btn btn-info" formnovalidate="formnovalidate" runat="server"
                                            Text="SAVE" OnClientClick=" return Hidebutton();" OnClick="BtnSave_Click" />
                                    </div>
                                    <div class="row form-group offset-2">
                                        <asp:GridView ID="GvEditLeave" runat="server" CssClass="table table-striped table-bordered"
                                            GridLines="None" AutoGenerateColumns="False" OnRowCancelingEdit="GvEditLeave_RowCancelingEdit"
                                            DataKeyNames="EmpId,LeaveTypeId" OnRowEditing="GvEditLeave_RowEditing" AutoGenerateEditButton="true"
                                            OnRowUpdating="GvEditLeave_RowUpdating">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sl.No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Employee">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEmpID" runat="server" Visible="false" Text='<%# Eval("EmpId") %>'></asp:Label>
                                                        <asp:Label ID="lblEmp" runat="server" Text='<%# Eval("EmpName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Leave Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltypeID" runat="server" Visible="false" Text='<%# Eval("LeaveTypeId") %>'></asp:Label>
                                                        <asp:Label ID="lblType" runat="server" Text='<%# Eval("TypeName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Leave Balance">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLeaveBalance" runat="server" Text='<%# Eval("LeaveBalance") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtLeaveBalance1" CssClass="form-control" MaxLength="3" runat="server"
                                                            autocomplete="Off" Text='<%# Eval("LeaveBalance") %>'></asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="StvExtender" FilterType="Numbers,Custom"
                                                            runat="server" TargetControlID="txtLeaveBalance1" ValidChars="." />
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
                <asp:HiddenField ID="hf" runat="server" />
                <!-- .animated -->
            </div>
            <!-- .content -->
        </div>
    </form>
</body>
</html>
