<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Logout" %>

<%@ Register TagPrefix="Footer" TagName="footer" Src="Footer.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="Header_New.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Logout</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no" />
    <link href="Assests/Css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Assests/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="Assests/Css/style.css" rel="stylesheet" type="text/css" />
    <link href="Assests/Css/TopMenu.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        history.pushState(null, null, 'Logout.aspx');
        window.addEventListener('popstate', function (event) {
            history.pushState(null, null, 'Logout.aspx');
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <Header_New:header ID="Header1" runat="server" />
    <div class="container-fluid">
    </div>
    <br />
    <br />
    <br />
    <div class="container-fluid">
        <div class="card">
            <div class="card-body">
                <div class="col-md-12" align="center">
                    <h3 class="form-signin-heading">
                        <asp:Image ID="Image1" ImageUrl="~/Assests/images/Logged_Out.jpg" CssClass="img-fluid"
                            runat="server" /></h3>
                    <div class="login">
                        <h1>
                            &nbsp;
                        </h1>
                        <div class="col-md-12 h6">
                            Click Here to <a href="Login.aspx" class="h4">Login</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clearfix">
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div class="row">
    </div>
    <br />
    <br />
    <br />
    <br />
    </form>
    <br />
    <br />
    <br />
    <Footer:footer ID="footer" runat="server"></Footer:footer>
</body>
</html>
