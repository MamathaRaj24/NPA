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

public partial class ViewAcceptRejectdata : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
    Recruitment_DL objRecr = new Recruitment_DL();
    CommonFuncs objcomm = new CommonFuncs();
    DataTable dt = new DataTable();
    string ConnKey = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
    string user, con;
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Request.ServerVariables["HTTP_REFERER"] == null) || (Request.ServerVariables["HTTP_REFERER"] == ""))
        {
            Response.Redirect("~/Error.aspx");
        }
        else
        {
            string http_ref = Request.ServerVariables["HTTP_REFERER"].Trim();
            string http_hos = Request.ServerVariables["HTTP_HOST"].Trim();
            int len = http_hos.Length;
            if (http_ref.IndexOf(http_hos, 0) < 0)
            {
                Response.Redirect("../Error.aspx");
            }
        }
        PrevBrowCache.enforceNoCache();
        if (Session["UserId"] != null && Session["RoleID"].ToString() == "5")
        {
            user = Session["UserId"].ToString();
            con = Session["ConnKey"].ToString();
        }
        else
        {
            Response.Redirect("../login.aspx");
        }
        if (!IsPostBack)
        {
            random();
            lblUser.Text = Session["Role"].ToString();
            lblDate.Text = DateTime.Now.Day + "/" + DateTime.Now.Month + "/" + DateTime.Now.Year;
            BindPosts();
        }
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
    public void BindPosts()
    {
        try
        {
            dt = new DataTable();
            objBE.Action = "NOTICE";
            dt = ObjDL.Post_IUDR(objBE, ConnKey);
            if (dt.Rows.Count > 0)
            {
                objcomm.BindDropDownLists(ddlPostType, dt, "PostName", "PostID", "Select");
            }
        }
        catch (Exception ex)
        { }
    }
    public void Getdata(string PostId)
    {
        try
        {
            objBE = new Master_BE();
            objBE.Action = "RS";
            objBE.PostTypeId = PostId;
            DataSet ds = objRecr.ApplyPost_DL(objBE, ConnKey);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Gvpost.Visible = true;
                Gvpost.DataSource = ds.Tables[0];
                Gvpost.DataBind();
            }
            else
            {
                Gvpost.Visible = false;
            }
        }
        catch (Exception ex)
        { }
    }
    protected void ddlPostType_SelectedIndexChanged(object sender, EventArgs e)
    {
        Gvpost.Visible = false;
        if (ddlPostType.SelectedIndex > 0)
            Getdata(ddlPostType.SelectedValue);
    }
   
}