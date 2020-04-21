using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;
using System.Configuration;

public partial class ViewPost : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
    Recruitment_DL objRecr = new Recruitment_DL();
    CommonFuncs objcomm = new CommonFuncs();
    Validate objvalidate = new Validate();
    DataTable dt;
    string con = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
    IFormatProvider provider = new System.Globalization.CultureInfo("en-IN", true);
    string postid;

    protected void Page_Load(object sender, EventArgs e)
    {
        postid = Session["Postid"].ToString();
        if (!IsPostBack)
        {
            GetPostDetails();
        }
    }
    protected void GetPostDetails()
    {
        dt = new DataTable();
        objBE.Id = postid;
        objBE.Action = "R";
        dt = ObjDL.Post_IUDR(objBE, con);

        lblPostName.Text = dt.Rows[0]["PostName"].ToString();
        lblPostType.Text = dt.Rows[0]["PostTypeName"].ToString();
        lblDesc.Text = dt.Rows[0]["Description"].ToString();
        lbldate.Text = dt.Rows[0]["EffectiveTo"].ToString();
        lblnop.Text = dt.Rows[0]["NoPosts"].ToString();
        lbllocation.Text = dt.Rows[0]["Placement"].ToString();
        lblSal.Text = dt.Rows[0]["MonthlySal"].ToString();
        lblAgeLimit.Text = dt.Rows[0]["AgeLimit"].ToString();
        lblQual.Text = dt.Rows[0]["Qualification_Name"].ToString();
        lblExp.Text = dt.Rows[0]["ExpDetails"].ToString();
    }
    protected void btn_Apply_Click(object sender, EventArgs e)
    {
        Session["Postid"]=postid;
        Session["PostName"] = lblPostName.Text;
        Response.Redirect("Recruitment.aspx", false);
    }
}