using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;

public partial class Admin_AddUser : System.Web.UI.Page
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
                    BindGrid();
                    BindEmployee(); 
                    BindRole();
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
    protected void BindRole()
    {
        dt = new DataTable();
        objBE.Action = "ROLE";
        dt = ObjDL.GetDetails(objBE, con);
        cf.BindDropDownLists(ddlRole, dt, "RoleName", "Role_Id", "Select");
    }
    protected void BindEmployee()
    {
        objBE.Action = "Empcode";
        dt = ObjDL.EmployeeIUDR(objBE, con);
        if (dt.Rows.Count > 0)
            cf.BindDropDownLists(ddlemployee, dt, "EmpoyeeName", "Employee_ID", "0");
    }
    protected void Btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            dt = new DataTable();
            objBE.Action = "I";
            objBE.UserType = ddlRole.SelectedValue;
            objBE.EmpId = ddlemployee.SelectedValue;
            objBE.Active = rblstatus.SelectedValue;
            objBE.UserID = user;
            objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
            objBE.Empcode = ddlemployee.SelectedItem.Text.Substring(ddlemployee.SelectedItem.Text.IndexOf("-") + 1);
            
            dt = ObjDL.User_IUDR(objBE, con);
            if (dt.Rows.Count > 0)
            {
                cf.ShowAlertMessage(dt.Rows[0][0].ToString());
            }
            else
            {
                //Clear();
                cf.ShowAlertMessage("User Added");
                BindGrid();
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }
    protected void BindGrid()
    {

        objBE.Action = "R";
        dt = ObjDL.User_IUDR(objBE, con);
        if (dt.Rows.Count > 0)
        {
            GVUsers.DataSource = dt;
            GVUsers.DataBind();
        }
        else
        {
            GVUsers.DataSource = null;
            GVUsers.DataBind();
            cf.ShowAlertMessage("No Data");
        }
    }

    protected void GVUsers_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "edt")
            {
                GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                BindRole();
                ddlRole.SelectedValue = ((Label)(gvrow.FindControl("lblRoleId"))).Text;
                BindEmployee();
                ddlemployee.SelectedValue = ((Label)(gvrow.FindControl("lblEmpId"))).Text;               
                
                if( ((Label)(gvrow.FindControl("lblActive"))).Text=="YES")              
                    rblstatus.SelectedValue = "1";
                else
                    rblstatus.SelectedValue = "0";
               
                ViewState["UserId"] = ((Label)(gvrow.FindControl("lblUserId"))).Text;
                BtnUpdate.Visible = true;
                Btnsave.Visible = false;
                BindGrid();
            }
       
            if (e.CommandName == "dlt")
            {
                GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                objBE.UserID= ((Label)(gvrow.FindControl("lblUserId"))).Text;
                objBE.Action = "D";
                dt = ObjDL.User_IUDR(objBE, con);
                if (dt.Rows.Count > 0)
                    cf.ShowAlertMessage(dt.Rows[0][0].ToString());
                else
                    cf.ShowAlertMessage("Deleted Successfully");
                BindGrid();
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");

        }
    }
    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            dt = new DataTable();
            objBE.Action = "U";
            objBE.UserType = ddlRole.SelectedValue;
            objBE.EmpId = ddlemployee.SelectedValue;
            objBE.Active = rblstatus.SelectedValue;
            objBE.UserID = user;
            objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
            objBE.Empcode = ddlemployee.SelectedItem.Text.Substring(ddlemployee.SelectedItem.Text.IndexOf("-") + 1);
            dt = ObjDL.User_IUDR(objBE, con);
            if (dt.Rows.Count > 0)
                cf.ShowAlertMessage(dt.Rows[0][0].ToString());
            else
            {
                cf.ShowAlertMessage("User Details Updated");
                BindGrid();
                ddlRole.Enabled = true;
                BtnUpdate.Visible = false;
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            //Response.Redirect("../Error.aspx");
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