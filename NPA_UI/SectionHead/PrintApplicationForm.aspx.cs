using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;

public partial class SectionHead_PrintApplicationForm : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
    CommonFuncs objcomm = new CommonFuncs();
    DataTable dt;
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

            if (!IsPostBack)
            {
                try
                {
                    random();
                    lblUser.Text = Session["Role"].ToString();
                    lblDate.Text = DateTime.Now.Day + "/" + DateTime.Now.Month + "/" + DateTime.Now.Year;
                    BindPost();
                    //BindSection();
                   // btn_Update.Visible = false;
                }
                catch (Exception ex)
                {
                    ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
                    Response.Redirect("../Error.aspx");
                }
            }
        }
        else
            Response.Redirect("../login.aspx");
    }

    protected void BindPost()
    {
        try
        {
            objBE = new Master_BE();
            objBE.Action = "T";
            dt = ObjDL.Post_IUDR(objBE, con);
            objcomm.BindDropDownLists(ddlPostType, dt, "ApplicationName", "ApplicationID", "0");
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }


    protected void BindGrid()
    {
        try
        {
            objBE = new Master_BE();
            objBE.Action = "R";
            objBE.Id = ddlPostType.SelectedValue;
            dt = ObjDL.Post_IUDR(objBE, con);
            string html = " <div class=card>";

            for (int i = 1; i < dt.Rows.Count; i++)
            {
                DataRow[] section = dt.Select("SectionID='"+i+"' ");
                if (section.Length > 0)
                {
                    html += " <div class='card-header'><strong>" + section[0]["SectionName"].ToString() + "</strong></div>";
                    html += "<div class='card-body card-block'> <div class='row form-group text-left'>";
                    foreach (DataRow row in section)
                    {
                        html += " <div class='col col-md-2'> <label class='form-control-label text-center'>" + row["ItemName"].ToString() + "</label></div>";
                        html += " <div class='col-md-2'> <asp:TextBox ID='' CssClass='form-control' runat='server'> </div>";
                    }
                    html += "</div> </div>";
                }
            }
            objcomm.ShowAlertMessage(html);
            DivData.InnerHtml = html;           
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
           // Response.Redirect("../Error.aspx");
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

    protected void ddlPostType_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid();
    }
}