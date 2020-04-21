using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;

public partial class Employee_ApproveLeave : System.Web.UI.Page
{

    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
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
        GridsDiv.Visible = true;
        objBE.EmpId = Session["Empid"].ToString();

        objBE.Action = "FODATA";
        dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
        GvLeaveFO.DataSource = dt;
        GvLeaveFO.DataBind();

        objBE.Action = "RODATA";
        dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
        GVLeaveRO.DataSource = dt;
        GVLeaveRO.DataBind();

        objBE.Action = "SODATA";
        dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
        GVLeaveSO.DataSource = dt;
        GVLeaveSO.DataBind();

        objBE.Action = "EXDATA_FO";
        dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
        GvExtLeaveFO.DataSource = dt;
        GvExtLeaveFO.DataBind();

        objBE.Action = "EXDATA_RO";
        dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
        GvExtLeaveRO.DataSource = dt;
        GvExtLeaveRO.DataBind();

        objBE.Action = "EXDATA_SO";
        dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
        GvExtLeaveSO.DataSource = dt;
        GvExtLeaveSO.DataBind();

        objBE.Action = "FODATA_C";
        dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
        GvCancelFO.DataSource = dt;
        GvCancelFO.DataBind();

        objBE.Action = "RODATA_R";
        dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
        GvCancelRO.DataSource = dt;
        GvCancelRO.DataBind();

        objBE.Action = "SODATA_S";
        dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
        GvCancelSO.DataSource = dt;
        GvCancelSO.DataBind();

        //if (GvLeaveFO.Rows.Count == 0 && GVLeaveRO.Rows.Count == 0 && GVLeaveSO.Rows.Count == 0)
        //    cf.ShowAlertMessage("No Leave pending with you");
    }

    protected void GvLeave_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridsDiv.Visible = false;
        try
        {
            GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;

            objBE.Id = ((Label)(gvrow.FindControl("lblAppID"))).Text;
            lblapliid.Text = ((Label)(gvrow.FindControl("lblAppID"))).Text;
            EmpType.Text = ((Label)(gvrow.FindControl("lblType"))).Text;
            objBE.Status = ((Label)(gvrow.FindControl("lblStatus"))).Text;
            objBE.Action = "VIEW";
            dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
            if (((Label)(gvrow.FindControl("lblStatus"))).Text == "10" || ((Label)(gvrow.FindControl("lblStatus"))).Text == "11" || ((Label)(gvrow.FindControl("lblStatus"))).Text == "12")
            {
                lblHead.Text = "Approve Cancelled Leave";
                btnReject.Visible = false;
            }
           else if (((Label)(gvrow.FindControl("lblStatus"))).Text == "14" || ((Label)(gvrow.FindControl("lblStatus"))).Text == "15" || ((Label)(gvrow.FindControl("lblStatus"))).Text == "16")
            {
                lblHead.Text = "Approve of extension Leave";
            }
            else
                lblHead.Text = "Approve Leave";
            if (dt.Rows.Count > 0)
            {
                DivEmployee.Visible = true;
                lblEmpName.Text = dt.Rows[0]["Emp"].ToString();
                lblDesignation.Text = dt.Rows[0]["Designation"].ToString();
                lblLeaveType.Text = dt.Rows[0]["lvType"].ToString();
                lblReasons.Text = dt.Rows[0]["Reason"].ToString();
                lblNoDays.Text = dt.Rows[0]["NoDays"].ToString();

                lblPrefix.Text = dt.Rows[0]["Prefix"].ToString();
                lblPostfix.Text = dt.Rows[0]["Postfix"].ToString();
                lblremarks.Text = dt.Rows[0]["Remarks"].ToString();
                lblStnLv.Text = dt.Rows[0]["StationLeave"].ToString();
                lblStnLvAdd.Text = dt.Rows[0]["StnLvAddress"].ToString();
                gvData.DataSource = dt;
                gvData.DataBind();
            }
            else
            {
                DivEmployee.Visible = false;
                cf.ShowAlertMessage("No Data Found");
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            //Response.Redirect("../Error.aspx");
        }
    }

    protected void btnAccept_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtOfficerRemarks.Text != "")
            {
                objBE.EmpId = Session["Empid"].ToString();
                objBE.EmpType = EmpType.Text.Trim();
                objBE.OfficerStatus = "A";
                objBE.Remarks = txtOfficerRemarks.Text.Trim();
                if (EmpType.Text == "FO")
                    objBE.Status = "2";
                else if (EmpType.Text == "RO")
                    objBE.Status = "4";
                else if (EmpType.Text == "SO")
                    objBE.Status = "6";
                else if (EmpType.Text == "FOC")
                    objBE.Status = "11";
                else if (EmpType.Text == "ROC")
                    objBE.Status = "12";
                else if (EmpType.Text == "SOC")
                    objBE.Status = "13";
                else if (EmpType.Text == "FOE")
                    objBE.Status = "15";
                else if (EmpType.Text == "ROE")
                    objBE.Status = "16";
                else if (EmpType.Text == "SOE")
                    objBE.Status = "17";

                if (EmpType.Text == "FO" || EmpType.Text == "RO" || EmpType.Text == "SO")
                    objBE.Action = "OfcrActn";
                if (EmpType.Text == "FOC" || EmpType.Text == "ROC" || EmpType.Text == "SOC")
                    objBE.Action = "OfcrActnC";
                if (EmpType.Text == "FOE" || EmpType.Text == "ROE" || EmpType.Text == "SOE")
                    objBE.Action = "OfcrActnE";

                objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
                objBE.Id = lblapliid.Text.Trim();
                dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
                if (dt.Rows.Count > 0)
                    cf.ShowAlertMessage("Status Not Saved, Try Again");
                else
                {
                    cf.ShowAlertMessage("Status Saved.");
                    txtOfficerRemarks.Text = "";
                }
                BindGrid();
                DivEmployee.Visible = false;
            }
            else
                cf.ShowAlertMessage("Please Enter Remarks");

        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            //Response.Redirect("../Error.aspx");

        }
    }

    protected void btnReject_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtOfficerRemarks.Text != "")
            {
                objBE.Action = "OfcrActn";
                objBE.EmpId = Session["Empid"].ToString();
                objBE.EmpType = EmpType.Text.Trim();
                objBE.OfficerStatus = "R";
                objBE.Remarks = txtOfficerRemarks.Text.Trim();
                if (EmpType.Text == "FO")
                    objBE.Status = "3";
                else if (EmpType.Text == "RO")
                    objBE.Status = "5";
                else if (EmpType.Text == "SO")
                    objBE.Status = "7";
                else if (EmpType.Text == "FOE")
                    objBE.Status = "19";
                else if (EmpType.Text == "ROE")
                    objBE.Status = "20";
                else if (EmpType.Text == "SOE")
                    objBE.Status = "21";
                objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
                objBE.Id = lblapliid.Text.Trim();
                dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
                if (dt.Rows.Count > 0)
                    cf.ShowAlertMessage("Status Not Saved, Try Again");
                else
                {
                    cf.ShowAlertMessage("Status Saved.");
                    txtOfficerRemarks.Text = "";
                }
                BindGrid();
                DivEmployee.Visible = false;
            }
            else
                cf.ShowAlertMessage("Please Enter Remarks");
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