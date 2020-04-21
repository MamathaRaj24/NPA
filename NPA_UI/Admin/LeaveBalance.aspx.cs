using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;

public partial class Admin_LeaveBalance : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
    CommonFuncs cf = new CommonFuncs();
    DataTable dt;
    string user, con;
    SampleSqlInjectionScreeningModule obj = new SampleSqlInjectionScreeningModule();
    string IP = HttpContext.Current.Request.UserHostAddress;

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
        if (Session["UserId"] != null && Session["RoleID"].ToString() == "1")
        {
            user = Session["UserId"].ToString();
            con = Session["ConnKey"].ToString();

            if (!IsPostBack)
            {
                try
                {
                    Grid1.Visible = false;
                    button1.Visible = false;
                    random();
                    lblUser.Text = Session["Role"].ToString();
                    lblDate.Text = DateTime.Now.Day + "/" + DateTime.Now.Month + "/" + DateTime.Now.Year;
                    BindEmployee();
                    BindGrid();

                }
                catch (Exception ex)
                {
                    ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
                    //Response.Redirect("../Error.aspx");
                }
            }
        }
    }

    protected void BindEmployee()
    {
        objBE.Action = "EMP";
        dt = ObjDL.LeaveBalanceIUDR(objBE, con);
        cf.BindDropDownLists(ddlEmp, dt, "Emp", "Employee_ID", "Select");
    }

    protected void ddlEmp_SelectedIndexChanged(object sender, EventArgs e)
    {
        button1.Visible = true;
        Grid1.Visible = true;
        try
        {
            objBE.Action = "R";
            objBE.EmpId = ddlEmp.SelectedIndex <= 0 ? null : ddlEmp.SelectedValue;
            dt = ObjDL.LeaveBalanceIUDR(objBE, con);
            if (dt.Rows.Count > 0)
            {
                GvEditLeave.DataSource = dt;
                GvEditLeave.DataBind();
                GvEditLeave.Visible = true;
                GvLBalance.Visible = false;
            }
            else
            {
                DataTable dtt = new DataTable();
                objBE.Action = "VIEW";
                objBE.EmpId = ddlEmp.SelectedValue.Trim();
                dtt = ObjDL.LeaveBalanceIUDR(objBE, con);
                if (dtt.Rows.Count > 0)
                {
                    GvLBalance.DataSource = dtt;
                    GvLBalance.DataBind();
                    GvLBalance.Visible = true;
                    GvEditLeave.Visible = false;
                }
                else
                    cf.ShowAlertMessage("No Data Found");
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        check();
        try
        {
            if (lblDJoin.Text.Trim() == "")
            {
                cf.ShowAlertMessage("Please Enter Date");
                return;
            }
            DataTable dtleave = new DataTable();
            dtleave.Columns.Add("LeaveType", typeof(string));
            dtleave.Columns.Add("balance", typeof(string));
            int j = 0;
            foreach (GridViewRow gr in GvLBalance.Rows)
            {
                string LeaveType = ((Label)gr.FindControl("lblLeaveCode")).Text.Trim();
                string balance = ((TextBox)gr.FindControl("txtLeaveBal")).Text.Trim();
                if (balance != "")
                {
                    dtleave.Rows.Add();
                    dtleave.Rows[j]["LeaveType"] = ((Label)gr.FindControl("lblLeaveCode")).Text.Trim();
                    dtleave.Rows[j]["balance"] = ((TextBox)gr.FindControl("txtLeaveBal")).Text.Trim();
                    j++;
                }
                else
                {
                    cf.ShowAlertMessage("Please Enter Leave Balance alteast Zero(0)");
                    return;
                }
            }
            dt = new DataTable();
            objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
            objBE.EmpId = ddlEmp.SelectedValue;
            objBE.AsOnDate = cf.Texttodateconverter(lblDJoin.Text.Trim());
            objBE.User = Session["UserId"].ToString();
            objBE.Action = "I";
            objBE.HTvp = dtleave;
            dt = ObjDL.LeaveBalanceIUDR(objBE, con);
            if (dt.Rows.Count > 0)
                cf.ShowAlertMessage("Data Not Saved");
            else
            {
                BindGrid();
                cf.ShowAlertMessage("Data Saved Successfully");
                ddlEmp.ClearSelection();
                GvLBalance.DataSource = null;
                GvLBalance.DataBind();
                button1.Visible = false;

            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            cf.ShowAlertMessage(ex.Message);
        }
    }

    protected void BindGrid()
    {
        objBE.Action = "R";
        objBE.EmpId = ddlEmp.SelectedIndex <= 0 ? null : ddlEmp.SelectedValue;
        dt = ObjDL.LeaveBalanceIUDR(objBE, con);
        if (dt.Rows.Count > 0)
        {
            GvEditLeave.Visible = true;
            GvEditLeave.DataSource = dt;
            GvEditLeave.DataBind();

        }
        else
        {
            GvEditLeave.DataSource = null;
            GvEditLeave.DataBind();
            cf.ShowAlertMessage("No Data Found");
        }
    }

    protected void GvEditLeave_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GvEditLeave.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void GvEditLeave_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GvEditLeave.EditIndex = -1;
        BindGrid();
    }

    protected void GvEditLeave_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = GvEditLeave.Rows[e.RowIndex];
            int empid1 = Convert.ToInt32(GvEditLeave.DataKeys[e.RowIndex].Values[0]);
            int typeid1 = Convert.ToInt32(GvEditLeave.DataKeys[e.RowIndex].Values[1]);
            string LeaveBalance1 = (row.FindControl("txtLeaveBalance1") as TextBox).Text;
            objBE.LeaveBalance = LeaveBalance1.ToString();
            objBE.EmpId = empid1.ToString();
            objBE.TypeId = typeid1.ToString();
            objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
            objBE.User = Session["UserId"].ToString();
            objBE.Action = "U";
            dt = ObjDL.LeaveBalanceIUDR(objBE, con);
            if (dt.Rows.Count > 0)
            {
                cf.ShowAlertMessage("Data Not Updated");
            }
            else
            {
                cf.ShowAlertMessage("Data Updated Successfully");
                GvEditLeave.DataSource = dt;
                GvEditLeave.DataBind();
                GvEditLeave.EditIndex = -1;
                BindGrid();
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            cf.ShowAlertMessage(ex.ToString());
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
