<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Test" %>

<%@ Register TagPrefix="Menu" TagName="menu" Src="~/Menu.ascx" %>
<%@ Register TagPrefix="Header_New" TagName="header" Src="Header_New.ascx" %>
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
</head>
<body>
    <form id="form1" runat="server">
    <Header_New:header ID="Header1" runat="server" />
    <Menu:menu ID="menu" runat="server" />
    <div class="sufee-login d-flex align-content-center flex-wrap">
        <div class="container-fluid">
            <br />
            <br />
            <div class="row">
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <strong>ABOUT SVPNPA</strong>
                        </div>
                        <div class="card-body card-block">
                            The Sardar Vallabhbhai Patel National Police Academy (SVPNPA), trains officers of
                            the Indian Police Service, who have been selected through an All India based Civil
                            Services Examination. The trained officers will be posted as Assistant Superintendent
                            of Police (ASP) in their respective states under whom the other sub-ranks of police
                            force will be working. The recruitment of sub-ranks such as Constables,Sub-Inspectors,
                            Deputy Superintendents of Police is each states prerogative, and will be done by
                            respective state Director Generals of Police. The IPS cadre is controlled by the
                            Home Ministry of the Government of India and the officer of this service can only
                            be appointed removed by an order of the President of India.
                        </div>
                        <div class="card-header">
                            <strong>Mission Statement </strong>
                        </div>
                        <div class="card-body card-block">
                            The Primary purpose of the Academy is to prepare leaders for the Indian Police,
                            who will lead/command the force with courage, uprightness, dedication and a strong
                            sense of service to the people. Academy will endeavour to inculcate in them, such
                            values and norms as would help them serve the people better. In particular, it will
                            try to inculcate integrity of the highest order, sensitivity to aspirations of people
                            in a fast changing social and economic milieu, respect for human rights, broad liberal
                            perspective of law and justice, high standard of professionalism, physical fitness
                            and mental alertness. The Academy will be a focal point for training of the trainers
                            of police training institutions all over the country and will provide consultancy
                            services to sister training institutions for improving their management of training.
                            The Academy will be a centre for research studies on police subjects and will expand
                            its resource base through tie-ups with similar institutions in and outside the country.
                            Vision of the Academy We aspire to be a Global Center of Excellence and the Nodal
                            Center of Police Training in India - setting Benchmarking Standards, leading the
                            Network of Police Training Institutions in the country and contributing to their
                            Capacity Building, developing training literature, besides being a Centre for Research
                            par excellence on Policing and Internal Security issues, ever keeping pace with
                            emerging challenges. We shall build a cadre of exemplary police officers who will
                            uphold the Rule of Law, respect National values of Secularism, Democracy, Equality
                            and Service to People and ensure the dignity and Human Rights of the citizens with
                            sensitivity.
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <strong>NOTIFICATIONS</strong>
                        </div>
                        <div class="card-body card-block">
                            <div id="divNotifications">
                                <ul>
                                    <li>Five day Course on 'Training of Trainers Programme for faculty of State Police Academies'
                                        - Acceptance of Nomination</li>
                                    <li>50 YEARS RE-UNION SEMINAR OF IPS OFFICERS 1970 BATCH (23RR) FROM MAY 04-05, 2020
                                        - Inviting Nominations</li>
                                    <li>Mid Career Training Programme Phase-IV - Calling of nominations</li>
                                    <li>Course on "Economic Offences" - Postponement</li>
                                    <li>Five days course on crime against women (Feb 03- 07, 2020) - Postponement</li>
                                    <li>Six day Course on 'Explosives, IEDs & Post Blast Procedures' - Inviting Nominations</li>
                                    <li>Course on "Tactics - 59" - Inviting Nominations</li>
                                    <li>03 days Course on 'Investigation of Digital payment frauds' -Inviting Nominations</li>
                                    <li>42nd IPS Induction Training Course - Inviting Nominations</li>
                                    <li>05-days Course on 'Counter Terrorism' - Inviting Nominations </li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-header">
                            <strong>Recruitment</strong>
                        </div>
                        <div class="card-body card-block">
                            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
    <script src="Assests/Js/bootstrap.min.js" type="text/javascript"></script>
    <script src="Assests/Js/main.js" type="text/javascript"></script>
    </form>
</body>
</html>
