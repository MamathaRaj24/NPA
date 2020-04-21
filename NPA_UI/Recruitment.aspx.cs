using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using NPA_DL;
using System.Data;
using System.Configuration;
using System.IO;


public partial class Recruitment : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
    Recruitment_DL objRecr = new Recruitment_DL();
    CommonFuncs objcomm = new CommonFuncs();
    Validate objvalidate = new Validate();
    DataTable dt;
    string con = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
    IFormatProvider provider = new System.Globalization.CultureInfo("en-IN", true);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string postid = Session["Postid"].ToString();
            string postNm = Session["PostName"].ToString();
            lblPostName.Text = postid + "  " + postNm;
            BindGrid(postid);
            BindCaste();
            BindGridQ();
            BindGridE();
        }
    }

    protected void BindCaste()
    {
        dt = new DataTable();
        objBE.Action = "CST";
        dt = ObjDL.GetDetails(objBE, con);
        objcomm.BindDropDownLists(ddlCaste, dt, "CasteName", "CasteCode", "Select");
    }
    protected void txtDOB_TextChanged(object sender, EventArgs e)
    {
        int age = 0;
        DateTime dob = Convert.ToDateTime(txtDOB.Text); 
        age = DateTime.Now.Year - dob.Year;
        if (DateTime.Now.DayOfYear < dob.DayOfYear)
            age = age - 1;
        if (age > Convert.ToInt16(lblAge.Text))
        {
            objcomm.ShowAlertMessage("You Are not eligible for this post");
            btn_Save.Visible = false;
        }
          
    }
    protected void BindGrid(string id)
    {
        try
        {
            objBE = new Master_BE();
            objBE.Action = "R";
            objBE.Id = id;
            dt = ObjDL.Post_IUDR(objBE, con);
            lblPostName.Text = dt.Rows[0]["PostName"].ToString();
            lblPostType.Text = dt.Rows[0]["PostTypeName"].ToString();
            lbldate.Text = dt.Rows[0]["EffectiveTo"].ToString();
            lblDesc.Text = dt.Rows[0]["Description"].ToString();
            lblDisclaimer.Text = dt.Rows[0]["Disclaimer"].ToString();
            lblAge.Text = dt.Rows[0]["AgeLimit"].ToString();
            if ((dt.Rows[0]["Exp"].ToString()) == "True")
            {
                Exp.Visible = true;
            }
            //string quali = dt.Rows[0]["Qualification_Name"].ToString();
            //GvQualification.DataSource = dt;
            //GvQualification.DataBind();
            //string html = " <div class=card>";

            //for (int i = 1; i < dt.Rows.Count; i++)
            //{
            //    DataRow[] section = dt.Select("SectionID='" + i + "' ");
            //    if (section.Length > 0)
            //    {
            //        html += " <div class='card-header'><strong>" + section[0]["SectionName"].ToString() + "</strong></div>";
            //        html += "<div class='card-body card-block'> <div class='row form-group text-left'>";
            //        foreach (DataRow row in section)
            //        {
            //            html += " <div class='col col-md-2'> <label class='form-control-label text-center'>" + row["ItemName"].ToString() + "</label></div>";
            //            html += " <div class='col-md-2'> <asp:TextBox ID='' CssClass='form-control' runat='server'> </div>";
            //        }
            //        html += "</div> </div>";
            //    }
            //}
            //objcomm.ShowAlertMessage(html);
            //DivData.InnerHtml = html;
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            // Response.Redirect("../Error.aspx");
        }
    }

    protected void BindGridQ()
    {
        try
        {
            DataTable dtqualification = CreatedtQual();

            dtqualification.Rows.Add();
            objBE.Action = "RQ";
            objBE.Id = Session["Postid"].ToString();
            dt = ObjDL.Post_IUDR(objBE, con);
            // Session["dtqualification"] = dtqualification;
            GvQualification.DataSource = dt;
            GvQualification.DataBind();
            if (GvQualification.Rows.Count > 0)
            {
                ((DropDownList)GvQualification.Rows[0].FindControl("ddlqualification")).Enabled = false;
            }

        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            objcomm.ShowAlertMessage(ex.ToString());
        }
    }
    public DataTable CreatedtQual()
    {
        DataTable dtqualification = new DataTable();
        dtqualification.Columns.Add("Qualification_Code", typeof(string));
        dtqualification.Columns.Add("Percentage_Marks", typeof(string));
        dtqualification.Columns.Add("Year_of_Passing", typeof(string));
        dtqualification.Columns.Add("University", typeof(string));

        return dtqualification;
    }
    public DataTable CreatedtExp()
    {
        DataTable dtExperiance = new DataTable();
        dtExperiance.Columns.Add("Post_Name", typeof(string));
        dtExperiance.Columns.Add("Exp", typeof(string));
        dtExperiance.Columns.Add("Sector", typeof(string));
        return dtExperiance;
    }
    protected void GvQualification_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "AddRows")
            {
                List<String> qulaification = new List<string>();
                DataTable dtqualification = CreatedtQual();
                int j = 0;
                foreach (GridViewRow gr in GvQualification.Rows)
                {

                    dtqualification.Rows.Add();
                    dtqualification.Rows[j]["Qualification_Code"] = ((DropDownList)gr.FindControl("ddlqualification")).SelectedValue.Trim();
                    dtqualification.Rows[j]["University"] = ((TextBox)gr.FindControl("txtbruniersity")).Text.Trim();
                    dtqualification.Rows[j]["Year_of_Passing"] = ((TextBox)gr.FindControl("txtyearofpassing")).Text.Trim();
                    dtqualification.Rows[j]["Percentage_Marks"] = ((TextBox)gr.FindControl("txtPerMarks")).Text.Trim();
                    qulaification.Add(((DropDownList)gr.FindControl("ddlqualification")).SelectedValue);
                    j++;

                }
                ViewState["lst"] = qulaification;
                dtqualification.Rows.Add();
                Session["dtqualification"] = dtqualification;
                GvQualification.DataSource = dtqualification;
                GvQualification.DataBind();
                if (GvQualification.Rows.Count > 0)
                {
                    ((DropDownList)GvQualification.Rows[0].FindControl("ddlqualification")).Enabled = false;
                }
            }

            if (e.CommandName == "Remove")
            {
                GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                DataTable dtqualification = CreatedtQual();
                int j = 0;
                foreach (GridViewRow gr in GvQualification.Rows)
                {
                    dtqualification.Rows.Add();
                    dtqualification.Rows[j]["Qualification_Code"] = ((DropDownList)gr.FindControl("ddlqualification")).SelectedValue.Trim();
                    dtqualification.Rows[j]["University"] = ((TextBox)gr.FindControl("txtbruniersity")).Text.Trim();
                    dtqualification.Rows[j]["Year_of_Passing"] = ((TextBox)gr.FindControl("txtyearofpassing")).Text.Trim();
                    dtqualification.Rows[j]["Percentage_Marks"] = ((TextBox)gr.FindControl("txtPerMarks")).Text.Trim();

                    j++;
                }
                dtqualification.Rows.RemoveAt(gvrow.RowIndex);
                if (dtqualification.Rows.Count == 0)
                    dtqualification.Rows.Add();
                GvQualification.DataSource = dtqualification;
                GvQualification.DataBind();
                if (GvQualification.Rows.Count > 0)
                {
                    ((DropDownList)GvQualification.Rows[0].FindControl("ddlqualification")).Enabled = false;
                }
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            objcomm.ShowAlertMessage(ex.ToString());
        }
    }

    protected void GvQualification_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblexam = (e.Row.FindControl("lblQualiCd") as Label);
            DropDownList ddlqualification = (DropDownList)e.Row.FindControl("ddlqualification");
            objBE.Action = "R";
            dt = ObjDL.GetDetails(objBE, con);
            if (dt.Rows.Count > 0)
            {
                objcomm.BindDropDownLists(ddlqualification, dt, "Qualification_Name", "Qualification_Code", "0");

                //DropDownList ddl = (DropDownList)e.Row.FindControl("ddlqualification");
                //ddl.Enabled = false;
            }

            if (lblexam.Text != "")
                ddlqualification.SelectedValue = lblexam.Text;
            else
                if (ViewState["lst"] != null)
                {
                    ListItem li = new ListItem();
                    List<String> qulaification = (List<String>)ViewState["lst"];

                    for (int l = 0; l < qulaification.ToArray().Length; l++)
                    {
                        li = ddlqualification.Items.FindByValue(qulaification.ToArray()[l]);
                        if (li != null) // WRONG DESIGNATION INSERTED
                            ddlqualification.Items.Remove(li);
                    }

                }

        }
    }

    protected void BindGridE()
    {
        try
        {
            DataTable dtExperiance = CreatedtExp();

            dtExperiance.Rows.Add();
            Session["dtExperiance"] = dtExperiance;
            GVExp.DataSource = dtExperiance;
            GVExp.DataBind();
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            objcomm.ShowAlertMessage(ex.ToString());
        }
    }

    protected void GVExp_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "AddRows")
            {
                DataTable dtExperiance = CreatedtExp();
                int j = 0;
                foreach (GridViewRow gr in GVExp.Rows)
                {

                    dtExperiance.Rows.Add();
                    dtExperiance.Rows[j]["Post_Name"] = ((TextBox)gr.FindControl("txtPostName")).Text.Trim();
                    dtExperiance.Rows[j]["Exp"] = ((TextBox)gr.FindControl("txtExp")).Text.Trim();
                    dtExperiance.Rows[j]["Sector"] = ((TextBox)gr.FindControl("txtSector")).Text.Trim();
                    j++;

                }
                dtExperiance.Rows.Add();
                Session["dtExperiance"] = dtExperiance;
                GVExp.DataSource = dtExperiance;
                GVExp.DataBind();
            }

            if (e.CommandName == "Remove")
            {
                GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                DataTable dtExperiance = CreatedtExp();
                int j = 0;
                foreach (GridViewRow gr in GVExp.Rows)
                {
                    dtExperiance.Rows.Add();
                    dtExperiance.Rows[j]["Post_Name"] = ((TextBox)gr.FindControl("txtPostName")).Text.Trim();
                    dtExperiance.Rows[j]["Exp"] = ((TextBox)gr.FindControl("txtExp")).Text.Trim();
                    dtExperiance.Rows[j]["Sector"] = ((TextBox)gr.FindControl("txtSector")).Text.Trim();
                    j++;


                }
                dtExperiance.Rows.RemoveAt(gvrow.RowIndex);
                if (dtExperiance.Rows.Count == 0)
                    dtExperiance.Rows.Add();
                GVExp.DataSource = dtExperiance;
                GVExp.DataBind();
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            objcomm.ShowAlertMessage(ex.ToString());
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
    protected void btn_Save_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtName.Text.Trim() == "")
            {
                objcomm.ShowAlertMessage("Please Enter Name");
                txtName.Focus();
                return;
            }
            if (txtFName.Text.Trim() == "")
            {
                objcomm.ShowAlertMessage("Please Enter Father Name");
                txtFName.Focus();
                return;
            }
            if (txtDOB.Text.Trim() == "")
            {
                objcomm.ShowAlertMessage("Please Enter Date Of Birth");
                txtDOB.Focus();
                return;
            }
            if (ddlCaste.SelectedIndex <= 0)
            {
                objcomm.ShowAlertMessage("Please Select Community");
                ddlCaste.Focus();
                return;
            }
            if (ddlNationality.SelectedIndex <= 0)
            {
                objcomm.ShowAlertMessage("Please Select Nationality");
                ddlNationality.Focus();
                return;
            }
            if (rbGender.SelectedIndex < 0)
            {
                objcomm.ShowAlertMessage("Please Select Gender");
                rbGender.Focus();
                return;
            }
            if (ddlReligion.SelectedIndex <= 0)
            {
                objcomm.ShowAlertMessage("Please Select Religion");
                ddlReligion.Focus();
                return;
            }
            if (txtAdd.Text.Trim() == "")
            {
                objcomm.ShowAlertMessage("Please Enter Address");
                txtAdd.Focus();
                return;
            }
            if (txtPAdd.Text.Trim() == "")
            {
                objcomm.ShowAlertMessage("Please Enter Permanent Address");
                txtAdd.Focus();
                return;
            }
            if (txtMob.Text.Trim() == "")
            {
                objcomm.ShowAlertMessage("Please Enter Mobile Number");
                txtMob.Focus();
                return;
            }
            else
            {
                if (txtMob.Text.Trim().Length < 10)
                {
                    objcomm.ShowAlertMessage("Please Enter 10 digit Mobile Number");
                    txtMob.Focus();
                    return;
                }
                else if (!objvalidate.ISMobileNo(txtMob.Text.Trim(), 9, 9))
                {
                    objcomm.ShowAlertMessage("Please Enter Valid Mobile Number");
                    txtMob.Focus();
                    return;
                }
            }
            if (txtEmail.Text.Trim() == "")
            {
                objcomm.ShowAlertMessage("Please Enter Email Id");
                txtEmail.Focus();
                return;
            }
            if (txtAadhaar.Text.Trim() == "")
            {
                objcomm.ShowAlertMessage("Please Enter Aadhaar Id");
                txtAadhaar.Focus();
                return;
            }
            if (chkDisclaimer.Checked==false)
            {
                objcomm.ShowAlertMessage("Please Check Disclaimer");
                chkDisclaimer.Focus();
                return;
            }
            objBE = new Master_BE();
            objBE.PostTypeId = Session["Postid"].ToString();
            objBE.EmpName = txtName.Text.Trim();
            objBE.Father_HusbandName = txtFName.Text.Trim();
            objBE.DOB = DateTime.Parse(txtDOB.Text.Trim(), provider, System.Globalization.DateTimeStyles.None).ToString("yyyy-MM-dd");
            objBE.Community = ddlCaste.SelectedValue;
            objBE.Nationality = ddlNationality.SelectedValue;
            objBE.Gender = rbGender.SelectedValue;
            objBE.Religion = ddlReligion.SelectedValue;
            objBE.Address = txtAdd.Text.Trim();
            objBE.PermAdd = txtPAdd.Text.Trim();
            objBE.Mobile = txtMob.Text.Trim();
            objBE.Email = txtEmail.Text.Trim();
            objBE.Aadhar = txtAadhaar.Text.Trim();

            DataTable dtqualification = CreatedtQual();
            int j = 0;
            foreach (GridViewRow gr in GvQualification.Rows)
            {

                dtqualification.Rows.Add();
                dtqualification.Rows[j]["Qualification_Code"] = ((DropDownList)gr.FindControl("ddlqualification")).SelectedValue.Trim();
                dtqualification.Rows[j]["University"] = ((TextBox)gr.FindControl("txtbruniersity")).Text.Trim();
                dtqualification.Rows[j]["Year_of_Passing"] = ((TextBox)gr.FindControl("txtyearofpassing")).Text.Trim();
                dtqualification.Rows[j]["Percentage_Marks"] = ((TextBox)gr.FindControl("txtPerMarks")).Text.Trim();
                j++;

            }
            if (dtqualification.Rows.Count <= 0)
            {
                objcomm.ShowAlertMessage("Please Enter Qualification Details");
                return;
            }
            j = 0;
            DataTable dtExperiance = CreatedtExp();
            foreach (GridViewRow gr in GVExp.Rows)
            {

                dtExperiance.Rows.Add();
                dtExperiance.Rows[j]["Post_Name"] = ((TextBox)gr.FindControl("txtPostName")).Text.Trim();
                dtExperiance.Rows[j]["Exp"] = ((TextBox)gr.FindControl("txtExp")).Text.Trim();
                dtExperiance.Rows[j]["Sector"] = ((TextBox)gr.FindControl("txtSector")).Text.Trim();
                j++;

            }
            if (dtExperiance.Rows.Count <= 0)
            {
                objcomm.ShowAlertMessage("Please Enter Experience Details");
                return;
            }
            if (fluPhoto.HasFile)
            {
                string fileNm = "", fileSize = "", fileType = "";
                byte[] content = null;
                Stream fs = fluPhoto.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                string fileext = Path.GetExtension(fluPhoto.PostedFile.FileName);
                if (fileext == ".jpg" || fileext == ".PNG" || fileext == ".png" || fileext == ".jpeg" || fileext == ".JPG")
                {
                    int len = fluPhoto.PostedFile.ContentLength;
                    if ((len / 1024) > 2048)
                    {
                        objcomm.ShowAlertMessage("File size is exceeded");
                        fluPhoto.Focus();
                        return;
                    }

                    string fn = Path.GetFileName(fluPhoto.PostedFile.FileName);

                    fileNm = fn;
                    fileSize = len.ToString();
                    fileType = fileext;
                    content = bytes;
                    dt = new DataTable();
                }
                else
                {
                    objcomm.ShowAlertMessage("Please Upload .JPG/.jpg/.png/.PNG/.jpeg");
                    return;
                }

                objBE.fileNm = fileNm;
                objBE.fileSize = fileSize;
                objBE.fileType = fileType;
                objBE.content = bytes;
            }
            else
            {
                objcomm.ShowAlertMessage("Please Upload .JPG/.jpg/.png/.PNG/.jpeg");
                return;
            }

            string SignfileNme = "", SignfileSizee = "", SignfileTypee = "";
            byte[] contentt = null;
            if (fluSig.HasFile)
            {
                Stream fs = fluSig.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                string fileext = Path.GetExtension(fluSig.PostedFile.FileName);
                //string mime =  MimeType.GetMimeType(bytes, FileUpload1.PostedFile.FileName);
                if (fileext == ".jpg" || fileext == ".PNG" || fileext == ".png" || fileext == ".jpeg" || fileext == ".JPG")
                {
                    int len = fluSig.PostedFile.ContentLength;
                    if ((len / 1024) > 2048)
                    {
                        objcomm.ShowAlertMessage("File size is exceeded");
                        fluSig.Focus();
                        return;
                    }

                    string fn = Path.GetFileName(fluSig.PostedFile.FileName);
                    SignfileNme = fn;
                    SignfileSizee = len.ToString();
                    SignfileTypee = fileext;
                    contentt = bytes;
                    dt = new DataTable();
                }
                else
                {
                    objcomm.ShowAlertMessage("Please Upload .JPG/.jpg/.png/.PNG/.jpeg");
                    return;
                }
                objBE.SignfileNme = SignfileNme;
                objBE.SignfileSizee = SignfileSizee;
                objBE.SignfileTypee = SignfileTypee;
                objBE.Signcontentt = bytes;
            }
            else
            {
                objcomm.ShowAlertMessage("Please Upload .JPG/.jpg/.png/.PNG/.jpeg");
                return;
            }
            objBE.Tvp = dtExperiance;
            objBE.TVP1 = dtqualification;
            objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
            objBE.Action = "I";
            DataSet ds = objRecr.ApplyPost_DL(objBE, con);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (ds.Tables[0].Rows[0][0].ToString() == "0")
                {                    
                    objcomm.ShowAlertMessage(ds.Tables[0].Rows[0][1].ToString());
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
                "alert('Application submitted successfully with application id:  " + ds.Tables[0].Rows[0][1].ToString() + " Please keep this for further reference.'); window.location='Recruitment.aspx';", true);
                    return;
                }
            }

        }
        catch (Exception ex)
        {
            objcomm.ShowAlertMessage(ex.Message);
            //Response.Redirect("~/Error.aspx");
        }
    }
    
}