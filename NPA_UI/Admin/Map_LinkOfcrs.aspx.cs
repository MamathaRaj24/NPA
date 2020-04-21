using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;

public partial class Map_LinkOfcrs : System.Web.UI.Page
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
                    BindCadre();
                    getEmpData();
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

    public void BindCadre()
    {
        try
        {
            objBE.Action = "R";
            dt = ObjDL.DesignationIUDR(objBE, con);
            if (dt.Rows.Count > 0)
                cf.BindDropDownLists_WithAllOption(ddlCurrentDesignation, dt, "Designation", "DesignationID", "Select");
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            // Response.Redirect("../Error.aspx");
        }
    }

    protected void ddlCurrentDesignation_SelectedIndexChanged(object sender, EventArgs e)
    {
        GVMapOfc.Visible = false;
        BtnSave.Visible = false;
        getEmpData();
    }

    protected void GVMapOfc_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Label lblSection = (Label)e.Row.FindControl("lblSection");
            //Label lblCurrentDesignation = (Label)e.Row.FindControl("lblCurrentDesignation");
            //Label lblcadre = (Label)e.Row.FindControl("lblcadre");


            Label lblforwording = (Label)e.Row.FindControl("lblforwardingofcr");
            Label lblao = (Label)e.Row.FindControl("lblao");
            Label lbllink = (Label)e.Row.FindControl("lbllink");
            Label lblsanction = (Label)e.Row.FindControl("lblsanction");

            //DropDownList ddlSection = (DropDownList)e.Row.FindControl("ddlSection");
            DropDownList ddlforwording = (DropDownList)e.Row.FindControl("ddlforwording");
            DropDownList ddlao = (DropDownList)e.Row.FindControl("ddlao");
            DropDownList ddllink = (DropDownList)e.Row.FindControl("ddllink");
            DropDownList ddlsanction = (DropDownList)e.Row.FindControl("ddlsanctionautharity");


            dt = new DataTable();
            objBE = new Master_BE();
            objBE.Action = "RPRT";
            dt = ObjDL.User_IUDR(objBE, con);
            if (dt.Rows.Count > 0)

                cf.BindDropDownLists(ddlforwording, dt, "EmployeeName", "EmpId", "Select");
            cf.BindDropDownLists(ddlao, dt, "EmployeeName", "EmpId", "Select");
            cf.BindDropDownLists(ddllink, dt, "EmployeeName", "EmpId", "Select");
            cf.BindDropDownLists(ddlsanction, dt, "EmployeeName", "EmpId", "Select");


            if (lblforwording.Text != "")
                ddlforwording.SelectedValue = lblforwording.Text;
            if (lblao.Text != "")
                ddlao.SelectedValue = lblao.Text;
            if (lbllink.Text != "")
                ddllink.SelectedValue = lbllink.Text;
            if (lblsanction.Text != "")
                ddlsanction.SelectedValue = lblsanction.Text;
        }
    }

    public void getEmpData()
    {
        try
        {
            dt = new DataTable();
            objBE = new Master_BE();
            objBE.Action = "EG";
            objBE.DesignationID = ddlCurrentDesignation.SelectedIndex <= 0 ? "0" : ddlCurrentDesignation.SelectedValue;
            dt = ObjDL.User_IUDR(objBE, con);
            if (dt.Rows.Count > 0)
            {
                GVMapOfc.Visible = true;
                BtnSave.Visible = true;
                GVMapOfc.DataSource = dt;
                GVMapOfc.DataBind();
                GVMapOfc.HeaderRow.Cells[0].Attributes["data-class"] = "expand";

                //Attribute to hide column in Phone.
                GVMapOfc.HeaderRow.Cells[1].Attributes["data-hide"] = "phone";
                GVMapOfc.HeaderRow.Cells[2].Attributes["data-hide"] = "phone";
                GVMapOfc.HeaderRow.Cells[3].Attributes["data-hide"] = "phone";
                GVMapOfc.HeaderRow.Cells[4].Attributes["data-hide"] = "phone";
                GVMapOfc.HeaderRow.Cells[5].Attributes["data-hide"] = "phone";
                GVMapOfc.HeaderRow.Cells[6].Attributes["data-hide"] = "phone";
                GVMapOfc.HeaderRow.Cells[7].Attributes["data-hide"] = "phone";
                //GVMapOfc.HeaderRow.Cells[8].Attributes["data-hide"] = "phone";
                //gvVillages.HeaderRow.Cells[2].Attributes["data-hide"] = "phone";

                //Adds THEAD and TBODY to GridView.
                GVMapOfc.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            else
            {
                GVMapOfc.Visible = false;
                BtnSave.Visible = false;
                cf.ShowAlertMessage("No Data Found");
            }
            dt.Dispose();
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            // Response.Redirect("../Error.aspx");
        }
    }

    protected bool Validategrid(DropDownList ddlforwrding, DropDownList ddlRecommededao, DropDownList ddlsanctioautharity, DropDownList ddllinkofficer)
    {
        if (ddlforwrding.SelectedIndex == 0)
        {
            cf.ShowAlertMessage("Please select forwrding officer");
            ddlforwrding.Focus();
            return false;
        }
        if (ddlRecommededao.SelectedIndex == 0)
        {
            cf.ShowAlertMessage("Please select Recommnede officer");
            ddlRecommededao.Focus();
            return false;
        }
        if (ddlsanctioautharity.SelectedIndex == 0)
        {
            cf.ShowAlertMessage("Please select Sanction autharity Officer");
            ddlsanctioautharity.Focus();
            return false;
        }
        if (ddllinkofficer.SelectedIndex == 0)
        {
            cf.ShowAlertMessage("Please select Link Officer");
            ddllinkofficer.Focus();
            return false;
        }

        return true;
    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        try
        {
            check();
            DataTable dtt = new DataTable();
            dtt.Columns.Add("Empid", typeof(string));
            dtt.Columns.Add("Forwording_Officer", typeof(string));
            dtt.Columns.Add("Recommended_Officer", typeof(string));
            dtt.Columns.Add("Sanction_Authority", typeof(string));
            dtt.Columns.Add("Link_Officer", typeof(string));
            int j = 0;
            foreach (GridViewRow gr in GVMapOfc.Rows)
            {
                if (((CheckBox)gr.FindControl("ChkSelect")).Checked == true)
                {
                    DropDownList forwarding = (DropDownList)gr.FindControl("ddlforwording");
                    DropDownList recomdedao = (DropDownList)gr.FindControl("ddlao");
                    DropDownList sanctionautharity = (DropDownList)gr.FindControl("ddlsanctionautharity");
                    DropDownList link = (DropDownList)gr.FindControl("ddllink");
                    if (Validategrid(forwarding, recomdedao, sanctionautharity, link))
                    {
                        dtt.Rows.Add();
                        dtt.Rows[j]["Empid"] = ((Label)gr.FindControl("lblEmpID")).Text;
                        if (forwarding.SelectedIndex != 0)
                        {
                            dtt.Rows[j]["Forwording_Officer"] = ((DropDownList)gr.FindControl("ddlforwording")).SelectedValue;
                        }
                        else
                        {
                            cf.ShowAlertMessage("Please select forwrding officer");
                            forwarding.Focus();
                            return;
                        }
                        if (recomdedao.SelectedIndex != 0)
                        {
                            dtt.Rows[j]["Recommended_Officer"] = ((DropDownList)gr.FindControl("ddlao")).Text;
                        }
                        else
                        {
                            cf.ShowAlertMessage("Please select Recommende officer");
                            recomdedao.Focus();
                            return;
                        }
                        if (sanctionautharity.SelectedIndex != 0)
                        {
                            dtt.Rows[j]["Sanction_Authority"] = ((DropDownList)gr.FindControl("ddlsanctionautharity")).SelectedValue;
                        }
                        else
                        {
                            cf.ShowAlertMessage("Please select Sanction autharity Officer");
                            sanctionautharity.Focus();
                            return;
                        }
                        if (link.SelectedIndex != 0)
                        {
                            dtt.Rows[j]["Link_Officer"] = ((DropDownList)gr.FindControl("ddllink")).Text;
                        }
                        else
                        {
                            cf.ShowAlertMessage("Please select Link Officer");
                            link.Focus();
                            return;
                        }
                        j++;
                    }
                }
                objBE.HTvp = dtt;
                objBE.Action = "LO";
                objBE.UserID = user;
                objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
                dt = ObjDL.User_IUDR(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    cf.ShowAlertMessage(dt.Rows[0][0].ToString());
                }
                else
                {
                    cf.ShowAlertMessage("Data Saved Successfully");
                    getEmpData();
                }
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }

    protected void ddlforwording_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList Dropdown = sender as DropDownList;
            GridViewRow gRow = (GridViewRow)Dropdown.NamingContainer;
            DropDownList ddlSection = ((DropDownList)(gRow.FindControl("ddlSection")));
            DropDownList ddlforwording = ((DropDownList)(gRow.FindControl("ddlforwording")));
            DropDownList ddlao = ((DropDownList)(gRow.FindControl("ddlao")));
            DropDownList ddllink = ((DropDownList)(gRow.FindControl("ddllink")));
            DropDownList ddlsanction = ((DropDownList)(gRow.FindControl("ddlsanctionautharity")));

            if (ddlforwording.SelectedValue != ddlao.SelectedValue && ddlforwording.SelectedValue != ddllink.SelectedValue && ddlforwording.SelectedValue != ddlsanction.SelectedValue)
            {

            }
            else
            {
                //cf.ShowAlertMessage("Already seleted employee,please select another employee");
                //ddlforwording.SelectedIndex = 0;
                //ddlforwording.Focus();
                //return;
            }

        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect(ex.Message.ToString());
        }
    }

    protected void ddlao_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList Dropdown = sender as DropDownList;
            GridViewRow gRow = (GridViewRow)Dropdown.NamingContainer;
            DropDownList ddlSection = ((DropDownList)(gRow.FindControl("ddlSection")));
            DropDownList ddlforwording = ((DropDownList)(gRow.FindControl("ddlforwording")));
            DropDownList ddlao = ((DropDownList)(gRow.FindControl("ddlao")));
            DropDownList ddllink = ((DropDownList)(gRow.FindControl("ddllink")));
            DropDownList ddlsanction = ((DropDownList)(gRow.FindControl("ddlsanctionautharity")));
            if (ddlao.SelectedValue != ddlforwording.SelectedValue && ddlao.SelectedValue != ddlsanction.SelectedValue && ddlao.SelectedValue != ddllink.SelectedValue)
            {
                //
            }
            else
            {
                //cf.ShowAlertMessage("Already seleted employee,please select another employee");
                //ddlao.SelectedIndex = 0;
                //ddlao.Focus();
                //return;
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect(ex.Message.ToString());
        }
    }

    protected void ddlsanctionautharity_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList Dropdown = sender as DropDownList;
            GridViewRow gRow = (GridViewRow)Dropdown.NamingContainer;
            DropDownList ddlSection = ((DropDownList)(gRow.FindControl("ddlSection")));
            DropDownList ddlforwording = ((DropDownList)(gRow.FindControl("ddlforwording")));
            DropDownList ddlao = ((DropDownList)(gRow.FindControl("ddlao")));
            DropDownList ddllink = ((DropDownList)(gRow.FindControl("ddllink")));
            DropDownList ddlsanction = ((DropDownList)(gRow.FindControl("ddlsanctionautharity")));
            if (ddlsanction.SelectedValue != ddlforwording.SelectedValue && ddlsanction.SelectedValue != ddlao.SelectedValue && ddlsanction.SelectedValue != ddllink.SelectedValue)
            {

            }
            else
            {
                //cf.ShowAlertMessage("Already seleted employee,please select another employee");
                //ddlsanction.SelectedIndex = 0;
                //ddlsanction.Focus();
                //return;
            }

        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect(ex.Message.ToString());
        }
    }

    protected void ddllink_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList Dropdown = sender as DropDownList;
            GridViewRow gRow = (GridViewRow)Dropdown.NamingContainer;
            DropDownList ddlSection = ((DropDownList)(gRow.FindControl("ddlSection")));
            DropDownList ddlforwording = ((DropDownList)(gRow.FindControl("ddlforwording")));
            DropDownList ddlao = ((DropDownList)(gRow.FindControl("ddlao")));
            DropDownList ddllink = ((DropDownList)(gRow.FindControl("ddllink")));
            DropDownList ddlsanction = ((DropDownList)(gRow.FindControl("ddlsanctionautharity")));
            if (ddllink.SelectedValue != ddlforwording.SelectedValue && ddllink.SelectedValue != ddlao.SelectedValue && ddllink.SelectedValue != ddlsanction.SelectedValue)
            {

            }
            else
            {
                //cf.ShowAlertMessage("Already seleted employee,please select another employee");
                //ddllink.SelectedIndex = 0;
                //ddllink.Focus();
                //return;
            }

        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect(ex.Message.ToString());
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
}