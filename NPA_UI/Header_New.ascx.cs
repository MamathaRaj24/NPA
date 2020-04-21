using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Header_New : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            imgStateLogo.ImageUrl = "Assests/images/sv.png";
            imglogo.ImageUrl = "Assests/images/logo.jpg";
        }
    }
}