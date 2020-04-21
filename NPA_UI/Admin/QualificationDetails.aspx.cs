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

public partial class Admin_QualificationDetails : System.Web.UI.Page
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
                    BindEmployee();
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
            DataTable dtqualification = new DataTable();
            dtqualification.Columns.Add("Exam", typeof(string));
            dtqualification.Columns.Add("Board", typeof(string));
            dtqualification.Columns.Add("Yearp", typeof(string));
            dtqualification.Columns.Add("Marks", typeof(string));

            dtqualification.Rows.Add();
            Session["dtqualification"] = dtqualification;
            GvQualification.DataSource = dtqualification;
            GvQualification.DataBind();
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            cf.ShowAlertMessage(ex.ToString());
        }
    }
    protected void BindEmployee()
    {
        objBE.Action = "Empcode";
        dt = ObjDL.EmployeeIUDR(objBE, con);
        if (dt.Rows.Count > 0)
        {
            cf.BindDropDownLists(ddlemployee, dt, "EmpoyeeName", "Employee_ID", "0");
        }

    }
    public bool validate()
    {
        //txtServiceDate,txtDateofBirth,Rdbactive,txtTempAdd,txtempemail,txtMob,txtEmpName,txtEmpCode,txtFName,,,,

        //if (txtEmpCode.Text == "")
        //{
        //    objcomm.ShowAlertMessage("Please Enter Employee code");
        //    txtEmpCode.Focus();
        //    return false;

        //}


        return true;
    }
    protected void ddlemployee_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid();
        lblemployeename.Visible = true;
        lblemployeename.Text = ddlemployee.SelectedItem.Text;
        Btnsave.Visible = true;
        pnlfamily.Visible = true;
        //ddlemployee.Enabled = false;
        BindGridemp();
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
    protected void GvQualification_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "AddRows")
            {
                DataTable dtqualification = new DataTable();
                dtqualification.Columns.Add("Exam", typeof(string));
                dtqualification.Columns.Add("Board", typeof(string));
                dtqualification.Columns.Add("Yearp", typeof(string));
                dtqualification.Columns.Add("Marks", typeof(string));

                int j = 0;
                foreach (GridViewRow gr in GvQualification.Rows)
                {

                    dtqualification.Rows.Add();
                    dtqualification.Rows[j]["Exam"] = ((DropDownList)gr.FindControl("ddlqualification")).SelectedValue.Trim();
                    dtqualification.Rows[j]["Board"] = ((TextBox)gr.FindControl("txtbruniersity")).Text.Trim();
                    dtqualification.Rows[j]["Yearp"] = ((TextBox)gr.FindControl("txtyearofpassing")).Text.Trim();
                    dtqualification.Rows[j]["Marks"] = ((TextBox)gr.FindControl("txtrelation")).Text.Trim();

                    j++;

                }
                dtqualification.Rows.Add();
                Session["dtqualification"] = dtqualification;
                GvQualification.DataSource = dtqualification;
                GvQualification.DataBind();
            }

            if (e.CommandName == "Remove")
            {
                GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                DataTable dtqualification = new DataTable();
                dtqualification.Columns.Add("Exam", typeof(string));
                dtqualification.Columns.Add("Board", typeof(string));
                dtqualification.Columns.Add("Yearp", typeof(string));
                dtqualification.Columns.Add("Marks", typeof(string));

                int j = 0;
                foreach (GridViewRow gr in GvQualification.Rows)
                {
                    dtqualification.Rows.Add();
                    dtqualification.Rows[j]["Exam"] = ((DropDownList)gr.FindControl("ddlqualification")).SelectedValue.Trim();
                    dtqualification.Rows[j]["Board"] = ((TextBox)gr.FindControl("txtbruniersity")).Text.Trim();
                    dtqualification.Rows[j]["Yearp"] = ((TextBox)gr.FindControl("txtyearofpassing")).Text.Trim();
                    dtqualification.Rows[j]["Marks"] = ((TextBox)gr.FindControl("txtrelation")).Text.Trim();

                    j++;
                }
                dtqualification.Rows.RemoveAt(gvrow.RowIndex);
                if (dtqualification.Rows.Count == 0)
                    dtqualification.Rows.Add();
                GvQualification.DataSource = dtqualification;
                GvQualification.DataBind();
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            cf.ShowAlertMessage(ex.ToString());
        }
    }
    protected void Btnsave_Click(object sender, EventArgs e)
    {
        check();
        try
        {
            if (validate())
            {

                DataTable dtqualification = new DataTable();
                dtqualification.Columns.Add("Exam", typeof(string));
                dtqualification.Columns.Add("Board", typeof(string));
                dtqualification.Columns.Add("Yearp", typeof(string));
                dtqualification.Columns.Add("Marks", typeof(string));
                int i = 0;
                foreach (GridViewRow gr in GvQualification.Rows)
                {
                    dtqualification.Rows.Add();
                    dtqualification.Rows[i]["Exam"] = ((DropDownList)gr.FindControl("ddlqualification")).SelectedValue.Trim();
                    dtqualification.Rows[i]["Board"] = ((TextBox)gr.FindControl("txtbruniersity")).Text.Trim();
                    dtqualification.Rows[i]["Yearp"] = ((TextBox)gr.FindControl("txtyearofpassing")).Text.Trim();
                    dtqualification.Rows[i]["Marks"] = ((TextBox)gr.FindControl("txtrelation")).Text.Trim();

                    i++;
                }
                objBE.EmpId = ddlemployee.SelectedValue;
                objBE.UserID = user;
                objBE.Action = "I";
                objBE.Etvp = dtqualification;
                dt = ObjDL.QualificationDetails(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    cf.ShowAlertMessage(dt.Rows[0][0].ToString());
                }
                else
                {
                    cf.ShowAlertMessage("Qualification Details Saved");
                    pnlfamily.Visible = false;

                }
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            cf.ShowAlertMessage(ex.ToString());
        }
    }
    protected void GvQualification_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblexam = (e.Row.FindControl("lblexam") as Label);
            DropDownList ddlqualification = (DropDownList)e.Row.FindControl("ddlqualification");
            objBE.Action = "R";
            dt = ObjDL.GetDetails(objBE, con);
            if (dt.Rows.Count > 0)
            {
                cf.BindDropDownLists(ddlqualification, dt, "Qualification_Name", "Qualification_Code", "0");
            }
            ddlqualification.SelectedValue = lblexam.Text;

        }
    }
    protected void BindGridemp()
    {
        objBE.Action = "R";
        objBE.EmpId = ddlemployee.SelectedValue;
        dt = ObjDL.QualificationDetails(objBE, con);
        if (dt.Rows.Count > 0)
        {
            Gvempqualification.DataSource = dt;
            Gvempqualification.DataBind();
        }
        else
        {
            Gvempqualification.DataSource = null;
            Gvempqualification.DataBind();
        }
    }

    protected void Gvempqualification_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Gvempqualification.EditIndex = e.NewEditIndex;
        BindGridemp();
    }
    protected void Gvempqualification_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if ((e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                Label lblexam = (e.Row.FindControl("lblexam") as Label);
                DropDownList ddlqualification = (DropDownList)e.Row.FindControl("ddlqualification");
                objBE.Action = "R";
                dt = ObjDL.GetDetails(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    cf.BindDropDownLists(ddlqualification, dt, "Qualification_Name", "Qualification_Code", "0");
                }
            }

        }
    }
    protected void Gvempqualification_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            GridViewRow row = Gvempqualification.Rows[e.RowIndex];
            int lblid = Convert.ToInt32(Gvempqualification.DataKeys[e.RowIndex].Values[0]);

            string Qualification = (row.FindControl("ddlqualification") as DropDownList).SelectedValue;
            string Brduniveristy = (row.FindControl("txtbruniersity") as TextBox).Text;
            string Yrofpassing = (row.FindControl("txtyearofpassing") as TextBox).Text;
            string Marks = (row.FindControl("txtmarks") as TextBox).Text;

            objBE.EmpId = lblid.ToString();
            objBE.Exam = Qualification.ToString();
            objBE.BoardUniver = Brduniveristy.ToString();
            objBE.YrPass = Yrofpassing.ToString();
            objBE.Marks = Marks.ToString();
            objBE.UserID = user;
            objBE.Action = "U";
            DataTable dt = new DataTable();
            dt = ObjDL.QualificationDetails(objBE, con);
            if (dt.Rows.Count > 0)
            {
                cf.ShowAlertMessage("Data Not Updated");
            }
            else
            {
                cf.ShowAlertMessage("Data Update successfully");
                Gvempqualification.EditIndex = -1;
                BindGridemp();

            }

        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            cf.ShowAlertMessage(ex.ToString());
        }

    }
    protected void Gvempqualification_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        Gvempqualification.EditIndex = -1;
        BindGridemp();
    }
    protected void Gvempqualification_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = Gvempqualification.Rows[e.RowIndex];
        int lblid = Convert.ToInt32(Gvempqualification.DataKeys[e.RowIndex].Values[0]);  
        string Qualification = (row.FindControl("lblexam") as Label).Text;

        objBE.EmpId = lblid.ToString();
        objBE.Exam = Qualification.ToString();
        objBE.Action = "D";
        DataTable dt = new DataTable();
        dt = ObjDL.QualificationDetails(objBE, con);
        if (dt.Rows.Count > 0)
        {
            cf.ShowAlertMessage("Data Deleted");
        }
        else
        {
            Gvempqualification.EditIndex = -1;
            BindGridemp();
            cf.ShowAlertMessage("Data Deleted successfully");

        }
    }
}