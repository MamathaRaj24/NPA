<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WorkUpdates.aspx.cs" Inherits="Employee_WorkUpdates" %>

<!DOCTYPE html>
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

    <style>
        /* Modal Popup */

        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
        }

        .modalPopup {
            background-color: #FFFFFF;
            width: 830px;
            border: 3px solid #DDDDEE;
            border-radius: 12px;
            padding: 0;
        }

            .modalPopup .header {
                background-color: #FFFFFF;
                height: 30px;
                color: White;
                line-height: 30px;
                font-weight: bold;
                border-top-left-radius: 6px;
                border-top-right-radius: 6px;
            }

            .modalPopup .body {
                min-height: 50px;
                line-height: 30px;
                text-align: center;
                font-weight: bold;
            }

            .modalPopup .footer {
                padding: 6px;
            }

            .modalPopup .yes, .modalPopup .no {
                height: 23px;
                color: White;
                line-height: 23px;
                text-align: center;
                font-weight: bold;
                cursor: pointer;
                border-radius: 4px;
            }

            .modalPopup .yes {
                background-color: #2FBDF1;
                border: 1px solid #0DA9D0;
            }

            .modalPopup .no {
                background-color: #9F9F9F;
                border: 1px solid #5C5C5C;
            }

        label {
            font-size: larger;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <ajax:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" CancelControlID="btnLogClose"
            TargetControlID="HiddenField1" BackgroundCssClass="modalBackground">
        </ajax:ModalPopupExtender>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="left" Style="display: none; overflow: auto"
            Height="600px" Width="1000px">
            <table width="1000px" style="overflow: auto; background-color: white;">
                <tr>
                    <td align="right" class="header">
                        <asp:ImageButton ID="btnLogClose" runat="server" ImageUrl="~/Assests/images/hr.gif" Width="40px"
                            Height="40px" CausesValidation="false" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class=" form-control-label">
                        </label>
                    </td>
                    <td>
                        <label class=" form-control-label">
                        </label>
                    </td>

                </tr>
                <tr>
                    <td align="center" valign="top">
                        <table align="center" style="width: 100%">
                            <tr>
                                <td align="center" id="foo">
                                    <table>
                                        <tr>
                                            <td>
                                                <label class=" form-control-label">
                                                    Comments</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtComments" class="form-control" runat="server"></asp:TextBox>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="txtComments_FilteredTextBoxExtender"
                                                    runat="server" BehaviorID="txtComments_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                    TargetControlID="txtComments" ValidChars=" .,()-">
                                                </ajaxToolkit:FilteredTextBoxExtender>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <label class=" form-control-label">
                                                </label>
                                            </td>
                                            <td>
                                                <label class=" form-control-label">
                                                </label>
                                            </td>

                                        </tr>
                                       
                                        <tr>
                                            <td>
                                                <label class=" form-control-label">
                                                    Work Done</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtWrkDone" class="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="txtWrkDone_FilteredTextBoxExtender"
                                                    runat="server" BehaviorID="txtWrkDone_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                    TargetControlID="txtWrkDone" ValidChars=" .,()-:">
                                                </ajaxToolkit:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                         <tr>
                                            <td>
                                                <label class=" form-control-label">
                                                </label>
                                            </td>
                                            <td>
                                                <label class=" form-control-label">
                                                </label>
                                            </td>

                                        </tr>
                                        <tr>

                                            <td>
                                                <label class=" form-control-label">
                                                    Status</label>
                                            </td>
                                            <td>
                                                <asp:RadioButtonList ID="rbStatus" RepeatDirection="Horizontal" runat="server">
                                                    <asp:ListItem Value="1">Not At Started</asp:ListItem>
                                                    <asp:ListItem Value="2">Some what completed</asp:ListItem>
                                                    <asp:ListItem Value="3">About to complete</asp:ListItem>
                                                    <asp:ListItem Value="4">Completed</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                         <tr>
                                            <td>
                                                <label class=" form-control-label">
                                                </label>
                                            </td>
                                            <td>
                                                <label class=" form-control-label">
                                                </label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <label class=" form-control-label">
                                                    % of completion</label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtMarks" class="form-control" runat="server"></asp:TextBox>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="txtMarks_FilteredTextBoxExtender"
                                                    runat="server" BehaviorID="txtMarks_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                                    TargetControlID="txtMarks" ValidChars=".">
                                                </ajaxToolkit:FilteredTextBoxExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label class=" form-control-label">
                                                </label>
                                            </td>
                                            <td>
                                                <label class=" form-control-label">
                                                </label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center">
                                                <asp:Button ID="btnSubmit" runat="server" Text="Update" CssClass="btn btn-info rounded" OnClick="btn_Save_Click" />

                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:Panel>


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
                                    <strong>Work Update</strong>
                                </div>
                                <div class="card-body card-block">
                                    <div class="row form-group">
                                        <div class="col-md-12 text-center">
                                            <asp:GridView ID="GvWrk" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"
                                                OnRowCommand="GvWrk_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Meeting Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMetingId" runat="server" Visible="false" Text='<%# Bind("Meeting_Id") %>'></asp:Label>
                                                            <asp:Label ID="lblMeetingName" runat="server" Text='<%# Bind("Meeting_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="Meeting Headed By">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMhead" runat="server" Text='<%# Bind("Meeting_Head") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDate" runat="server" Text='<%# Bind("Date") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Subject">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSubject" runat="server" Text='<%# Bind("Subject") %>'></asp:Label><br />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Given Work">
                                                        <ItemTemplate>
                                                             <asp:Label ID="lblWrkId" runat="server" Visible="false" Text='<%# Bind("Meeting_Id") %>'></asp:Label>
                                                            <asp:Label ID="lblWrk" runat="server" Text='<%# Bind("Work") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="View">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnView" runat="server" CssClass="btn btn-info rounded" Text="View" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                    </div>
                                </div>

                                <%--<div class="card-body card-block">
                                    <div class="row form-group">
                                        <div class="col-md-12 text-center">
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"
                                                OnRowCommand="GvLeave_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl.No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Work Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblWrkName" runat="server" Text='<%# Bind("") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Comments">
                                                        <ItemTemplate>
                                                            
                                                            
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Work Done">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtWrkDone" runat="server"></asp:TextBox>
                                                           
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="Status">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>
                                                           
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="% of completion">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtPCompletion" runat="server"></asp:TextBox>
                                                           
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    
                                                </Columns>
                                            </asp:GridView>

                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
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
