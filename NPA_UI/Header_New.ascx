<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header_New.ascx.cs" Inherits="Header_New" %>
 <header id="header" class="header">
    <div class="header-menu">
        <div class="col-sm-2 d-none d-sm-block">
         <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
         <asp:Image ID="imgStateLogo" runat="server"  width="120px" height="120px" alt="logo"  class="responsive" />
            <%--<img src="Assests/images/sv.png" style="height: 120px; width: 120px;" alt="patel" />--%>
        </div>
        <div class="col-sm-8 d-none d-sm-block">
           <span style="font-size:x-large; font-family:Calibri;"> Sardar Vallabhbhai Patel National Police Academy (SVPNPA) <br />
            Government Of India : Ministry Of Home Affairs, Hyderabad</span>
            </div>
        <div class="col-sm-2 text-right">
        <asp:Image ID="imglogo" runat="server"  width="120px" height="120px"  class="responsive" alt="patel" />
            <%--<img src="Assests/images/logo.jpg" style="height: 120px; width: 120px;" alt="patel" />--%>
        </div>
    </div>
    </header>
     