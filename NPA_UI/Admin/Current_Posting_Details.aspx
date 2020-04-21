<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Current_Posting_Details.aspx.cs"
    Inherits="Admin_Current_Posting_Details" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="Menu" TagName="menu" Src="~/Admin/AdminMenu.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="~/Header_New.ascx" %>
<%@ Register TagPrefix="Footer" TagName="footer" Src="~/Footer.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SVPNPA</title>
    <%--CSS--%>
    <link rel="icon" href="../Assests/images/sv.png" type="image/x-icon" />
    <link href="../Assests/Css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/themify-icons/css/themify-icons.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/flag-icon-css/css/flag-icon.min.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/Css/cs-skin-elastic.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/Css/style.css" rel="stylesheet" type="text/css" />
    <link href="../Assests/Css/Jquery_UI.css" rel="stylesheet" type="text/css" />
    <%--Script--%>
    <script src="../Assests/Js/jquery.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery-ui.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/popper.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/main.js" type="text/javascript"></script>
    <script type="text/javascript">
        history.pushState(null, null, 'Current_Posting_Details.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Current_Posting_Details.aspx');
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
            $('#txtFromDate').datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                yearRange: "-50:+0",
               
            });
            $('#txtToDate').datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                yearRange: "-40:+0",
               
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
                                    <strong>Current Posting Details</strong>
                                </div>
                                <div class="card-body card-block">
                                    <div class="row form-group">
                                        <div class="col col-md-4 text-right">
                                            <h4>
                                                <label class=" form-control-label">
                                                    Employee Name</label>
                                            </h4>
                                        </div>
                                        <div class="col-md-4 text-center">
                                            <asp:DropDownList ID="ddlemployee" CssClass="form-control" runat="server" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlemployee_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body card-block" id="Div1" runat="server">
                                    <div class="row form-group">
                                        <div class="col col-md-2">
                                            <h4>
                                                <label class=" form-control-label">
                                                    State</label>
                                            </h4>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="ddlState" CssClass="form-control" runat="server" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col col-md-2">
                                            <h4>
                                                <label class=" form-control-label">
                                                    District
                                                </label>
                                            </h4>
                                        </div>
                                        <div class=" col-md-4">
                                            <asp:DropDownList ID="ddlCrntDistrict" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-2">
                                            <h4>
                                                <label class=" form-control-label">
                                                    Office Name</label>
                                            </h4>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtOffice" CssClass="form-control" AutoComplete="off" runat="server">
                                            </asp:TextBox>
                                        </div>
                                        <div class="col col-md-2">
                                            <h4>
                                                <label class=" form-control-label">
                                                    Designation
                                                </label>
                                            </h4>
                                        </div>
                                        <div class=" col-md-4">
                                            <asp:DropDownList ID="ddlDesignation" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-2">
                                            <h4>
                                                <label class=" form-control-label">
                                                    From Date</label></h4>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtFromDate" AutoComplete="off" CssClass="form-control cal" runat="server"
                                                placeholder="dd/mm/yyyy"></asp:TextBox>
                                        </div>
                                        <div class="col col-md-2">
                                            <h4>
                                                <label class=" form-control-label">
                                                    To Date
                                                </label>
                                            </h4>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtToDate" runat="server" AutoComplete="off" CssClass="form-control cal" AutoPostBack="true"
                                                Value="Till Now" onblur="if(this.value==''){ this.value='Till Now';}" onfocus="if(this.value=='Till Now'){ this.value=''; }"
                                                required ontextchanged="txtToDate_TextChanged"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-2">
                                            <h4>
                                                <label class=" form-control-label">
                                                    Section
                                                </label>
                                            </h4>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:DropDownList ID="ddlSection" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0" Text="select"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group text-center">
                                        <asp:Button ID="btn_Save" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btn_Save_Click" />
                                        <asp:Button ID="btn_Update" runat="server" Text="Update" Visible="false" CssClass="btn btn-primary"
                                            OnClick="btn_Update_Click" />
                                        <asp:HiddenField ID="hdnvalue" runat="server" />
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
                                <asp:GridView ID="GvEmployee" runat="server" CssClass="table table-striped table-bordered dataTable no-footer"
                                    GridLines="None" AutoGenerateColumns="False" OnRowCommand="GvEmployee_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="SNo">
                                            <ItemTemplate>
                                                <span>
                                                    <%#Container.DataItemIndex + 1%>
                                                </span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Employee">
                                            <ItemTemplate>
                                                <asp:Label ID="lblId" runat="server" Visible="false" Text='<%# Bind("Id") %>'></asp:Label>
                                                <asp:Label ID="lblEmpId" runat="server" Visible="false" Text='<%# Bind("EmpId") %>'>
                                                </asp:Label>
                                                <asp:Label ID="lblEmpName" runat="server" Text='<%# Bind("EmpName") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="State">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStateCode" runat="server" Visible="false" Text='<%# Bind("StateCode") %>'>
                                                </asp:Label>
                                                <asp:Label ID="lblState" runat="server" Text='<%# Bind("State") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="District">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDistCode" runat="server" Visible="false" Text='<%# Bind("DistCode") %>'>
                                                </asp:Label>
                                                <asp:Label ID="lblDist" runat="server" Text='<%# Bind("DistName") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Office Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblOfficeName" runat="server" Text='<%# Bind("OfficeName") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Designation">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDesigCode" runat="server" Visible="false" Text='<%# Bind("DesignationID") %>'>
                                                </asp:Label>
                                                <asp:Label ID="lblDesigNAme" runat="server" Text='<%# Bind("Designation") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="From Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFromDate" runat="server" Text='<%# Bind("FromDate") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="To Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblToDate" runat="server" Text='<%# Bind("ToDate") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Section">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSectionCode" runat="server" Visible="false" Text='<%# Bind("SectionID") %>'>
                                                </asp:Label>
                                                <asp:Label ID="lblSectionName" runat="server" Text='<%# Bind("SectionName") %>'>
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Update" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edt"
                                                    Text="Edit"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="Dlt"
                                                    OnClientClick="return Confirm(this)" Text="Delete"></asp:LinkButton>
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
