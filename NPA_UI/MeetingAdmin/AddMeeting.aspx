<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddMeeting.aspx.cs" Inherits="MeetingAdmin_AddMeeting" %>

<!DOCTYPE html>
<%@ Register TagPrefix="Menu" TagName="menu" Src="~/MeetingAdmin/Menu.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="~/Header_New.ascx" %>
<%@ Register TagPrefix="Footer" TagName="footer" Src="~/Footer.ascx" %>
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
        history.pushState(null, null, 'AddMeeting.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'AddMeeting.aspx');
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
            $('#txtDate').datepicker({
                dateFormat: 'dd/mm/yy',
                minDate: new Date(),
                changeMonth: true,
                changeYear: true,
                yearRange: "-0:+2"
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
                                <strong>Add Meetings</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="row form-group text-left">
                                    <div class="col col-md-2">
                                        <label class="form-control-label text-left">
                                            Meeting Name</label>
                                    </div>
                                    <div class=" col-md-3">
                                        <asp:TextBox ID="txtMName" CssClass="form-control" autocomplete="Off" MaxLength="75"
                                            runat="server" placeholder="Enter Meeting Name">
                                        </asp:TextBox>
                                         <ajaxToolkit:FilteredTextBoxExtender ID="txtMName_FilteredTextBoxExtender"
                                            runat="server" BehaviorID="txtMName_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtMName" ValidChars=" .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                    <div class="col col-md-2">
                                        <label class=" form-control-label">
                                            Date</label>
                                    </div>
                                    <div class="col-md-3">
                                         <asp:TextBox ID="txtDate" CssClass="form-control" autocomplete="Off" runat="server"
                                            placeholder="Enter Date">
                                        </asp:TextBox>
                                         <ajaxToolkit:FilteredTextBoxExtender ID="txtDate_FilteredTextBoxExtender"
                                            runat="server" BehaviorID="txtDate_FilteredTextBoxExtender" FilterType="Numbers,custom"
                                            TargetControlID="txtDate" ValidChars="/-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                </div>
                                <div class="row form-group text-left">
                                    <div class="col col-md-2 text-left">
                                        <label class="form-control-label text-left">
                                            Subject</label>
                                    </div>
                                    <div class=" col-md-3">
                                        <asp:TextBox ID="txtSubject" CssClass="form-control" TextMode="MultiLine" autocomplete="Off"
                                            MaxLength="250" runat="server" placeholder="Enter Subject  ">
                                        </asp:TextBox>
                                         <ajaxToolkit:FilteredTextBoxExtender ID="txtSubject_FilteredTextBoxExtender"
                                            runat="server" BehaviorID="txtSubject_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtSubject" ValidChars=" .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                      <div class="col col-md-2">
                                        <label class="form-control-label text-left">
                                            Meeting Headed By</label>
                                    </div>
                                    <div class=" col-md-3">
                                        <asp:TextBox ID="txtMHead" CssClass="form-control" autocomplete="Off"  MaxLength="75" runat="server"
                                            placeholder="Enter Meeting Headed By">
                                        </asp:TextBox>
                                         <ajaxToolkit:FilteredTextBoxExtender ID="txtMHead_FilteredTextBoxExtender"
                                            runat="server" BehaviorID="txtMHead_FilteredTextBoxExtender" FilterType="UppercaseLetters, LowercaseLetters,Numbers,custom"
                                            TargetControlID="txtMHead" ValidChars=" .,()-">
                                        </ajaxToolkit:FilteredTextBoxExtender>
                                    </div>
                                </div>
                              
                              <div class="card-body card-block">
                                <div class="row form-group">
                                    <div class="col col-md-12">
                                        <div class="table-responsive">
                                            <asp:GridView ID="GVWrk" runat="server" CssClass="table table-striped table-bordered dataTable no-footer"
                                                GridLines="None" AutoGenerateColumns="False" ShowFooter="true" OnRowDataBound="GVWrk_RowDataBound"
                                                OnRowCommand="GVWrk_RowCommand">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <FooterTemplate>
                                                            <asp:ImageButton ID="imgBtnAdd" runat="server" CommandName="Add" Height="30px" ImageUrl="~/Assests/images/plus.png" />
                                                        </FooterTemplate>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgBtnRemove" runat="server" CommandName="Remove" ImageUrl="~/Assests/images/hr.gif" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Enter Work">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtWrk" Text='<%# Bind("Work") %>' runat="server"></asp:TextBox>
                                                            <%--<asp:Label ID="lblSection" Visible="false" runat="server" Text='<%# Bind("Section") %>' />--%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Select Employees">
                                                        <ItemTemplate>
                                                            <asp:CheckBoxList ID="cblItems" runat="server" RepeatLayout="Table" RepeatColumns="6">
                                                            </asp:CheckBoxList>
                                                            <asp:Label ID="lblItem" Visible="false" runat="server" Text='<%# Bind("Emp") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                 <div class="row form-group col col-md-12 text-center">
                                        <asp:Button ID="btn_Save" runat="server" Text="Submit" CssClass="btn btn-primary"
                                            OnClick="btn_Save_Click" />
                                    </div>
                            </div>
                               
                                
                            </div>
                            
                            <asp:HiddenField ID="hf" runat="server" />
                        </div>
                    </div>
                </div>
                <Footer:footer ID="footer" runat="server"></Footer:footer>
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
