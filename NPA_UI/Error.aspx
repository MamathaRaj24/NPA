<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="DCA_Error" %>
<%@ Register TagPrefix="Footer" TagName="footer" Src="Footer.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <link href="Assests/Css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Assests/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="Assests/Css/style.css" rel="stylesheet" type="text/css" />
    <link href="Assests/Css/TopMenu.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <header id="header" class="header">
    <div class="header-menu">
        <div class="col-sm-2">
            <img src="Assests/images/sv.png" style="height: 120px; width: 120px;" alt="patel" />
        </div>
        <div class="col-sm-8">
           <span style="font-size:xx-large"> Sardar Vallabhbhai Patel National Police Academy (SVPNPA) </span><br />
            Government Of India : Ministry Of Home Affairs<br />Hyderabad
            </div>
        <div class="col-sm-2">
            <img src="Assests/images/logo.jpg" style="height: 120px; width: 120px;" alt="patel" />
        </div>
    </div>
    </header>
   
    <div class="container-fluid">
        <div class="card">
            <div class="card-body">
              
                <div class="row offset-4">
                    <div class="error-container">
                        <h1>
                            404</h1>
                        <h2>
                            Internal Error Occured.</h2>
                        <div class="error-details">
                            Sorry, an error has occured! Why not try going back to the <a href="Default.aspx">home
                                page</a> or perhaps try following!
                        </div>
                        <div class="error-actions">
                            <a href="Login.aspx" class="btn btn-large btn-primary"><i class="icon-chevron-left">
                            </i>&nbsp; Back to Login Page </a>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
      
    </div>
    </form>
    <br />
    <br />
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    <Footer:footer ID="footer" runat="server"></Footer:footer>
</body>
</html>
