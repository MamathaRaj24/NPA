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

public partial class Admin_Education_Qualification : System.Web.UI.Page
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
                    BindGrid();
                    bindDiscipline();
                    bindQualification();
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
    public bool validate()
    {
        //txtServiceDate,txtDOB,Rdbactive,txtTempAdd,txtempemail,txtMob,txtEmpName,txtEmpCode,txtFName,,,,

        //if (txtEmpCode.Text == "")
        //{
        //    objcomm.ShowAlertMessage("Please Enter Employee code");
        //    txtEmpCode.Focus();
        //    return false;

        //} 

        return true;
    } 
    public void bindQualification()
    {
        try
        {
            objBE.Action = "R";
            dt = ObjDL.GetDetails(objBE, con);
            if (dt.Rows.Count > 0)
            {
                objcomm.BindDropDownLists(ddlQualification, dt, "Qualification_Name", "Qualification_Code", "0");
            }
            else
            {

            }
        }
        catch (Exception ex)
        {
        }
    }
    public void bindDiscipline()
    {
        try
        {
            objBE.Action = "D";
            dt = ObjDL.GetDetails(objBE, con);
            if (dt.Rows.Count > 0)
            {
                objcomm.BindDropDownLists(ddlDiscipline, dt, "Discipline_Name", "Discipline_Code", "0");
            }
            else
            {

            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void Clear()
    { 
        ddlQualification.ClearSelection();
        ddlDiscipline.ClearSelection();
        txtBoardUniver.Text = "";
        txtyrPass.Text = ""; 
    }
    protected void BindGrid()
    {
        try
        {
            objBE = new Master_BE(); 
            objBE.Action = "R";
            dt = ObjDL.EducationQualification(objBE, con);
            if (dt.Rows.Count > 0)
            {
                GvEmployee.DataSource = dt;
                GvEmployee.DataBind();
            }
            else
            {
                GvEmployee.DataSource = null;
                GvEmployee.DataBind();
                objcomm.ShowAlertMessage("No Data");
            }
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
            if (validate())
            {
                objBE.Qualificationcode = ddlQualification.SelectedValue.Trim();
                objBE.Discipline_Code = ddlDiscipline.SelectedValue.Trim();
                objBE.BoardUniver = txtBoardUniver.Text.Trim();
                objBE.YrPass = objcomm.Texttodateconverter(txtyrPass.Text.Trim());
                objBE.UserID = user;
                objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
                objBE.Action = "I";

                dt = ObjDL.EducationQualification(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    objcomm.ShowAlertMessage(dt.Rows[0][0].ToString());
                }
                else
                {
                    objcomm.ShowAlertMessage("Saved Successfully");
                }
                BindGrid();
                Clear();
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
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