using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using PA_BE;
namespace NPA_DL
{
    public class Employee_Leave
    {
        public DataTable Employee_LeaveDL(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("EmpLeave_Details", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@EmpCode", SqlDbType.VarChar).Value = obj.Empcode;
                    da.SelectCommand.Parameters.Add("@LeaveType", SqlDbType.Int).Value = obj.TypeId;
                    da.SelectCommand.Parameters.Add("@LeaveType_SC", SqlDbType.Char).Value = obj.Type;
                    da.SelectCommand.Parameters.Add("@Sation_leave", SqlDbType.Int).Value = obj.Station_leave;
                    da.SelectCommand.Parameters.Add("@Address_Leave", SqlDbType.VarChar).Value = obj.Address;
                    da.SelectCommand.Parameters.Add("@Remarks", SqlDbType.VarChar).Value = obj.Remarks;
                    da.SelectCommand.Parameters.Add("@Reason", SqlDbType.VarChar).Value = obj.Reason;
                    da.SelectCommand.Parameters.Add("@Status", SqlDbType.VarChar).Value = obj.Status;
                    da.SelectCommand.Parameters.Add("@Noofdays", SqlDbType.Decimal).Value = obj.Noleaves;
                    da.SelectCommand.Parameters.Add("@User", SqlDbType.VarChar).Value = obj.User;
                    da.SelectCommand.Parameters.Add("@PendingAt", SqlDbType.VarChar).Value = obj.ReportingOfficer;
                    da.SelectCommand.Parameters.Add("@Leave_Doc", SqlDbType.VarBinary).Value = obj.Doc_Content;
                    da.SelectCommand.Parameters.Add("@TVP_LeaveDetails", SqlDbType.Structured).Value = obj.Tvp;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }
        //TESTING

        public DataTable Employee_LeaveDtails(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("EmpLeave_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@EmpId", SqlDbType.VarChar).Value = obj.Empcode;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }
        public DataTable Employee_LeaveDL_Test(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("EmpLeave_Details_TEST", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@EmpCode", SqlDbType.VarChar).Value = obj.Empcode;
                    da.SelectCommand.Parameters.Add("@LeaveType", SqlDbType.Int).Value = obj.TypeId;
                    da.SelectCommand.Parameters.Add("@LeaveType_SC", SqlDbType.Char).Value = obj.Type;
                    da.SelectCommand.Parameters.Add("@Sation_leave", SqlDbType.Int).Value = obj.Station_leave;
                    da.SelectCommand.Parameters.Add("@Address_Leave", SqlDbType.VarChar).Value = obj.Address;
                    da.SelectCommand.Parameters.Add("@Remarks", SqlDbType.VarChar).Value = obj.Remarks;
                    da.SelectCommand.Parameters.Add("@Reason", SqlDbType.VarChar).Value = obj.Reason;
                    da.SelectCommand.Parameters.Add("@Status", SqlDbType.VarChar).Value = obj.Status;
                    da.SelectCommand.Parameters.Add("@Noofdays", SqlDbType.Decimal).Value = obj.Noleaves;
                    da.SelectCommand.Parameters.Add("@User", SqlDbType.VarChar).Value = obj.User;
                    da.SelectCommand.Parameters.Add("@PendingAt", SqlDbType.VarChar).Value = obj.ReportingOfficer;
                    da.SelectCommand.Parameters.Add("@Leave_Doc", SqlDbType.VarBinary).Value = obj.Doc_Content;
                    da.SelectCommand.Parameters.Add("@TVP_LeaveDetails", SqlDbType.Structured).Value = obj.Tvp;
                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }

        /*Leave Apply*/
        public DataTable ApplyLeave_IUDR(Master_BE obj, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("EmpLeave_IUDR", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@ApplicationId", SqlDbType.VarChar).Value = obj.Id;
                    da.SelectCommand.Parameters.Add("@EmpType", SqlDbType.VarChar).Value = obj.EmpType;
                    da.SelectCommand.Parameters.Add("@EmpCode", SqlDbType.VarChar).Value = obj.Empcode;
                    da.SelectCommand.Parameters.Add("@EmpId", SqlDbType.VarChar).Value = obj.EmpId;
                    da.SelectCommand.Parameters.Add("@TestDay", SqlDbType.VarChar).Value = obj.FmDt;
                    da.SelectCommand.Parameters.Add("@CancelFrm", SqlDbType.VarChar).Value = obj.CancelFrm;
                    da.SelectCommand.Parameters.Add("@CancelTo", SqlDbType.VarChar).Value = obj.CancelTo;
                    da.SelectCommand.Parameters.Add("@LeaveType", SqlDbType.VarChar).Value = obj.Type;
                    da.SelectCommand.Parameters.Add("@Flag", SqlDbType.VarChar).Value = obj.CType;
                    da.SelectCommand.Parameters.Add("@Reason", SqlDbType.VarChar).Value = obj.Reason;
                    da.SelectCommand.Parameters.Add("@Nod", SqlDbType.VarChar).Value = obj.Noleaves;
                    da.SelectCommand.Parameters.Add("@Prefix", SqlDbType.VarChar).Value = obj.Prefix;
                    da.SelectCommand.Parameters.Add("@Postfix", SqlDbType.VarChar).Value = obj.PostFix;
                    da.SelectCommand.Parameters.Add("@StnLv", SqlDbType.VarChar).Value = obj.Station_leave;
                    da.SelectCommand.Parameters.Add("@StnLvAddress", SqlDbType.VarChar).Value = obj.Address;
                    da.SelectCommand.Parameters.Add("@Rmrks", SqlDbType.VarChar).Value = obj.Remarks;
                    da.SelectCommand.Parameters.Add("@IP", SqlDbType.VarChar).Value = obj.IP;
                    da.SelectCommand.Parameters.Add("@FileType", SqlDbType.VarChar).Value = obj.Doc_Type;
                    da.SelectCommand.Parameters.Add("@FileName", SqlDbType.VarChar).Value = obj.Doc_Name;
                    da.SelectCommand.Parameters.Add("@FileContent", SqlDbType.VarBinary).Value = obj.Doc_Content;
                    da.SelectCommand.Parameters.Add("@Tvp", SqlDbType.Structured).Value = obj.Tvp;
                    da.SelectCommand.Parameters.Add("@Status", SqlDbType.VarChar).Value = obj.Status;
                    da.SelectCommand.Parameters.Add("@OfficerStatus", SqlDbType.VarChar).Value = obj.OfficerStatus;

                    da.SelectCommand.Parameters.Add("@Leave_Type", SqlDbType.VarChar).Value = obj.LType;
                    da.SelectCommand.Parameters.Add("@FromDate", SqlDbType.VarChar).Value = obj.FmDt;
                    da.SelectCommand.Parameters.Add("@ToDate", SqlDbType.VarChar).Value = obj.ToDt;
                    da.SelectCommand.Parameters.Add("@Joining_FromDate", SqlDbType.VarChar).Value = obj.doj;
                    da.SelectCommand.Parameters.Add("@Joining_FromType", SqlDbType.VarChar).Value = obj.JType;

                    da.SelectCommand.Parameters.Add("@Action", SqlDbType.VarChar).Value = obj.Action;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }
    }
}
