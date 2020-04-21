using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using PA_BE;
using NPA_DL;
using System.Data;
using System.Configuration;


public partial class Test : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Master_DL objdl = new Master_DL();
    CommonFuncs cf = new CommonFuncs();
    DataTable dt;
    string ConnKey = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        CreateControl();
    }

    private void CreateControl()
    {
        dt = new DataTable();
        objBE.Action = "NOTICE";
        dt = objdl.Post_IUDR(objBE, ConnKey);

        if (dt.Rows.Count > 0)
        {
            Int32 i; 
            for (i = 0; i < dt.Rows.Count; i++) 
            {
                
                LinkButton lb = new LinkButton();
                lb = new LinkButton();
                lb.Text = "Applications invited for the post of " + dt.Rows[i]["PostName"];
                lb.Font.Bold = true;
                lb.ForeColor = System.Drawing.Color.Blue;
                lb.ID = Convert.ToString(i);
                lb.CommandArgument = Convert.ToString(dt.Rows[i]["PostID"]);
                lb.CommandName = Convert.ToString(dt.Rows[i]["Description"]);
                lb.Command += new CommandEventHandler(lb_Command);
                PlaceHolder1.Controls.Add(lb);
                PlaceHolder1.Controls.Add(new LiteralControl("<hr/>"));
            }
        }
    }

    protected void lb_Command(object sender, CommandEventArgs e)
    {
        LinkButton lnk = sender as LinkButton;
        //Label1.Text = e.CommandName; // will display the which Linkbutton clicked
        string postid = lnk.CommandArgument;
        Session["Postid"] = postid;
        Session["PostName"] = e.CommandName;
        Response.Redirect("ViewPost.aspx", false);

        //Label1.Text += "  " + postid;
        if (lnk.Font.Bold == true)
        {
            lnk.Font.Bold = false;
            lnk.ForeColor = System.Drawing.Color.Blue;
        }
        else
        {
            lnk.Font.Bold = true;
            lnk.ForeColor = System.Drawing.Color.Green;
        }

    }

}