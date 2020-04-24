using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;

public partial class Employee_WorkUpdates : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Meeting ObjDL = new Meeting();
    CommonFuncs cf = new CommonFuncs();
    Employee_Leave ObjEmpDL = new Employee_Leave();
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
        if (Session["UserId"] != null)
        {
            user = Session["UserId"].ToString();
            con = Session["ConnKey"].ToString();

            if (!IsPostBack)
            {
                try
                {
                    random();
                    lblUser.Text = " " + Session["EmployeeName"].ToString();
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
        else
            Response.Redirect("../Error.aspx");
    }

    protected void BindGrid()
    {
        objBE.EmpId = Session["EmpId"].ToString();
        objBE.Action = "RE";
        dt = ObjDL.AddMeeting_IUDR(objBE, con);
        if (dt.Rows.Count > 0)
        {
            GvWrk.DataSource = dt;
            GvWrk.DataBind();
        }

    }
    protected void GvWrk_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            mp1.Show();
            GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            ViewState["WrkId"] = ((Label)(gvrow.FindControl("lblWrkId"))).Text;
            //if (dt.Rows.Count > 0)
            //{


            //}
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");

        }
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        try
        {
            check();

            objBE.Remarks = txtComments.Text.Trim();
            objBE.Status = rbStatus.SelectedValue; ;
            objBE.WrkDone = txtWrkDone.Text.Trim();
            objBE.Marks = txtMarks.Text.Trim();
            objBE.WrkId= ViewState["WrkId"].ToString();
            objBE.Action = "U";
            dt = ObjDL.AddMeeting_IUDR(objBE, con);
            if (dt.Rows.Count > 0)
                cf.ShowAlertMessage(dt.Rows[0][0].ToString());

            else
            {
                cf.ShowAlertMessage("Status Updated Successfully");
                txtComments.Text = "";
                txtMarks.Text = "";
                txtWrkDone.Text = "";
            }
            //BindGrid();
           // Clear();

        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            //Response.Redirect("../Error.aspx");
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
}