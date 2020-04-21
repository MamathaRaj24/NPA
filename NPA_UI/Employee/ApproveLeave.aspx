<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApproveLeave.aspx.cs" Inherits="Employee_ApproveLeave" %>

<%@ Register TagPrefix="Menu" TagName="menu" Src="~/Employee/EmployeeMenu.ascx" %>
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
        <div id="GridsDiv" runat="server">
            <div class="content mt-3">
                <div class="animated fadeIn">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <strong>Approve Leave As Farwarding Officer</strong>
                                </div>
                                <div class="card-body card-block">
                                    <div class="row form-group">
                                        <div class="col-md-12 text-center">
                                            <asp:GridView ID="GvLeaveFO" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"
                                                OnRowCommand="GvLeave_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Application Id">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblType" runat="server" Visible="false" Text='<%# Bind("TYPE") %>'></asp:Label>
                                                            <asp:Label ID="lblAppID" runat="server" Text='<%# Bind("ApplicationId") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Employee">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEmployee" runat="server" Text='<%# Bind("Emp") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Leave Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTypeName" runat="server" Text='<%# Bind("lvType") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="No. of days leave">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbldays" runat="server" Text='<%# Bind("NoDays") %>'></asp:Label><br />
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="View">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnView" runat="server" CssClass="btn btn-info rounded" Text="View" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <asp:Label runat="server">No Records To Approve</asp:Label>
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                            <asp:Label runat="server" ID="EmpType" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                     <div class="row form-group">
                                        <div class="col-md-12 text-center">
                                            <asp:GridView ID="GvExtLeaveFO" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"
                                                OnRowCommand="GvLeave_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Application Id">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblType" runat="server" Visible="false" Text='<%# Bind("TYPE") %>'></asp:Label>
                                                            <asp:Label ID="lblAppID" runat="server" Text='<%# Bind("ApplicationId") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Employee">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEmployee" runat="server" Text='<%# Bind("Emp") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Leave Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTypeName" runat="server" Text='<%# Bind("lvType") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="No. of days leave">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbldays" runat="server" Text='<%# Bind("NoDays") %>'></asp:Label><br />
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="View">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnView" runat="server" CssClass="btn btn-info rounded" Text="View" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <asp:Label ID="Label9" runat="server">No Records To Approve</asp:Label>
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                            <asp:Label runat="server" ID="Label10" Visible="false"></asp:Label>
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
                                    <strong>Approve Leave As Recommending Officer</strong>
                                </div>
                                <div class="card-body card-block">
                                    <div class="row form-group">
                                        <div class="col-md-12 text-center">
                                            <asp:GridView ID="GVLeaveRO" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"
                                                OnRowCommand="GvLeave_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Application Id">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblType" runat="server" Visible="false" Text='<%# Bind("TYPE") %>'></asp:Label>
                                                            <asp:Label ID="lblAppID" runat="server" Text='<%# Bind("ApplicationId") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Employee">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEmployee" runat="server" Text='<%# Bind("Emp") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Leave Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTypeName" runat="server" Text='<%# Bind("lvType") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="No. of days leave">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbldays" runat="server" Text='<%# Bind("NoDays") %>'></asp:Label><br />
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="View">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnView" runat="server" CssClass="btn btn-info rounded" Text="View" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <asp:Label runat="server">No Records To Approve</asp:Label>
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                            <asp:Label runat="server" ID="Label1" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-12 text-center">
                                            <asp:GridView ID="GvExtLeaveRO" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"
                                                OnRowCommand="GvLeave_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Application Id">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblType" runat="server" Visible="false" Text='<%# Bind("TYPE") %>'></asp:Label>
                                                            <asp:Label ID="lblAppID" runat="server" Text='<%# Bind("ApplicationId") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Employee">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEmployee" runat="server" Text='<%# Bind("Emp") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Leave Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTypeName" runat="server" Text='<%# Bind("lvType") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="No. of days leave">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbldays" runat="server" Text='<%# Bind("NoDays") %>'></asp:Label><br />
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="View">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnView" runat="server" CssClass="btn btn-info rounded" Text="View" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <asp:Label ID="Label11" runat="server">No Records To Approve</asp:Label>
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                            <asp:Label runat="server" ID="Label12" Visible="false"></asp:Label>
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
                                    <strong>Approve Leave As Sanctioning Officer</strong>
                                </div>
                                <div class="card-body card-block">
                                    <div class="row form-group">
                                        <div class="col-md-12 text-center">
                                            <asp:GridView ID="GVLeaveSO" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"
                                                OnRowCommand="GvLeave_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Application Id">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblType" runat="server" Visible="false" Text='<%# Bind("TYPE") %>'></asp:Label>
                                                            <asp:Label ID="lblAppID" runat="server" Text='<%# Bind("ApplicationId") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Employee">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEmployee" runat="server" Text='<%# Bind("Emp") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Leave Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTypeName" runat="server" Text='<%# Bind("lvType") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="No. of days leave">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbldays" runat="server" Text='<%# Bind("NoDays") %>'></asp:Label><br />
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="View">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnView" runat="server" CssClass="btn btn-info rounded" Text="View" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <asp:Label runat="server">No Records To Approve</asp:Label>
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                            <asp:Label runat="server" ID="Label2" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col-md-12 text-center">
                                            <asp:GridView ID="GvExtLeaveSO" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"
                                                OnRowCommand="GvLeave_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Application Id">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblType" runat="server" Visible="false" Text='<%# Bind("TYPE") %>'></asp:Label>
                                                            <asp:Label ID="lblAppID" runat="server" Text='<%# Bind("ApplicationId") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Employee">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEmployee" runat="server" Text='<%# Bind("Emp") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Leave Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTypeName" runat="server" Text='<%# Bind("lvType") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="No. of days leave">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbldays" runat="server" Text='<%# Bind("NoDays") %>'></asp:Label><br />
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="View">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnView" runat="server" CssClass="btn btn-info rounded" Text="View" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <asp:Label ID="Label13" runat="server">No Records To Approve</asp:Label>
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                            <asp:Label runat="server" ID="Label14" Visible="false"></asp:Label>
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
                                    <strong>Approval of Cancelled Leave As Forwarding Officer</strong>
                                </div>
                                <div class="card-body card-block">
                                    <div class="row form-group">
                                        <div class="col-md-12 text-center">
                                            <asp:GridView ID="GvCancelFO" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"
                                                OnRowCommand="GvLeave_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Application Id">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblType" runat="server" Visible="false" Text='<%# Bind("TYPE") %>'></asp:Label>
                                                            <asp:Label ID="lblAppID" runat="server" Text='<%# Bind("ApplicationId") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Employee">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEmployee" runat="server" Text='<%# Bind("Emp") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Leave Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTypeName" runat="server" Text='<%# Bind("lvType") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="No. of days leave">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbldays" runat="server" Text='<%# Bind("NoDays") %>'></asp:Label><br />
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="View">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnView" runat="server" CssClass="btn btn-info rounded" Text="View" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <asp:Label ID="Label5" runat="server">No Records To Approve</asp:Label>
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                            <asp:Label runat="server" ID="Label6" Visible="false"></asp:Label>
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
                                    <strong>Approval of Cancelled Leave As Recommending Officer</strong>
                                </div>
                                <div class="card-body card-block">
                                    <div class="row form-group">
                                        <div class="col-md-12 text-center">
                                            <asp:GridView ID="GvCancelRO" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"
                                                OnRowCommand="GvLeave_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Application Id">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblType" runat="server" Visible="false" Text='<%# Bind("TYPE") %>'></asp:Label>
                                                            <asp:Label ID="lblAppID" runat="server" Text='<%# Bind("ApplicationId") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Employee">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEmployee" runat="server" Text='<%# Bind("Emp") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Leave Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTypeName" runat="server" Text='<%# Bind("lvType") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="No. of days leave">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbldays" runat="server" Text='<%# Bind("NoDays") %>'></asp:Label><br />
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="View">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnView" runat="server" CssClass="btn btn-info rounded" Text="View" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <asp:Label ID="Label5" runat="server">No Records To Approve</asp:Label>
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                            <asp:Label runat="server" ID="Label7" Visible="false"></asp:Label>
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
                                    <strong>Approval of Cancelled Leave As Sanctioning Officer</strong>
                                </div>
                                <div class="card-body card-block">
                                    <div class="row form-group">
                                        <div class="col-md-12 text-center">
                                            <asp:GridView ID="GvCancelSO" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"
                                                OnRowCommand="GvLeave_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Application Id">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblType" runat="server" Visible="false" Text='<%# Bind("TYPE") %>'></asp:Label>
                                                            <asp:Label ID="lblAppID" runat="server" Text='<%# Bind("ApplicationId") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Employee">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblEmployee" runat="server" Text='<%# Bind("Emp") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Leave Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTypeName" runat="server" Text='<%# Bind("lvType") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="No. of days leave">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbldays" runat="server" Text='<%# Bind("NoDays") %>'></asp:Label><br />
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="View">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnView" runat="server" CssClass="btn btn-info rounded" Text="View" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <EmptyDataTemplate>
                                                    <asp:Label ID="Label5" runat="server">No Records To Approve</asp:Label>
                                                </EmptyDataTemplate>
                                            </asp:GridView>
                                            <asp:Label runat="server" ID="Label8" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="content mt-3" id="DivEmployee" runat="server" visible="false">
            <div class="animated fadeIn">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <strong>Application Details-
                                    <asp:Label ID="lblapliid" runat="server" CssClass="alert alert-info" />
                                </strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-12 text-center">
                                        <asp:Label ID="lblHead" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="Green"></asp:Label>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class=" form-control-label">
                                            Employee Name</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label ID="lblEmpName" runat="server" Font-Bold="true">
                                        </asp:Label>
                                    </div>
                                    <div class="col col-md-3">
                                        <label class=" form-control-label">
                                            Designation</label>
                                    </div>
                                    <div class=" col-md-3">
                                        <asp:Label ID="lblDesignation" runat="server" Font-Bold="true">
                                        </asp:Label>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class=" form-control-label">
                                            Leave Type</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label ID="lblLeaveType" runat="server" Font-Bold="true">
                                        </asp:Label>
                                    </div>
                                    <div class="col col-md-3">
                                        <label class=" form-control-label">
                                            NoDays</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label ID="lblNoDays" runat="server" Font-Bold="true"></asp:Label>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-md-12 text-center">
                                        <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Sl.No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Leave Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblType" runat="server" Text='<%# Bind("TypeName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="From Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("FromDate") %>'></asp:Label>
                                                        <asp:Label ID="lblEmployee" runat="server" Text='<%# Bind("FromType") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="To Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ToDate") %>'></asp:Label>
                                                        <asp:Label ID="lblEmployee" runat="server" Text='<%# Bind("ToType") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="No. of days leave">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbldays" runat="server" Text='<%# Bind("Nod") %>'></asp:Label><br />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Extension Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLeaveExtensionDt" runat="server" Text='<%# Bind("LeaveExtensionDt") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Extended No. of days">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblExtendedNod" runat="server" Text='<%# Bind("ExtendedNod") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Cancel From Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCancelFrm" runat="server" Text='<%# Bind("CancelFrm") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Cancel To Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCancelTo" runat="server" Text='<%# Bind("CancelTo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <asp:Label runat="server">No Records To Approve</asp:Label>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                        <asp:Label runat="server" ID="Label3" Visible="false"></asp:Label>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class=" form-control-label">
                                            Reason</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label ID="lblReasons" runat="server" Font-Bold="true"></asp:Label>
                                    </div>
                                    <div class="col col-md-3">
                                        <label class=" form-control-label">
                                            Remarks Of Employee</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label ID="lblremarks" runat="server" Font-Bold="true">
                                        </asp:Label>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class=" form-control-label">
                                            Prefix</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label ID="lblPrefix" runat="server" Font-Bold="true">
                                        </asp:Label>
                                    </div>
                                    <div class="col col-md-3">
                                        <label class=" form-control-label">
                                            Suffix</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label ID="lblPostfix" runat="server" Font-Bold="true">
                                        </asp:Label>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class=" form-control-label">
                                            Opted for Station Leave</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label ID="lblStnLv" runat="server" Font-Bold="true">
                                        </asp:Label>
                                    </div>
                                    <div class="col col-md-3">
                                        <label class=" form-control-label">
                                            Address during Staion Leave</label>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label ID="lblStnLvAdd" runat="server" Font-Bold="true">
                                        </asp:Label>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        Officer Remarks
                                    </div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtOfficerRemarks" CssClass="form-control" runat="server">
                                        </asp:TextBox>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-md-12 text-center">
                                        <asp:Button ID="btnAccept" runat="server" Text="APPROVE" CssClass="btn btn-success rounded"
                                            OnClick="btnAccept_Click" />
                                        <asp:Button ID="btnReject" runat="server" Text="REJECT" CssClass="btn btn-danger rounded"
                                            OnClick="btnReject_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <!-- .animated -->
        </div>
        <asp:HiddenField ID="hf" runat="server" />
    </div>
    <script src="../Assests/Js/jquery.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/popper.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Assests/Js/main.js" type="text/javascript"></script>
    </form>
</body>
</html>
