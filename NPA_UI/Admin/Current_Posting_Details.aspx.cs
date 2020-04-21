using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;
using System.Globalization;


public partial class Admin_Current_Posting_Details : System.Web.UI.Page
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
                    Div1.Visible = false;
                    BindEmployee();
                    BindState();
                    BindSection();
                    BindDesignation();
                    lblUser.Text = Session["Role"].ToString();
                    lblDate.Text = DateTime.Now.Day + "/" + DateTime.Now.Month + "/" + DateTime.Now.Year;
                    //BindGrid();
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

    protected void BindEmployee()
    {
        try
        {
            objBE.Action = "Empcode";
            dt = ObjDL.EmployeeIUDR(objBE, con);
            if (dt.Rows.Count > 0)
            {
                cf.BindDropDownLists(ddlemployee, dt, "EmpoyeeName", "Employee_ID", "0");
                Div1.Visible = true;
            }
            else
            {
                Div1.Visible = false;
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }

    public void BindState()
    {
        try
        {
            objBE = new Master_BE();
            objBE.statecode = "0";
            objBE.Action = "R";
            dt = ObjDL.StateIUDR(objBE, con);
            if (dt.Rows.Count > 0)
            {
                cf.BindDropDownLists(ddlState, dt, "State", "StateCode", "0");
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }

    public void BindDistrict()
    {
        try
        {
            objBE = new Master_BE();
            objBE.statecode = ddlState.SelectedValue;
            objBE.Action = "R";
            dt = ObjDL.DistrictMaster_IUDR(objBE, con);
            if (dt.Rows.Count > 0)
                cf.BindDropDownLists(ddlCrntDistrict, dt, "DistName", "DistCode", "0");
            else
                ddlCrntDistrict.Items.Clear();
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }

    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDistrict();
    }

    public void BindDesignation()
    {
        objBE = new Master_BE();
        objBE.Action = "R";
        objBE.DesignationID = "0";
        dt = ObjDL.DesignationIUDR(objBE, con);
        if (dt.Rows.Count > 0)
        {
            cf.BindDropDownLists(ddlDesignation, dt, "Designation", "DesignationID", "0");
        }
    }

    public void BindSection()
    {
        objBE.Action = "R";
        dt = ObjDL.SectionIUDR(objBE, con);
        if (dt.Rows.Count > 0)
        {
            cf.BindDropDownLists(ddlSection, dt, "SectionName", "SectionID", "0");
        }
    }

    protected void ddlemployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid();
        int n = GvEmployee.Rows.Count;
        if (GvEmployee.Rows.Count > 0)
        {
            string todate = ((Label)GvEmployee.Rows[n-1].FindControl("lblToDate")).Text;
            if (todate != "Till Now")
            {
                DateTime nextDate = Convert.ToDateTime(todate).AddDays(1);
                txtFromDate.Text = cf.Texttodateconverter(nextDate.ToShortDateString());
            }
            else
                txtFromDate.Text = "";
        }
    }

    protected void BindGrid()
    {
        try
        {
            objBE = new Master_BE();
            objBE.Empcode = ddlemployee.SelectedValue.Trim();
            objBE.Action = "R";
            dt = ObjDL.CurrentPosting(objBE, con);
            if (dt.Rows.Count > 0)
            {
                GvEmployee.DataSource = dt;
                GvEmployee.DataBind();
            }
            else
            {
                GvEmployee.DataSource = null;
                GvEmployee.DataBind();
                cf.ShowAlertMessage("No Data Found");
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            //Response.Redirect("../Error.aspx");
        }
    }
    protected void txtToDate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            DateTime fromdt = Convert.ToDateTime(cf.Texttodateconverter(txtFromDate.Text));
            DateTime todate = Convert.ToDateTime(cf.Texttodateconverter(txtToDate.Text));

            if (todate <= fromdt)
            {
                cf.ShowAlertMessage("To Date Should be Greater Than From Date");
                txtToDate.Text = "";
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            cf.ShowAlertMessage(ex.Message.ToString());
        }
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        try
        {
            check();
            if (validate())
            {
                objBE.Empcode = ddlemployee.SelectedValue.Trim();
                objBE.statecode = ddlState.SelectedValue.Trim();
                objBE.DistCode = ddlCrntDistrict.SelectedValue.Trim();
                objBE.OfficeName = txtOffice.Text;
                objBE.DesignationID = ddlDesignation.SelectedValue.Trim();
                objBE.SectionID = ddlSection.SelectedValue.Trim();
                objBE.OfficeFrom = cf.Texttodateconverter(txtFromDate.Text);
                if (txtToDate.Text != "Till Now")
                    objBE.OfficeTo = cf.Texttodateconverter(txtToDate.Text);
                else
                    objBE.OfficeTo = txtToDate.Text;
                objBE.SectionID = ddlSection.SelectedValue.Trim();
                objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
                objBE.UserID = user;
                objBE.Action = "I";
                dt = ObjDL.CurrentPosting(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    cf.ShowAlertMessage(dt.Rows[0][0].ToString());
                    txtToDate.Text = "";
                    txtToDate.Focus();
                }
                else
                {
                    cf.ShowAlertMessage("Data Saved Successfully");                    
                    if (txtToDate.Text != "Till Now")
                    {
                        DateTime nextDate = Convert.ToDateTime(txtToDate.Text).AddDays(1);
                        txtFromDate.Text = cf.Texttodateconverter(nextDate.ToShortDateString());
                    }
                }
                BindGrid();
                Clear();
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            // Response.Redirect("../Error.aspx");
            cf.ShowAlertMessage(ex.Message);
        }
    }

    protected void GvEmployee_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Edt")
        {
            GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            hdnvalue.Value = ((Label)gvrow.FindControl("lblId")).Text;
            BindEmployee();
            ddlemployee.SelectedValue = ((Label)gvrow.FindControl("lblEmpId")).Text;
            BindState();
            ddlState.SelectedValue = ((Label)gvrow.FindControl("lblStateCode")).Text;
            BindDistrict();
            ddlCrntDistrict.SelectedValue = ((Label)gvrow.FindControl("lblDistCode")).Text;
            txtOffice.Text = ((Label)gvrow.FindControl("lblOfficeName")).Text;
            ddlDesignation.SelectedValue = ((Label)gvrow.FindControl("lblDesigCode")).Text;
            txtFromDate.Text = ((Label)gvrow.FindControl("lblFromDate")).Text;
            txtToDate.Text = ((Label)gvrow.FindControl("lblToDate")).Text;
            ddlSection.SelectedValue = ((Label)gvrow.FindControl("lblSectionCode")).Text;
            btn_Save.Visible = false;
            btn_Update.Visible = true;
        }
        if (e.CommandName == "Dlt")
        {
            try
            {
                GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                objBE.Id = ((Label)gvrow.FindControl("lblId")).Text;
                dt = new DataTable();
                objBE.Action = "D";
                dt = ObjDL.CurrentPosting(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    cf.ShowAlertMessage("Data Unable to Delete");
                    BindGrid();
                    btn_Save.Visible = true;
                    btn_Update.Visible = false;
                }
                else
                {
                    cf.ShowAlertMessage("Data Deleted Successfully");
                    BindGrid();
                    Clear();
                    btn_Save.Visible = true;
                    btn_Update.Visible = false;
                }
            }
            catch (Exception ex)
            {
                ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
                Response.Redirect("~/Error.aspx");
            }
        }
    }

    protected void btn_Update_Click(object sender, EventArgs e)
    {
        try
        {
            if (validate())
            {
                objBE.Id = hdnvalue.Value;
                objBE.Empcode = ddlemployee.SelectedValue.Trim();
                objBE.statecode = ddlState.SelectedValue.Trim();
                objBE.DistCode = ddlCrntDistrict.SelectedValue.Trim();
                objBE.OfficeName = txtOffice.Text;
                objBE.DesignationID = ddlDesignation.SelectedValue.Trim();
                objBE.SectionID = ddlSection.SelectedValue.Trim();
                objBE.OfficeFrom = cf.Texttodateconverter(txtFromDate.Text);
                if (txtToDate.Text != "Till Now")
                    objBE.OfficeTo = cf.Texttodateconverter(txtToDate.Text);
                else
                    objBE.OfficeTo = txtToDate.Text;
                objBE.SectionID = ddlSection.SelectedValue.Trim();
                objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
                objBE.UserID = user;
                objBE.Action = "U";
                dt = ObjDL.CurrentPosting(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    cf.ShowAlertMessage("Data Unable to Update");
                }
                else
                {
                    cf.ShowAlertMessage("Data Updated Successfully");
                    Clear();
                    btn_Update.Visible = false;
                    btn_Save.Visible = true;
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

    protected void Clear()
    {
        ddlState.ClearSelection();
        ddlCrntDistrict.ClearSelection();
        txtOffice.Text = "";
        ddlDesignation.ClearSelection();
        //txtFromDate.Text = "";
        txtToDate.Text = "";
        ddlSection.ClearSelection();
    }

    public bool validate()
    {
        //txtServiceDate,txtDOB,Rdbactive,txtTempAdd,txtempemail,txtMob,txtEmpName,txtEmpCode,txtFName,,,,

        if (ddlemployee.SelectedIndex == 0)
        {
            cf.ShowAlertMessage("Please select Employee");
            ddlemployee.Focus();
            return false;
        }
        if (ddlState.SelectedIndex == 0)
        {
            cf.ShowAlertMessage("Please Select State");
            ddlState.Focus();
            return false;
        }
        if (ddlCrntDistrict.SelectedIndex == 0)
        {
            cf.ShowAlertMessage("Please Select District");
            ddlCrntDistrict.Focus();
            return false;
        }
        if (txtOffice.Text == "")
        {
            cf.ShowAlertMessage("Please Enter Office Name");
            txtOffice.Focus();
            return false;
        }
        if (ddlDesignation.SelectedIndex == 0)
        {
            cf.ShowAlertMessage("Please Select Designation");
            ddlDesignation.Focus();
            return false;
        }
        if (txtFromDate.Text == "")
        {
            cf.ShowAlertMessage("Please Enter From Date");
            txtFromDate.Focus();
            return false;
        }
        if (txtToDate.Text != "")
        {
            if (txtToDate.Text != "Till Now")
            {
                DateTime fromdate = Convert.ToDateTime(txtFromDate.Text);
                DateTime todate = Convert.ToDateTime(txtToDate.Text);
                if (fromdate <= todate)
                {
                    TimeSpan daycount = todate.Subtract(fromdate);
                    int dacount1 = Convert.ToInt32(daycount.Days) + 1;

                }
                else
                {
                    cf.ShowAlertMessage("From Date Must be Less Than To Date");
                    txtToDate.Text = "";
                    txtToDate.Focus();
                    return false;
                }
            }            
        }
        else
        {
            cf.ShowAlertMessage("Please Enter To Date");
            txtToDate.Focus();
            return false;
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