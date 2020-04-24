using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;
public partial class Admin_Mst_Qualification : System.Web.UI.Page
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
        if (Session["UserId"] != null && Session["RoleID"].ToString() == "5")
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
                    txtQualification.Focus();
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
    protected void BindGrid()
    {
        try
        {
            objBE = new Master_BE();
            objBE.Action = "R";
            
            dt = ObjDL.Qualification_Master(objBE, con);
            if (dt.Rows.Count > 0)
            {
                GvQual.DataSource = dt;
                GvQual.DataBind();
            }
            else
            {
                GvQual.DataSource = null;
                GvQual.DataBind();
                cf.ShowAlertMessage("No Data");
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
        try
        {
            check();
            if (validate())
            {
                if (txtQualification.Text.Trim() != "")
                {
                    objBE.Qualification = txtQualification.Text.Trim();
                }
                objBE.Level = txtLevel.Text.Trim();
                objBE.Action = "I";
               
                dt = ObjDL.Qualification_Master(objBE, con);
                if (dt.Rows.Count > 0)
                    cf.ShowAlertMessage(dt.Rows[0][0].ToString());
                else
                {
                    txtQualification.Text = "";
                    txtLevel.Text = "";
                    cf.ShowAlertMessage("Saved Successfully");
                    BindGrid();
                }
                
               
               
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

                objBE.Qualificationcode = lblQualId.Text.Trim();
                objBE.Qualification = txtQualification.Text.Trim();
                objBE.Level = txtLevel.Text.Trim();
                objBE.Action = "U";
                dt = ObjDL.Qualification_Master(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    txtQualification.Text = "";
                    cf.ShowAlertMessage(" Updated Failed");
                }
                else
                {
                    cf.ShowAlertMessage("Qualification Details Updated Successfully");
                    btnUpdate.Visible = false;
                    BtnSave.Visible = true;
                    BindGrid();
                    txtQualification.Text = "";
                    txtLevel.Text = "";
                }
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");

        }
    }
    protected void GvQual_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "edt")
            {
                GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                lblQualId.Text = ((Label)(gvrow.FindControl("lblQualificationId"))).Text;
                txtQualification.Text = ((Label)(gvrow.FindControl("lblQualificationName"))).Text;
                txtLevel.Text = ((Label)(gvrow.FindControl("lblLevel"))).Text;
                btnUpdate.Visible = true;
                BtnSave.Visible = false;

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
                objBE.Qualificationcode = ((Label)(gvrow.FindControl("lblQualificationId"))).Text;
                
                objBE.Action = "D";
                dt = ObjDL.Qualification_Master(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    txtQualification.Text = "";
                    
                }
                else
                {
                    txtQualification.Text = "";
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
        if (txtQualification.Text.Trim() == "")
        {
            cf.ShowAlertMessage("Please Enter Qualification");
            txtQualification.Focus();
            return false;

        }
        if (txtLevel.Text.Trim() == "")
        {
            cf.ShowAlertMessage("Please Enter Level");
            txtLevel.Focus();
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