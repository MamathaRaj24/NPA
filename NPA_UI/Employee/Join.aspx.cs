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

public partial class Employee_Join : System.Web.UI.Page
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
                    BindGrid();
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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            objBE.doj = DateTime.Parse(txtFromdate.Text.Trim(), provider, System.Globalization.DateTimeStyles.None).ToString("yyyy-MM-dd");
            objBE.Type = ddlFrom.SelectedValue;
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
                //foreach (GridViewRow gr in GVJoin.Rows)
                //{
                //    if (((RadioButton)(gr.FindControl("rbJoin"))).Checked  == true)
                //    {
                //        objBE.Id = ((Label)(gr.FindControl("lblApplicationId"))).Text;
                //        objBE.LType = ((Label)(gr.FindControl("lblleavetyCd"))).Text;
                //        objBE.Type = ((Label)(gr.FindControl("lblType"))).Text;
                //        objBE.Prefix = ((Label)(gr.FindControl("lblPrefix"))).Text;
                //        objBE.PostFix = ((Label)(gr.FindControl("lblSuffix"))).Text;
                //    }
                //}
                if (ViewState["ApplicationId"] == null)
                {
                    cf.ShowAlertMessage("Please select Application Id");
                    return;
                }
                objBE.Id = ViewState["ApplicationId"].ToString();
                objBE.LType = ViewState["Ltype"].ToString();
                objBE.Type = ViewState["Ltypedesc"].ToString();
                objBE.Doc_Content = br.ReadBytes((Int32)fs.Length);
                objBE.EmpId = Session["Empid"].ToString();
                objBE.Doc_Name = UpldLeavdoc.PostedFile.FileName;
                objBE.Action = "JOIN_S";
                dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
                if (dt.Rows.Count > 0)
                    cf.ShowAlertMessage("Status not updated");

                else
                    cf.ShowAlertMessage("Status Updated");
            }
            else
            {
                cf.ShowAlertMessage("Please Upload File");
            }
            BindGrid();
        }
        catch (Exception ex)
        {
            //Response.Redirect("~/Error.aspx");
        }
    }
    protected void BindGrid()
    {

        objBE.EmpId = Session["Empid"].ToString();
        objBE.Action = "JOIN";
        dt = ObjEmpDL.ApplyLeave_IUDR(objBE, con);
        GVJoin.DataSource = dt;
        GVJoin.DataBind();
        if (dt.Rows.Count > 0)
            divmain.Visible = true;
        else
            divmain.Visible = false;
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
    protected void rbJoin_CheckedChanged(object sender, EventArgs e)
    {
        RadioButton rbJoin = sender as RadioButton;
        GridViewRow gRow = (GridViewRow)rbJoin.NamingContainer;
        Label lblleavtype = ((Label)(gRow.FindControl("lblLeave")));
        Label lblApplicationId = ((Label)(gRow.FindControl("lblApplicationId")));
        Label lblleavetyCd = ((Label)(gRow.FindControl("lblleavetyCd")));
        Label lblType = ((Label)(gRow.FindControl("lblType")));

        ViewState["ApplicationId"] = lblApplicationId.Text;
        ViewState["Ltype"] = lblleavetyCd.Text;
        ViewState["Ltypedesc"] = lblType.Text;

        if (rbJoin.Checked == true)
        {
            foreach (GridViewRow gr in GVJoin.Rows)
            {
                if (((Label)(gr.FindControl("lblLeave"))).Text == lblleavtype.Text && ((Label)(gr.FindControl("lblApplicationId"))).Text == lblApplicationId.Text)
                {
                    ((RadioButton)(gr.FindControl("rbJoin"))).Checked = true;
                }
                else
                    ((RadioButton)(gr.FindControl("rbJoin"))).Checked = false;
            }
        }
    }
}