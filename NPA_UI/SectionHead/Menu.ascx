
﻿    <%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="SectionHead_Menu" %>

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

                <li><a href="Add_ApplicationSection.aspx"> <i class="menu-icon fa fa-puzzle-piece"></i>Add Application Section</a></li>
                        <li><a href="AddItems_Section.aspx"><i class="menu-icon fa fa-puzzle-piece"></i>Add Items in Section</a></li>   
                        <li><a href="TypeOfPost.aspx"> <i class="menu-icon fa fa-puzzle-piece"></i>Type of Post</a></li> 
                        <li><a href="Mst_Qualification.aspx"> <i class="menu-icon fa fa-puzzle-piece"></i>Qualificatins</a></li> 
                        <li><a href="CreatePost.aspx"> <i class="menu-icon fa fa-puzzle-piece"></i>Create Post</a></li>  
                        <li><a href="ViewAppliedPersons.aspx"> <i class="menu-icon fa fa-puzzle-piece"></i>View Applied Persons</a></li>   
                        <li><a href="ViewAcceptRejectdata.aspx"> <i class="menu-icon fa fa-puzzle-piece"></i>View Applications Status Report</a></li>
                        <li><a href="PrintApplicationForm.aspx"> <i class="menu-icon fa fa-puzzle-piece"></i>Print Application</a></li>   

               
                <li><a href="../Logout.aspx"><i class=" menu-icon fa fa-share-square-o"></i>Logout </a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>
</aside>

