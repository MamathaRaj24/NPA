using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;

public partial class Admin_Intial_Joining_Details : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
    CommonFuncs objcomm = new CommonFuncs();
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
                btn_Save.Visible = false;
                Btn_Edit.Visible = false;
                btn_Update.Visible = false;
                try
                {
                    random();
                    bindState();
                    bindDesignationType();
                    bindPayCommission();
                    //bindClassType();
                    //bindEmpType();
                    BindEmployee();
                    lblUser.Text = Session["Role"].ToString();
                    lblDate.Text = DateTime.Now.Day + "/" + DateTime.Now.Month + "/" + DateTime.Now.Year;
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
        objBE.Action = "Empcode";
        dt = ObjDL.EmployeeIUDR(objBE, con);
        if (dt.Rows.Count > 0)
        {
            objcomm.BindDropDownLists(ddlemployee, dt, "EmpoyeeName", "Employee_ID", "0");
        }
    }
    public void bindState()
    {
        objBE.Action = "S";
        dt = ObjDL.GetLocations(objBE, con);
        if (dt.Rows.Count > 0)
            objcomm.BindDropDownLists(ddlState, dt, "State", "StateCode", "0");
    }
    protected void ddlemployee_SelectedIndexChanged(object sender, EventArgs e)
    {        
        lblemployeename.Visible = true;
        lblemployeename.Text = ddlemployee.SelectedItem.Text;
        objBE.EmpId = ddlemployee.SelectedValue;
        objBE.Action = "R";
        //ddlemployee.Enabled = false;
        dt = new DataTable();
        dt = ObjDL.IntialPosting(objBE, con);
        if (dt.Rows.Count > 0)
        {
            ddlState.SelectedValue = dt.Rows[0]["StateCode"].ToString();
            txtOfficeNm.Text = dt.Rows[0]["OfficeName"].ToString();
            ddlDesignation.SelectedValue = dt.Rows[0]["Designation_Code"].ToString();
            txtDoJ.Text = dt.Rows[0]["DOJ"].ToString();
            txtConOrdNum.Text = dt.Rows[0]["OrdNum"].ToString();
            txtCOrDt.Text = dt.Rows[0]["OrdDate"].ToString();
            txtAppAut.Text = dt.Rows[0]["ApointgAuthority"].ToString();
            txtModeRec.Text = dt.Rows[0]["ModeOfRec"].ToString();
            rdbOffType.SelectedValue = dt.Rows[0]["OfficerType"].ToString().Trim();
            ddlPayComm.SelectedValue = dt.Rows[0]["PayCommision_Code"].ToString();
            txtPayScale.Text = dt.Rows[0]["PayScale"].ToString();
            txtBasicPay.Text = dt.Rows[0]["BasicPay"].ToString();
            disableEdit();
            Btn_Edit.Visible = true;
            btn_Save.Visible = false;
            btn_Update.Visible = false;
        }
        else
        {
            Clear();
            EnableEdit();
            Btn_Edit.Visible = false;
            btn_Save.Visible = true;
            btn_Update.Visible = false;
        }
    }
    
    public void bindDesignationType()
    {
        objBE.Action = "R";
        dt = ObjDL.DesignationIUDR(objBE, con);
        if (dt.Rows.Count > 0)
            objcomm.BindDropDownLists(ddlDesignation, dt, "Designation", "DesignationID", "0");
    }
    //public void bindClassType()
    //{       
    //        objBE.Action = "Cls"; 
    //        dt = ObjDL.GetDetails(objBE, con);
    //        if (dt.Rows.Count > 0)
    //        {
    //            objcomm.BindDropDownLists(ddlClass, dt, "Class_Name", "Class_Code", "0");
    //        }
    //}
    public void bindPayCommission()
    {
        objBE.Action = "Paycm";
        dt = ObjDL.GetDetails(objBE, con);
        if (dt.Rows.Count > 0)
            objcomm.BindDropDownLists(ddlPayComm, dt, "PayCommision_Name", "PayCommision_Code", "0");
    }
    //public void bindEmpType()
    //{
        
    //        objBE.Action = "Emptype";
    //        dt = ObjDL.GetDetails(objBE, con);
    //        if (dt.Rows.Count > 0)
    //        {
    //            objcomm.BindDropDownLists(ddlEmpType, dt, "EmpType_Name", "EmpType_Code", "0");
    //        }
        
    //}
    protected void disableEdit()
    {
        ddlState.Enabled = false;
        rdbOffType.Enabled = false;
        txtOfficeNm.Enabled = false;
        ddlDesignation.Enabled = false;
        txtConOrdNum.Enabled = false;
        txtAppAut.Enabled = false;
        txtModeRec.Enabled = false;
        ddlPayComm.Enabled = false;
        txtPayScale.Enabled = false;
        txtBasicPay.Enabled = false;
        txtDoJ.Enabled = false;
        txtCOrDt.Enabled = false;
    }
    protected void EnableEdit()
    {
        ddlState.Enabled = true;
        txtOfficeNm.Enabled = true;
        rdbOffType.Enabled = true;
        ddlDesignation.Enabled = true;
        txtConOrdNum.Enabled = true;
        txtAppAut.Enabled = true;
        txtModeRec.Enabled = true;
        ddlPayComm.Enabled = true;
        txtPayScale.Enabled = true;
        txtBasicPay.Enabled = true;
        txtDoJ.Enabled = true;
        txtCOrDt.Enabled = true;
    }
    protected void Clear()
    {
        ddlState.ClearSelection();
        txtOfficeNm.Text = "";
        ddlDesignation.ClearSelection();
        rdbOffType.SelectedIndex=0;
        txtConOrdNum.Text = "";
        txtAppAut.Text = "";
        txtModeRec.Text = "";
        //ddlEmpType.ClearSelection();
        ddlPayComm.ClearSelection();
        txtPayScale.Text = "";
        txtBasicPay.Text = "";
        txtDoJ.Text = "";
        txtCOrDt.Text = "";
    }

   
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        try
        {
            check();
            if (validate())
            {
                objBE.EmpId = ddlemployee.SelectedValue;
                objBE.statecode = ddlState.SelectedValue.Trim();
                objBE.OfficeName = txtOfficeNm.Text.Trim();
                objBE.DesignationName = ddlDesignation.SelectedValue.Trim();
                objBE.DOJ = objcomm.Texttodateconverter(txtDoJ.Text.Trim());
                objBE.ConfOrdNum = txtConOrdNum.Text.Trim();
                objBE.DOR = objcomm.Texttodateconverter(txtCOrDt.Text.Trim());
                objBE.ApointgAuthority = txtAppAut.Text.Trim();
                objBE.ModeOfRec = txtModeRec.Text.Trim();
                objBE.offType = rdbOffType.SelectedValue.Trim();               
                objBE.PayCommsion = ddlPayComm.SelectedValue.Trim();
                objBE.PayScale = txtPayScale.Text.Trim();
                objBE.BasicPay = txtBasicPay.Text.Trim();
                objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
                objBE.UserID = user;
                objBE.Action = "I";
                dt = ObjDL.IntialPosting(objBE, con);
                if (dt.Rows.Count > 0)
                    objcomm.ShowAlertMessage(dt.Rows[0][0].ToString());
                else
                    objcomm.ShowAlertMessage("Saved Successfully");
                disableEdit();
                btn_Save.Visible = false;
                Btn_Edit.Visible = true;
                btn_Update.Visible = false;
                ddlemployee.Enabled = true;
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            objcomm.ShowAlertMessage(ex.Message.ToString());
        }
    }

    protected void btn_Edit_Click(object sender, EventArgs e)
    {
        EnableEdit();
        btn_Save.Visible = false;
        Btn_Edit.Visible = false;
        btn_Update.Visible = true;
    }
    protected void btn_Update_Click(object sender, EventArgs e)
    {
        try
        {
            check();
            if (validate())
            {
                objBE.EmpId = ddlemployee.SelectedValue;
                objBE.statecode = ddlState.SelectedValue.Trim();
                objBE.OfficeName = txtOfficeNm.Text.Trim();
                objBE.DesignationName = ddlDesignation.SelectedValue.Trim();
                objBE.DOJ = objcomm.Texttodateconverter(txtDoJ.Text.Trim());
                objBE.ConfOrdNum = txtConOrdNum.Text.Trim();
                objBE.DOR = objcomm.Texttodateconverter(txtCOrDt.Text.Trim());
                objBE.ApointgAuthority = txtAppAut.Text.Trim();
                objBE.ModeOfRec = txtModeRec.Text.Trim();
                objBE.offType = rdbOffType.SelectedValue.Trim();
                objBE.PayCommsion = ddlPayComm.SelectedValue.Trim();
                objBE.PayScale = txtPayScale.Text.Trim();
                objBE.BasicPay = txtBasicPay.Text.Trim();
                objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
                objBE.UserID = user;
                objBE.Action = "U";
                dt = ObjDL.IntialPosting(objBE, con);
                if (dt.Rows.Count > 0)
                    objcomm.ShowAlertMessage(dt.Rows[0][0].ToString());
                else
                    objcomm.ShowAlertMessage("Updated Successfully");
                disableEdit();
                btn_Save.Visible = false;
                Btn_Edit.Visible = false;
                btn_Update.Visible = false;
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            objcomm.ShowAlertMessage(ex.Message.ToString());
        }
    }
    public bool validate()
    {
        if (ddlState.SelectedIndex == 0)
        {
            objcomm.ShowAlertMessage("Select State of Initial Joining");
            ddlState.Focus();
            return false;
        }
        else if (txtOfficeNm.Text == "")
        {
            objcomm.ShowAlertMessage("Enter Office Name");
            txtOfficeNm.Focus();
            return false;
        }
        else if (ddlDesignation.SelectedIndex == 0)
        {
            objcomm.ShowAlertMessage("Select Designation");
            ddlDesignation.Focus();
            return false;
        }
        else if (txtDoJ.Text == "")
        {
            objcomm.ShowAlertMessage("Select Date Of Joining");
            txtDoJ.Focus();
            return false;
        }
        else if (txtConOrdNum.Text == "")
        {
            objcomm.ShowAlertMessage("Enter Order Number");
            txtConOrdNum.Focus();
            return false;
        }
        else if (txtCOrDt.Text == "")
        {
            objcomm.ShowAlertMessage("Select Date Of Order");
            txtCOrDt.Focus();
            return false;
        }
        else if (txtAppAut.Text == "")
        {
            objcomm.ShowAlertMessage("Enter Appointing Authority");
            txtAppAut.Focus();
            return false;
        }
        else
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