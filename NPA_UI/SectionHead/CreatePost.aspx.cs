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

public partial class SectionHead_Application : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
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
                    BindPostType();
                    GetSections();
                    GetQualifications();
                }
                catch (Exception ex)
                {
                    ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
                    Response.Redirect("../Error.aspx");
                }
            }
        }
    }
    protected void GetQualifications()
    {
        objBE.Action = "R";
        dt = ObjDL.GetDetails(objBE, con);
        cf.BindDropDownLists(ddlQalification, dt, "Qualification_Name", "Qualification_Code", "");
    }
    protected void BindPostType()
    {
        objBE.Action = "R";
        dt = ObjDL.TypeOfPostIUDR(objBE, con);
        if (dt.Rows.Count > 0)
            cf.BindDropDownLists(ddlPostType, dt, "PostTypeName", "PostTypeID", "0");
    }

    protected void GetSections()
    {
        DataTable dtparam = new DataTable();
        dtparam.Columns.Add("Section", typeof(string));
        dtparam.Columns.Add("Items", typeof(string));
        dtparam.Rows.Add();
        Session["dtitems"] = dtparam;
        GVSection.DataSource = dtparam;
        GVSection.DataBind();
    }
    protected void rblExp_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rblExp.SelectedValue == "0")
            txtExp.Enabled = false;
        else
            txtExp.Enabled = true;
    }
    protected void GVSection_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            string[] items=null;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblSection = (e.Row.FindControl("lblSection") as Label);
                DropDownList ddlSection = (DropDownList)e.Row.FindControl("ddlSection");
                CheckBoxList cblItems = ((CheckBoxList)(e.Row.FindControl("cblItems")));
                Label lblChkbox = (e.Row.FindControl("lblItem") as Label);
                //  ddlSection.SelectedValue = lblSection.Text;
                dt = new DataTable();
                objBE.SectionID = "0";
                objBE.Action = "R";
                dt = ObjDL.AddApplicationSectionIUDR(objBE, con);
                cf.BindDropDownLists(ddlSection, dt, "SectionName", "SectionID", "0");
                if (lblSection.Text != "")
                    ddlSection.SelectedValue = lblSection.Text;
                if (ddlSection.SelectedIndex > 0)
                {
                    objBE.SectionID = ddlSection.SelectedValue;
                    objBE.Action = "R";
                    dt = ObjDL.AddItemsInSectionIUDR(objBE, con);
                    if (dt.Rows.Count > 0)
                        cf.BindCheckLists(cblItems, dt, "ItemName", "ItemID", "");
                }
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

    protected void ddlSection_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList Dropdown = sender as DropDownList;
            GridViewRow gRow = (GridViewRow)Dropdown.NamingContainer;
            DropDownList ddlSection = ((DropDownList)(gRow.FindControl("ddlSection")));
            CheckBoxList cblItems = ((CheckBoxList)(gRow.FindControl("cblItems")));
            objBE.SectionID = ddlSection.SelectedValue;
            objBE.Action = "R";
            dt = ObjDL.AddItemsInSectionIUDR(objBE, con);
            if (dt.Rows.Count > 0)
                cf.BindCheckLists(cblItems, dt, "ItemName", "ItemID", "");            
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
                objBE.Postname = txtPostName.Text.Trim();
                objBE.PostDescription = txtPostDes.Text.Trim();
                objBE.PostTypeId = ddlPostType.SelectedValue;
                objBE.Effectfrom = cf.Texttodateconverter(txtfrom.Text);
                objBE.EffecTO = cf.Texttodateconverter(txtTo.Text);
                objBE.Qualificationcode = ddlQalification.SelectedValue;
                objBE.Exp = rblExp.SelectedValue;
                objBE.ExpDet = txtExp.Text.Trim();
                objBE.Photo = rblphoto.SelectedValue;
                objBE.Disclaimer = txtdisclaimer.Text.Trim();
                objBE.no_of_Posts = txtnop.Text.Trim();
                objBE.Placement = txtLocation.Text.Trim();
                objBE.Salary = txtsal.Text.Trim();
                objBE.AgeLimit = txtage.Text.Trim();
                objBE.AppliFee = rblFee.SelectedValue;
                objBE.Fee = txtFee.Text.Trim();
                objBE.UserID = user;
                objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
                objBE.Action = "I";

                DataTable dtItems = new DataTable();
                dtItems.Columns.Add("Section", typeof(string));
                dtItems.Columns.Add("Item", typeof(string));
                int j = 0;
                foreach (GridViewRow gr in GVSection.Rows)
                {
                    CheckBoxList cblItems = ((CheckBoxList)(gr.FindControl("cblItems")));
                    for (int i = 0; i < cblItems.Items.Count; i++)
                    {
                        if (cblItems.Items[i].Selected)
                        {
                            dtItems.Rows.Add();
                            dtItems.Rows[j]["Section"] = ((DropDownList)gr.FindControl("ddlSection")).SelectedValue;
                            dtItems.Rows[j]["Item"] = cblItems.Items[i].Value;
                            j++;
                        }
                    }
                }
                objBE.Tvp = dtItems;
                dt = ObjDL.Post_IUDR(objBE, con);
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
        }
    }

    public DataTable CreateDataTable()
    {
        DataTable ddt = new DataTable();
        ddt.Columns.Add("Section", typeof(string));
        ddt.Columns.Add("Items", typeof(string));
        return ddt;
    }

    protected void GVSection_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            DataTable dt;
            if (e.CommandName == "Remove")
            {
                if (GVSection.Rows.Count > 1)
                {
                    GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;

                    dt = CreateDataTable();
                    int j = 0;
                    foreach (GridViewRow gr in GVSection.Rows)
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
                        dt.Rows[j]["Section"] = ((DropDownList)gr.FindControl("ddlSection")).SelectedValue;
                        dt.Rows[j]["Items"] = items;
                        j++;
                    }
                    dt.Rows.RemoveAt(gvrow.RowIndex);
                    if (dt.Rows.Count == 0)
                    {
                        dt.Rows.Add();
                    }
                    GVSection.DataSource = dt;
                    GVSection.DataBind();
                }
            }
            if (e.CommandName == "Add")
            {
                GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;

                dt = CreateDataTable();
                int j = 0;               
                foreach (GridViewRow gr in GVSection.Rows)
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
                    dt.Rows[j]["Section"] = ((DropDownList)gr.FindControl("ddlSection")).SelectedValue;
                    dt.Rows[j]["Items"] = items;
                    j++;
                }
                dt.Rows.Add();
                GVSection.DataSource = dt;
                GVSection.DataBind();
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            // Response.Redirect("../Error.aspx");
        }
    }
    public bool validate()
    {
        if (txtPostName.Text.Trim() == "")
        {
            cf.ShowAlertMessage("Please Enter Post Name");
            txtPostName.Focus();
            return false;
        }
        if (txtPostDes.Text.Trim() == "")
        {
            cf.ShowAlertMessage("Please Enter Post Description");
            txtPostDes.Focus();
            return false;
        }
        if (ddlPostType.SelectedIndex == 0)
        {
            cf.ShowAlertMessage("Please Select Type of Post");
            ddlPostType.Focus();
            return false;
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
        txtPostName.Text = "";
        txtPostDes.Text = "";
        ddlPostType.ClearSelection();
    }


   
}