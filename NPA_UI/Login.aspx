<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register TagPrefix="Menu" TagName="menu" Src="~/Menu.ascx" %>
<%@ Register TagPrefix="Footer" TagName="footer" Src="Footer.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="Header_New.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
    <link href="../Assets/css/pages/signin.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Assests/Js/shaa256.js"></script>
    <script type="text/javascript" src="Assests/Js/jquery.min.js"></script>
    <script type="text/javascript">
        function validateReg() {
            var pwd = document.getElementById('txtPwd').value;
            if (pwd != "") {
                var keyGenrate = '<%=ViewState["KeyGenerator"]%>';
                var myval = sha256(keyGenrate);
                document.getElementById('txtPwdHash').value = '';
                var myval1 = sha256(document.getElementById('txtPwd').value.toString());
                document.getElementById('txtPwd').value = '******';
                document.getElementById('txtPwdHash').value = sha256(myval1 + myval);
            }
        }
    </script>
    <script type="text/javascript">
        history.pushState(null, null, 'Login.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Login.aspx');
        });
    </script>
</head>
<body class="">
    <form id="form1" runat="server">
        <Header_New:header ID="Header1" runat="server" />
        <Menu:menu ID="menu" runat="server" />
        <div class="sufee-login d-flex align-content-center flex-wrap">
            <div class="container">
                <div class="login-content">
                    <div class="login-form">
                        <div class="login-logo">
                            <a href="#">
                                <img class="align-content" src=" Assests/images/logo1.png" alt="">
                            </a>
                        </div>
                        <div class="form-group">
                            <label for="username">
                               
                                Username</label>
                            <asp:TextBox ID="txtUname" class="login username-field form-control" runat="server">
                            </asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="password">
                                Password:</label>
                            <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" class="login password-field form-control"
                                name="password" placeholder="Password" required>
                            </asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblmsg" CssClass="alert-danger" runat="server"></asp:Label>
                        <asp:HiddenField ID="txtPwdHash" runat="server" />
                            <asp:HiddenField ID="hf" runat="server" />
                        </div>
                        <div class="form-group">
                            <asp:Image ID="Image2" runat="server" />
                            <asp:ImageButton ID="btnImgRefresh" runat="server" ImageUrl="Assests/images/RecaptchaLogo.png"
                                ToolTip="Refresh Captcha Text" formnovalidate OnClick="btnImgRefresh_Click"></asp:ImageButton>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="captch" runat="server" class="captcha-field form-control" placeholder="Enter Captcha" AutoComplete="off">
                            </asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnLogin" Width="100%" runat="server" Text="LOGIN" class="button btn btn-primary btn-large"
                                OnClientClick="return validateReg();" Font-Bold="True" Font-Size="Large" OnClick="btnLogin_Click" />
                            
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <div class="container-fluid">
            <Footer:footer ID="footer" runat="server"></Footer:footer>
        </div>
        <script src="Assests/Js/jquery.min.js" type="text/javascript"></script>
        <script src="Assests/Js/popper.min.js" type="text/javascript"></script>
        <script src="Assests/Js/bootstrap.min.js" type="text/javascript"></script>
        <script src="Assests/Js/main.js" type="text/javascript"></script>
    </form>
</body>
</html>
