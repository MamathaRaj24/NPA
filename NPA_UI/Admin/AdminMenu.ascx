<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminMenu.ascx.cs" Inherits="Admin_AdminMenu" %>
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
           

            <h3 class="menu-title">
               Masters</h3>

             <li class="menu-item-has-children dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false"><i class="menu-icon fa fa-laptop"></i>
               Location Masters</a>
                <ul class="sub-menu children dropdown-menu">
                    <li><i class="fa fa-puzzle-piece"></i><a href="StateMaster.aspx">State</a></li>
                    <li><i class="fa fa-puzzle-piece"></i><a href="DistrictMaster.aspx">Districts</a></li>
                    </ul>
                    </li>
            <li class="menu-item-has-children dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false"><i class="menu-icon fa fa-laptop"></i>
               HR Masters</a>
                <ul class="sub-menu children dropdown-menu">
                  
                    <li><i class="fa fa-puzzle-piece"></i><a href="Designation.aspx">Designation</a></li>
                    <li><i class="fa fa-puzzle-piece"></i><a href="Sections.aspx">Sections</a></li>

                    <%--<li><i class="fa fa-id-badge"></i><a href="Employee_Mst.aspx">Employes</a></li> --%>
                    <li><i class="fa fa-id-badge"></i><a href="Employee_Registration.aspx">Add Employee </a></li> 
                     <li><i class="fa fa-id-badge"></i><a href="UpdateEmployee_Registration.aspx">Update Employee</a></li>                    
                     <li><i class="fa fa-id-badge"></i><a href="ViewEmployee.aspx">View Employee</a></li>                    
                     <li><i class="fa fa-id-badge"></i><a href="QualificationDetails.aspx">Educational Qualification</a></li>   
                     <li><i class="fa fa-id-badge"></i><a href="FamilyDetails.aspx">Family Details</a></li>   
                     <li><i class="fa fa-id-badge"></i><a href="Intial_Joining_Details.aspx">Intial Joing Details</a></li> 
                     
                     <li><i class="fa fa-id-badge"></i><a href="Current_Posting_Details.aspx">Current Posting Details</a></li> 
                          <li><i class="fa fa-id-badge"></i><a href="#">Promotion Details</a></li> 
                               <li><i class="fa fa-id-badge"></i><a href="Transfer_Details.aspx">Transfer Details</a></li> 
                    <li><i class="fa fa-id-badge"></i><a href="AddUser.aspx">User</a></li>
                    <li><i class="fa fa-id-badge"></i><a href="Map_LinkOfcrs.aspx">Map Officers</a></li>
                   
                   
                   <%-- <li><i class="fa fa-id-badge"></i><a href="AddPost.aspx">Post</a></li>
                    <li><i class="fa fa-id-badge"></i><a href="Qualification.aspx">Qualification</a></li>
                    <li><i class="fa fa-id-badge"></i><a href="PostQualificationMap.aspx">Post Qualification Map</a></li>--%>
                 
                </ul>
            </li>

             <li class="menu-item-has-children dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false"><i class="menu-icon fa fa-laptop"></i>
               Leave Masters</a>
                <ul class="sub-menu children dropdown-menu">
                    <li><i class="fa fa-puzzle-piece"></i><a href="LeaveType.aspx">Leave Types</a></li>
                     <li><i class="fa fa-id-badge"></i><a href="LeaveCombination.aspx">Leave Combination</a></li>
                    <li><i class="fa fa-puzzle-piece"></i><a href="LeaveBalance.aspx">Leave Balance</a></li>
                    <li><i class="fa fa-puzzle-piece"></i><a href="Holiday_Mst.aspx">HolidayMaster</a></li>
                </ul>
            </li>
             <li><i class="fa fa-puzzle-piece"></i><a href="#">Approve Leaves</a></li>

           <%-- <h3 class="menu-title">
                Meeting Managment</h3>
            <li class="menu-item-has-children dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false"><i class="menu-icon fa fa-laptop"></i>
                Components</a>
                <ul class="sub-menu children dropdown-menu">
                    <li><i class="fa fa-puzzle-piece"></i><a href="ui-buttons.html">Buttons</a></li>
                    <li><i class="fa fa-id-badge"></i><a href="ui-badges.html">Badges</a></li>
                    <li><i class="fa fa-bars"></i><a href="ui-tabs.html">Tabs</a></li>
                    <li><i class="fa fa-share-square-o"></i><a href="ui-social-buttons.html">Social Buttons</a></li>
                    <li><i class="fa fa-id-card-o"></i><a href="ui-cards.html">Cards</a></li>
                    <li><i class="fa fa-exclamation-triangle"></i><a href="ui-alerts.html">Alerts</a></li>
                    <li><i class="fa fa-spinner"></i><a href="ui-progressbar.html">Progress Bars</a></li>
                    <li><i class="fa fa-fire"></i><a href="ui-modals.html">Modals</a></li>
                    <li><i class="fa fa-book"></i><a href="ui-switches.html">Switches</a></li>
                    <li><i class="fa fa-th"></i><a href="ui-grids.html">Grids</a></li>
                    <li><i class="fa fa-file-word-o"></i><a href="ui-typgraphy.html">Typography</a></li>
                </ul>
            </li>
            <li class="menu-item-has-children dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false"><i class="menu-icon fa fa-table"></i>
                Tables</a>
                <ul class="sub-menu children dropdown-menu">
                    <li><i class="fa fa-table"></i><a href="tables-basic.html">Basic Table</a></li>
                    <li><i class="fa fa-table"></i><a href="tables-data.html">Data Table</a></li>
                </ul>
            </li>
            <li class="menu-item-has-children active dropdown"><a href="#" class="dropdown-toggle"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="menu-icon fa fa-th">
                </i>Forms</a>
                <ul class="sub-menu children dropdown-menu">
                    <li><i class="menu-icon fa fa-th"></i><a href="forms-basic.html">Basic Form</a></li>
                    <li><i class="menu-icon fa fa-th"></i><a href="forms-advanced.html">Advanced Form</a></li>
                </ul>
            </li>
            <h3 class="menu-title">
                Leave Managment</h3>
            <!-- /.menu-title -->
            <li class="menu-item-has-children dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false"><i class="menu-icon fa fa-tasks"></i>
                Icons</a>
                <ul class="sub-menu children dropdown-menu">
                    <li><i class="menu-icon fa fa-fort-awesome"></i><a href="font-fontawesome.html">Font
                        Awesome</a></li>
                    <li><i class="menu-icon ti-themify-logo"></i><a href="font-themify.html">Themefy Icons</a></li>
                </ul>
            </li>
            <li><a href="widgets.html"><i class="menu-icon ti-email"></i>Widgets </a></li>
            
            <h3 class="menu-title">
                Recruitment</h3>
            <!-- /.menu-title -->
            <li class="menu-item-has-children dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false"><i class="menu-icon fa fa-glass"></i>
                Pages</a>
                <ul class="sub-menu children dropdown-menu">
                    <li><i class="menu-icon fa fa-sign-in"></i><a href="page-login.html">Login</a></li>
                    <li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">Register</a></li>
                    <li><i class="menu-icon fa fa-paper-plane"></i><a href="pages-forget.html">Forget Pass</a></li>
                </ul>
            </li>--%>
            <li><a href="../Logout.aspx"><i class=" menu-icon fa fa-share-square-o"></i>Logout </a></li>
        </ul>
         
    </div>
    <!-- /.navbar-collapse -->
    </nav> </aside>
