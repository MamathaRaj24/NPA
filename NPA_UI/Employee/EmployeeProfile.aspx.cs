using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
public partial class Employee_EmployeeProfile : System.Web.UI.Page
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
            PrevBrowCache.enforceNoCache();
            if (Session["UserId"] != null && Session["RoleID"].ToString() != "1")
            {
                user = Session["UserId"].ToString();
                con = Session["ConnKey"].ToString();

                if (!IsPostBack)
                {
                    try
                    {

                        //random();
                        lblUser.Text = " " + Session["EmployeeName"].ToString();
                        lblDate.Text = DateTime.Now.Day + "/" + DateTime.Now.Month + "/" + DateTime.Now.Year;
                        EmployeeDeatils();
                        //ContactDeatils();
                        BindGrid();

                    }
                    catch (Exception ex)
                    {
                        ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
                        Response.Redirect("../Error.aspx");
                    }
                }
            }
        }
    }

    protected void EmployeeDeatils()
    {
        lblDesg.Text = Session["Designation"].ToString();
        lblSect.Text = Session["SectionName"].ToString();
        lblEname.Text = Session["EmployeeName"].ToString();
        lblMob.Text = Session["MobileNumber"].ToString();
        lblMail.Text = Session["email"].ToString();
    }

    protected void BindGrid()
    {
        try
        {
            DataSet ds = new DataSet();
            objBE = new Master_BE();
            objBE.Empcode = Session["Empid"].ToString();
            objBE.Action = "ED";
            ds = ObjDL.Employee(objBE, con);
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables.Count == 2)
                {
                    if (ds.Tables[0].Rows[0][0].ToString() == "1")
                    {
                        LeaveBalance.Visible = true;
                        GvLBalance.DataSource = ds.Tables[0];
                        GvLBalance.DataBind();


                        ReportingOfficers.Visible = true;
                        gvReportingOfficers.DataSource = ds.Tables[1];
                        gvReportingOfficers.DataBind();


                    }
                    else
                    {
                        if (ds.Tables[0].Rows[0][0].ToString() == "1")
                        {
                            //if (ds.Tables[0].Rows.Count > 0)
                            //{
                            LeaveBalance.Visible = true;
                            GvLBalance.DataSource = dt;
                            GvLBalance.DataBind();
                            //}
                        }
                        else if (ds.Tables[0].Rows[0][0].ToString() == "2")
                        {
                            // if (ds.Tables[1].Rows.Count > 0)
                            //{
                            gvReportingOfficers.DataSource = dt;
                            gvReportingOfficers.DataBind();
                            ReportingOfficers.Visible = true;
                            //}
                        }
                    }
                }
            }
        }

        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            //Response.Redirect("../Error.aspx");
        }
    }
}