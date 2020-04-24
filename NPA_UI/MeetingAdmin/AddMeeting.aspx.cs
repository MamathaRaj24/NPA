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

public partial class MeetingAdmin_AddMeeting : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
    Meeting Obj_DL = new Meeting();
    CommonFuncs cf = new CommonFuncs();
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
        if (Session["UserId"] != null && Session["RoleID"].ToString() == "11")
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
                }
                catch (Exception ex)
                {
                    ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
                    Response.Redirect("../Error.aspx");
                }
            }
        }
    }

    public void BindGrid()
    {
        DataTable dt = CreateDataTable();
        dt.Rows.Add();
        GVWrk.DataSource = dt;
        GVWrk.DataBind();
    }

    protected void GVWrk_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            string[] items = null;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
               
                TextBox txtWrk = (TextBox)e.Row.FindControl("txtWrk");
                CheckBoxList cblItems = ((CheckBoxList)(e.Row.FindControl("cblItems")));
                Label lblChkbox = (e.Row.FindControl("lblItem") as Label);
                
                dt = new DataTable();
               
                objBE.Action = "Empcode";
                dt = ObjDL.EmployeeIUDR(objBE, con);
                if (dt.Rows.Count > 0)
                    cf.BindCheckLists(cblItems, dt, "EmpoyeeName", "Employee_ID", "");
                items = lblChkbox.Text.Split(',');
                for (int i = 0; i < items.Length; i++)
                {
                    for (int k = 0; k < cblItems.Items.Count; k++)
                    {
                        if (items[i] == cblItems.Items[k].Value)
                            cblItems.Items[k].Selected = true;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }

    public bool validate()
    {
        if (txtMName.Text.Trim() == "")
        {
            cf.ShowAlertMessage("Please Enter Meeting Name");
            txtMName.Focus();
            return false;
        }
        if (txtDate.Text.Trim() == "")
        {
            cf.ShowAlertMessage("Please Enter Date");
            txtDate.Focus();
            return false;
        }
        if (txtSubject.Text.Trim() == "")
        {
            cf.ShowAlertMessage("Please Enter Subject");
            txtSubject.Focus();
            return false;
        }
        if (txtMHead.Text.Trim() == "")
        {
            cf.ShowAlertMessage("Please Enter Meeting Head");
            txtMHead.Focus();
            return false;
        }

        return true;
    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        try
        {
            check();
            if (validate())
            {
                objBE.MName = txtMName.Text.Trim();
                objBE.ToDt = cf.Texttodateconverter(txtDate.Text);
                objBE.Subject = txtSubject.Text.Trim();
                objBE.MHead = txtMHead.Text.Trim();
                
                objBE.UserID = user;
                objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
                objBE.Action = "I";

                DataTable dtItems = new DataTable();
                dtItems.Columns.Add("Work", typeof(string));
                dtItems.Columns.Add("Emp", typeof(string));
                int j = 0;
                foreach (GridViewRow gr in GVWrk.Rows)
                {
                    CheckBoxList cblItems = ((CheckBoxList)(gr.FindControl("cblItems")));
                    for (int i = 0; i < cblItems.Items.Count; i++)
                    {
                        if (cblItems.Items[i].Selected)
                        {
                            dtItems.Rows.Add();
                            dtItems.Rows[j]["Work"] = ((TextBox)gr.FindControl("txtWrk")).Text.Trim();
                            dtItems.Rows[j]["Emp"] = cblItems.Items[i].Value;
                            j++;
                        }
                    }
                }
                objBE.Tvp = dtItems;
                dt = Obj_DL.AddMeeting_IUDR(objBE, con);
                if (dt.Rows.Count > 0)
                    cf.ShowAlertMessage(dt.Rows[0][0].ToString());

                else
                    cf.ShowAlertMessage("Post Created Successfully");

                //BindGrid();
                Clear();
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            //Response.Redirect("../Error.aspx");
            cf.ShowAlertMessage(ex.Message);
        }
    }

    protected void Clear()
    {
        txtMName.Text = "";
        txtDate.Text = "";
        txtSubject.Text = "";
        txtMHead.Text = "";
    }

    protected void GVWrk_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            DataTable dt;
            if (e.CommandName == "Remove")
            {
                if (GVWrk.Rows.Count > 1)
                {
                    GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;

                    dt = CreateDataTable();
                    int j = 0;
                    foreach (GridViewRow gr in GVWrk.Rows)
                    {
                        string items = "";
                        CheckBoxList cblItems = ((CheckBoxList)(gr.FindControl("cblItems")));
                        for (int i = 0; i < cblItems.Items.Count; i++)
                        {
                            if (cblItems.Items[i].Selected)
                            {
                                items = items + (items == "" ? "" : ",") + cblItems.Items[i].Value;
                            }
                        }
                        dt.Rows.Add();
                        dt.Rows[j]["Work"] = ((TextBox)gr.FindControl("txtWrk")).Text.Trim();
                        dt.Rows[j]["Emp"] = items;
                        j++;
                    }
                    dt.Rows.RemoveAt(gvrow.RowIndex);
                    if (dt.Rows.Count == 0)
                    {
                        dt.Rows.Add();
                    }
                    GVWrk.DataSource = dt;
                    GVWrk.DataBind();
                }
            }
            if (e.CommandName == "Add")
            {
                GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;

                dt = CreateDataTable();
                int j = 0;
                foreach (GridViewRow gr in GVWrk.Rows)
                {
                    string items = "";
                    CheckBoxList cblItems = ((CheckBoxList)(gr.FindControl("cblItems")));
                    for (int i = 0; i < cblItems.Items.Count; i++)
                    {
                        if (cblItems.Items[i].Selected)
                        {
                            items = items + (items == "" ? "" : ",") + cblItems.Items[i].Value;
                        }
                    }
                    dt.Rows.Add();
                    dt.Rows[j]["Work"] = ((TextBox)gr.FindControl("txtWrk")).Text.Trim();
                    dt.Rows[j]["Emp"] = items;
                    j++;
                }
                dt.Rows.Add();
                GVWrk.DataSource = dt;
                GVWrk.DataBind();
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            // Response.Redirect("../Error.aspx");
        }
    }

    public DataTable CreateDataTable()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Work", typeof(string));
        dt.Columns.Add("Emp", typeof(string));
        dt.Columns.Add();
        return dt;
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