using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;

public partial class Leave_Details : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
    CommonFuncs cf = new CommonFuncs();
    Employee_Leave ObjEmpDL = new Employee_Leave();
    DataTable dt;
    string user, con;
    SampleSqlInjectionScreeningModule obj = new SampleSqlInjectionScreeningModule();
    string IP = HttpContext.Current.Request.UserHostAddress;
    IFormatProvider provider = new System.Globalization.CultureInfo("en-IN", true);
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
        objBE.Action = "LD";
        objBE.Empcode = Session["Empid"].ToString();
        dt = ObjEmpDL.Employee_LeaveDL(objBE, con);
        if (dt.Rows.Count > 0)
        {
            GvLeave.DataSource = dt;
            GvLeave.DataBind();
            GvLeave.HeaderRow.Cells[0].Attributes["data-class"] = "expand";

            //Attribute to hide column in Phone.
            GvLeave.HeaderRow.Cells[1].Attributes["data-hide"] = "phone";
            GvLeave.HeaderRow.Cells[2].Attributes["data-hide"] = "phone";
            GvLeave.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
            GvLeave.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";
            GvLeave.HeaderRow.Cells[5].Attributes["data-hide"] = "phone";
            GvLeave.HeaderRow.Cells[6].Attributes["data-hide"] = "phone";
            GvLeave.HeaderRow.Cells[7].Attributes["data-hide"] = "phone";
            //gvVillages.HeaderRow.Cells[2].Attributes["data-hide"] = "phone";


            //Adds THEAD and TBODY to GridView.
            GvLeave.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        else
        {
            GvLeave.DataSource = null;
            GvLeave.DataBind();
            cf.ShowAlertMessage("No Data");
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
        try
        {
            GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            objBE.Action = "CL";
            objBE.Empcode = Session["Empid"].ToString();
            objBE.Status = e.CommandArgument.ToString();
            dt = ObjEmpDL.Employee_LeaveDL(objBE, con);
            if (dt.Rows.Count > 0)
            {
                BindGrid();
            }
         }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");

        }
    }
}
