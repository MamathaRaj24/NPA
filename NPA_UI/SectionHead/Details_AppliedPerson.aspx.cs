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
using System.IO;


public partial class Details_AppliedPerson : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
    Recruitment_DL objRecr = new Recruitment_DL();
    CommonFuncs objcomm = new CommonFuncs();
    Validate objvalidate = new Validate();
    DataTable dt;
    string con = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
    IFormatProvider provider = new System.Globalization.CultureInfo("en-IN", true);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblPostName.Text = Session["GPostName"].ToString();
            GetData();
        }
    }
    public void GetData()
    {
        try {
            objBE = new Master_BE();
            objBE.Action = "RQED";
            objBE.PostTypeId = Session["GPostId"].ToString();
            objBE.ApplicationId = Session["GAppId"].ToString();
            DataSet ds = objRecr.ApplyPost_DL(objBE, con);
            lblapliid.Text = ds.Tables[0].Rows[0]["Application_Id"].ToString();
            lblName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
            lblFName.Text = ds.Tables[0].Rows[0]["FName"].ToString();
            lblDob.Text = ds.Tables[0].Rows[0]["DOB"].ToString();
            lblCaste.Text = ds.Tables[0].Rows[0]["CasteName"].ToString();
            lblNationality.Text = ds.Tables[0].Rows[0]["Nationality"].ToString();
            lblGender.Text = ds.Tables[0].Rows[0]["Gender"].ToString();
            lblMob.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
            lblEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();

            GvQualification.DataSource = ds.Tables[1];
            GvQualification.DataBind();

            GVExp.DataSource = ds.Tables[2];
            GVExp.DataBind();

            string ss = ds.Tables[3].Rows[0]["PhfileType"].ToString().Split('.')[1];
            ImgPhoto.ImageUrl = "data:image/"+ds.Tables[3].Rows[0]["PhfileType"].ToString().Split('.')[1]+";base64," +  Convert.ToBase64String((byte[])ds.Tables[3].Rows[0]["Phcontent"]);
            ImgSign.ImageUrl = "data:image/" + ds.Tables[3].Rows[0]["SigfileType"].ToString().Split('.')[1] + ";base64," + Convert.ToBase64String((byte[])ds.Tables[3].Rows[0]["Sigcontent"]);


        }
        catch (Exception ex)
        { }
    }
    public void random()
    {
        try
        {
            string strString = "abcdefghijklmnpqrstuvwxyzABCDQEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            string num = "";
            Random rm = new Random();
            for (int i = 0; i < 16; i++)
            {
                int randomcharindex = rm.Next(0, strString.Length);
                char randomchar = strString[randomcharindex];
                num += Convert.ToString(randomchar);
            }
            hf.Value = num;
            Session["ASPFIXATION2"] = num;
        }
        catch (Exception ex)
        {
            Response.Redirect("~/Error.aspx");
        }
    }

    public void check()
    {
        try
        {
            string cookie_value = null;
            string session_value = null;

            cookie_value = hf.Value;
            session_value = System.Web.HttpContext.Current.Session["ASPFIXATION2"].ToString();
            if (cookie_value != session_value)
            {
                System.Web.HttpContext.Current.Session.Abandon();
                HttpContext.Current.Response.Buffer = false;
                HttpContext.Current.Response.Redirect("~/Error.aspx");
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("~/Error.aspx");
        }
    }

    protected void btnback_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SectionHead/ViewAppliedPersons.aspx");
    }
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        try
        {
            if (rdbType.SelectedIndex < 0)
            {
                objcomm.ShowAlertMessage("Please select Accept/Reject");
                rdbType.Focus();
                return;
            }
            if (rdbType.SelectedValue == "R" && txtRemarks.Text.Trim() == "")
            {
                objcomm.ShowAlertMessage("Please Enter Remarks");
                txtRemarks.Focus();
                return;
            }
            objBE = new Master_BE();
            objBE.Action = "RU";
            objBE.Status = rdbType.SelectedValue;
            objBE.Remarks = txtRemarks.Text.Trim();
            objBE.PostTypeId = Session["GPostId"].ToString();
            objBE.ApplicationId = Session["GAppId"].ToString();
            DataSet ds = objRecr.ApplyPost_DL(objBE, con);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Redirect("~/SectionHead/ViewAppliedPersons.aspx");
            }
        }
        catch (Exception ex)
        { }

    }
}