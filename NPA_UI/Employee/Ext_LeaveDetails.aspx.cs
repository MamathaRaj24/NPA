using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;

public partial class Ext_LeaveDetails : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
    CommonFuncs cf = new CommonFuncs();
    Employee_Leave ObjEmpDL = new Employee_Leave();
    DataTable dt;
    string user, con;
    IFormatProvider provider = new System.Globalization.CultureInfo("en-IN", true);

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
        objBE.Action = "LvExtend";
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
    protected bool IsHoliday(string day)
    {
        DataTable dtnew = new DataTable();
        objBE.FmDt = cf.Texttodateconverter(day);
        objBE.Action = "CHK";
        dtnew = ObjDL.HolidayIUDR(objBE, con);
        if (dtnew.Rows.Count > 0)
            return true;
        else
            return false;

    }
    protected bool IsRHday(string day)
    {
        objBE.FmDt = cf.Texttodateconverter(day);
        objBE.Action = "RS";
        dt = ObjDL.HolidayIUDR(objBE, con);
        if (dt.Rows.Count > 0)
            return true;
        else
            return false;
    }
    protected bool CheckDay(string day)
    {
        objBE.Action = "CHKDAY";
        objBE.EmpId = Session["Empid"].ToString();
        objBE.FmDt = cf.Texttodateconverter(day);
        dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
        if (dt.Rows.Count > 0)
            return false;
        else
            return true;
    }
    protected void GVtxtToDate_TextChanged(object sender, EventArgs e)
    {
        TextBox txtTodate = sender as TextBox;
        GridViewRow gRow = (GridViewRow)txtTodate.NamingContainer;
        Label lblTo = ((Label)(gRow.FindControl("lblTo")));
        Label lblnol = ((Label)(gRow.FindControl("lblnol")));
        Label lblLeaveBalance = ((Label)(gRow.FindControl("lblLeaveBalance")));
        Label lblMaxLeaves = ((Label)(gRow.FindControl("lblMaxLeaves")));

        if (lblTo.Text.Trim() != "" && txtTodate.Text.Trim() != "")
        {
            DateTime frmdt = DateTime.Parse(lblTo.Text.Trim(), provider, System.Globalization.DateTimeStyles.None);
            DateTime todate = DateTime.Parse(txtTodate.Text.Trim(), provider, System.Globalization.DateTimeStyles.None);
            TimeSpan ts = todate - frmdt;
            if (ts.Days < 0)
            {
                cf.ShowAlertMessage("Invalid Date Selection");
                txtTodate.Text = "";
                return;
            }
            else
            { 
                    if (CheckDay(txtTodate.Text))
                        GetNoLGrid(lblTo, txtTodate, lblnol, lblLeaveBalance, lblMaxLeaves);

                    else
                        cf.ShowAlertMessage("Leave Already applied for selected date");
                
            }
            
        }

    }
    public void GetNoLGrid(Label from, TextBox to, Label nol, Label lb, Label max)
    {
        if (from.Text.Trim() != "" && to.Text.Trim() != "")
        {
            DateTime frmdt = DateTime.Parse(from.Text.Trim(), provider, System.Globalization.DateTimeStyles.None);
            DateTime todate = DateTime.Parse(to.Text.Trim(), provider, System.Globalization.DateTimeStyles.None);
            if (todate < DateTime.Now.Date || todate < frmdt)
            {                
                cf.ShowAlertMessage("To date can not be less than from date");
                return;
            }
            double Totaldays = 0;

            TimeSpan ts = todate.Subtract(frmdt);
            int noofdays = ts.Days;

            if (from.Text.Trim() == to.Text.Trim())
            {
                cf.ShowAlertMessage("No need of extension for selected to date");
                return;
            }
            nol.Text = noofdays.ToString();
            if (Totaldays > Convert.ToInt16(lb.Text))
            {
                to.Text = "";
                nol.Text = "";
                to.Focus();
                to.Enabled = true;
                cf.ShowAlertMessage("No. of Leaves can not be more than leave balance");
            }
            if (Totaldays > Convert.ToInt16(max.Text))
            {
                to.Text = "";
                nol.Text = "";
                to.Focus();
                to.Enabled = true;
                cf.ShowAlertMessage("No. of Leaves can not be more than maximum leaves");
            }
        }
    }
   
    protected void GvLeave_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Ext")
        {
            try
            {
                GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                
                Label lblApplications = (Label)gvrow.FindControl("lblApplication");
                Label lblLeaveTypes = (Label)gvrow.FindControl("lblleavetypecd");
                TextBox txtTo = (TextBox)gvrow.FindControl("txtTo");
                RadioButtonList rbLeaves = (RadioButtonList)gvrow.FindControl("rbLeaves");
                Label lblnol = (Label)gvrow.FindControl("lblnol");
                objBE.ToDt = DateTime.Parse(((TextBox)gvrow.FindControl("txtTo")).Text.Trim(), provider, System.Globalization.DateTimeStyles.None).ToString("yyyy-MM-dd");
                objBE.Status = "14";
                objBE.Id = lblApplications.Text;
                //objBE.Reason = Reasons.Text;
                objBE.Action = "EX";
                objBE.Noleaves = lblnol.Text;
                dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
                if (dt.Rows.Count > 0)
                {
                  
                    cf.ShowAlertMessage(dt.Rows[0][0].ToString());
                }
                BindGrid();
                //}
                //else
                //    cf.ShowAlertMessage("Please Enter Reasons for Cancellation");
            }
            catch (Exception ex)
            {
                ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
                Response.Redirect("../Error.aspx");
            }
        }

    }
    protected void rbLeaves_SelectedIndexChanged(object sender, EventArgs e)
    {
        RadioButtonList rblist = (RadioButtonList)sender;
        GridViewRow gr = (GridViewRow)rblist.NamingContainer;

        TextBox From = (TextBox)gr.FindControl("txtFrom");
        TextBox To = (TextBox)gr.FindControl("txtTo");
        if (rblist.SelectedValue == "P")
        {
            From.Enabled = true;
            To.Enabled = true;
        }
        else
        {
            From.Enabled = false;
            To.Enabled = false;

        }
    }
    protected void GVFromdate_TextChanged(object sender, EventArgs e)
    {
        TextBox txtfrom = sender as TextBox;
        GridViewRow gRow = (GridViewRow)txtfrom.NamingContainer;
        TextBox txtFrom = ((TextBox)(gRow.FindControl("txtFrom")));
        if (txtFrom.Text.Trim() != "")
        {
            DateTime txtfrmdate = DateTime.Parse(((TextBox)(gRow.FindControl("txtFrom"))).Text.Trim(), provider, System.Globalization.DateTimeStyles.None);
            DateTime lblfrmdate = DateTime.Parse(((Label)(gRow.FindControl("lblFrom"))).Text.Trim(), provider, System.Globalization.DateTimeStyles.None);
            if ((lblfrmdate > txtfrmdate))
            {
                txtfrom.Text = "";
                cf.ShowAlertMessage("Selected date should be in between applied leave dates");
            }
        }

        //if (txtFrom.Text.Trim() != "" && ((TextBox)(gRow.FindControl("txtTo"))).Text.Trim() != "")
        //{
        //    DateTime txtfrmdate = DateTime.Parse(((TextBox)(gRow.FindControl("txtFrom"))).Text.Trim(), provider, System.Globalization.DateTimeStyles.None);
        //    DateTime txttodate = DateTime.Parse(((TextBox)(gRow.FindControl("txtTo"))).Text.Trim(), provider, System.Globalization.DateTimeStyles.None);

        //    DateTime lblfrmdate = DateTime.Parse(((Label)(gRow.FindControl("lblFrom"))).Text.Trim(), provider, System.Globalization.DateTimeStyles.None);
        //    DateTime lbltodate = DateTime.Parse(((Label)(gRow.FindControl("lblTo"))).Text.Trim(), provider, System.Globalization.DateTimeStyles.None);
        //    if ((lblfrmdate >= txtfrmdate) && (lbltodate <= txttodate))
        //    {
        //        txtfrom.Text = "";
        //        cf.ShowAlertMessage("Selected date should be greater than the current date");
        //    }
        //}
        
        //if (DateTime.Now.Date > DateTime.Parse(txtFrom.Text.Trim(), provider, System.Globalization.DateTimeStyles.None))
        //{
        //    txtfrom.Text = "";
        //    cf.ShowAlertMessage("Selected date should be greater than the current date");
        //}
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
