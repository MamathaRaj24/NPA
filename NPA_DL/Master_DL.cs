using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using PA_BE;

namespace NPA_DL
{
    public class Master_DL
    {
        //State Master
        public DataTable StateIUDR(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("[State_IUDR]", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@StateCode", SqlDbType.VarChar).Value = obj.statecode;
                    da.SelectCommand.Parameters.Add("@stateName", SqlDbType.VarChar).Value = obj.stateName;
                    da.SelectCommand.Parameters.Add("@user", SqlDbType.VarChar).Value = obj.UserID;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }


        //District Master
        public DataTable DistrictMaster_IUDR(Master_BE objBE, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("District_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@statecode", SqlDbType.VarChar).Value = objBE.statecode;
                    da.SelectCommand.Parameters.Add("@distcode", SqlDbType.VarChar).Value = objBE.DistCode;
                    da.SelectCommand.Parameters.Add("@distcode_LG", SqlDbType.VarChar).Value = objBE.Distcode_LG;
                    da.SelectCommand.Parameters.Add("@DistName", SqlDbType.VarChar).Value = objBE.DistName;
                    da.SelectCommand.Parameters.Add("@user", SqlDbType.VarChar).Value = objBE.UserID;
                    da.SelectCommand.Parameters.Add("@action", SqlDbType.VarChar).Value = objBE.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }
        public DataTable PrintApplicationForm(Master_BE obj, string con)
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("Print_ApplicationForm", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@ApplicationID", SqlDbType.VarChar).Value = obj.ApplicationId;
                    da.SelectCommand.Parameters.Add("@SectionID", SqlDbType.VarChar).Value = obj.SectionID;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }

        //Designation Master
        public DataTable DesignationIUDR(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("Designation_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@DesignationID", SqlDbType.VarChar).Value = obj.DesignationID;
                    da.SelectCommand.Parameters.Add("@Desig", SqlDbType.VarChar).Value = obj.DesignationName;
                    da.SelectCommand.Parameters.Add("@cadre", SqlDbType.VarChar).Value = obj.cadre;
                    da.SelectCommand.Parameters.Add("@User", SqlDbType.VarChar).Value = obj.UserID;
                    da.SelectCommand.Parameters.Add("@AddedIP", SqlDbType.VarChar).Value = obj.IP;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }
        //section
        public DataTable SectionIUDR(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("Section_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@SectionID", SqlDbType.VarChar).Value = obj.SectionID;
                    da.SelectCommand.Parameters.Add("@Section", SqlDbType.VarChar).Value = obj.SectionName;
                    da.SelectCommand.Parameters.Add("@User", SqlDbType.VarChar).Value = obj.UserID;
                    da.SelectCommand.Parameters.Add("@IP", SqlDbType.VarChar).Value = obj.IP;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }
        public DataTable FamilyDdetails(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("FamilyMaster_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@MemberName", SqlDbType.VarChar).Value = obj.MemberName;
                    da.SelectCommand.Parameters.Add("@Relation", SqlDbType.VarChar).Value = obj.Relation;
                    da.SelectCommand.Parameters.Add("@Dependent", SqlDbType.VarChar).Value = obj.Dependent;
                    da.SelectCommand.Parameters.Add("@DOB", SqlDbType.Date).Value = obj.DOB;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    da.SelectCommand.Parameters.Add("@DepCode", SqlDbType.VarChar).Value = obj.DesignationID;
                    da.SelectCommand.Parameters.Add("@IpAddress", SqlDbType.VarChar).Value = obj.IP;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }



        public DataTable CurrentPosting(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("CurrentPosting_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@Id", SqlDbType.VarChar).Value = obj.Id;
                    da.SelectCommand.Parameters.Add("@Emp_Code", SqlDbType.VarChar).Value = obj.Empcode;
                    da.SelectCommand.Parameters.Add("@StateCode", SqlDbType.VarChar).Value = obj.statecode;
                    da.SelectCommand.Parameters.Add("@DistCode", SqlDbType.VarChar).Value = obj.DistCode;
                    da.SelectCommand.Parameters.Add("@OfficeName", SqlDbType.VarChar).Value = obj.OfficeName;
                    da.SelectCommand.Parameters.Add("@DesignationID", SqlDbType.VarChar).Value = obj.DesignationID;
                    da.SelectCommand.Parameters.Add("@FromDate", SqlDbType.Date).Value = obj.OfficeFrom;
                    da.SelectCommand.Parameters.Add("@ToDate", SqlDbType.VarChar).Value = obj.OfficeTo;
                    da.SelectCommand.Parameters.Add("@SectionID", SqlDbType.VarChar).Value = obj.SectionID;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    da.SelectCommand.Parameters.Add("@IpAddress", SqlDbType.VarChar).Value = obj.IP;
                    da.SelectCommand.Parameters.Add("@user", SqlDbType.VarChar).Value = obj.UserID;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }

        public DataTable IntialPosting(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("IntialjoiningMaster_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@EmpId", SqlDbType.VarChar).Value = obj.EmpId;
                    da.SelectCommand.Parameters.Add("@State", SqlDbType.VarChar).Value = obj.statecode;
                    da.SelectCommand.Parameters.Add("@Office", SqlDbType.VarChar).Value = obj.OfficeName;
                    da.SelectCommand.Parameters.Add("@Designation", SqlDbType.VarChar).Value = obj.DesignationName;
                    da.SelectCommand.Parameters.Add("@DOJ", SqlDbType.Date).Value = obj.DOJ;
                    da.SelectCommand.Parameters.Add("@OrdNum", SqlDbType.VarChar).Value = obj.ConfOrdNum;
                    da.SelectCommand.Parameters.Add("@OrderDate", SqlDbType.Date).Value = obj.DOR;
                    da.SelectCommand.Parameters.Add("@Emp_Code", SqlDbType.VarChar).Value = obj.Empcode;
                    da.SelectCommand.Parameters.Add("@StateCode", SqlDbType.VarChar).Value = obj.statecode;
                    da.SelectCommand.Parameters.Add("@Dep_Code", SqlDbType.VarChar).Value = obj.Department;
                    da.SelectCommand.Parameters.Add("@Office_Code", SqlDbType.VarChar).Value = obj.OfficeName;
                    da.SelectCommand.Parameters.Add("@Designation_Code", SqlDbType.VarChar).Value = obj.DesignationName;
                    da.SelectCommand.Parameters.Add("@Dependent", SqlDbType.VarChar).Value = obj.Dependent;
                    da.SelectCommand.Parameters.Add("@ConfOrdNum", SqlDbType.VarChar).Value = obj.ConfOrdNum;
                    da.SelectCommand.Parameters.Add("@ApointgAuthority", SqlDbType.VarChar).Value = obj.ApointgAuthority;
                    da.SelectCommand.Parameters.Add("@ModeOfRec", SqlDbType.VarChar).Value = obj.ModeOfRec;
                    da.SelectCommand.Parameters.Add("@OfficerType", SqlDbType.VarChar).Value = obj.offType;
                    da.SelectCommand.Parameters.Add("@PayCommision_Code", SqlDbType.VarChar).Value = obj.PayCommsion;
                    da.SelectCommand.Parameters.Add("@PayScale", SqlDbType.VarChar).Value = obj.PayScale;
                    da.SelectCommand.Parameters.Add("@BasicPay", SqlDbType.VarChar).Value = obj.BasicPay;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    da.SelectCommand.Parameters.Add("@User", SqlDbType.VarChar).Value = obj.UserID;
                    da.SelectCommand.Parameters.Add("@IpAddress", SqlDbType.VarChar).Value = obj.IP;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }

        public DataTable EducationQualification(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("EducationMaster_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@Qualification_Code", SqlDbType.VarChar).Value = obj.Qualificationcode;
                    // da.SelectCommand.Parameters.Add("@Qualification_Name", SqlDbType.VarChar).Value = obj.Qualification;
                    da.SelectCommand.Parameters.Add("@Discipline_Code", SqlDbType.VarChar).Value = obj.Discipline_Code;

                    da.SelectCommand.Parameters.Add("@University", SqlDbType.VarChar).Value = obj.BoardUniver;
                    da.SelectCommand.Parameters.Add("@yearOfPass", SqlDbType.Date).Value = obj.YrPass;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    da.SelectCommand.Parameters.Add("@DepCode", SqlDbType.VarChar).Value = obj.DesignationID;
                    da.SelectCommand.Parameters.Add("@user", SqlDbType.VarChar).Value = obj.UserID;
                    da.SelectCommand.Parameters.Add("@IpAddress", SqlDbType.VarChar).Value = obj.IP;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }

        //public DataTable Qualification_Master(Master_BE objBE, string ConnKey)
        //{
        //    using (SqlConnection con = new SqlConnection(ConnKey))
        //    {
        //        using (SqlDataAdapter da = new SqlDataAdapter("QualificationMaster_IUDR", con))
        //        {
        //            da.SelectCommand.CommandType = CommandType.StoredProcedure;
        //            da.SelectCommand.Parameters.Add("@Qualification_Code", SqlDbType.VarChar).Value = objBE.Qualificationcode;
        //            da.SelectCommand.Parameters.Add("@Qualification_Name", SqlDbType.VarChar).Value = objBE.Qualification;
        //            da.SelectCommand.Parameters.Add("@LoggedIn_Dt", SqlDbType.Date).Value = objBE.User;
        //            //da.SelectCommand.Parameters.Add("@VillName", SqlDbType.VarChar).Value = objBE.VillName;
        //            da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = objBE.Action;
        //            DataTable dt = new DataTable();
        //            da.Fill(dt);
        //            return dt;
        //        }
        //    }
        //}

        public DataTable Discipline_Master(Master_BE objBE, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("DisciplineMaster_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@Discipline_Code", SqlDbType.VarChar).Value = objBE.Discipline_Code;
                    da.SelectCommand.Parameters.Add("@Discipline_Name", SqlDbType.VarChar).Value = objBE.Discipline;
                    da.SelectCommand.Parameters.Add("@LoggedIn_Dt", SqlDbType.Date).Value = objBE.User;
                    //da.SelectCommand.Parameters.Add("@VillName", SqlDbType.VarChar).Value = objBE.VillName;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = objBE.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }

        public DataTable AnnualConfidental(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("FamilyMasterDtls", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@MemberName", SqlDbType.Date).Value = obj.YrPass;
                    da.SelectCommand.Parameters.Add("@PhfileNm", SqlDbType.VarChar).Value = obj.fileNm;
                    da.SelectCommand.Parameters.Add("@PhfileSize", SqlDbType.VarChar).Value = obj.fileSize;
                    da.SelectCommand.Parameters.Add("@PhfileType", SqlDbType.VarChar).Value = obj.fileType;
                    da.SelectCommand.Parameters.AddWithValue("@Phcontent", obj.content);
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    da.SelectCommand.Parameters.Add("@DepCode", SqlDbType.VarChar).Value = obj.DesignationID;
                    da.SelectCommand.Parameters.Add("@IpAddress", SqlDbType.VarChar).Value = obj.IP;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }
        //  Employee Registration
        public DataTable EmployeeIUDR(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("Employee_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@EmpCode", SqlDbType.VarChar).Value = obj.Empcode;
                    da.SelectCommand.Parameters.Add("@EmpName", SqlDbType.VarChar).Value = obj.EmpName;
                    da.SelectCommand.Parameters.Add("@SurName", SqlDbType.VarChar).Value = obj.SurName;
                    da.SelectCommand.Parameters.Add("@FName", SqlDbType.VarChar).Value = obj.EmpHusFatName;
                    da.SelectCommand.Parameters.Add("@Nationality", SqlDbType.VarChar).Value = obj.Nationality;
                    da.SelectCommand.Parameters.Add("@Gender", SqlDbType.VarChar).Value = obj.Gender;
                    da.SelectCommand.Parameters.Add("@MotherName", SqlDbType.VarChar).Value = obj.MotherName;
                    da.SelectCommand.Parameters.Add("@Qualification", SqlDbType.VarChar).Value = obj.Qualification;
                    da.SelectCommand.Parameters.Add("@DOB", SqlDbType.Date).Value = obj.DOB;
                    da.SelectCommand.Parameters.Add("@Community", SqlDbType.VarChar).Value = obj.Community;
                    da.SelectCommand.Parameters.Add("@Religion", SqlDbType.VarChar).Value = obj.Religion;
                    da.SelectCommand.Parameters.Add("@MotherTng", SqlDbType.VarChar).Value = obj.MotherTng;
                    da.SelectCommand.Parameters.Add("@MrgStatus", SqlDbType.VarChar).Value = obj.MrgStatus;
                    da.SelectCommand.Parameters.Add("@DifferentlyAble", SqlDbType.VarChar).Value = obj.DifferentAbled;
                    da.SelectCommand.Parameters.Add("@Disability_Percent", SqlDbType.VarChar).Value = obj.Percentage;
                    da.SelectCommand.Parameters.Add("@IdentMarkOne", SqlDbType.VarChar).Value = obj.IdentMarkOne;
                    da.SelectCommand.Parameters.Add("@IdentMarkTwo", SqlDbType.VarChar).Value = obj.IdentMarkTwo;
                    da.SelectCommand.Parameters.Add("@HStateCode", SqlDbType.VarChar).Value = obj.HomeSate;
                    da.SelectCommand.Parameters.Add("@HDistCode", SqlDbType.VarChar).Value = obj.HomeDistrict;
                    da.SelectCommand.Parameters.Add("@LtcHometown", SqlDbType.VarChar).Value = obj.LicHomeTown;
                    da.SelectCommand.Parameters.Add("@Aadhar", SqlDbType.VarChar).Value = obj.Aadhar;
                    da.SelectCommand.Parameters.Add("@Pan", SqlDbType.VarChar).Value = obj.PanNo;
                    da.SelectCommand.Parameters.Add("@Mobile", SqlDbType.VarChar).Value = obj.Mobile;
                    da.SelectCommand.Parameters.Add("@MailId", SqlDbType.VarChar).Value = obj.Email;
                    da.SelectCommand.Parameters.Add("@Address", SqlDbType.VarChar).Value = obj.Address;
                    da.SelectCommand.Parameters.Add("@StateCode", SqlDbType.VarChar).Value = obj.statecode;
                    da.SelectCommand.Parameters.Add("@DistCode", SqlDbType.VarChar).Value = obj.DistCode;
                    da.SelectCommand.Parameters.Add("@PinCode", SqlDbType.VarChar).Value = obj.PinCode;
                    da.SelectCommand.Parameters.Add("@PAddress", SqlDbType.VarChar).Value = obj.PresentAddress;
                    da.SelectCommand.Parameters.Add("@PStateCode", SqlDbType.VarChar).Value = obj.PerStateCode;
                    da.SelectCommand.Parameters.Add("@PDistCode", SqlDbType.VarChar).Value = obj.PerDistrict;
                    da.SelectCommand.Parameters.Add("@PPinCode", SqlDbType.VarChar).Value = obj.PerPinCode;
                    da.SelectCommand.Parameters.Add("@Phone", SqlDbType.VarChar).Value = obj.phone;
                    da.SelectCommand.Parameters.Add("@PhfileNm", SqlDbType.VarChar).Value = obj.fileNm;
                    da.SelectCommand.Parameters.Add("@PhfileSize", SqlDbType.VarChar).Value = obj.fileSize;
                    da.SelectCommand.Parameters.Add("@PhfileType", SqlDbType.VarChar).Value = obj.fileType;
                    da.SelectCommand.Parameters.AddWithValue("@Phcontent", obj.content);
                    da.SelectCommand.Parameters.Add("@SigfileNme", SqlDbType.VarChar).Value = obj.SignfileNme;
                    da.SelectCommand.Parameters.Add("@SigfileSizee", SqlDbType.VarChar).Value = obj.SignfileSizee;
                    da.SelectCommand.Parameters.Add("@SigfileTypee", SqlDbType.VarChar).Value = obj.SignfileTypee;
                    da.SelectCommand.Parameters.AddWithValue("@Sigcontentt", obj.Signcontentt);
                    da.SelectCommand.Parameters.Add("@IpAddress", SqlDbType.VarChar).Value = obj.IP;
                    da.SelectCommand.Parameters.Add("@NearRailStation", SqlDbType.VarChar).Value = obj.NearRailStation;
                    da.SelectCommand.Parameters.Add("@User", SqlDbType.VarChar).Value = obj.UserID;
                    da.SelectCommand.Parameters.Add("@Active", SqlDbType.Bit).Value = obj.Active;
                    da.SelectCommand.Parameters.Add("@F", SqlDbType.Structured).Value = obj.Ftvp;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    da.SelectCommand.Parameters.Add("@Empid", SqlDbType.VarChar).Value = obj.EmpId;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }

        //Qualification Details
        public DataTable QualificationDetails(Master_BE objBE, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("EmpEdu_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@Empid", SqlDbType.VarChar).Value = objBE.EmpId;
                    da.SelectCommand.Parameters.Add("@Exam", SqlDbType.VarChar).Value = objBE.Exam;
                    da.SelectCommand.Parameters.Add("@Board", SqlDbType.VarChar).Value = objBE.BoardUniver;
                    da.SelectCommand.Parameters.Add("@Yearp", SqlDbType.VarChar).Value = objBE.YrPass;
                    da.SelectCommand.Parameters.Add("@Marks", SqlDbType.VarChar).Value = objBE.Marks;
                    da.SelectCommand.Parameters.Add("@user", SqlDbType.VarChar).Value = objBE.UserID;
                    da.SelectCommand.Parameters.Add("@E", SqlDbType.Structured).Value = objBE.Etvp;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = objBE.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }


        //GET LOCATIONS
        public DataTable GetLocations(Master_BE objBE, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("GetLocations", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@state", SqlDbType.VarChar).Value = objBE.statecode;
                    da.SelectCommand.Parameters.Add("@dist", SqlDbType.VarChar).Value = objBE.DistCode;
                    da.SelectCommand.Parameters.Add("@mand", SqlDbType.VarChar).Value = objBE.MandalCode;
                    da.SelectCommand.Parameters.Add("@divcode", SqlDbType.VarChar).Value = objBE.DivisionCode;
                    da.SelectCommand.Parameters.Add("@divname", SqlDbType.VarChar).Value = objBE.DivisionName;
                    da.SelectCommand.Parameters.Add("@action", SqlDbType.VarChar).Value = objBE.Action;

                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }
        //GET DETAIL
        public DataTable GetDetails(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("GetDetails", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@action", SqlDbType.VarChar).Value = obj.Action;
                    da.SelectCommand.Parameters.Add("@ID", SqlDbType.VarChar).Value = obj.Id;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }
        //Nomini Details
        public DataTable NomineeDetails(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("NomineeMaster_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@Empcode", SqlDbType.VarChar).Value = obj.Empcode;
                    da.SelectCommand.Parameters.Add("@Contribution_Code", SqlDbType.VarChar).Value = obj.TypeofContr;
                    da.SelectCommand.Parameters.Add("@NomineeNm", SqlDbType.VarChar).Value = obj.NomineeNm;
                    da.SelectCommand.Parameters.Add("@Relation", SqlDbType.VarChar).Value = obj.Relation;
                    da.SelectCommand.Parameters.Add("@DOJ", SqlDbType.Date).Value = obj.DOJ;
                    da.SelectCommand.Parameters.Add("@Percentage", SqlDbType.VarChar).Value = obj.Percentage;
                    da.SelectCommand.Parameters.Add("@NomAddress", SqlDbType.VarChar).Value = obj.NomAddress;
                    da.SelectCommand.Parameters.Add("@GurdainNm", SqlDbType.VarChar).Value = obj.GurdainNm;
                    da.SelectCommand.Parameters.Add("@Address", SqlDbType.VarChar).Value = obj.Address;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    da.SelectCommand.Parameters.Add("@DepCode", SqlDbType.VarChar).Value = obj.DesignationID;
                    da.SelectCommand.Parameters.Add("@IpAddress", SqlDbType.VarChar).Value = obj.IP;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }
        //Transfer Details
        public DataTable TransferDetails(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("TransferMasterDetails_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@DesignationFrom", SqlDbType.VarChar).Value = obj.DesignationFrom;
                    da.SelectCommand.Parameters.Add("@OfficeFrom", SqlDbType.VarChar).Value = obj.OfficeFrom;
                    da.SelectCommand.Parameters.Add("@DesignationTo", SqlDbType.VarChar).Value = obj.DesignationTo;
                    da.SelectCommand.Parameters.Add("@OfficeTo", SqlDbType.VarChar).Value = obj.OfficeTo;
                    da.SelectCommand.Parameters.Add("@DOJ", SqlDbType.Date).Value = obj.DOJ;
                    da.SelectCommand.Parameters.Add("@OrderDt", SqlDbType.Date).Value = obj.OrderDt;
                    da.SelectCommand.Parameters.Add("@OrderNum", SqlDbType.VarChar).Value = obj.OrderNum;
                    da.SelectCommand.Parameters.Add("@Transfer", SqlDbType.VarChar).Value = obj.Transfer;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    da.SelectCommand.Parameters.Add("@DepCode", SqlDbType.VarChar).Value = obj.DesignationID;
                    da.SelectCommand.Parameters.Add("@IpAddress", SqlDbType.VarChar).Value = obj.IP;
                    da.SelectCommand.Parameters.Add("@user", SqlDbType.VarChar).Value = obj.UserID;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }
        //Promotion Details
        public DataTable PromotionDetails(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("CurrentPostingDtlsMasterDtls", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@Dep_Code", SqlDbType.VarChar).Value = obj.DesignationFrom;
                    da.SelectCommand.Parameters.Add("@DistCode", SqlDbType.VarChar).Value = obj.DesignationTo;
                    da.SelectCommand.Parameters.Add("@OffLevel", SqlDbType.VarChar).Value = obj.ScaleFrom;
                    da.SelectCommand.Parameters.Add("@CurrentPostOff", SqlDbType.VarChar).Value = obj.ScaleTo;
                    da.SelectCommand.Parameters.Add("@DOJ", SqlDbType.Date).Value = obj.OrderDt;
                    da.SelectCommand.Parameters.Add("@CurrentClass", SqlDbType.VarChar).Value = obj.OrderNum;
                    da.SelectCommand.Parameters.Add("@EstOff", SqlDbType.VarChar).Value = obj.Transfer;
                    // da.SelectCommand.Parameters.Add("@ModeOfRec", SqlDbType.VarChar).Value = obj.GurdainNm;
                    da.SelectCommand.Parameters.Add("@CurrentEstaDep", SqlDbType.VarChar).Value = obj.Address;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    da.SelectCommand.Parameters.Add("@DepCode", SqlDbType.VarChar).Value = obj.DesignationID;
                    da.SelectCommand.Parameters.Add("@IpAddress", SqlDbType.VarChar).Value = obj.IP;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }





        //Holiday IUDR
        public DataTable HolidayIUDR(Master_BE objBE, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("Holidays_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@Hid", SqlDbType.VarChar).Value = objBE.Hid;
                    da.SelectCommand.Parameters.Add("@FromDate", SqlDbType.VarChar).Value = objBE.FmDt;
                    da.SelectCommand.Parameters.Add("@ToDate", SqlDbType.VarChar).Value = objBE.ToDt;
                    da.SelectCommand.Parameters.Add("@Hyear", SqlDbType.VarChar).Value = objBE.HYear;
                    da.SelectCommand.Parameters.Add("@Hmonth", SqlDbType.VarChar).Value = objBE.HMonth;
                    da.SelectCommand.Parameters.Add("@ip", SqlDbType.VarChar).Value = objBE.IP;
                    da.SelectCommand.Parameters.Add("@User", SqlDbType.VarChar).Value = objBE.User;
                    da.SelectCommand.Parameters.Add("@TvpHoliday", SqlDbType.Structured).Value = objBE.HTvp;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = objBE.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }

        //Leave balance
        public DataTable LeaveBalanceIUDR(Master_BE objBE, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("LeaveBalance_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@EmpID", SqlDbType.VarChar).Value = objBE.EmpId;
                    da.SelectCommand.Parameters.Add("@AsOnDate", SqlDbType.Date).Value = objBE.AsOnDate;
                    da.SelectCommand.Parameters.Add("@LeaveType", SqlDbType.VarChar).Value = objBE.TypeId;
                    da.SelectCommand.Parameters.Add("@IP", SqlDbType.VarChar).Value = objBE.IP;
                    da.SelectCommand.Parameters.Add("@user", SqlDbType.VarChar).Value = objBE.User;
                    da.SelectCommand.Parameters.Add("@Tvp", SqlDbType.Structured).Value = objBE.HTvp;
                    da.SelectCommand.Parameters.Add("@LeaveBalance", SqlDbType.VarChar).Value = objBE.LeaveBalance;
                    da.SelectCommand.Parameters.Add("@action", SqlDbType.VarChar).Value = objBE.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }
        //LeaveType
        public DataTable LeaveTypeIUDR(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("LeaveType_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@typeId", SqlDbType.VarChar).Value = obj.TypeId;
                    da.SelectCommand.Parameters.Add("@EmpId", SqlDbType.VarChar).Value = obj.EmpId;
                    da.SelectCommand.Parameters.Add("@TypeName", SqlDbType.VarChar).Value = obj.TypeName;
                    da.SelectCommand.Parameters.Add("@Appli", SqlDbType.VarChar).Value = obj.Applicable;
                    da.SelectCommand.Parameters.Add("@Nol", SqlDbType.VarChar).Value = obj.Noleaves;
                    da.SelectCommand.Parameters.Add("@User", SqlDbType.VarChar).Value = obj.UserID;
                    da.SelectCommand.Parameters.Add("@AppliesFor", SqlDbType.VarChar).Value = obj.AppliesFor;
                    da.SelectCommand.Parameters.Add("@Max", SqlDbType.VarChar).Value = obj.MaxTime;
                    da.SelectCommand.Parameters.Add("@link", SqlDbType.VarChar).Value = obj.Linked;
                    da.SelectCommand.Parameters.Add("@Noc", SqlDbType.VarChar).Value = obj.NoofChildren;
                    da.SelectCommand.Parameters.Add("@lvsEach", SqlDbType.VarChar).Value = obj.LeavesEach;
                    da.SelectCommand.Parameters.Add("@MinLvs", SqlDbType.VarChar).Value = obj.MinLvs;
                    da.SelectCommand.Parameters.Add("@YrEndStatus", SqlDbType.VarChar).Value = obj.YrEndStatus;
                    da.SelectCommand.Parameters.Add("@TVP_LB_TVP", SqlDbType.Structured).Value = obj.HTvp;
                    //  da.SelectCommand.Parameters.Add("@EmpId", SqlDbType.Int).Value = obj.EmpId;
                    da.SelectCommand.Parameters.Add("@RequiresJoining", SqlDbType.VarChar).Value = obj.ReqJoining;
                    da.SelectCommand.Parameters.Add("@Extended", SqlDbType.VarChar).Value = obj.Extended;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }



        public DataTable User_IUDR(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("User_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@Role", SqlDbType.VarChar).Value = obj.UserType;
                    da.SelectCommand.Parameters.Add("@Section", SqlDbType.VarChar).Value = obj.SectionID;
                    da.SelectCommand.Parameters.Add("@Empid", SqlDbType.VarChar).Value = obj.EmpId;
                    da.SelectCommand.Parameters.Add("@Active", SqlDbType.VarChar).Value = obj.Active;
                    da.SelectCommand.Parameters.Add("@User", SqlDbType.VarChar).Value = obj.UserID;
                    da.SelectCommand.Parameters.Add("@IP", SqlDbType.VarChar).Value = obj.IP;
                    da.SelectCommand.Parameters.Add("@empcode", SqlDbType.VarChar).Value = obj.Empcode;
                    da.SelectCommand.Parameters.Add("@DesigId", SqlDbType.VarChar).Value = obj.DesignationID;
                    da.SelectCommand.Parameters.Add("@TVP_LinkOfficers", SqlDbType.Structured).Value = obj.HTvp;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }


        public DataSet Employee(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("Employee_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@EmpCode", SqlDbType.VarChar).Value = obj.Empcode;
                    da.SelectCommand.Parameters.Add("@EmpName", SqlDbType.VarChar).Value = obj.EmpName;
                    da.SelectCommand.Parameters.Add("@SurName", SqlDbType.VarChar).Value = obj.SurName;
                    da.SelectCommand.Parameters.Add("@FName", SqlDbType.VarChar).Value = obj.EmpHusFatName;
                    da.SelectCommand.Parameters.Add("@Nationality", SqlDbType.VarChar).Value = obj.Nationality;
                    da.SelectCommand.Parameters.Add("@Gender", SqlDbType.VarChar).Value = obj.Gender;
                    da.SelectCommand.Parameters.Add("@MotherName", SqlDbType.VarChar).Value = obj.MotherName;
                    da.SelectCommand.Parameters.Add("@Qualification", SqlDbType.VarChar).Value = obj.Qualification;
                    da.SelectCommand.Parameters.Add("@DOB", SqlDbType.Date).Value = obj.DOB;
                    da.SelectCommand.Parameters.Add("@Community", SqlDbType.VarChar).Value = obj.Community;
                    da.SelectCommand.Parameters.Add("@Religion", SqlDbType.VarChar).Value = obj.Religion;
                    da.SelectCommand.Parameters.Add("@MotherTng", SqlDbType.VarChar).Value = obj.MotherTng;
                    da.SelectCommand.Parameters.Add("@MrgStatus", SqlDbType.VarChar).Value = obj.MrgStatus;
                    da.SelectCommand.Parameters.Add("@DifferentlyAble", SqlDbType.VarChar).Value = obj.DifferentAbled;
                    da.SelectCommand.Parameters.Add("@Disability_Percent", SqlDbType.VarChar).Value = obj.Percentage;
                    da.SelectCommand.Parameters.Add("@IdentMarkOne", SqlDbType.VarChar).Value = obj.IdentMarkOne;
                    da.SelectCommand.Parameters.Add("@IdentMarkTwo", SqlDbType.VarChar).Value = obj.IdentMarkTwo;
                    da.SelectCommand.Parameters.Add("@HStateCode", SqlDbType.VarChar).Value = obj.HomeSate;
                    da.SelectCommand.Parameters.Add("@HDistCode", SqlDbType.VarChar).Value = obj.HomeDistrict;
                    da.SelectCommand.Parameters.Add("@LtcHometown", SqlDbType.VarChar).Value = obj.LicHomeTown;
                    da.SelectCommand.Parameters.Add("@Aadhar", SqlDbType.VarChar).Value = obj.Aadhar;
                    da.SelectCommand.Parameters.Add("@Pan", SqlDbType.VarChar).Value = obj.PanNo;
                    da.SelectCommand.Parameters.Add("@Mobile", SqlDbType.VarChar).Value = obj.Mobile;
                    da.SelectCommand.Parameters.Add("@MailId", SqlDbType.VarChar).Value = obj.Email;
                    da.SelectCommand.Parameters.Add("@Address", SqlDbType.VarChar).Value = obj.Address;
                    da.SelectCommand.Parameters.Add("@StateCode", SqlDbType.VarChar).Value = obj.statecode;
                    da.SelectCommand.Parameters.Add("@DistCode", SqlDbType.VarChar).Value = obj.DistCode;
                    da.SelectCommand.Parameters.Add("@PinCode", SqlDbType.VarChar).Value = obj.PinCode;
                    da.SelectCommand.Parameters.Add("@PAddress", SqlDbType.VarChar).Value = obj.PresentAddress;
                    da.SelectCommand.Parameters.Add("@PStateCode", SqlDbType.VarChar).Value = obj.PerStateCode;
                    da.SelectCommand.Parameters.Add("@PDistCode", SqlDbType.VarChar).Value = obj.PerDistrict;
                    da.SelectCommand.Parameters.Add("@PPinCode", SqlDbType.VarChar).Value = obj.PerPinCode;
                    da.SelectCommand.Parameters.Add("@Phone", SqlDbType.VarChar).Value = obj.phone;
                    da.SelectCommand.Parameters.Add("@PhfileNm", SqlDbType.VarChar).Value = obj.fileNm;
                    da.SelectCommand.Parameters.Add("@PhfileSize", SqlDbType.VarChar).Value = obj.fileSize;
                    da.SelectCommand.Parameters.Add("@PhfileType", SqlDbType.VarChar).Value = obj.fileType;
                    da.SelectCommand.Parameters.AddWithValue("@Phcontent", obj.content);
                    da.SelectCommand.Parameters.Add("@SigfileNme", SqlDbType.VarChar).Value = obj.fileNme;
                    da.SelectCommand.Parameters.Add("@SigfileSizee", SqlDbType.VarChar).Value = obj.fileSizee;
                    da.SelectCommand.Parameters.Add("@SigfileTypee", SqlDbType.VarChar).Value = obj.fileTypee;
                    da.SelectCommand.Parameters.AddWithValue("@Sigcontentt", obj.contentt);
                    da.SelectCommand.Parameters.Add("@IpAddress", SqlDbType.VarChar).Value = obj.IP;
                    da.SelectCommand.Parameters.Add("@NearRailStation", SqlDbType.VarChar).Value = obj.NearRailStation;
                    da.SelectCommand.Parameters.Add("@User", SqlDbType.VarChar).Value = obj.UserID;
                    da.SelectCommand.Parameters.Add("@Active", SqlDbType.Bit).Value = obj.Active;
                    da.SelectCommand.Parameters.Add("@F", SqlDbType.Structured).Value = obj.Ftvp;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    da.SelectCommand.Parameters.Add("@Empid", SqlDbType.VarChar).Value = obj.EmpId;
                    DataSet dt = new DataSet();
                    da.Fill(dt);
                    return dt;
                }
            }
        }


        //AddApplicationSection
        public DataTable AddApplicationSectionIUDR(Master_BE obj, string con)
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("ApplicationSection_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@SectionID", SqlDbType.VarChar).Value = obj.SectionID;
                    da.SelectCommand.Parameters.Add("@SectionName", SqlDbType.VarChar).Value = obj.SectionName;
                    da.SelectCommand.Parameters.Add("@User", SqlDbType.VarChar).Value = obj.UserID;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }



        //AddItemInSection
        public DataTable AddItemsInSectionIUDR(Master_BE obj, string con)
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("ItemInSection_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@SectionID", SqlDbType.VarChar).Value = obj.SectionID;
                    da.SelectCommand.Parameters.Add("@ItemName", SqlDbType.VarChar).Value = obj.ItemName;
                    da.SelectCommand.Parameters.Add("@ItemId", SqlDbType.VarChar).Value = obj.ItemId;
                    da.SelectCommand.Parameters.Add("@User", SqlDbType.VarChar).Value = obj.UserID;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }

        //TypeOfPost
        public DataTable TypeOfPostIUDR(Master_BE obj, string con)
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("TypeOfPost_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@PostTypeID", SqlDbType.VarChar).Value = obj.PostTypeId;
                    da.SelectCommand.Parameters.Add("@PostTypeName", SqlDbType.VarChar).Value = obj.PostTypeName;
                    da.SelectCommand.Parameters.Add("@User", SqlDbType.VarChar).Value = obj.UserID;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }


        //APPLICATION
        public DataTable Post_IUDR(Master_BE obj, string con)
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("Post_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@PostID", SqlDbType.VarChar).Value = obj.Id;
                    da.SelectCommand.Parameters.Add("@PostName", SqlDbType.VarChar).Value = obj.Postname;
                    da.SelectCommand.Parameters.Add("@Desc", SqlDbType.VarChar).Value = obj.PostDescription;
                    da.SelectCommand.Parameters.Add("@PostType", SqlDbType.VarChar).Value = obj.PostTypeId;
                    da.SelectCommand.Parameters.Add("@EFrom", SqlDbType.VarChar).Value = obj.Effectfrom;
                    da.SelectCommand.Parameters.Add("@ETo", SqlDbType.VarChar).Value = obj.EffecTO;
                    da.SelectCommand.Parameters.Add("@Qual", SqlDbType.VarChar).Value = obj.Qualificationcode;
                    da.SelectCommand.Parameters.Add("@Exp", SqlDbType.VarChar).Value = obj.Exp;
                    da.SelectCommand.Parameters.Add("@ExpDet", SqlDbType.VarChar).Value = obj.ExpDet;
                    da.SelectCommand.Parameters.Add("@Photosig", SqlDbType.VarChar).Value = obj.Photo;
                    da.SelectCommand.Parameters.Add("@Discl", SqlDbType.VarChar).Value = obj.Disclaimer;
                    da.SelectCommand.Parameters.Add("@User", SqlDbType.VarChar).Value = obj.UserID;
                    da.SelectCommand.Parameters.Add("@nop", SqlDbType.VarChar).Value = obj.no_of_Posts;
                    da.SelectCommand.Parameters.Add("@Plcmnt", SqlDbType.VarChar).Value = obj.Placement;
                    da.SelectCommand.Parameters.Add("@Sal", SqlDbType.VarChar).Value = obj.Salary;
                    da.SelectCommand.Parameters.Add("@AgeLimit", SqlDbType.VarChar).Value = obj.AgeLimit;
                    da.SelectCommand.Parameters.Add("@AFee", SqlDbType.VarChar).Value = obj.AppliFee;
                    da.SelectCommand.Parameters.Add("@Fee", SqlDbType.VarChar).Value = obj.Fee;                   
                    da.SelectCommand.Parameters.Add("@IP", SqlDbType.VarChar).Value = obj.IP;
                    da.SelectCommand.Parameters.Add("@T", SqlDbType.Structured).Value = obj.Tvp;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }


        public DataTable Qualification_Master(Master_BE objBE, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("Qualification_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@Qualification_Code", SqlDbType.VarChar).Value = objBE.Qualificationcode;
                    da.SelectCommand.Parameters.Add("@Qualification_Name", SqlDbType.VarChar).Value = objBE.Qualification;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = objBE.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }



    }

}
