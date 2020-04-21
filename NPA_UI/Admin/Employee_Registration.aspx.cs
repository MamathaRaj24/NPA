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
using System.IO;
using System.Text;

public partial class Admin_Employee_Registration : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Master_DL ObjDL = new Master_DL();
    CommonFuncs objcomm = new CommonFuncs();
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
        Page.MaintainScrollPositionOnPostBack = true;
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
                    bindHomeState();
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
    public void bindHomeState()
    {
        objBE.Action = "S";
        dt = ObjDL.GetLocations(objBE, con);
        if (dt.Rows.Count > 0)
        {
            objcomm.BindDropDownLists(ddlHomeSate, dt, "State", "StateCode", "0");
            objcomm.BindDropDownLists(ddlState, dt, "State", "StateCode", "0");
            objcomm.BindDropDownLists(ddlPerState, dt, "State", "StateCode", "0");
        }
    }

    public void BindHomeDistrict()
    {
        try
        {
            objBE.Action = "D";
            objBE.statecode = ddlHomeSate.SelectedValue;
            dt = ObjDL.GetLocations(objBE, con);
            if (dt.Rows.Count > 0)
            {
                objcomm.BindDropDownLists(ddlHomeDistrict, dt, "DistName", "DistCode", "0");
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }

    public void GetPresentDistrict()
    {
        try
        {
            objBE.Action = "D";
            objBE.statecode = ddlState.SelectedValue;
            dt = ObjDL.GetLocations(objBE, con);
            if (dt.Rows.Count > 0)
                objcomm.BindDropDownLists(ddlPresentDistrict, dt, "DistName", "DistCode", "0");
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }
    public void GetPerDistrict()
    {
        try
        {
            objBE.Action = "D";
            objBE.statecode = ddlPerState.SelectedValue;
            dt = ObjDL.GetLocations(objBE, con);
            if (dt.Rows.Count > 0)
                objcomm.BindDropDownLists(ddlPerDistrict, dt, "DistName", "DistCode", "0");
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }
    public bool validate()
    {
        if (txtEmpCode.Text == "")
        {
            objcomm.ShowAlertMessage("Please Enter Employee code");
            txtEmpCode.Focus();
            return false;
        }
        return true;
    }

    //Perminant Address
    public void BindPerminatdDistrict()
    {
        try
        {
            objBE.Action = "D";
            objBE.statecode = ddlPerState.SelectedValue;
            dt = ObjDL.GetLocations(objBE, con);
            if (dt.Rows.Count > 0)
                objcomm.BindDropDownLists(ddlPerDistrict, dt, "DistName", "DistCode", "0");
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UserId"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }
    protected void rdbDiffAbled_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdbDiffAbled.SelectedValue == "Y")
            txtDisability.Enabled = true;
        else
        {
            txtDisability.Text = "";
            txtDisability.Enabled = false;
        }
    }

    protected void chkSame_CheckedChanged(object sender, EventArgs e)
    {
        if (chkSame.Checked == true)
        {
            ddlPerState.SelectedValue = ddlState.SelectedValue;
            BindPerminatdDistrict();
            ddlPerDistrict.SelectedValue = ddlPresentDistrict.SelectedValue;
            txtPermAddress.Text = txtPrAddress.Text.Trim();
            txtPerPinCode.Text = txtPinCode.Text.Trim();
        }
    }
    protected void BindGrid()
    {
        try
        {
            objBE = new Master_BE();

            objBE.Action = "R";
            dt = ObjDL.EmployeeIUDR(objBE, con);
            if (dt.Rows.Count > 0)
            {
                GvEmployee.DataSource = dt;
                GvEmployee.DataBind();
            }
            else
            {
                GvEmployee.DataSource = null;
                GvEmployee.DataBind();
                objcomm.ShowAlertMessage("No Data");
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("../Error.aspx");
        }
    }
    public string GetImage(object img)
    {
        if (img != DBNull.Value)
        {
            return "data:image/jpg;base64," + Convert.ToBase64String((byte[])img);
        }
        else
        {
            return "";
        }
    }
    protected void BtnSave_Click1(object sender, EventArgs e)
    {
        try
        {
            check();
            if (validate())
            {
                string fileNm = "", fileSize = "", fileType = "";
                byte[] content = null;
                if (fluPhoto.HasFile)
                {
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
                    }

                    objBE.fileNm = fileNm;
                    objBE.fileSize = fileSize;
                    objBE.fileType = fileType;
                    objBE.content = bytes;
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
                    }

                    objBE.SignfileNme = SignfileNme;
                    objBE.SignfileSizee = SignfileSizee;
                    objBE.SignfileTypee = SignfileTypee;
                    objBE.Signcontentt = bytes;
                }

                objBE.Empcode = txtEmpCode.Text.Trim();
                objBE.EmpName = txtEmpName.Text.Trim();
                objBE.SurName = txtSurName.Text.Trim();
                objBE.EmpHusFatName = txtHusFatName.Text.Trim();
                objBE.MotherName = txtMotherName.Text.Trim();
                objBE.Nationality = ddlNational.SelectedValue.Trim();
                objBE.Gender = ddlGender.SelectedValue.Trim();
                objBE.DOB = objcomm.Texttodateconverter(txtDOB.Text);
                objBE.Community = ddlCategory.SelectedValue.Trim();
                objBE.Religion = ddlReligion.SelectedValue.Trim();
                objBE.MotherTng = txtMotherTng.Text.Trim();
                objBE.MrgStatus = rdbMrgSta.SelectedValue.Trim();
                objBE.DifferentAbled = rdbDiffAbled.SelectedValue.Trim();
                objBE.IdentMarkOne = txtIdentMarkOne.Text.Trim();
                objBE.IdentMarkTwo = txtIdentMarkTwo.Text.Trim();
                objBE.HomeSate = ddlHomeSate.SelectedValue.Trim();
                objBE.HomeDistrict = ddlHomeDistrict.SelectedValue.Trim();
                objBE.LicHomeTown = txtLicHomeTwn.Text.Trim();
                objBE.NearRailStation = txtNrRailStn.Text.Trim();
                objBE.statecode = ddlState.SelectedValue.Trim();
                objBE.DistCode = ddlPresentDistrict.SelectedValue.Trim();
                objBE.PinCode = txtPinCode.Text.Trim();
                objBE.PerStateCode = ddlPerState.SelectedValue.Trim();
                objBE.PerDistrict = ddlPerDistrict.SelectedValue.Trim();
                objBE.PerPinCode = txtPerPinCode.Text.Trim();
                objBE.Email = txtempemail.Text;
                objBE.phone = txtPhNo.Text;
                objBE.Mobile = txtMobile.Text.Trim();
                objBE.Aadhar = txtAdharNum.Text.Trim();
                objBE.PanNo = txtPanNum.Text.Trim();
                objBE.UserID = user;
                objBE.Action = "I";
                //objBE.Active = "Ye";
                objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
                dt = ObjDL.EmployeeIUDR(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    objcomm.ShowAlertMessage("Unable to Save");
                }
                else
                {
                    objcomm.ShowAlertMessage("Saved Successfully");
                }
                BindGrid();
                Clear();
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            //Response.Redirect("../Error.aspx");
        }
    }

    protected void ddlHomeSate_SelectedIndexChanged1(object sender, EventArgs e)
    {
        BindHomeDistrict();
    }
    //Present
    protected void ddlState_SelectedIndexChanged1(object sender, EventArgs e)
    {
        GetPresentDistrict();
    }

    protected void ddlPerState_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindPerminatdDistrict();
    }

    protected void Clear()
    {
        txtEmpCode.Text = "";
        txtEmpName.Text = "";
        txtSurName.Text = "";
        txtHusFatName.Text = "";
        txtMotherName.Text = "";
        ddlNational.ClearSelection();
        ddlGender.ClearSelection();
        txtDOB.Text = "";
        ddlCategory.ClearSelection();
        ddlReligion.ClearSelection();
        txtMotherTng.Text = "";
        rdbMrgSta.SelectedValue = "0";
        rdbDiffAbled.SelectedValue = "0";
        txtIdentMarkOne.Text = "";
        txtIdentMarkTwo.Text = "";
        ddlHomeSate.ClearSelection();
        ddlHomeDistrict.ClearSelection();
        txtLicHomeTwn.Text = "";
        txtNrRailStn.Text = "";
        ddlState.ClearSelection();
        ddlPresentDistrict.ClearSelection();
        txtPinCode.Text = "";
        ddlPerState.ClearSelection();
        ddlPerDistrict.ClearSelection();
        txtPerPinCode.Text = "";
        txtempemail.Text = "";
        txtPhNo.Text = "";
        txtMobile.Text = "";
        txtAdharNum.Text = "";
        txtPanNum.Text = "";
        Img1.ImageUrl = null;
        Img2.ImageUrl = null;
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

    protected void GvEmployee_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Edt")
        {
            GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            ViewState["EmpId"] = ((Label)gvrow.FindControl("lblEmployee_ID")).Text;
            txtEmpCode.Text = ((Label)gvrow.FindControl("lblEmpID")).Text;
            txtEmpName.Text = ((Label)gvrow.FindControl("lblEmpName")).Text;
            txtSurName.Text = ((Label)gvrow.FindControl("lblSurName")).Text;
            txtHusFatName.Text = ((Label)gvrow.FindControl("lblFName")).Text;
            txtMotherName.Text = ((Label)gvrow.FindControl("lblMotherName")).Text;
            ddlNational.SelectedValue = ((Label)gvrow.FindControl("lblNationalitys")).Text;
            ddlGender.SelectedValue = ((Label)gvrow.FindControl("lblGENDER")).Text;
            txtDOB.Text = ((Label)gvrow.FindControl("lblDOB")).Text;
            ddlCategory.SelectedValue = ((Label)gvrow.FindControl("lblCommunity")).Text;
            ddlReligion.SelectedValue = ((Label)gvrow.FindControl("lblReligion")).Text;
            txtMotherTng.Text = ((Label)gvrow.FindControl("lblMotherTng")).Text;
            rdbMrgSta.SelectedValue = ((Label)gvrow.FindControl("lblMrgStatus")).Text;
            if (((Label)gvrow.FindControl("lblDifferentAbled")).Text == "YES")
                rdbDiffAbled.SelectedValue = "1";
            else
                rdbDiffAbled.SelectedValue = "0";
            txtDisability.Text = ((Label)gvrow.FindControl("lblDisabilty_Percentage")).Text;
            txtIdentMarkOne.Text = ((Label)gvrow.FindControl("lblIdentMarkOne")).Text;
            txtIdentMarkTwo.Text = ((Label)gvrow.FindControl("lblIdentMarkTwo")).Text;
            bindHomeState();
            if (((Label)gvrow.FindControl("lblHomeSate")).Text != "0")
                ddlHomeSate.SelectedValue = ((Label)gvrow.FindControl("lblHomeSate")).Text;
            BindHomeDistrict();
            if (((Label)gvrow.FindControl("lblHomeDistrict")).Text != "0")
                ddlHomeDistrict.SelectedValue = ((Label)gvrow.FindControl("lblHomeDistrict")).Text;

            txtLicHomeTwn.Text = ((Label)gvrow.FindControl("lblLTCHomeTown")).Text;
            txtNrRailStn.Text = ((Label)gvrow.FindControl("lblNearRailStation")).Text;
            bindHomeState();
            if (((Label)gvrow.FindControl("lblStateCode")).Text != "0")
                ddlState.SelectedValue = ((Label)gvrow.FindControl("lblStateCode")).Text;
            GetPresentDistrict();
            if (((Label)gvrow.FindControl("lblDistCode")).Text != "0")
                ddlPresentDistrict.SelectedValue = ((Label)gvrow.FindControl("lblDistCode")).Text;
            txtPrAddress.Text = ((Label)gvrow.FindControl("lblAddress")).Text;
            txtPinCode.Text = ((Label)gvrow.FindControl("lblPinCode")).Text;
            GetPerDistrict();
            if (((Label)gvrow.FindControl("lblPerStateCode")).Text != "0")
                ddlPerState.SelectedValue = ((Label)gvrow.FindControl("lblPerStateCode")).Text;
            if (((Label)gvrow.FindControl("lblPerDistCode")).Text != "0")
                ddlPerDistrict.SelectedValue = ((Label)gvrow.FindControl("lblPerDistCode")).Text;
            txtPermAddress.Text = ((Label)gvrow.FindControl("lblPerAddress")).Text;
            txtPerPinCode.Text = ((Label)gvrow.FindControl("lblPerPinCode")).Text;

            txtempemail.Text = ((Label)gvrow.FindControl("lblEmail")).Text;
            txtPhNo.Text = ((Label)gvrow.FindControl("lblphone")).Text;
            txtMobile.Text = ((Label)gvrow.FindControl("lblMobile")).Text;

            txtAdharNum.Text = ((Label)gvrow.FindControl("lblAadhar")).Text;
            txtPanNum.Text = ((Label)gvrow.FindControl("lblPanNo")).Text;

            if (((System.Web.UI.WebControls.Image)(gvrow.FindControl("lblPhcontent"))).ImageUrl != "")
            {
                Img1.Visible = true;
                Img1.ImageUrl = ((System.Web.UI.WebControls.Image)(gvrow.FindControl("lblPhcontent"))).ImageUrl;
                string x = Img1.ImageUrl.Remove(0, 22);
                byte[] imageBytes = Convert.FromBase64String(x);
                ViewState["PhotoContent"] = imageBytes;//((Label)(gRow.FindControl("img_photo"))).Text;
                ViewState["PhotoName"] = ((Label)(gvrow.FindControl("lblPhfileNm"))).Text;
                ViewState["PhotoType"] = ((Label)(gvrow.FindControl("lblPhfileType"))).Text;
            }
            else
            {
                ViewState["PhotoContent"] = null;
                ViewState["PhotoName"] = null;
            }
            if (((System.Web.UI.WebControls.Image)(gvrow.FindControl("lblSigcontent"))).ImageUrl != "")
            {
                Img2.Visible = true;
                Img2.ImageUrl = ((System.Web.UI.WebControls.Image)(gvrow.FindControl("lblSigcontent"))).ImageUrl;
                string x = Img2.ImageUrl.Remove(0, 22);
                byte[] imageBytes = Convert.FromBase64String(x);
                ViewState["PhotoContent1"] = imageBytes;//((Label)(gRow.FindControl("img_photo"))).Text;
                ViewState["PhotoName1"] = ((Label)(gvrow.FindControl("lblSigfileNme"))).Text;
                ViewState["PhotoType1"] = ((Label)(gvrow.FindControl("lblSigfileTypee"))).Text;
            }
            else
            {
                ViewState["PhotoContent1"] = null;
                ViewState["PhotoName1"] = null;
            }

            BtnSave.Visible = false;
            BtnUpdate.Visible = true;
            txtEmpCode.Enabled = false;


        }
        if (e.CommandName == "frz")
        {
            GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            objBE = new Master_BE();
            objBE.EmpId = ((Label)gvrow.FindControl("lblEmployee_ID")).Text; 
            objBE.Action = "F";
            //objBE.Active = "Ye";
            objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
            dt = ObjDL.EmployeeIUDR(objBE, con);
            if (dt.Rows.Count > 0)
            {
                objcomm.ShowAlertMessage("Unable to Freeze");
            }
            else
            {
                BtnSave.Visible = true;
                BtnUpdate.Visible = false;
                objcomm.ShowAlertMessage("Freezed Successfully");
            }
            BindGrid();
                
            
        }
        if (e.CommandName == "Dlt")
        {
            GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            objBE = new Master_BE();
            objBE.EmpId = ((Label)gvrow.FindControl("lblEmployee_ID")).Text;
            objBE.Action = "D";
            //objBE.Active = "Ye";
            objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
            dt = ObjDL.EmployeeIUDR(objBE, con);
            if (dt.Rows.Count > 0)
            {
                objcomm.ShowAlertMessage("Unable to Delete");
            }
            else
            {
                BtnSave.Visible = true;
                BtnUpdate.Visible = false;
                objcomm.ShowAlertMessage("Deleted Successfully");
            }
            BindGrid();


        }
        // if (e.CommandName == "frz")
        //{
        //    GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
        //    BindState();
        //    ddlstate.SelectedValue = ((Label)gvrow.FindControl("lblstatecode")).Text;
        //    lblDistcode.Text = ((Label)gvrow.FindControl("lbldistcode")).Text;
        //    txtdistcodelg.Text = ((Label)gvrow.FindControl("lbldistcodelg")).Text;
        //    txtdistname.Text = ((Label)gvrow.FindControl("lbldistname")).Text;

        //    ddlstate.Enabled = false;
        //    lblDistcode.Enabled = false;
        //    btn_Save.Visible = false;
        //    btn_Update.Visible = true;
        //}
        //if (e.CommandName == "Dlt")
        //{
        //    try
        //    {
        //        GridViewRow gvrow = (GridViewRow)((Control)e.CommandSource).NamingContainer;
        //        ddlstate.SelectedValue = ((Label)gvrow.FindControl("lblstatecode")).Text;
        //        lblDistcode.Text = ((Label)gvrow.FindControl("lbldistcode")).Text;
        //        dt = new DataTable();
        //        objBE.statecode = ddlstate.SelectedValue;
        //        objBE.DistCode = lblDistcode.Text;
        //        objBE.Action = "D";
        //        dt = ObjDL.DistrictMaster_IUDR(objBE, con);

        //        if (dt.Rows.Count > 0)
        //        {
        //            cf.ShowAlertMessage(" Deleted Failed");
        //            BindGrid();
        //            btn_Save.Visible = true;
        //            btn_Update.Visible = false;
        //        }
        //        else
        //        {
        //            cf.ShowAlertMessage(" Deleted");
        //            BindGrid();
        //            Clear();
        //            btn_Save.Visible = true;
        //            btn_Update.Visible = false;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
        //        Response.Redirect("~/Error.aspx");
        //    }
    }




    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            check();
            if (validate())
            {
                string fileNm = "", fileSize = "", fileType = "";
                byte[] content = null;
                if (fluPhoto.HasFile)
                {
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
                    }

                    objBE.fileNm = fileNm;
                    objBE.fileSize = fileSize;
                    objBE.fileType = fileType;
                    objBE.content = bytes;
                }
                else if (ViewState["PhotoContent"] != null)
                {
                    objBE.fileNm = ViewState["PhotoName"].ToString();
                    objBE.fileSize = ((byte[])ViewState["PhotoContent"]).Length.ToString();
                    objBE.fileType = objBE.fileType = ViewState["PhotoType"].ToString();
                    objBE.content = (byte[])ViewState["PhotoContent"];
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
                    }

                    objBE.SignfileNme = SignfileNme;
                    objBE.SignfileSizee = SignfileSizee;
                    objBE.SignfileTypee = SignfileTypee;
                    objBE.Signcontentt = bytes;
                }
                else if (ViewState["PhotoContent1"] != null)
                {
                    objBE.SignfileNme = ViewState["PhotoName1"].ToString();
                    objBE.SignfileSizee = ((byte[])ViewState["PhotoContent1"]).Length.ToString();
                    objBE.SignfileTypee = ViewState["PhotoType1"].ToString();
                    objBE.Signcontentt = (byte[])ViewState["PhotoContent1"];
                }
                objBE.EmpId = ViewState["EmpId"].ToString();
                objBE.Empcode = txtEmpCode.Text.Trim();
                objBE.EmpName = txtEmpName.Text.Trim();
                objBE.SurName = txtSurName.Text.Trim();
                objBE.EmpHusFatName = txtHusFatName.Text.Trim();
                objBE.MotherName = txtMotherName.Text.Trim();
                objBE.Nationality = ddlNational.SelectedValue.Trim();
                objBE.Gender = ddlGender.SelectedValue.Trim();
                objBE.DOB = objcomm.Texttodateconverter(txtDOB.Text);
                objBE.Community = ddlCategory.SelectedValue.Trim();
                objBE.Religion = ddlReligion.SelectedValue.Trim();
                objBE.MotherTng = txtMotherTng.Text.Trim();
                objBE.MrgStatus = rdbMrgSta.SelectedValue.Trim();
                objBE.DifferentAbled = rdbDiffAbled.SelectedValue.Trim();
                objBE.IdentMarkOne = txtIdentMarkOne.Text.Trim();
                objBE.IdentMarkTwo = txtIdentMarkTwo.Text.Trim();
                objBE.HomeSate = ddlHomeSate.SelectedValue.Trim();
                objBE.HomeDistrict = ddlHomeDistrict.SelectedValue.Trim();
                objBE.LicHomeTown = txtLicHomeTwn.Text.Trim();
                objBE.NearRailStation = txtNrRailStn.Text.Trim();
                objBE.statecode = ddlState.SelectedValue.Trim();
                objBE.DistCode = ddlPresentDistrict.SelectedValue.Trim();
                objBE.PinCode = txtPinCode.Text.Trim();
                objBE.PerStateCode = ddlPerState.SelectedValue.Trim();
                objBE.PerDistrict = ddlPerDistrict.SelectedValue.Trim();
                objBE.PerPinCode = txtPerPinCode.Text.Trim();
                objBE.Email = txtempemail.Text;
                objBE.phone = txtPhNo.Text;
                objBE.Mobile = txtMobile.Text.Trim();
                objBE.Aadhar = txtAdharNum.Text.Trim();
                objBE.PanNo = txtPanNum.Text.Trim();
                objBE.UserID = user;
                objBE.Action = "UE";
                //objBE.Active = "Ye";
                objBE.IP = Request.ServerVariables["REMOTE_ADDR"].ToString();
                dt = ObjDL.EmployeeIUDR(objBE, con);
                if (dt.Rows.Count > 0)
                {
                    objcomm.ShowAlertMessage("Unable to Save");
                }
                else
                {
                    BtnSave.Visible = true;
                    BtnUpdate.Visible = false;
                    objcomm.ShowAlertMessage("Updated Successfully");
                }
                BindGrid();
                Clear();
            }
        }
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, Session["UsrName"].ToString(), Request.ServerVariables["REMOTE_ADDR"].ToString());
            //Response.Redirect("../Error.aspx");
        }
    }
}