using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using PA_BE;

namespace NPA_DL
{
    public class Recruitment_DL
    {
        public DataSet ApplyPost_DL(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("ApplyPost_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@Id", SqlDbType.BigInt).Value = obj.Id;
                    da.SelectCommand.Parameters.Add("@Application_Id", SqlDbType.VarChar).Value = obj.ApplicationId;
                    da.SelectCommand.Parameters.Add("@Post_ID", SqlDbType.Int).Value = obj.PostTypeId;
                    da.SelectCommand.Parameters.Add("@Name", SqlDbType.VarChar).Value = obj.EmpName;
                    da.SelectCommand.Parameters.Add("@FName", SqlDbType.VarChar).Value = obj.Father_HusbandName;
                    da.SelectCommand.Parameters.Add("@DOB", SqlDbType.DateTime).Value = obj.DOB;
                    da.SelectCommand.Parameters.Add("@Caste", SqlDbType.Int).Value = obj.Community;
                    da.SelectCommand.Parameters.Add("@Nationality", SqlDbType.Int).Value = obj.Nationality;
                    da.SelectCommand.Parameters.Add("@Religion", SqlDbType.Int).Value = obj.Religion;
                    da.SelectCommand.Parameters.Add("@Gender", SqlDbType.VarChar).Value = obj.Gender;
                    da.SelectCommand.Parameters.Add("@Address", SqlDbType.VarChar).Value = obj.Address;
                    da.SelectCommand.Parameters.Add("@PAddress", SqlDbType.VarChar).Value = obj.PermAdd;
                    da.SelectCommand.Parameters.Add("@Mobile", SqlDbType.VarChar).Value = obj.Mobile;
                    da.SelectCommand.Parameters.Add("@Email", SqlDbType.VarChar).Value = obj.Email;
                    da.SelectCommand.Parameters.Add("@IpAddress", SqlDbType.VarChar).Value = obj.IP;
                    da.SelectCommand.Parameters.Add("@PhfileNm", SqlDbType.VarChar).Value = obj.fileNm;
                    da.SelectCommand.Parameters.Add("@PhfileSize", SqlDbType.VarChar).Value = obj.fileSize;
                    da.SelectCommand.Parameters.Add("@PhfileType", SqlDbType.VarChar).Value = obj.fileType;
                    da.SelectCommand.Parameters.Add("@Phcontent", SqlDbType.VarBinary).Value = obj.content;
                    da.SelectCommand.Parameters.Add("@SigfileNme", SqlDbType.VarChar).Value = obj.SignfileNme;
                    da.SelectCommand.Parameters.Add("@SigfileSizee", SqlDbType.VarChar).Value = obj.SignfileSizee;
                    da.SelectCommand.Parameters.Add("@SigfileType", SqlDbType.VarChar).Value = obj.SignfileTypee;
                    da.SelectCommand.Parameters.Add("@Sigcontent", SqlDbType.VarBinary).Value = obj.Signcontentt;
                    da.SelectCommand.Parameters.Add("@EntryBy", SqlDbType.Int).Value = obj.UserID;
                    da.SelectCommand.Parameters.Add("@TVPE", SqlDbType.Structured).Value = obj.Tvp;
                    da.SelectCommand.Parameters.Add("@TVPQ", SqlDbType.Structured).Value = obj.TVP1;
                    da.SelectCommand.Parameters.Add("@Aadhar", SqlDbType.VarChar).Value = obj.Aadhar;
                    da.SelectCommand.Parameters.Add("@Status", SqlDbType.VarChar).Value = obj.Status;
                    da.SelectCommand.Parameters.Add("@Remarks", SqlDbType.VarChar).Value = obj.Remarks;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    return ds;
                }
            }
        }
    }
}
