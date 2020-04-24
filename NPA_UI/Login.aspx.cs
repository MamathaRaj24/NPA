using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PA_BE;
using PA_DL;
using System.Data;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    Master_BE objBE = new Master_BE();
    Login_DL objLogin = new Login_DL();
    CommonFuncs objCommon = new CommonFuncs();
    DataTable dt;
    string ConnKey = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {

        txtUname.Attributes.Add("autocomplete", "off");
        txtPwd.Attributes.Add("autocomplete", "off");
        if (!IsPostBack)
        {
            random();
            ViewState["KeyGenerator"] = Guid.NewGuid().ToString("N").Substring(0, 16);
            txtUname.Focus();
            getCaptchaImage();
        }
    }
    public void getCaptchaImage()
    {
        Captcha ci = new Captcha();
        string text = Captcha.generateRandomCode();
        ViewState["captchtext"] = text;
        Image2.ImageUrl = "Assests/cpImg/cpImage.aspx?randomNo=" + text;
    }

    protected bool CheckCaptcha()
    {
        //if (captch.Text == "")
        //{
        //    lblmsg.Text = "Enter Captcha Text";
        //    return false;
        //}
        //else if (captch.Text != ViewState["captchtext"].ToString())
        //{
        //    lblmsg.Text = "Enter Captcha Text as shown in the image";
        //    captch.Text = "";
        //    return false;
        //}
        //else if (captch.Text == ViewState["captchtext"].ToString())
        //    return true;
        //else
        //{
        //    lblmsg.Text = "image code is not valid.";
        //    captch.Text = "";
        //    return false;
        //}
        return true;
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        check();
        try
        {
            if (CheckCaptcha())
            {
                objBE.Action = "R";
                objBE.User = txtUname.Text;
                DataTable dtLogin = objLogin.getLoginDetails(objBE, ConnKey);
                if (dtLogin.Rows.Count > 0)
                {
                    string password = dtLogin.Rows[0]["Password"].ToString();
                    string roleNm = dtLogin.Rows[0]["RoleName"].ToString();
                    string role = dtLogin.Rows[0]["role"].ToString();
                    string UserID = dtLogin.Rows[0]["Sno"].ToString();
                    string EmpCode = dtLogin.Rows[0]["EmpCode"].ToString();
                    string Designation = dtLogin.Rows[0]["Designation"].ToString();
                    string Empid = dtLogin.Rows[0]["Empid"].ToString();
                    string SectionID = dtLogin.Rows[0]["SectionID"].ToString();
                    string EmployeeName = dtLogin.Rows[0]["EmpName"].ToString();
                    string MobileNumber = dtLogin.Rows[0]["Mobile"].ToString();
                    string email = dtLogin.Rows[0]["email"].ToString();
                    string DesigId = dtLogin.Rows[0]["DesignationID"].ToString();
                    string SectionName = dtLogin.Rows[0]["SectionName"].ToString();
                    string Type = dtLogin.Rows[0]["Type"].ToString();
                    Session["Gender"] = dtLogin.Rows[0]["Gender"].ToString();
                    Session["UserId"] = dtLogin.Rows[0]["Sno"].ToString();
                    Session["EmpId"] = Empid;
                    string myval = ShaEncrypt(ViewState["KeyGenerator"].ToString());
                    string value = ShaEncrypt(password.ToLower() + myval.ToLower());

                    if (txtPwdHash.Value == value.ToLower())
                    {
                        string guid = Guid.NewGuid().ToString();
                        Session["AuthToken"] = guid;
                        Response.ClearContent();
                        Response.Cookies.Add(new HttpCookie("AuthToken", guid));
                        Session["ConnKey"] = ConnKey;
                        Session["Role"] = roleNm;
                        Session["RoleID"] = role;
                        Session["UsrName"] = txtUname.Text;
                        Session["UserId"] = UserID;

                        Session["EmployeeName"] = EmployeeName;
                        Session["EmpCode"] = EmpCode;
                        Session["SectionName"] = SectionName;
                        Session["Designation"] = Designation;
                        Session["MobileNumber"] = MobileNumber;
                        Session["email"] = email;
                        Session["Empid"] = Empid;
                        Session["ReportingOfficer"] = dtLogin.Rows[0]["ReportingOfficer"].ToString();
                        Session["ForwordingOfficer"] = dtLogin.Rows[0]["Forwording_Officer"].ToString();
                        Session["SanctionOfficer"] = dtLogin.Rows[0]["Sanction_Authority"].ToString();
                        Session["RecommendedOfficer"] = dtLogin.Rows[0]["Recommended_Officer"].ToString();
                        Session["LinkOfficer"] = dtLogin.Rows[0]["Link_Officer"].ToString();

                        captch.Text = "";

                        Session["LoginSno"] = objLogin.insertUserLoginStatus(txtUname.Text, DateTime.Now, Request.ServerVariables["REMOTE_ADDR"].ToString(), "Login Successful", ConnKey);

                        //if (password.ToUpper() == "6B4C8CBCB6B66F050C12D6A0203C58A8BC6D36E5A8C28B74111681F7AECE378A")
                        //{
                        //    Session["Role"] = roleNm;
                        //    Session["UsrName"] = txtUname.Text;
                        //    Session["StateCode"] = StateCode;
                        //    Session["distCode"] = DistCode;
                        //    Session["mandcode"] = MandCode;
                        //    Session["district"] = district;
                        //    Session["mandal"] = mandal;
                        //    Response.Redirect("ChangePWD.aspx", false);
                        //}

                        //else 
                        if (dtLogin.Rows[0]["Role"].ToString() == "1")
                        {
                            Response.Redirect("~/Admin/Designation.aspx", false);
                        }
                        if (dtLogin.Rows[0]["Role"].ToString() == "5")
                        {
                            Response.Redirect("~/SectionHead/Add_ApplicationSection.aspx", false);
                        }
                        if (dtLogin.Rows[0]["Role"].ToString() == "7")
                        {
                            Response.Redirect("~/Employee/EmployeeProfile.aspx", false);
                        }
                        if (dtLogin.Rows[0]["Role"].ToString() == "10")
                        {
                            Response.Redirect("~/AdminSection/ViewLeaveDtls.aspx", false);
                        }
                        if (dtLogin.Rows[0]["Role"].ToString() == "11")
                        {
                            Response.Redirect("~/MeetingAdmin/AddMeeting.aspx", false);
                        }
                    }
                    else
                    {
                        captch.Text = "";
                        ViewState["KeyGenerator"] = Guid.NewGuid().ToString("N").Substring(0, 16);
                        objCommon.ShowAlertMessage("Please Enter Valid user name");
                    }

                }
                else
                {
                    captch.Text = "";
                    ViewState["KeyGenerator"] = Guid.NewGuid().ToString("N").Substring(0, 16);
                    lblmsg.Text = "The characters you entered didn't match.Please try again";
                }


                }
            }
          
        catch (Exception ex)
        {
            ExceptionLogging.SendExcepToDB(ex, "", Request.ServerVariables["REMOTE_ADDR"].ToString());
            Response.Redirect("~/Error.aspx");
        }
    }

    public string ShaEncrypt(string Ptext)
    {
        string hash = "";
        System.Security.Cryptography.SHA256CryptoServiceProvider m1 = new System.Security.Cryptography.SHA256CryptoServiceProvider();
        byte[] s1 = System.Text.Encoding.ASCII.GetBytes(Ptext);
        s1 = m1.ComputeHash(s1);
        foreach (byte bt in s1)
        {
            hash = hash + bt.ToString("x2");
        }
        return hash;
    }
    protected void btnImgRefresh_Click(object sender, ImageClickEventArgs e)
    {
        captch.Text = "";
        getCaptchaImage();
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
            hf.Value = num;
            Session["ASPFIXATION2"] = num;
        }
        catch (Exception ex)
        {
            Response.Redirect("~/Error.aspx", false);
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
                HttpContext.Current.Response.Redirect("~/Error.aspx", false);
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("~/Error.aspx");
        }
    }
}