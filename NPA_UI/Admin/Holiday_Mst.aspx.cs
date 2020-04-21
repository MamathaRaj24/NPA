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

public partial class Admin_Holiday_Mst : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
    CommonFuncs cf = new CommonFuncs();
    DataTable dt;
    string user, con;
    SampleSqlInjectionScreeningModule obj = new SampleSqlInjectionScreeningModule();
    IFormatProvider provider = new System.Globalization.CultureInfo("en-IN", true);

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
                    for (int i = 0; i < 7; i++)
                    {
                        ddlyear.Items.Add(DateTime.Now.AddYears(i).ToString("yyyy"));
                    }
                    lblDate.Text = DateTime.Now.Day + "/" + DateTime.Now.Month + "/" + DateTime.Now.Year;
                    DD_monthbind();
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
   
    protected void DD_monthbind()
    {
        DateTimeFormatInfo info = DateTimeFormatInfo.GetInstance(null);
        for (int i = 1; i < 13; i++)
        {
            DropDownList1.Items.Add(new ListItem(info.GetMonthName(i), i.ToString()));
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        CreateDataTable();
        BtnSave.Visible = true;
    }
    public void CreateDataTable()
    {
        dt = new DataTable();
        objBE.HYear = ddlyear.SelectedValue;      
        objBE.HMonth = DropDownList1.SelectedValue;
        objBE.Action = "R";
        dt = ObjDL.HolidayIUDR(objBE, con);
        if (dt.Rows.Count == 0)
        {
            DataRow drRow = dt.NewRow();
            drRow["HolidayDate"] = null;
            drRow["HolidayType"] = null;
            drRow["Description"] = null;
            dt.Rows.Add(drRow);
            GvHoliday.DataSource = dt;
            GvHoliday.DataBind();
        }
        else 
        {
            Session["dtHoliday"] = dt;
            GvHoliday.DataSource = dt;
            GvHoliday.DataBind();
            DataRow drRow = dt.NewRow();
            drRow["HolidayDate"] = null;
            drRow["HolidayType"] = null;
            drRow["Description"] = null;
            dt.Rows.Add(drRow);
            GvHoliday.DataSource = dt;
            GvHoliday.DataBind();
        }
    }
    protected void GvHoliday_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lbldatetype = (e.Row.FindControl("lblholidaytype") as Label);
            DropDownList ddlhldtype = (DropDownList)e.Row.FindControl("ddlholidaytype");
            ddlhldtype.SelectedValue = lbldatetype.Text;
        }
    }
    protected void txtholidayDate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            TextBox txthlday = (TextBox)sender;
            string holiday = ((TextBox)txthlday.FindControl("txtholidayDate")).Text.Trim();
            string year = holiday.ToString().Substring(6, 4);
            string month = holiday.ToString().Substring(3, 2);
            if (Convert.ToInt32(year) != Convert.ToInt32(ddlyear.SelectedValue.ToString()) || Convert.ToInt32(month) != Convert.ToInt32(DropDownList1.SelectedValue.ToString()))
            {
                cf.ShowAlertMessage("Please Select Same Year and Month");
                txthlday.Text = string.Empty;
                //txthlday.Focus();
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            cf.ShowAlertMessage(ex.ToString());
        }
    }
    protected void GvHoliday_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "AddRows")
            {
                DataTable dtholiday = new DataTable();
                dtholiday.Columns.Add("HolidayDate", typeof(string));
                dtholiday.Columns.Add("HolidayType", typeof(string));
                dtholiday.Columns.Add("Description", typeof(string));

                int j = 0;
                foreach (GridViewRow gr in GvHoliday.Rows)
                {
                    TextBox txtholidadate = (TextBox)gr.FindControl("txtholidayDate");
                    DropDownList ddlhldtype = (DropDownList)gr.FindControl("ddlholidaytype");
                    TextBox textdesc = (TextBox)gr.FindControl("txtdesc");
                    if (ValidateGrid(ddlhldtype, textdesc))
                    {
                        dtholiday.Rows.Add();
                        dtholiday.Rows[j]["HolidayDate"] = ((TextBox)gr.FindControl("txtholidayDate")).Text.Trim();
                        dtholiday.Rows[j]["HolidayType"] = ((DropDownList)gr.FindControl("ddlholidaytype")).SelectedValue.Trim();
                        dtholiday.Rows[j]["Description"] = ((TextBox)gr.FindControl("txtdesc")).Text.Trim();
                        j++;
                    }
                }
                dtholiday.Rows.Add();
                Session["dtHoliday"] = dtholiday;
                GvHoliday.DataSource = dtholiday;
                GvHoliday.DataBind();
            }

            if (e.CommandName == "Remove")
            {
                GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                DataTable dtholiday = new DataTable();
                dtholiday.Columns.Add("HolidayDate", typeof(string));
                dtholiday.Columns.Add("HolidayType", typeof(string));
                dtholiday.Columns.Add("Description", typeof(string));

                int j = 0;
                foreach (GridViewRow gr in GvHoliday.Rows)
                {
                    dtholiday.Rows.Add();
                    dtholiday.Rows[j]["HolidayDate"] = ((TextBox)gr.FindControl("txtholidayDate")).Text.Trim();
                    dtholiday.Rows[j]["HolidayType"] = ((DropDownList)gr.FindControl("ddlholidaytype")).SelectedValue.Trim();
                    dtholiday.Rows[j]["Description"] = ((TextBox)gr.FindControl("txtdesc")).Text.Trim();

                    j++;
                }
                dtholiday.Rows.RemoveAt(gvrow.RowIndex);
                if (dtholiday.Rows.Count == 0)
                    dtholiday.Rows.Add();
                GvHoliday.DataSource = dtholiday;
                GvHoliday.DataBind();
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            cf.ShowAlertMessage(ex.ToString());
        }
    }
    protected bool ValidateGrid(DropDownList ddlhldtype, TextBox textdesc)
    {

        if (ddlhldtype.SelectedIndex == 0)
        {
            cf.ShowAlertMessage("Select HolidayType");
            ddlhldtype.Focus();
            return false;
        }
        if (textdesc.Text == "")
        {
            cf.ShowAlertMessage("Enter Description");
            textdesc.Focus();
            return false;
        }

        return true;
    }
   
    protected bool validate()
    {
        if (ddlyear.SelectedIndex == 0)
        {
            cf.ShowAlertMessage("Select Year");
            ddlyear.Focus();
            return false;
        }
        //if (DropDownList1.SelectedIndex == 0)
        //{
        //    cf.ShowAlertMessage("Select Month");
        //    DropDownList1.Focus();
        //    return false;
        //}
        if (DropDownList1.SelectedIndex == 0)
        {
            cf.ShowAlertMessage("Select Month");
            DropDownList1.Focus();
            return false;
        }

        return true;
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        check();
        try
        {
            if (validate())
            {
                objBE.Action = "I";
                objBE.HYear = ddlyear.SelectedValue;
                objBE.HMonth = DropDownList1.SelectedValue;
                objBE.User = user;
                objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();

                DataTable dtholiday = new DataTable();
                dtholiday.Columns.Add("HolidayDate", typeof(string));
                dtholiday.Columns.Add("HolidayType", typeof(string));
                dtholiday.Columns.Add("Description", typeof(string));

                int i = 0;
                foreach (GridViewRow gr in GvHoliday.Rows)
                {
                    TextBox txtholidadate = (TextBox)gr.FindControl("txtholidayDate");
                    DropDownList ddlhldtype = (DropDownList)gr.FindControl("ddlholidaytype");

                    TextBox textdesc = (TextBox)gr.FindControl("txtdesc");

                    if (ValidateGrid(ddlhldtype, textdesc))
                    {
                        dtholiday.Rows.Add();
                        dtholiday.Rows[i]["HolidayDate"] = ((TextBox)gr.FindControl("txtholidayDate")).Text.Trim();
                        dtholiday.Rows[i]["HolidayType"] = ((DropDownList)gr.FindControl("ddlholidaytype")).SelectedValue.Trim();
                        dtholiday.Rows[i]["Description"] = ((TextBox)gr.FindControl("txtdesc")).Text.Trim();
                    }
                    else
                    {
                        return;
                    }
                    i++;
                }
                objBE.HTvp = dtholiday;
                dt = ObjDL.HolidayIUDR(objBE, con);
                if (dt.Rows.Count > 0)
                    cf.ShowAlertMessage(dt.Rows[0][0].ToString());
                else
                {
                    cf.ShowAlertMessage("Data Saved ");
                    CreateDataTable();
                }
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            cf.ShowAlertMessage(ex.ToString());
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

            Response.Cookies.Add(new HttpCookie("ASPFIXATION2", num));
            Session["hf"] = num;
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
            //cookie_value = System.Web.HttpContext.Current.Request.Cookies["ASPFIXATION2"].Value;
            cookie_value = Session["hf"].ToString();
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