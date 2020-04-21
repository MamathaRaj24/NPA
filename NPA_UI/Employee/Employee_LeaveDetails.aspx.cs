using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;

public partial class Employee_Employee_LeaveDetails : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
    CommonFuncs cf = new CommonFuncs();
    Employee_Leave ObjEmpDL = new Employee_Leave();
    DataTable dt;
    string user, con;
  
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Request.ServerVariables["HTTP_REFERER"] == null) || (Request.ServerVariables["HTTP_REFERER"] == "7"))
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
        if (Session["UserId"] != null)
        {
            user = Session["UserId"].ToString();
            con = Session["ConnKey"].ToString();

            if (!IsPostBack)
            {
                try
                {
                    random();
                    lblUser.Text = Session["EmployeeName"].ToString();
                    lblDate.Text = DateTime.Now.Day + "/" + DateTime.Now.Month + "/" + DateTime.Now.Year;
                    BindGrid();
                }
                catch (Exception ex)
                {
                    ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
                    Response.Redirect("../Error.aspx");
                }
            }
        }
    }
    protected void BindGrid()
    {
        objBE.Action = "EV";
        //objBE.TypeId = "S";
        objBE.EmpId = Session["Empid"].ToString();
        dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
        if (dt.Rows.Count > 0)
        {
            GvLeave.DataSource = dt;
            GvLeave.DataBind();
        }
        else
        {
            GvLeave.DataSource = null;
            GvLeave.DataBind();
        }
    }
 
    public void check()
    {
        try
        {
            string cookie_value = null;
            string session_value = null;
            //cookie_value = System.Web.HttpContext.Current.Request.Cookies["ASPFIXATION2"].Value;
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
    protected void GvLeave_RowCommand(object sender, GridViewCommandEventArgs e)
    {
      if (e.CommandName == "View")
      {
          try
          {
              GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
              Label lblStatusname = (Label)gvrow.FindControl("lblStatusname");
              Label lblStatusUpdate = (Label)gvrow.FindControl("lblStatusUpdate");
              Label lblApplications = (Label)gvrow.FindControl("lblApplication");
              objBE.Id = lblApplications.Text;
              
              objBE.Action = "VS";
              dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
              if (dt.Rows.Count > 0)
              {
                  GDView.Visible = true;
                  GDView.DataSource = dt;
                  GDView.DataBind();
              }

              objBE.Action = "VIEWlV";
              dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
              if (dt.Rows.Count > 0)
              {
                  GridView1.Visible = true;
                  GridView1.DataSource = dt;
                  GridView1.DataBind();
              }


          }
          catch (Exception ex)
          {
              ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
              Response.Redirect("../Error.aspx");
          }
      }
  
    }
}
