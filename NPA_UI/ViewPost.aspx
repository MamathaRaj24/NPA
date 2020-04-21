<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewPost.aspx.cs" Inherits="ViewPost" %>

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
                            <strong>Post Details</strong>
                        </div>
                        <div class="content mt-3">
                            <div class="animated fadeIn">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-body card-block">
                                                <div class="row form-group">
                                                    <div class="col col-md-2 text-left">
                                                        <label class=" form-control-label">
                                                            Post Name</label>
                                                    </div>
                                                    <div class="col-md-3">
                                                       <strong> <asp:Label ID="lblPostName" runat="server"></asp:Label> </strong>
                                                    </div>
                                                    <div class="col col-md-2 text-left">
                                                        <label class=" form-control-label">
                                                            Type of Post</label>
                                                    </div>
                                                    <div class="col-md-3">
                                                       <strong> <asp:Label ID="lblPostType" runat="server"></asp:Label></strong>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-2 text-left">
                                                        <label class="form-control-label text-left">
                                                            Post Description</label>
                                                    </div>
                                                    <div class="col-md-8">
                                                       <strong> <asp:Label ID="lblDesc" runat="server"></asp:Label></strong>
                                                    </div>
                                                </div>
                                                <div class="row form-group text-left">
                                                    <div class="col col-md-4 text-left">
                                                        <label class="form-control-label text-left">
                                                            Last Date for Applying Post</label>
                                                    </div>
                                                    <div class=" col-md-8">
                                                       <strong> <asp:Label ID="lbldate" runat="server"></asp:Label></strong>
                                                    </div>
                                                </div>
                                                <div class="row form-group text-left">
                                                    <div class="col col-md-2">
                                                        <label class="form-control-label text-left">
                                                            No of Posts Vacant</label>
                                                    </div>
                                                    <div class=" col-md-3">
                                                      <strong>  <asp:Label ID="lblnop" runat="server"></asp:Label></strong>
                                                    </div>
                                                    <div class="col col-md-2">
                                                        <label class="form-control-label text-left">
                                                            Placement Location</label>
                                                    </div>
                                                    <div class=" col-md-3">
                                                      <strong>  <asp:Label ID="lbllocation" runat="server"></asp:Label></strong>
                                                    </div>
                                                </div>
                                                <div class="row form-group text-left">
                                                    <div class="col col-md-2">
                                                        <label class="form-control-label text-left">
                                                            Salary Per Month</label>
                                                    </div>
                                                    <div class=" col-md-3">
                                                      <strong>  <asp:Label ID="lblSal" runat="server"></asp:Label></strong>
                                                    </div>
                                                    <div class="col col-md-2">
                                                        <label class="form-control-label text-left">
                                                            Age Limit</label>
                                                    </div>
                                                    <div class=" col-md-3">
                                                       <strong> <asp:Label ID="lblAgeLimit" runat="server"></asp:Label></strong>
                                                    </div>
                                                </div>
                                                 <div class="row form-group">
                                                    <div class="col col-md-2 text-left">
                                                        <label class="form-control-label text-left">
                                                           Eligibility Criteria</label>
                                                    </div>
                                                    <div class="col-md-8">
                                                       <strong> <asp:Label ID="lblQual" runat="server"></asp:Label></strong>
                                                    </div>
                                                </div>
                                                 <div class="row form-group">
                                                    <div class="col col-md-2 text-left">
                                                        <label class="form-control-label text-left">
                                                            Experience Details</label>
                                                    </div>
                                                    <div class="col-md-8">
                                                       <strong> <asp:Label ID="lblExp" runat="server"></asp:Label></strong>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row form-group col-md-3 offset-6">
                                            <asp:Button ID="btn_Apply" runat="server" Text="Apply For the Post" CssClass="btn btn-primary"
                                                OnClick="btn_Apply_Click" />
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
