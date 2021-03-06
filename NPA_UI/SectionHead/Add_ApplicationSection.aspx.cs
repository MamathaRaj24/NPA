﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;

public partial class SectionHead_Add_ApplicationSection : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
    CommonFuncs objcomm = new CommonFuncs();
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
                    btn_Update.Visible = false;
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
        if (txtSectionname.Text.Trim() == "")
        {
            objcomm.ShowAlertMessage("Please Enter Section Name");
            txtSectionname.Focus();
            return false;
        }
        return true;
    }

    protected void BindGrid()
    {
        try
        {
            objBE = new Master_BE();
            objBE.SectionID = "0";
            objBE.Action = "R";
            dt = ObjDL.AddApplicationSectionIUDR(objBE, con);
            if (dt.Rows.Count > 0)
            {
                GVSection.DataSource = dt;
                GVSection.DataBind();
            }
            else
            {
                GVSection.DataSource = null;
                GVSection.DataBind();
                objcomm.ShowAlertMessage("No Data");
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }
    protected void GVSection_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Edt")
            {
                GridViewRow grdDetails = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                txtSectionname.Text = ((Label)(grdDetails.FindControl("lblsectionname"))).Text;
                Label1.Text = ((Label)(grdDetails.FindControl("lblsectioncode"))).Text;
                btn_Save.Visible = false;
                btn_Update.Visible = true;
            }
            if (e.CommandName == "Dlt")
            {
                GridViewRow grdDetails = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                objBE.SectionID = ((Label)(grdDetails.FindControl("lblsectioncode"))).Text;
                objBE.Action = "D";
                dt = ObjDL.AddApplicationSectionIUDR(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    objcomm.ShowAlertMessage(dt.Rows[0][0].ToString());
                    objcomm.ShowAlertMessage("record not deleted");
                    return;
                }   
                else
                {
                    txtSectionname.Text = "";
                   objcomm.ShowAlertMessage("record deleted");
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
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        try
        {
            check();
            if (validate())
            {
                objBE.SectionName = txtSectionname.Text.Trim();
                objBE.UserID = user;
                objBE.Action = "I";
                dt = ObjDL.AddApplicationSectionIUDR(objBE, con);
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
 protected void btn_Update_Click(object sender, EventArgs e)
 {
     try
     {
         objBE = new Master_BE();
         objBE.SectionName = txtSectionname.Text;
         objBE.SectionID = Label1.Text;
         objBE.Action = "U";
         dt = ObjDL.AddApplicationSectionIUDR(objBE, con);
         if (dt.Rows.Count > 0)
         {
             txtSectionname.Text = "";
             objcomm.ShowAlertMessage(" Update Failed");
         }
         else
         {
             objcomm.ShowAlertMessage("Details Updated Successfully");
             btn_Update.Visible = false;
             btn_Save.Visible = true;
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
    protected void Clear()
    {
        txtSectionname.Text = "";
    }

}