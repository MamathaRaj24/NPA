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

public partial class Admin_FamilyDetails : System.Web.UI.Page
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
            DataTable dtfamily = new DataTable();
            dtfamily.Columns.Add("MemberName", typeof(string));
            dtfamily.Columns.Add("Relation", typeof(string));
            dtfamily.Columns.Add("DateofBirth", typeof(string));
            dtfamily.Columns.Add("Dependent", typeof(string));
            dtfamily.Columns.Add("GovtEmp", typeof(string));
            dtfamily.Columns.Add("Nominee", typeof(string));
            dtfamily.Columns.Add("NomineePercentage", typeof(string));
            dtfamily.Rows.Add();
            Session["dtfamily"] = dtfamily;
            Gvfamily.DataSource = dtfamily;
            Gvfamily.DataBind();
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
    }
    protected void Gvfamily_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "AddRows")
            {
                DataTable dtfamily = new DataTable();
                dtfamily.Columns.Add("MemberName", typeof(string));
                dtfamily.Columns.Add("Relation", typeof(string));
                dtfamily.Columns.Add("DateofBirth", typeof(string));
                dtfamily.Columns.Add("Dependent", typeof(string));
                dtfamily.Columns.Add("GovtEmp", typeof(string));
                dtfamily.Columns.Add("Nominee", typeof(string));
                dtfamily.Columns.Add("NomineePercentage", typeof(string));
               // dtfamily.Rows.Add();

                int j = 0;
                foreach (GridViewRow gr in Gvfamily.Rows)
                {
                    TextBox MemberName = (TextBox)gr.FindControl("txtMemberName");
                    TextBox Relation = (TextBox)gr.FindControl("txtRelation");
                    TextBox dateofbirth = (TextBox)gr.FindControl("txtdtofbirth");
                    RadioButtonList Dependent = (RadioButtonList)gr.FindControl("rblDependentlist");
                    RadioButtonList GovtEmp = (RadioButtonList)gr.FindControl("rblGovtEmp");
                    RadioButtonList Nominee = (RadioButtonList)gr.FindControl("rblNominee");
                    TextBox Nomineepersantage = (TextBox)gr.FindControl("txtNomineePercentage");

                    dtfamily.Rows.Add();
                    dtfamily.Rows[j]["MemberName"] = ((TextBox)gr.FindControl("txtMemberName")).Text.Trim();
                    dtfamily.Rows[j]["Relation"] = ((TextBox)gr.FindControl("txtRelation")).Text.Trim();
                    dtfamily.Rows[j]["DateofBirth"] = ((TextBox)gr.FindControl("txtdtofbirth")).Text.Trim();
                    dtfamily.Rows[j]["Dependent"] = ((RadioButtonList)gr.FindControl("rblDependentlist")).SelectedValue.Trim();
                    dtfamily.Rows[j]["GovtEmp"] = ((RadioButtonList)gr.FindControl("rblisanemployee")).SelectedValue.Trim();
                    dtfamily.Rows[j]["Nominee"] = ((RadioButtonList)gr.FindControl("rblnominee")).SelectedValue.Trim(); 
                    dtfamily.Rows[j]["NomineePercentage"] = ((TextBox)gr.FindControl("txtNomineePercentage")).Text.Trim();

                    j++;
                  
                }
                dtfamily.Rows.Add();
                Session["dtfamily"] = dtfamily;
                Gvfamily.DataSource = dtfamily;
                Gvfamily.DataBind();
            }

            if (e.CommandName == "Remove")
            {
                GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                DataTable dtfamily = new DataTable();
                dtfamily.Columns.Add("MemberName", typeof(string));
                dtfamily.Columns.Add("Relation", typeof(string));
                dtfamily.Columns.Add("DateofBirth", typeof(string));
                dtfamily.Columns.Add("Dependent", typeof(string));
                dtfamily.Columns.Add("GovtEmp", typeof(string));
                dtfamily.Columns.Add("Nominee", typeof(string));
                dtfamily.Columns.Add("NomineePercentage", typeof(string));
             
                int j = 0;
                foreach (GridViewRow gr in Gvfamily.Rows)
                {
                    dtfamily.Rows.Add();
                    dtfamily.Rows[j]["MemberName"] = ((TextBox)gr.FindControl("txtMemberName")).Text.Trim();
                    dtfamily.Rows[j]["Relation"] = ((TextBox)gr.FindControl("txtRelation")).Text.Trim();
                    dtfamily.Rows[j]["DateofBirth"] = ((TextBox)gr.FindControl("txtdtofbirth")).Text.Trim();
                    dtfamily.Rows[j]["Dependent"] = ((RadioButtonList)gr.FindControl("rblDependentlist")).SelectedValue.Trim();
                    dtfamily.Rows[j]["GovtEmp"] = ((RadioButtonList)gr.FindControl("rblisanemployee")).SelectedValue.Trim();
                    dtfamily.Rows[j]["Nominee"] = ((RadioButtonList)gr.FindControl("rblnominee")).SelectedValue.Trim();
                    dtfamily.Rows[j]["NomineePercentage"] = ((TextBox)gr.FindControl("txtNomineePercentage")).Text.Trim();
                    j++;

                }
                dtfamily.Rows.RemoveAt(gvrow.RowIndex);
                if (dtfamily.Rows.Count == 0)
                    dtfamily.Rows.Add();
                Gvfamily.DataSource = dtfamily;
                Gvfamily.DataBind();
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

                DataTable dtfamily = new DataTable(); 
                dtfamily.Columns.Add("MemberName", typeof(string));
                dtfamily.Columns.Add("Relation", typeof(string));
                dtfamily.Columns.Add("DateofBirth", typeof(string));
                dtfamily.Columns.Add("Dependent", typeof(string));
                dtfamily.Columns.Add("GovtEmp", typeof(string));
                dtfamily.Columns.Add("Nominee", typeof(string));
                dtfamily.Columns.Add("NomineePercentage", typeof(string)); 
                int i = 0;
                foreach (GridViewRow gr in Gvfamily.Rows) 
                {
                    dtfamily.Rows.Add();
                    dtfamily.Rows[i]["MemberName"] = ((TextBox)gr.FindControl("txtMemberName")).Text.Trim();
                    dtfamily.Rows[i]["Relation"] = ((TextBox)gr.FindControl("txtRelation")).Text.Trim();
                    dtfamily.Rows[i]["DateofBirth"] =cf.Texttodateconverter( ((TextBox)gr.FindControl("txtdtofbirth")).Text.Trim());
                    dtfamily.Rows[i]["Dependent"] = ((RadioButtonList)gr.FindControl("rblDependentlist")).SelectedValue.Trim();
                    dtfamily.Rows[i]["GovtEmp"] = ((RadioButtonList)gr.FindControl("rblisanemployee")).SelectedValue.Trim();
                    dtfamily.Rows[i]["Nominee"] = ((RadioButtonList)gr.FindControl("rblnominee")).SelectedValue.Trim(); 
                    if (((RadioButtonList)gr.FindControl("rblNominee")).SelectedValue == "1")
                    {
                        ((TextBox)gr.FindControl("txtNomineePercentage")).Enabled = true;
                        dtfamily.Rows[i]["NomineePercentage"] = ((TextBox)gr.FindControl("txtNomineePercentage")).Text.Trim();
                    }

                    i++;
                }
                objBE.EmpId = ddlemployee.SelectedValue;
                objBE.UserID = user;
                objBE.Action = "Family";
                objBE.Ftvp = dtfamily; 
                dt = ObjDL.EmployeeIUDR(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    cf.ShowAlertMessage(dt.Rows[0][0].ToString());
                }
                else
                {
                    cf.ShowAlertMessage("Family Details Saved");
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
    protected void Gvfamily_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lbldependent = (e.Row.FindControl("lbldependent") as Label); 
            RadioButtonList rblDependent = (RadioButtonList)e.Row.FindControl("rbldependentlist");

            Label lblgvemp = (e.Row.FindControl("lblgvtemp") as Label); 
            RadioButtonList rblisanemployee = (RadioButtonList)e.Row.FindControl("rblisanemployee");

            Label lblnominee = (e.Row.FindControl("lblnominee") as Label); 
            RadioButtonList rblnomeeeni = (RadioButtonList)e.Row.FindControl("rblnominee");

            rblDependent.SelectedValue = lbldependent.Text;
            rblisanemployee.SelectedValue = lblgvemp.Text;
            rblnomeeeni.SelectedValue = lblnominee.Text; 
            
        }
    }
    protected void rblnominee_SelectedIndexChanged(object sender, EventArgs e)
    {
        RadioButtonList rd = (RadioButtonList)sender;
        GridViewRow row = (GridViewRow)rd.NamingContainer;
      
        RadioButtonList rblnomeeeni = (RadioButtonList)row.FindControl("rblnominee");
        Label lblnominee = (Label)row.FindControl("lblnominee");
        TextBox txtnomeeni = (TextBox)row.FindControl("txtnomineepercentage");

        if (rblnomeeeni.SelectedValue == "1")
        {
            txtnomeeni.Enabled = true;
        }
        else
        {
            txtnomeeni.Enabled = false;
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