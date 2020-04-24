<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmployeeMenu.ascx.cs" Inherits="Employee_EmployeeMenu" %>

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
                <li><a href="EmployeeProfile.aspx"><i class="menu-icon fa fa-dashboard"></i>Dashboard </a></li>
                <li><a href="ApplyLeave.aspx"><i class=" menu-icon fa fa-puzzle-piece"></i>Apply Leave </a></li>
                <li><a href="ApproveLeave.aspx"><i class=" menu-icon fa fa-puzzle-piece"></i>Approve Leaves </a></li>
                <li><a href="Employee_LeaveDetails.aspx"><i class=" menu-icon fa fa-puzzle-piece"></i>Leave Details </a></li>
                <li><a href="Cancel_LeaveDetails.aspx"><i class=" menu-icon fa fa-puzzle-piece"></i>Cancel Leave </a></li>
                <li><a href="Ext_LeaveDetails.aspx"><i class=" menu-icon fa fa-puzzle-piece"></i>Extension of Leave </a></li>
                <li><a href="Join.aspx"><i class=" menu-icon fa fa-puzzle-piece"></i>Joining Report </a></li>
                 <li><a href="WorkUpdates.aspx"><i class=" menu-icon fa fa-puzzle-piece"></i>Work Updates</a></li>


               <%-- <li class="menu-item-has-children dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false"><i class="menu-icon fa fa-laptop"></i>
                    Profile</a>
                    <ul class="sub-menu children dropdown-menu">
                        <%--<li><i class="fa fa-puzzle-piece"></i><a href="RegistrationEmployee.aspx">Employee Registration</a></li>
                        <li><i class="fa fa-puzzle-piece"></i><a href="EmployeeProfile.aspx">Employee Profile</a></li>
                        <li><i class="fa fa-puzzle-piece"></i><a href="ApplyLeave.aspx">Apply Leave</a></li>
                        <li><i class="fa fa-puzzle-piece"></i><a href="ApproveLeave.aspx">Approve Leaves</a></li>
                        <li><i class="fa fa-puzzle-piece"></i><a href="Leave_Details.aspx">Applied Leave Details</a></li>
                    </ul>
                </li>--%>
                <li><a href="../Logout.aspx"><i class=" menu-icon fa fa-share-square-o"></i>Logout </a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>
</aside>



