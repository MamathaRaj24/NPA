using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using PA_BE;
using NPA_DL;
using System.IO;

public partial class Employee_ApplyLeave : System.Web.UI.Page
{
    DataTable ddt = new DataTable();
    DataTable dt = new DataTable();
    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
    Employee_Leave ObjEmpDL = new Employee_Leave();
    CommonFuncs cf = new CommonFuncs();
    string user, con; int i = 0;
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
        if (Session["UserId"] != null)
        {
            user = Session["UserId"].ToString();
            con = Session["ConnKey"].ToString();

            if (!IsPostBack)
            {
                try
                {
                    random();
                    lblUser.Text = " " + Session["EmployeeName"].ToString();
                    lblDate.Text = DateTime.Now.Day + "/" + DateTime.Now.Month + "/" + DateTime.Now.Year;
                    BindLeaveType();
                    //txtFromdate.Enabled = false;
                    //txtToDate.Enabled = false;
                    Prefix.Visible = false;

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

    protected void BindLeaveType()
    {
        dt = new DataTable();
        objBE.Action = "GR";
        objBE.Applicable = Session["Gender"].ToString();
        objBE.EmpId = Session["Empid"].ToString();
        dt = ObjDL.LeaveTypeIUDR(objBE, con);
        if (dt.Rows.Count > 0)
            cf.BindDropDownLists(ddlLeave, dt, "TypeName", "TypeID", "Select");
    }

    protected void ddlLeave_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlLeave.SelectedValue == "1")
        {
            ddlFrom.Enabled = true;
            ddlTo.Enabled = true;
        }
        else
        {
            ddlFrom.SelectedIndex = 0;
            ddlTo.SelectedIndex = 0;
            ddlFrom.Enabled = false;
            ddlTo.Enabled = false;
        }
        GetMaxleavs(Session["Empid"].ToString(), ddlLeave.SelectedValue, txtLeaveBalance, txtMax);
    }

    protected void GetMaxleavs(string empid, string lvtype, Label lb, Label max)
    {
        try
        {
            objBE.Action = "LB";
            objBE.EmpId = empid;
            objBE.Type = lvtype;
            dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
            if (dt.Rows.Count > 0)
            {
                if (Convert.ToInt32(dt.Rows[0]["LeaveBalance"]) <= 0)
                {
                    cf.ShowAlertMessage("There is no leave balance for seleted leave");
                    return;
                }
                else
                {
                    txtFromdate.Enabled = true;
                    txtToDate.Enabled = true;
                    ViewState["LeaveBalance"] = dt.Rows[0]["LeaveBalance"];
                    lb.Text = dt.Rows[0]["LeaveBalance"].ToString();
                    max.Text = dt.Rows[0]["MaxAt_A_Time"].ToString();
                }
            }
            else
            {
                max.Text = "";
                lb.Text = "";
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }

    protected void txtFromdate_TextChanged(object sender, EventArgs e)
    {
        if (txtFromdate.Text.Trim() != "")
        {
            if (IsHoliday(txtFromdate.Text))
            {
                cf.ShowAlertMessage("Selected Date is Already a Holiday");
                txtFromdate.Text = "";
            }
            else if (CheckDay(txtFromdate.Text))
            {
                if (ddlLeave.SelectedValue == "1")
                {
                    ddlFrom.Enabled = true;
                    ddlTo.Enabled = true;
                    txtToDate.Enabled = true;
                }
                else if (ddlLeave.SelectedValue == "3")
                {
                    if (IsRHday(txtFromdate.Text))
                    {
                        txtToDate.Text = txtFromdate.Text;
                        txtToDate.Enabled = false;
                        ddlFrom.Enabled = false;
                        ddlTo.Enabled = false;
                        lblNoofdaysLeave.Text = "1";
                    }
                    else
                    {
                        cf.ShowAlertMessage("Your Selected Date is not A Restricted Holiday");
                        txtFromdate.Text = "";
                    }
                }
                else
                {
                    txtToDate.Enabled = true;
                    ddlFrom.Enabled = false;
                    ddlTo.Enabled = false;
                }
                GetNoLeavs();
            }
            else
            {
                txtFromdate.Text = "";
                cf.ShowAlertMessage("Leave Already applied for selected date");
            }
        }
    }

    protected void ddlFrom_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlFrom.SelectedIndex > 0)
            GetNoLeavs();
    }

    protected void txtToDate_TextChanged(object sender, EventArgs e)
    {
        if (txtToDate.Text.Trim() != "" && txtFromdate.Text.Trim() != "")
        {
            DateTime frmdt = DateTime.Parse(txtFromdate.Text.Trim(), provider, System.Globalization.DateTimeStyles.None);
            DateTime todate = DateTime.Parse(txtToDate.Text.Trim(), provider, System.Globalization.DateTimeStyles.None);
            TimeSpan ts = todate - frmdt;
            if (ts.Days < 0)
            {
                cf.ShowAlertMessage("Invalid Date Selection");
                txtToDate.Text = "";
                return;
            }
            else
            {
                if (IsHoliday(txtToDate.Text))
                {
                    cf.ShowAlertMessage("Selected Date is Already a Holiday");
                    txtToDate.Text = "";
                    return;
                }
                else
                {
                    if (CheckDay(txtToDate.Text))
                    {
                        //ddlTo.Enabled = true;
                        GetNoLeavs();
                    }
                    else
                    {
                        txtFromdate.Text = "";
                        cf.ShowAlertMessage("Leave Already applied for selected date");
                    }
                }
            }
        }

        //GetMaxleavs(Session["Empid"].ToString(), ddlLeave.SelectedValue, txtMax, txtLeaveBalance);
    }
    protected bool IsHoliday(string day)
    {
        DataTable dtnew = new DataTable();
        objBE.FmDt = cf.Texttodateconverter(day);
        objBE.Action = "CHK";
        dtnew = ObjDL.HolidayIUDR(objBE, con);
        if (dtnew.Rows.Count > 0)
            return true;
        else
            return false;

    }
    protected bool IsRHday(string day)
    {
        objBE.FmDt = cf.Texttodateconverter(day);
        objBE.Action = "RS";
        dt = ObjDL.HolidayIUDR(objBE, con);
        if (dt.Rows.Count > 0)
            return true;
        else
            return false;
    }
    protected void ddlTo_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlTo.SelectedIndex > 0)
            GetNoLeavs();
    }
    protected bool CheckDay(string day)
    {
        objBE.Action = "CHKDAY";
        objBE.EmpId = Session["Empid"].ToString();
        objBE.FmDt = cf.Texttodateconverter(day);
        dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
        if (dt.Rows.Count > 0)
            return false;
        else
            return true;
    }
    public void GetNoLeavs()
    {
        if (txtFromdate.Text.Trim() != "" && txtToDate.Text.Trim() != "")
        {
            DateTime frmdt = DateTime.Parse(txtFromdate.Text.Trim(), provider, System.Globalization.DateTimeStyles.None);
            DateTime todate = DateTime.Parse(txtToDate.Text.Trim(), provider, System.Globalization.DateTimeStyles.None);
            if (todate < DateTime.Now.Date)
            {
                cf.ShowAlertMessage("To date can not be less than from date");
                txtToDate.Text = "";
                lblNoofdaysLeave.Text = "";
                ddlTo.ClearSelection();
            }

            double Totaldays = 0;
            //int noofdays = date (todate - frmdt).Days + 1;
            TimeSpan ts = todate.Subtract(frmdt);
            int noofdays = ts.Days + 1;

            if (txtFromdate.Text.Trim() == txtToDate.Text.Trim())
            {
                if (ddlFrom.SelectedValue == "1")
                    Totaldays = 1;
                else
                    Totaldays = 0.5;
            }
            else if (ddlFrom.SelectedValue == "0.5" && ddlTo.SelectedValue == "0.5")
                Totaldays = noofdays - 1;

            else if (ddlFrom.SelectedValue == "0.5")
                Totaldays = noofdays - 0.5;

            else if (ddlTo.SelectedValue == "0.5")
                Totaldays = noofdays - 0.5;
            else
                Totaldays = noofdays;

            divTotal.Visible = true;
            lblNoofdaysLeave.Text = Totaldays.ToString();

            if (Totaldays > Convert.ToInt32(ViewState["LeaveBalance"].ToString() == "" ? "0" : ViewState["LeaveBalance"].ToString()))
            {
                txtToDate.Text = "";
                lblNoofdaysLeave.Text = "";
                ddlTo.ClearSelection();
                cf.ShowAlertMessage("No. of Leaves can not be more than leave balance");
                return;
            }
            if (Totaldays > Convert.ToInt32(txtMax.Text.Trim() == "" ? "0" : txtMax.Text.Trim()))
            {
                txtToDate.Text = "";
                lblNoofdaysLeave.Text = "";
                ddlTo.ClearSelection();
                cf.ShowAlertMessage("No. of Leaves Excess than leave max leaves");
                return;
            }
            BindPrefix(txtFromdate.Text.Trim(), txtToDate.Text.Trim());
        }
    }

    public void BindPrefix(string from, string to)
    {
        try
        {
            objBE.FmDt = DateTime.Parse(from.Trim(), provider, System.Globalization.DateTimeStyles.None).ToString("dd-MM-yyyy");
            objBE.Action = "Pfix";
            dt = ObjDL.HolidayIUDR(objBE, con);
            if (dt.Rows.Count > 0)
            {
                List<String> Insect_list = new List<string>();
                foreach (DataRow roe in dt.Rows)
                {
                    Prefix.Visible = true;
                    Label1.Text = roe["HolidayDate"].ToString();
                    Insect_list.Add(Label1.Text);
                    lblPrefix.Text = String.Join(",", Insect_list.ToArray());
                }
            }
            else
                Prefix.Visible = false;

            objBE.ToDt = DateTime.Parse(to.Trim(), provider, System.Globalization.DateTimeStyles.None).ToString("dd-MM-yyyy");
            objBE.Action = "Pofix";
            dt = ObjDL.HolidayIUDR(objBE, con);
            if (dt.Rows.Count > 0)
            {
                List<String> PostList = new List<string>();
                foreach (DataRow roe in dt.Rows)
                {
                    Prefix.Visible = true;
                    lblPostDube.Text = roe["HolidayDate"].ToString();
                    PostList.Add(lblPostDube.Text);
                    lblPostFix.Text = String.Join(",", PostList.ToArray());
                }
            }
            //DataTable dl = new DataTable();
            //objBE.Action = "CHK";
            //objBE.FmDt = DateTime.Parse(txtFromdate.Text.Trim(), provider, System.Globalization.DateTimeStyles.None).ToString("yyyy-MM-dd");
            //dl = ObjDL.HolidayIUDR(objBE, con);
            //if (dl.Rows.Count > 0)
            //{
            //    cf.ShowAlertMessage("Your Selected Date is" + " " + dl.Rows[0]["Description"].ToString());
            //    txtFromdate.Text = "";
            //    return;
            //}
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }

    protected void rbLeaveRequired_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbLeaveRequired.SelectedValue == "1")
            divStation.Visible = true;
        else
            divStation.Visible = false;
    }

    protected void RBLeave_SelectedIndexChanged(object sender, EventArgs e)
    {
        divTotal.Visible = true;
        if (RBLeave.SelectedValue == "S")
        {
            SLdiv.Visible = true;
            GvLeave.Visible = false;
            CML.Visible = false;
            BindLeaveType();
        }
        else
        {
            divTotal.Visible = false;
            Prefix.Visible = false;
            SLdiv.Visible = false;
            CML.Visible = true;
            GvLeave.Visible = true;
            BindGrid();
        }
    }

    public DataTable CreateDataTable()
    {
        ddt = new DataTable();
        ddt.Columns.Add("LeaveType", typeof(string));
        ddt.Columns.Add("LeaveBalance", typeof(string));
        ddt.Columns.Add("LeaveMax", typeof(string));
        ddt.Columns.Add("FromDate", typeof(string));
        ddt.Columns.Add("FromType", typeof(string));
        ddt.Columns.Add("ToDate", typeof(string));
        ddt.Columns.Add("ToType", typeof(string));
        ddt.Columns.Add("nol", typeof(string));
        return ddt;
    }

    public void BindGrid()
    {
        dt = CreateDataTable();
        dt.Rows.Add();
        GvLeave.Visible = true;
        GvLeave.DataSource = dt;
        GvLeave.DataBind();
    }

    protected void GvLeave_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddlLeave = (DropDownList)e.Row.FindControl("ddlLeave");
                if (GvLeave.Rows.Count < 1)
                {
                    DropDownList ddlGFrom = (DropDownList)e.Row.FindControl("ddlGFrom");
                    DropDownList ddlTo = (DropDownList)e.Row.FindControl("ddlTo");
                    Label lblLeaveCode = (Label)e.Row.FindControl("lblLeaveCode");
                    Label lblfromtype = (Label)e.Row.FindControl("lblfromtype");
                    Label lbltotype = (Label)e.Row.FindControl("lbltotype");
                    dt = new DataTable();
                    objBE.Action = "GR";
                    objBE.Applicable = Session["Gender"].ToString();
                    objBE.EmpId = Session["Empid"].ToString();
                    dt = ObjDL.LeaveTypeIUDR(objBE, con);
                    if (dt.Rows.Count > 0)
                        cf.BindDropDownLists(ddlLeave, dt, "TypeName", "TypeID", "Select");
                    if (lblLeaveCode.Text != "")
                        ddlLeave.SelectedValue = lblLeaveCode.Text;
                    if (lblfromtype.Text != "")
                        ddlGFrom.SelectedValue = lblfromtype.Text;
                    if (lbltotype.Text != "")
                        ddlTo.SelectedValue = lbltotype.Text;

                    //DropDownList ddlLeave = (DropDownList)e.Row.FindControl("ddlLeave");
                    //Label lblLeaveCode = (Label)e.Row.FindControl("lblLeaveCode");
                    //dt = new DataTable();
                    //objBE.Action = "GR";
                    //objBE.Applicable = Session["Gender"].ToString();
                    //objBE.EmpId = Session["Empid"].ToString();
                    //dt = ObjDL.LeaveTypeIUDR(objBE, con);
                    //if (dt.Rows.Count > 0)
                    //    cf.BindDropDownLists(ddlLeave, dt, "TypeName", "TypeID", "Select");
                    //lblLeaveCode.Text = ddlLeave.SelectedValue;
                }
                else
                {
                    objBE.Action = "CHK";
                    DropDownList ddl = (GvLeave.Rows[0].FindControl("ddlLeave") as DropDownList);
                    objBE.TypeId = ddl.SelectedValue;
                    dt = ObjDL.LeaveTypeIUDR(objBE, con);
                    if (dt.Rows.Count > 0)
                        cf.BindDropDownLists(ddlLeave, dt, "TypeName", "CombiLeave", "Select");
                    else
                        cf.ShowAlertMessage("Selected Leave can not be combined with any. ");

                    ((TextBox)e.Row.FindControl("txtFromdate")).Enabled = false;
                }
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            // Response.Redirect("../Error.aspx");
        }
    }

    protected void ddlLeaveSelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlLeaves = sender as DropDownList;
        GridViewRow gRow = (GridViewRow)ddlLeaves.NamingContainer;
        TextBox txtFromdate = ((TextBox)(gRow.FindControl("txtFromdate")));
        DropDownList ddlGFrom = ((DropDownList)(gRow.FindControl("ddlGFrom")));
        DropDownList ddlGTo = ((DropDownList)(gRow.FindControl("ddlTo")));
        TextBox txtTodate = ((TextBox)(gRow.FindControl("txtTodate")));
        Label lbllb = ((Label)(gRow.FindControl("lblLeaveBalance")));
        Label lblMax = ((Label)(gRow.FindControl("lblMaxLeaves")));
        Label lblnol = ((Label)(gRow.FindControl("lblnol")));

        if (ddlLeaves.SelectedValue == "1")
        {
            ddlGFrom.Enabled = true;
            ddlGTo.Enabled = true;
        }
        else if (ddlLeaves.SelectedValue == "3")
        {
            ((TextBox)(gRow.FindControl("txtTodate"))).Text = ((TextBox)(gRow.FindControl("txtFromdate"))).Text.Trim();
            ((TextBox)(gRow.FindControl("txtTodate"))).Enabled = false;
            ((TextBox)(gRow.FindControl("txtFromdate"))).Enabled = false;
            ((DropDownList)(gRow.FindControl("ddlGFrom"))).Enabled = false;
            ((DropDownList)(gRow.FindControl("ddlTo"))).Enabled = false;
            if (((DropDownList)(gRow.FindControl("ddlLeave"))).SelectedValue == "3")
            {
                if (!IsRHday(DateTime.Parse(((TextBox)(gRow.FindControl("txtFromdate"))).Text.Trim(), provider, System.Globalization.DateTimeStyles.None).ToString("dd/MM/yyyy")))
                {
                    cf.ShowAlertMessage("Restricted Leave is not allowed");
                    ((DropDownList)(gRow.FindControl("ddlLeave"))).ClearSelection();
                    ((TextBox)(gRow.FindControl("txtTodate"))).Enabled = true;
                    ((TextBox)(gRow.FindControl("txtTodate"))).Text = "";
                    return;
                }
            }
        }
        else
        {
            ddlGFrom.SelectedIndex = 0;
            ddlGTo.SelectedIndex = 0;
            ((TextBox)(gRow.FindControl("txtTodate"))).Enabled = true;
            ddlGFrom.Enabled = false;
            ddlGTo.Enabled = false;
        }

        GetMaxleavs(Session["Empid"].ToString(), ddlLeaves.SelectedValue, lbllb, lblMax);
        GetNoLGrid(txtFromdate, txtTodate, ddlGFrom, ddlGTo, lblnol, lbllb, lblMax);
    }

    public void GetNoLGrid(TextBox from, TextBox to, DropDownList ddlfrm, DropDownList ddlto, Label nol, Label lb, Label max)
    {
        if (from.Text.Trim() != "" && to.Text.Trim() != "")
        {
            DateTime frmdt = DateTime.Parse(from.Text.Trim(), provider, System.Globalization.DateTimeStyles.None);
            DateTime todate = DateTime.Parse(to.Text.Trim(), provider, System.Globalization.DateTimeStyles.None);
            if (todate < DateTime.Now.Date)
            {
                txtToDate.Text = "";
                lblNoofdaysLeave.Text = "";
                ddlTo.ClearSelection();
                cf.ShowAlertMessage("To date can not be less than from date");
            }
            double Totaldays = 0;

            TimeSpan ts = todate.Subtract(frmdt);
            int noofdays = ts.Days + 1;

            if (from.Text.Trim() == to.Text.Trim())
            {
                if (ddlfrm.SelectedIndex > 0)
                {
                    if (ddlfrm.SelectedValue == "1")
                        Totaldays = 1;
                    else if (ddlfrm.SelectedValue == "0.5")
                        Totaldays = 0.5;
                }
                else
                    Totaldays = 1;
            }
            else if (ddlfrm.SelectedValue == "0.5" && ddlto.SelectedValue == "0.5")
                Totaldays = noofdays - 1;

            else if (ddlfrm.SelectedValue == "0.5")
                Totaldays = noofdays - 0.5;

            else if (ddlto.SelectedValue == "0.5")
                Totaldays = noofdays - 0.5;
            else
                Totaldays = noofdays;

            nol.Text = Totaldays.ToString();
            GetTotLeaves();
            if (Totaldays > Convert.ToInt16(lb.Text))
            {
                to.Text = "";
                nol.Text = "";
                ddlto.ClearSelection();

                to.Focus();
                to.Enabled = true;
                cf.ShowAlertMessage("No. of Leaves can not be more than leave balance");
            }
            if (Totaldays > Convert.ToInt16(max.Text))
            {
                to.Text = "";
                nol.Text = "";
                ddlto.ClearSelection();

                to.Focus();
                to.Enabled = true;
                cf.ShowAlertMessage("No. of Leaves can not be more than maximum leaves");
            }
        }
    }

    protected void GetTotLeaves()
    {
        decimal n = 0;
        foreach (GridViewRow R in GvLeave.Rows)
        {
            n = n + Convert.ToDecimal(((Label)R.FindControl("lblnol")).Text);
        }
        divTotal.Visible = true;
        lblNoofdaysLeave.Text = n.ToString();
        if (GvLeave.Rows.Count > 1)
        {
            string frm = ((TextBox)GvLeave.Rows[0].FindControl("txtFromdate")).Text;
            string to = ((TextBox)GvLeave.Rows[1].FindControl("txtTodate")).Text;
            BindPrefix(frm, to);
        }
    }

    protected void GVFromdate_TextChanged(object sender, EventArgs e)
    {
        TextBox txtfrom = sender as TextBox;
        GridViewRow gRow = (GridViewRow)txtfrom.NamingContainer;
        DropDownList ddlLeave = ((DropDownList)(gRow.FindControl("ddlLeave")));
        DropDownList ddlGFrom = ((DropDownList)(gRow.FindControl("ddlGFrom")));
        DropDownList ddlGTo = ((DropDownList)(gRow.FindControl("ddlTo")));
        TextBox txtTodate = ((TextBox)(gRow.FindControl("txtTodate")));
        Label lblnol = ((Label)(gRow.FindControl("lblnol")));
        Label lblLeaveBalance = ((Label)(gRow.FindControl("lblLeaveBalance")));
        Label lblMaxLeaves = ((Label)(gRow.FindControl("lblMaxLeaves")));
        ddlLeave.Enabled = false;
        if (IsHoliday(txtfrom.Text))
        {
            cf.ShowAlertMessage("Selected Date is Already a Holiday");
            txtfrom.Text = "";
        }
        else if (CheckDay(txtfrom.Text))
        {
            if (ddlLeave.SelectedValue == "1")
            {
                ddlGFrom.Enabled = true;
                ddlGTo.Enabled = true;
                txtTodate.Enabled = true;
            }
            else if (ddlLeave.SelectedValue == "3")
            {
                if (IsRHday(txtFromdate.Text))
                {
                    txtTodate.Text = txtfrom.Text;
                    txtToDate.Enabled = false;
                    ddlGFrom.Enabled = false;
                    ddlGTo.Enabled = false;
                    lblnol.Text = "1";
                }
                else
                {
                    cf.ShowAlertMessage("Your Selected Date is not A Restricted Holiday");
                    txtfrom.Text = "";
                }
            }
            else
            {
                txtToDate.Enabled = true;
                ddlGFrom.Enabled = false;
                ddlGTo.Enabled = false;
            }
            GetNoLGrid(txtfrom, txtTodate, ddlGFrom, ddlGTo, lblnol, lblLeaveBalance, lblMaxLeaves);
            ddlLeave.Enabled = false;
        }
        else
            cf.ShowAlertMessage("Leave Already applied for selected date");
    }

    protected void GVtxtToDate_TextChanged(object sender, EventArgs e)
    {
        TextBox txtTodate = sender as TextBox;
        GridViewRow gRow = (GridViewRow)txtTodate.NamingContainer;
        DropDownList ddlGFrom = ((DropDownList)(gRow.FindControl("ddlGFrom")));
        DropDownList ddlGTo = ((DropDownList)(gRow.FindControl("ddlTo")));
        TextBox txtfrom = ((TextBox)(gRow.FindControl("txtFromdate")));
        Label lblnol = ((Label)(gRow.FindControl("lblnol")));
        Label lblLeaveBalance = ((Label)(gRow.FindControl("lblLeaveBalance")));
        Label lblMaxLeaves = ((Label)(gRow.FindControl("lblMaxLeaves")));

        if (txtfrom.Text.Trim() != "" && txtTodate.Text.Trim() != "")
        {
            DateTime frmdt = DateTime.Parse(txtfrom.Text.Trim(), provider, System.Globalization.DateTimeStyles.None);
            DateTime todate = DateTime.Parse(txtTodate.Text.Trim(), provider, System.Globalization.DateTimeStyles.None);
            TimeSpan ts = todate - frmdt;
            if (ts.Days < 0)
            {
                cf.ShowAlertMessage("Invalid Date Selection");
                txtTodate.Text = "";
                return;
            }
            else
            {
                if (IsHoliday(txtTodate.Text))
                {
                    cf.ShowAlertMessage("Selected Date is Already a Holiday");
                    txtTodate.Text = "";
                }
                else
                {
                    if (CheckDay(txtTodate.Text))
                        GetNoLGrid(txtfrom, txtTodate, ddlGFrom, ddlGTo, lblnol, lblLeaveBalance, lblMaxLeaves);

                    else
                        cf.ShowAlertMessage("Leave Already applied for selected date");
                }
            }
            //if (frmdt > todate)
            //{
            //    cf.ShowAlertMessage("Invalid Date Selection"); 
            //    txtTodate.Text = "";
            //    return;
            //}
        }


        //if (ddlLeave.SelectedValue == "3")
        //{

        //    txtfrom.Text = txtTodate.Text;
        //    txtTodate.Enabled = false;

        //}
        //if (txtfrom.Text.Trim() == txtTodate.Text.Trim())
        //{
        //    ddlGTo.Enabled = false;
        //    GetNoLGrid(txtfrom, txtTodate, ddlGFrom, ddlGTo, lblnol, lblLeaveBalance, lblMaxLeaves);
        //}
        //else
        //{
        //    if (IsHoliday(txtTodate.Text))
        //    {
        //        ddlGTo.Enabled = true;
        //        cf.ShowAlertMessage("Selected Date is Already a Holiday");
        //    }
        //    else
        //    {
        //        if (CheckDay(txtTodate.Text))
        //        {

        //            GetNoLGrid(txtfrom, txtTodate, ddlGFrom, ddlGTo, lblnol, lblLeaveBalance, lblMaxLeaves);
        //            //ddlGTo.Enabled = true;
        //            //txtfrom.Enabled = false;
        //        }
        //        else
        //        {
        //            //ddlGTo.Enabled = true;
        //            cf.ShowAlertMessage("Leave Already applied for selected date");
        //            //ddlGTo.Enabled = true;
        //        }
        //    }
        //}
    }

    protected void GVddlFrom_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlGFrom = sender as DropDownList;
        GridViewRow gRow = (GridViewRow)ddlGFrom.NamingContainer;
        TextBox txtTodate = ((TextBox)(gRow.FindControl("txtTodate")));
        DropDownList ddlGTo = ((DropDownList)(gRow.FindControl("ddlTo")));
        TextBox txtfrom = ((TextBox)(gRow.FindControl("txtFromdate")));
        Label lblnol = ((Label)(gRow.FindControl("lblnol")));
        Label lblLeaveBalance = ((Label)(gRow.FindControl("lblLeaveBalance")));
        Label lblMaxLeaves = ((Label)(gRow.FindControl("lblMaxLeaves")));
        GetNoLGrid(txtfrom, txtTodate, ddlGFrom, ddlGTo, lblnol, lblLeaveBalance, lblMaxLeaves);
    }

    protected void GVddlTo_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlGTo = sender as DropDownList;
        GridViewRow gRow = (GridViewRow)ddlGTo.NamingContainer;
        TextBox txtTodate = ((TextBox)(gRow.FindControl("txtTodate")));
        DropDownList ddlGFrom = ((DropDownList)(gRow.FindControl("ddlGFrom")));
        TextBox txtfrom = ((TextBox)(gRow.FindControl("txtFromdate")));
        Label lblnol = ((Label)(gRow.FindControl("lblnol")));
        Label lblLeaveBalance = ((Label)(gRow.FindControl("lblLeaveBalance")));
        Label lblMaxLeaves = ((Label)(gRow.FindControl("lblMaxLeaves")));
        GetNoLGrid(txtfrom, txtTodate, ddlGFrom, ddlGTo, lblnol, lblLeaveBalance, lblMaxLeaves);
    }

    protected void GvLeave_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            i = 0;
            if (e.CommandName == "Add")
            {
                if (GvLeave.Rows.Count == 2)
                    cf.ShowAlertMessage("No More rows can be added");
                else
                {
                    GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    dt = CreateDataTable();
                    TextBox txtgtodate = ((TextBox)gvrow.FindControl("txtTodate"));
                    TextBox txtgfromodate = ((TextBox)gvrow.FindControl("txtFromdate"));
                    foreach (GridViewRow gr in GvLeave.Rows)
                    {
                        dt.Rows.Add();
                        dt.Rows[i]["LeaveType"] = ((DropDownList)gr.FindControl("ddlLeave")).SelectedValue;
                        dt.Rows[i]["LeaveBalance"] = ((Label)gr.FindControl("lblLeaveBalance")).Text.Trim();
                        dt.Rows[i]["LeaveMax"] = ((Label)gr.FindControl("lblMaxLeaves")).Text.Trim();
                        dt.Rows[i]["FromDate"] = ((TextBox)gr.FindControl("txtFromdate")).Text.Trim();
                        dt.Rows[i]["FromType"] = ((DropDownList)gr.FindControl("ddlGFrom")).SelectedValue;
                        dt.Rows[i]["ToDate"] = ((TextBox)gr.FindControl("txtTodate")).Text.Trim();
                        dt.Rows[i]["ToType"] = ((DropDownList)gr.FindControl("ddlTo")).SelectedValue;
                        dt.Rows[i]["nol"] = ((Label)gr.FindControl("lblnol")).Text.Trim();
                        i++;
                    }
                    string txtdate = ((TextBox)(GvLeave.Rows[GvLeave.Rows.Count - 1].FindControl("txtTodate"))).Text;
                    dt.Rows.Add();
                    dt.Rows[i]["FromDate"] = DateTime.Parse(txtdate.Trim(), provider, System.Globalization.DateTimeStyles.None).AddDays(1).ToString("dd/MM/yyyy");
                    //if (txtdate != "")
                    //{
                    //    int l = 0, t = 1;
                    //    while (l == 0)
                    //    {
                    //        string dtHoliday = DateTime.Parse(txtdate.Trim(), provider, System.Globalization.DateTimeStyles.None).AddDays(t).ToString("dd/MM/yyyy");
                    //        if (((DropDownList)(GvLeave.Rows[GvLeave.Rows.Count - 1].FindControl("ddlLeave"))).SelectedValue == "3")
                    //        { 
                                
                    //        }
                    //        if (!IsHoliday(dtHoliday))
                    //        {
                    //            dt.Rows.Add();
                    //            dt.Rows[i]["FromDate"] = dtHoliday;//DateTime.Parse(dtHoliday, provider, System.Globalization.DateTimeStyles.None).AddDays(1).ToString("dd-MM-yyyy");
                    //            l = 1;
                    //            break;
                    //        }
                    //        t++;
                    //    }

                    //    //if (ddlLeave.SelectedValue == "3")
                    //    //{
                    //    //dt.Rows[i]["ToDate"] = DateTime.Parse(txtdate.Trim(), provider, System.Globalization.DateTimeStyles.None).AddDays(1).ToString("dd-MM-yyyy");

                    //    //}
                    //    //txtgfromodate.Enabled = false;
                    //}
                    GvLeave.DataSource = dt;
                    GvLeave.DataBind();
                    //((TextBox)GvLeave.Rows[0].FindControl("txtTodate")).Enabled = false;
                    //((TextBox)GvLeave.Rows[0].FindControl("txtFromdate")).Enabled = false;
                }
            }

            if (e.CommandName == "Remove")
            {
                if (GvLeave.Rows.Count > 1)
                {
                    GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                    dt = CreateDataTable();
                    foreach (GridViewRow gr in GvLeave.Rows)
                    {
                        dt.Rows.Add();
                        dt.Rows[i]["LeaveType"] = ((DropDownList)gr.FindControl("ddlLeave")).SelectedValue;
                        dt.Rows[i]["LeaveBalance"] = ((Label)gr.FindControl("lblLeaveBalance")).Text.Trim();
                        dt.Rows[i]["LeaveMax"] = ((Label)gr.FindControl("lblMaxLeaves")).Text.Trim();
                        dt.Rows[i]["FromDate"] = ((TextBox)gr.FindControl("txtFromdate")).Text.Trim();
                        dt.Rows[i]["FromType"] = ((DropDownList)gr.FindControl("ddlGFrom")).SelectedValue;
                        dt.Rows[i]["ToDate"] = ((TextBox)gr.FindControl("txtTodate")).Text.Trim();
                        dt.Rows[i]["ToType"] = ((DropDownList)gr.FindControl("ddlTo")).SelectedValue;
                        dt.Rows[i]["nol"] = ((Label)gr.FindControl("lblnol")).Text.Trim();
                        i++;
                    }
                    dt.Rows.RemoveAt(gvrow.RowIndex);

                    if (dt.Rows.Count == 0)
                    {
                        dt.Rows.Add();
                    }
                    GvLeave.DataSource = dt;
                    GvLeave.DataBind();

                    string txttodate = ((TextBox)(GvLeave.Rows[GvLeave.Rows.Count - 1].FindControl("txtTodate"))).Text;
                    if (txttodate != "")
                    {
                        DataTable PF = new DataTable();
                        objBE.ToDt = txttodate;
                        objBE.Action = "Pofix";
                        PF = ObjDL.HolidayIUDR(objBE, con);
                        if (PF.Rows.Count > 0)
                        {
                            List<String> GvPreList = new List<string>();
                            foreach (DataRow row in PF.Rows)
                            {
                                Prefix.Visible = true;
                                string Date = row["HolidayDate"].ToString();
                                GvPreList.Add(Date);
                                lblPostFix.Text = String.Join(",", GvPreList.ToArray());
                            }
                        }
                        else
                        {
                            lblPostFix.Text = "";
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            //Response.Redirect("../Error.aspx");
        }
    }

    public DataTable CreateTVP()
    {
        ddt = new DataTable();
        ddt.Columns.Add("LeaveType", typeof(string));
        ddt.Columns.Add("FromDate", typeof(string));
        ddt.Columns.Add("FromType", typeof(string));
        ddt.Columns.Add("ToDate", typeof(string));
        ddt.Columns.Add("ToType", typeof(string));
        ddt.Columns.Add("nod", typeof(string));
        return ddt;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (validate())
            {
                objBE = new Master_BE();
                objBE.Empcode = Session["EmpCode"].ToString();
                objBE.EmpId = Session["Empid"].ToString();
                objBE.Type = RBLeave.SelectedValue;
                objBE.Reason = txtReason.Text;

                if (RBLeave.SelectedValue == "S")
                {
                    if (DateTime.Parse(txtFromdate.Text.Trim(), provider, System.Globalization.DateTimeStyles.None) > DateTime.Parse(txtToDate.Text.Trim(), provider, System.Globalization.DateTimeStyles.None))
                    {
                        cf.ShowAlertMessage("from date should be less than the to date");
                        return;
                    }
                    DataTable ds = CreateTVP();
                    ds.Rows.Add();
                    ds.Rows[i]["LeaveType"] = ddlLeave.SelectedValue.Trim();
                    ds.Rows[i]["FromDate"] = DateTime.Parse(txtFromdate.Text.Trim(), provider, System.Globalization.DateTimeStyles.None).ToString("yyyy-MM-dd");
                    if (ddlFrom.SelectedIndex == 0)
                        ds.Rows[i]["FromType"] = null;
                    else
                        ds.Rows[i]["FromType"] = ddlFrom.SelectedItem.Text;
                    ds.Rows[i]["ToDate"] = DateTime.Parse(txtToDate.Text.Trim(), provider, System.Globalization.DateTimeStyles.None).ToString("yyyy-MM-dd");
                    if (ddlTo.SelectedIndex == 0)
                        ds.Rows[i]["ToType"] = null;
                    else
                        ds.Rows[i]["ToType"] = ddlTo.SelectedItem.Text;
                    ds.Rows[i]["nod"] = lblNoofdaysLeave.Text;
                    i++;
                    objBE.Tvp = ds;
                }

                if (RBLeave.SelectedValue == "C")
                {
                    DataTable dtt = CreateTVP();
                    foreach (GridViewRow gr in GvLeave.Rows)
                    {
                        DropDownList LeaveType = ((DropDownList)(gr.FindControl("ddlLeave")));
                        TextBox FromDate = ((TextBox)(gr.FindControl("txtFromdate")));
                        TextBox ToDate = ((TextBox)(gr.FindControl("txtTodate")));
                        DropDownList ddlFromDate = ((DropDownList)gr.FindControl("ddlGFrom"));
                        DropDownList ddlTodate = ((DropDownList)gr.FindControl("ddlTo"));
                        Label lblTotLeaves = ((Label)gr.FindControl("lblnol"));
                        if (ValidateGrid(LeaveType, FromDate, ToDate))
                        {
                            dtt.Rows.Add();
                            dtt.Rows[i]["LeaveType"] = LeaveType.SelectedValue;
                            dtt.Rows[i]["FromDate"] = DateTime.Parse(FromDate.Text.Trim(), provider, System.Globalization.DateTimeStyles.None).ToString("yyyy-MM-dd");
                            if (ddlFrom.SelectedIndex == 0)
                                dtt.Rows[i]["FromType"] = null;
                            else
                                dtt.Rows[i]["FromType"] = ddlFromDate.SelectedItem.Text;
                            dtt.Rows[i]["ToDate"] = DateTime.Parse(ToDate.Text.Trim(), provider, System.Globalization.DateTimeStyles.None).ToString("yyyy-MM-dd");
                            if (ddlTodate.SelectedIndex == 0)
                                dtt.Rows[i]["ToType"] = null;
                            else
                                dtt.Rows[i]["ToType"] = ddlTodate.SelectedItem.Text;
                            dtt.Rows[i]["nod"] = lblTotLeaves.Text.Trim();
                            i++;
                        }
                        else
                            cf.ShowAlertMessage("Please Enter all Fields");
                    }
                    objBE.Tvp = dtt;
                }

                /*File Upload*/
                if (UpldLeavdoc.HasFile)
                {
                    if (UpldLeavdoc.PostedFile.ContentType != "application/pdf" && UpldLeavdoc.PostedFile.ContentType != "application/vnd.openxmlformats-officedocument.wordprocessingml.document")
                    {
                        cf.ShowAlertMessage("Please Upload Word Document/PDF File");
                        return;
                    }
                    if (UpldLeavdoc.PostedFile.ContentLength > 2097152)
                    {
                        cf.ShowAlertMessage("File size is exceeded");
                        return;
                    }
                    Stream fs = UpldLeavdoc.PostedFile.InputStream;
                    BinaryReader br = new BinaryReader(fs);
                    objBE.Doc_Content = br.ReadBytes((Int32)fs.Length);
                    objBE.Doc_Name = UpldLeavdoc.PostedFile.FileName;
                }
                objBE.TypeId = RBLeave.SelectedValue;
                objBE.Noleaves = lblNoofdaysLeave.Text.Trim();
                objBE.Prefix = lblPrefix.Text;
                objBE.PostFix = lblPostFix.Text;
                objBE.Station_leave = rbLeaveRequired.SelectedValue;
                objBE.Address = txtAddLeave.Text.Trim();
                objBE.Remarks = txtRemarks.Text.Trim();
                objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
                objBE.Action = "I";
                ddt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
                if (ddt.Rows.Count > 0)
                    cf.ShowAlertMessage("Leave Not Applied, Try again");
                else
                    cf.ShowAlertMessage("Leave Applied Successfully");
                Clear();
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            // Response.Redirect("../Error.aspx");
        }
    }

    public void Clear()
    {
        RBLeave.ClearSelection();
        txtReason.Text = "";
        ddlLeave.SelectedIndex = 0;
        txtLeaveBalance.Text = "";
        txtMax.Text = "";
        txtFromdate.Text = "";
        txtToDate.Text = "";
        ddlFrom.SelectedIndex = 0;
        ddlTo.SelectedIndex = 0;
        lblNoofdaysLeave.Text = "";
        GvLeave.Visible = false;
        lblPrefix.Text = "";
        lblPostFix.Text = "";
        rbLeaveRequired.ClearSelection();
        txtAddLeave.Text = "";
        txtRemarks.Text = "";
    }

    protected bool ValidateGrid(DropDownList ddlLeave, TextBox txtfdate, TextBox txtTdate)
    {
        if (ddlLeave.SelectedIndex == 0)
        {
            cf.ShowAlertMessage("Select Leave");
            ddlLeave.Focus();
            return false;
        }
        //if (ddlGFrom.SelectedIndex == 0)
        //{
        //    cf.ShowAlertMessage("Select From Date");
        //    ddlGFrom.Focus();
        //    return false;
        //}
        //if (ddlTo.SelectedIndex == 0)
        //{
        //    cf.ShowAlertMessage("Select To Date");
        //    ddlTo.Focus();
        //    return false;
        //}
        if (txtfdate.Text == "")
        {
            cf.ShowAlertMessage("Please Enter From Date");
            txtfdate.Focus();
            return false;
        }
        if (txtTdate.Text == "")
        {
            cf.ShowAlertMessage("Please Enter To Date");
            txtTdate.Focus();
            return false;
        }
        if (DateTime.Parse(txtfdate.Text.Trim(), provider, System.Globalization.DateTimeStyles.None) > DateTime.Parse(txtTdate.Text.Trim(), provider, System.Globalization.DateTimeStyles.None))
        {
            cf.ShowAlertMessage("from date should be less than the to date");
            return false;
        }
        return true;
    }

    public bool validate()
    {
        if (txtReason.Text == "")
        {
            cf.ShowAlertMessage("Please Enter Reasons");
            txtReason.Focus();
            return false;
        }
        if (rbLeaveRequired.SelectedIndex < 0)
        {
            cf.ShowAlertMessage("Select Station Leave required or not.");
            rbLeaveRequired.Focus();
            return false;
        }
        if (RBLeave.SelectedValue == "S")
        {
            if (ddlLeave.SelectedIndex == 0)
            {
                cf.ShowAlertMessage("Please Select Leave Type");
                ddlLeave.Focus();
                return false;
            }
            if (txtLeaveBalance.Text == "")
            {
                cf.ShowAlertMessage("Leave Balance can not be empty");
                txtLeaveBalance.Focus();
                return false;
            }
            if (txtMax.Text == "")
            {
                cf.ShowAlertMessage("Max Leaves can not be empty");
                txtMax.Focus();
                return false;
            }

            if (txtFromdate.Text == "")
            {
                cf.ShowAlertMessage("Please Enter From Date");
                txtFromdate.Focus();
                return false;
            }
            if (txtToDate.Text == "")
            {
                cf.ShowAlertMessage("Please Enter To Date");
                txtToDate.Focus();
                return false;
            }
            if (lblNoofdaysLeave.Text == "")
            {
                cf.ShowAlertMessage("Please Enter No of Days Leave");
                lblNoofdaysLeave.Focus();
                return false;
            }
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
            //cookie_value = System.Web.HttpContext.Current.Request.Cookies["ASPFIXATION2"].Value;
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
