   
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="SectionHead_Menu" %>

<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">
        <div class="navbar-header">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu"
                aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand" href="./">
                <img src="../Assests/images/logo1.png" alt="Logo"></a> <a class="navbar-brand hidden"
                    href="./">
                    <img src="../Assests/images/logo2.png" alt="Logo"></a>
        </div>
        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="index.html"><i class="menu-icon fa fa-dashboard"></i>Dashboard </a>
                </li>

                <li><a href="Add_ApplicationSection.aspx"><i class="menu-icon fa fa-puzzle-piece"></i>Add Meetings</a></li>
                

                <li><a href="../Logout.aspx"><i class=" menu-icon fa fa-share-square-o"></i>Logout </a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>
</aside>

