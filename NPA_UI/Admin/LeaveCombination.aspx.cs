using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;

public partial class Admin_LeaveCombination : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
    CommonFuncs cf = new CommonFuncs();
    DataTable dt;
    string user, con;
    SampleSqlInjectionScreeningModule obj = new SampleSqlInjectionScreeningModule();

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
                    random();
                    lblUser.Text = Session["Role"].ToString();
                    lblDate.Text = DateTime.Now.Day + "/" + DateTime.Now.Month + "/" + DateTime.Now.Year;
                    BindLeaveType();

                }
                catch (Exception ex)
                {
                    ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
                    Response.Redirect("../Error.aspx");
                }
            }
        }
        else
        {
            Response.Redirect("../Error.aspx");
        }
    }
    protected void BindLeaveType()
    {
        dt = new DataTable();
        objBE.Action = "R";
        dt = ObjDL.LeaveTypeIUDR(objBE, con);
        cf.BindDropDownLists(ddlLeaveType, dt, "TypeName", "typeId", "Select");
    }
    protected void ddlLeaveType_SelectedIndexChanged(object sender, EventArgs e)
    {
        grid.Visible = true;
        button.Visible = true;
        BindCombinationType();
    }
    protected void BindCombinationType()
    {
        objBE.Action = "CMR";
        objBE.TypeId = ddlLeaveType.SelectedValue;
        dt = ObjDL.LeaveTypeIUDR(objBE, con);
        if (dt.Rows.Count > 0)
        {
            GVLeaves.DataSource = dt;
            GVLeaves.DataBind();
        }
        else
        {
            GVLeaves.DataSource = null;
            GVLeaves.DataBind();
            cf.ShowAlertMessage("No Data");
        }
    }

    protected void GVLeaves_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblCml = (Label)e.Row.FindControl("lblCheck");
            Label lblTypeID = (Label)e.Row.FindControl("lblTypeID");
            CheckBox chk = (CheckBox)e.Row.FindControl("CheckBox1");
            if (lblTypeID.Text == ddlLeaveType.SelectedValue)
            {
                chk.Enabled = false;
            }

            if (lblCml.Text == lblTypeID.Text)
            {
                chk.Checked = true;
            }
            else
            {
                chk.Checked = false;
            }
        }
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        try
        {
            check();
            DataTable LeaveTypes = new DataTable();
            LeaveTypes.Columns.Add("LeaveType", typeof(string));
            LeaveTypes.Columns.Add("balance", typeof(string));
            int j = 0;

            foreach (GridViewRow gr in GVLeaves.Rows)
            {
                string ID = ((Label)gr.FindControl("lblTypeID")).Text;
                string Name = ((Label)gr.FindControl("lblLeaveName")).Text;
                var checkbox = gr.FindControl("CheckBox1") as CheckBox;
                if (checkbox.Checked == true)
                {
                    LeaveTypes.Rows.Add();
                    LeaveTypes.Rows[j]["LeaveType"] = ((Label)gr.FindControl("lblTypeID")).Text;
                    j++;
                }
            }

            if (ddlLeaveType.SelectedValue != "")
            {
                objBE.TypeId = ddlLeaveType.SelectedValue;
            }
            objBE.HTvp = LeaveTypes;
            objBE.Action = "CMI";
            objBE.UserID = user;
            dt = ObjDL.LeaveTypeIUDR(objBE, con);
            if (dt.Rows.Count > 0)
            {
                cf.ShowAlertMessage(dt.Rows[0][0].ToString());
            }
            else
            {
                cf.ShowAlertMessage("Saved Successfully");
                ddlLeaveType.ClearSelection();
                GVLeaves.DataSource = null;
                GVLeaves.DataBind();
                button.Visible = false;
            }

        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");

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