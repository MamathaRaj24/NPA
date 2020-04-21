using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;


public partial class Admin_Designation : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
    CommonFuncs cf = new CommonFuncs();
    DataTable dt;
    string user,con;
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
                    txtdisignation.Focus();
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
            objBE.DesignationID = "0";
            dt = ObjDL.DesignationIUDR(objBE, con);
            if (dt.Rows.Count > 0)
            {
                Gvdesignation.DataSource = dt;
                Gvdesignation.DataBind();
            }
            else
            {
                Gvdesignation.DataSource = null;
                Gvdesignation.DataBind();
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
                if (txtdisignation.Text != "")
                {
                    objBE.DesignationName = txtdisignation.Text;
                }
                objBE.UserID = user;
                objBE.Action = "I";
                objBE.IP = IP;
                objBE.cadre = txtcadre.Text.Trim();
                dt = ObjDL.DesignationIUDR(objBE, con);
                if (dt.Rows.Count > 0)
                    cf.ShowAlertMessage(dt.Rows[0][0].ToString());
                else
                    cf.ShowAlertMessage("Saved Successfully");
                BindGrid();
                txtdisignation.Text = "";
                txtcadre.Text = "";
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
                objBE.UserID = user;
                objBE.IP = IP;
                objBE.DesignationID = lbldsgnid.Text;
                objBE.DesignationName = txtdisignation.Text;
                objBE.cadre = txtcadre.Text.Trim();
                objBE.Action = "U";
                dt = ObjDL.DesignationIUDR(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    txtdisignation.Text = "";
                    cf.ShowAlertMessage(" Updated Failed");
                }
                else
                {
                    cf.ShowAlertMessage("Designation Details Updated Successfully");
                    btnUpdate.Visible = false;
                    BtnSave.Visible = true;
                    BindGrid();
                    txtdisignation.Text = "";
                    txtcadre.Text = "";
                }
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");

        }
    }
    protected void Gvdesignation_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "edt")
            {
                GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                lbldsgnid.Text = ((Label)(gvrow.FindControl("lblDesgCode"))).Text;
                txtdisignation.Text = ((Label)(gvrow.FindControl("lblDesgName"))).Text;
                txtcadre.Text = ((Label)(gvrow.FindControl("lblcadre"))).Text;
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

                objBE.DesignationID = ((Label)(gvrow.FindControl("lblDesgCode"))).Text;
                objBE.Action = "D";
                dt = ObjDL.DesignationIUDR(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    txtdisignation.Text = "";
                    txtcadre.Text = "";
                }
                else
                {
                    txtdisignation.Text = "";
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
        if (txtdisignation.Text.Trim() == "")
        {
            cf.ShowAlertMessage("Please Enter Designation");
            txtdisignation.Focus();
            return false;

        }
        if (txtdisignation.Text.Trim() != "")
        {
            bool val;
            
            val = obj.CheckInput_new(txtdisignation.Text);
            if (val == true)
                Response.Redirect("~/Error.aspx");
        }
        if (txtcadre.Text.Trim() == "")
        {
            cf.ShowAlertMessage("Please Enter Hirarchy Order");
            txtcadre.Focus();
            return false;
        }
        if (txtcadre.Text.Trim() != "")
        {
            bool val;

            val = obj.CheckInput_new(txtdisignation.Text);
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