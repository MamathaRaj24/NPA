using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;

public partial class Admin_LeaveType : System.Web.UI.Page
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
                    random();
                    lblUser.Text = Session["Role"].ToString();
                    lblDate.Text = DateTime.Now.Day + "/" + DateTime.Now.Month + "/" + DateTime.Now.Year;
                    BindGrid();
                    txtLTName.Focus();
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

    protected void BindGrid()
    {
        try
        {
            objBE.Action = "R";
            objBE.TypeId = "0";
            dt = ObjDL.LeaveTypeIUDR(objBE, con);
            if (dt.Rows.Count > 0)
            {
                GvLeaves.DataSource = dt;
                GvLeaves.DataBind();
            }
            else
            {
                GvLeaves.DataSource = null;
                GvLeaves.DataBind();
                cf.ShowAlertMessage("No Data");
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }

    protected void rblBirth_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rblBirth.SelectedValue == "1")
        {
            txtnob.Enabled = true;
            txtEach.Enabled = true;
            txtMinLvs.Enabled = true;
        }
        else
        {
            txtnob.Enabled = false;
            txtEach.Enabled = false;
            txtMinLvs.Enabled = false;
        }
    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        try
        {
            check();
            if (validate())
            {
                if (txtLTName.Text != "")
                {
                    objBE.TypeName = txtLTName.Text;
                }
                objBE.UserID = user;
                objBE.Applicable = ddlApplicable.SelectedItem.Text;
                objBE.Noleaves = txtNoOfLeaves.Text.Trim();
                objBE.Action = "I";
                objBE.Applicable = ddlApplicable.SelectedValue;
                objBE.Noleaves = txtNoOfLeaves.Text.Trim();
                objBE.MaxTime = txtMax.Text.Trim();
                objBE.AppliesFor = rdbAppliesFor.SelectedValue;
                objBE.Linked = rblBirth.SelectedValue;
                objBE.NoofChildren = txtnob.Text.Trim();
                objBE.LeavesEach = txtEach.Text.Trim();
                objBE.MinLvs = txtMinLvs.Text.Trim();
                objBE.YrEndStatus = rblLvType.SelectedValue;
                objBE.ReqJoining = rbRequiresJoining.SelectedValue;
                objBE.Extended = rbExtended.SelectedValue;
                dt = ObjDL.LeaveTypeIUDR(objBE, con);
                if (dt.Rows.Count > 0)
                    cf.ShowAlertMessage(dt.Rows[0][0].ToString());
                else
                    cf.ShowAlertMessage("Saved Successfully");
                BindGrid();
                txtLTName.Text = "";
                txtNoOfLeaves.Text = "";
                ddlApplicable.ClearSelection();
                rdbAppliesFor.ClearSelection();
                txtMax.Text = "";
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            check();
            if (validate())
            {
                //objBE.UserID = user;

                objBE.TypeId = lblLID.Text;
                objBE.TypeName = txtLTName.Text;
                objBE.Noleaves = txtNoOfLeaves.Text;
                objBE.Linked = rblBirth.SelectedValue;
                objBE.Applicable = ddlApplicable.SelectedValue;
                objBE.MaxTime = txtMax.Text.Trim();
                objBE.NoofChildren = txtnob.Text.Trim();
                objBE.AppliesFor = rdbAppliesFor.SelectedValue;
                objBE.LeavesEach = txtEach.Text.Trim();
                objBE.MinLvs = txtMinLvs.Text.Trim();
                objBE.YrEndStatus = rblLvType.SelectedValue;
                objBE.UserID = user;
                objBE.Action = "U";
                objBE.ReqJoining = rbRequiresJoining.SelectedValue;
                objBE.Extended = rbExtended.SelectedValue;
                dt = ObjDL.LeaveTypeIUDR(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    txtLTName.Text = "";
                    cf.ShowAlertMessage(" Updated Failed");
                }
                else
                {
                    cf.ShowAlertMessage("Leave Type Details Updated Successfully");
                    btnUpdate.Visible = false;
                    BtnSave.Visible = true;
                    BindGrid();
                    txtLTName.Text = "";
                    txtNoOfLeaves.Text = "";
                    txtLTName.Enabled = true;
                    rblBirth.ClearSelection();
                    rblLvType.ClearSelection();
                    ddlApplicable.ClearSelection();
                    rdbAppliesFor.ClearSelection();
                    rbRequiresJoining.ClearSelection();
                    rbExtended.ClearSelection();
                    txtNoOfLeaves.Enabled = true;
                    //txtnob.Enabled = true;
                    //txtEach.Enabled = true;
                    //txtMinLvs.Enabled = true;
                    txtnob.Text = "";
                    txtEach.Text = "";
                    txtMinLvs.Text = "";
                    txtMax.Text = "";
                }
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }

    protected void GvLeaves_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "edt")
            {
                GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                lblLID.Text = ((Label)(gvrow.FindControl("lblLeaveCode"))).Text;
                txtLTName.Text = ((Label)(gvrow.FindControl("lblLeaveName"))).Text;
                txtNoOfLeaves.Text = ((Label)(gvrow.FindControl("lblNoleaves"))).Text;
               // ddlApplicable.SelectedValue = ((Label)(gvrow.FindControl("lblapplicable"))).Text;
                txtMax.Text = ((Label)(gvrow.FindControl("lblMaxNo"))).Text;
                rdbAppliesFor.SelectedValue = ((Label)(gvrow.FindControl("lblappliesfor"))).Text;
                // rblLvType.SelectedValue = ((Label)(gvrow.FindControl("lblYrEndStatus"))).Text;
                //rbRequiresJoining.SelectedValue = ((Label)(gvrow.FindControl("lblReqJoining"))).Text;
                // rbExtended.SelectedValue = ((Label)(gvrow.FindControl("lblExtended"))).Text;
                txtnob.Text = ((Label)(gvrow.FindControl("lblnoc"))).Text;
                txtEach.Text = ((Label)(gvrow.FindControl("lblnocs"))).Text;
                txtMinLvs.Text = ((Label)(gvrow.FindControl("lblMinLeaves"))).Text;
                if (((Label)(gvrow.FindControl("lbllink"))).Text == "YES")
                    rblBirth.SelectedValue = "1";
                else
                    rblBirth.SelectedValue = "0";
                if (((Label)(gvrow.FindControl("lblReqJoining"))).Text == "YES")
                    rbRequiresJoining.SelectedValue = "1";
                else
                    rbRequiresJoining.SelectedValue = "0";
                if (((Label)(gvrow.FindControl("lblExtended"))).Text == "YES")
                    rbExtended.SelectedValue = "1";
                else
                    rbExtended.SelectedValue = "0";
                if (((Label)(gvrow.FindControl("lblYrEndStatus"))).Text == "APPENDS")
                    rblLvType.SelectedValue = "A";
                else
                    rblLvType.SelectedValue = "L";
                if (((Label)(gvrow.FindControl("lblapplicable"))).Text == "Male  ")
                    ddlApplicable.SelectedValue = "Male";
                if (((Label)(gvrow.FindControl("lblapplicable"))).Text == "Female")
                    ddlApplicable.SelectedValue = "Female";
                if (((Label)(gvrow.FindControl("lblapplicable"))).Text == "Both  ")
                    ddlApplicable.SelectedValue = "Both";
                if (((Label)(gvrow.FindControl("lblappliesfor"))).Text == "Half Yearly         ")
                    rdbAppliesFor.SelectedValue = "Half Yearly";
                if (((Label)(gvrow.FindControl("lblappliesfor"))).Text == "Per Annum           ")
                    rdbAppliesFor.SelectedValue = "Per Annum";
                if (((Label)(gvrow.FindControl("lblappliesfor"))).Text == "For Whole Service   ")
                    rdbAppliesFor.SelectedValue = "For Whole Service";
                btnUpdate.Visible = true;
                BtnSave.Visible = false;
                txtLTName.Enabled = false;
                BindGrid();
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");

        }

        try
        {
            if (e.CommandName == "dlt")
            {
                GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;

                objBE.TypeId = ((Label)(gvrow.FindControl("lblLeaveCode"))).Text;
                objBE.Action = "D";
                dt = ObjDL.LeaveTypeIUDR(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    txtLTName.Text = "";
                }
                else
                {
                    txtLTName.Text = "";
                    cf.ShowAlertMessage("Deleted Successfully");
                }
                BindGrid();

            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");

        }
    }

    public bool validate()
    {
        if (txtLTName.Text == "")
        {
            cf.ShowAlertMessage("Please Enter Leave Name");
            txtLTName.Focus();
            return false;

        }
        if (txtLTName.Text != "")
        {
            bool val;

            val = obj.CheckInput_new(txtLTName.Text);
            if (val == true)
                Response.Redirect("~/Error.aspx");
        }
        return true;
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

}