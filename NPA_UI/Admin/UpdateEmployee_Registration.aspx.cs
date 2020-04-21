using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;
using System.Globalization;
using System.IO;
using System.Text;
public partial class Admin_UpdateEmployee_Registration : System.Web.UI.Page
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
                try
                {
                    random();

                    lblUser.Text = Session["Role"].ToString();
                    lblDate.Text = DateTime.Now.Day + "/" + DateTime.Now.Month + "/" + DateTime.Now.Year;
                    BindEmployee();
                }
                catch (Exception ex)
                {
                    ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
                    Response.Redirect("../Error.aspx");
                }
            }
        }
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
    protected void Btnget_Click(object sender, EventArgs e)
    {
        DataTable dtt = new DataTable();
        objBE.Action = "R";
        objBE.EmpId = ddlemployee.SelectedValue;
        dtt = ObjDL.EmployeeIUDR(objBE, con);
        empanle.Visible = true;
        BtnUpdate.Visible = true;
        if (dtt.Rows.Count > 0)
        {

            if (dtt.Rows[0]["MrgStatus"].ToString() == "Married")
            {
                rdbMrgSta.SelectedValue = "Married";
            }
            else
            {
                rdbMrgSta.SelectedValue = "UnMarried";
            }
            txtNrRailStn.Text = dtt.Rows[0]["NearRailStation"].ToString();
            txtLicHomeTwn.Text = dtt.Rows[0]["LTCHomeTown"].ToString();
            txtNrRailStn.Text = dtt.Rows[0]["NearRailStation"].ToString();
            BindState();
            ddlState.SelectedValue = dtt.Rows[0]["StateCode"].ToString();
            BindDistrict();
            ddlPresentDistrict.SelectedValue = dtt.Rows[0]["DistCode"].ToString();
            txtPinCode.Text = dtt.Rows[0]["PinCode"].ToString();
        }
    }
    public void BindState()
    {
        objBE.Action = "S";
        dt = ObjDL.GetLocations(objBE, con);
        if (dt.Rows.Count > 0)
        {

            objcomm.BindDropDownLists(ddlState, dt, "State", "StateCode", "0");
        }
    }

    public void BindDistrict()
    {
        try
        {
            objBE.Action = "D";
            objBE.statecode = ddlState.SelectedValue;
            dt = ObjDL.GetLocations(objBE, con);
            if (dt.Rows.Count > 0)
                objcomm.BindDropDownLists(ddlPresentDistrict, dt, "DistName", "DistCode", "0");
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }
    
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindDistrict();
    }
    protected void ddlPresentDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        // BindMandal();
    }

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            check();

            objBE.EmpId = ddlemployee.SelectedValue;
            objBE.MrgStatus = rdbMrgSta.SelectedValue.Trim();


            objBE.LicHomeTown = txtLicHomeTwn.Text.Trim();
            objBE.NearRailStation = txtNrRailStn.Text.Trim();
            objBE.statecode = ddlState.SelectedValue.Trim();
            objBE.DistCode = ddlPresentDistrict.SelectedValue.Trim();
            objBE.PinCode = txtPinCode.Text.Trim();

            objBE.UserID = user;
            objBE.Action = "U";
            objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
            dt = ObjDL.EmployeeIUDR(objBE, con);
            if (dt.Rows.Count > 0)
            {
                objcomm.ShowAlertMessage(dt.Rows[0][0].ToString());
            }
            else
            {
                objcomm.ShowAlertMessage("Saved Successfully");
            }
            empanle.Visible = false;
            BtnUpdate.Visible = false;
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
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