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

public partial class Admin_DistrictMaster : System.Web.UI.Page
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
                    BindState();
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
            Response.Redirect("../login.aspx");
    }
    public void BindState()
    {
        objBE.Action = "S";
        dt = ObjDL.GetLocations(objBE, con);
        if (dt.Rows.Count > 0)
            cf.BindDropDownLists(ddlstate, dt, "State", "StateCode", "0");
    }
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        try
        {
            if (Validate_Save())
            {
                objBE.statecode = ddlstate.SelectedValue;
                objBE.DistName = txtdistname.Text;
                objBE.Distcode_LG = txtdistcodelg.Text;
                objBE.UserID = user;
                objBE.Action = "I";
                dt = ObjDL.DistrictMaster_IUDR(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    cf.ShowAlertMessage(dt.Rows[0][0].ToString());
                }
                else
                {
                    cf.ShowAlertMessage("Saved Successfully");
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
    protected void BindGrid()
    {
        try
        {
            objBE = new Master_BE();
            objBE.statecode = ddlstate.SelectedValue;
            objBE.Action = "R";
            dt = ObjDL.DistrictMaster_IUDR(objBE, con);
            if (dt.Rows.Count > 0)
            {
                Gvdistrict.DataSource = dt;
                Gvdistrict.DataBind();
            }
            else
            {
                Gvdistrict.DataSource = null;
                Gvdistrict.DataBind();
                cf.ShowAlertMessage("No Data");
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }
    protected void ddlstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid();
    }
    protected bool Validate_Save()
    {
        if (ddlstate.SelectedIndex == 0)
        {
            cf.ShowAlertMessage("Please Select Statename");
            ddlstate.Focus();
            return false;
        }    

        if (txtdistname.Text == "")
        {
            cf.ShowAlertMessage("Please Enter District Name");
            txtdistname.Focus();
            return false;
        }
        return true;
    }
    protected void Gvdistrict_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Edt")
        {
            GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            BindState();
            ddlstate.SelectedValue = ((Label)gvrow.FindControl("lblstatecode")).Text;
            lblDistcode.Text = ((Label)gvrow.FindControl("lbldistcode")).Text;
            txtdistcodelg.Text = ((Label)gvrow.FindControl("lbldistcodelg")).Text;
            txtdistname.Text = ((Label)gvrow.FindControl("lbldistname")).Text;

            ddlstate.Enabled = false;
            lblDistcode.Enabled = false;
            btn_Save.Visible = false;
            btn_Update.Visible = true;
        }
        if (e.CommandName == "Dlt")
        {
            try
            {
                GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                ddlstate.SelectedValue = ((Label)gvrow.FindControl("lblstatecode")).Text;
                lblDistcode.Text = ((Label)gvrow.FindControl("lbldistcode")).Text;
                dt = new DataTable();
                objBE.statecode = ddlstate.SelectedValue;
                objBE.DistCode = lblDistcode.Text;
                objBE.Action = "D";
                dt = ObjDL.DistrictMaster_IUDR(objBE, con);

                if (dt.Rows.Count > 0)
                {
                    cf.ShowAlertMessage(" Deleted Failed");
                    BindGrid();
                    btn_Save.Visible = true;
                    btn_Update.Visible = false;
                }
                else
                {
                    cf.ShowAlertMessage(" Deleted");
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
            if (Validate_Save())
            {
                objBE.statecode = ddlstate.SelectedValue;
                objBE.DistCode = lblDistcode.Text;
                objBE.DistName = txtdistname.Text;
                objBE.Distcode_LG = txtdistcodelg.Text;
                objBE.UserID = user;
                objBE.Action = "I";
                dt = ObjDL.DistrictMaster_IUDR(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    cf.ShowAlertMessage(dt.Rows[0][0].ToString());
                }
                else
                {
                    cf.ShowAlertMessage("Updated Successfully");
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
 
    protected void Gvdistrict_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Gvdistrict.PageIndex = e.NewPageIndex;
        BindGrid();
    }
    protected void Clear()
    {
        txtdistname.Text = "";
        lblDistcode.Text = "";
        txtdistcodelg.Text = "";
        ddlstate.ClearSelection();
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