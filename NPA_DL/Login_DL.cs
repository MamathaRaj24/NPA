﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using PA_BE;
using System.Data;
using System.Data.SqlClient;


namespace PA_DL
{
    public class Login_DL
    {
        public DataTable getLoginDetails(Master_BE objBE, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                using (SqlDataAdapter da = new SqlDataAdapter("GetLoginDetails", con))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add("@username", SqlDbType.NVarChar).Value = objBE.User;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
        }

        public int insertUserLoginStatus(string userId, DateTime dateAndTime, string ipAddress, string loginStatus, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                SqlCommand cmd = new SqlCommand("UserLoginStatus_IU", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@UserId", SqlDbType.NVarChar).Value = userId;
                cmd.Parameters.Add("@Login_or_LogoutDateAndTime", SqlDbType.DateTime).Value = dateAndTime;
                cmd.Parameters.Add("@IpAddress", SqlDbType.NVarChar).Value = ipAddress;
                cmd.Parameters.Add("@Status", SqlDbType.NVarChar).Value = loginStatus;
                cmd.Parameters.Add("@Action", SqlDbType.VarChar).Value = "I";
                cmd.Parameters.Add("@LoginSno", SqlDbType.Int);

                //cmd.Parameters.Add("@LogoutDateAndTime", SqlDbType.DateTime).Value = LogoutDateAndTime;
                cmd.Parameters["@LoginSno"].Direction = ParameterDirection.Output;
                con.Open();
                cmd.ExecuteNonQuery();
                int code = Convert.ToInt32(cmd.Parameters["@LoginSno"].Value);
                con.Close();
                con.Dispose();
                return code;
            }
        }

        public void updateUserLoginStatus(int id, string status, DateTime logouttime, string ConnKey)
        {
            using (SqlConnection con = new SqlConnection(ConnKey))
            {
                SqlCommand cmd = new SqlCommand("UserLoginStatus_IU", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@LoginSno_toUpdate", SqlDbType.BigInt).Value = id;
                cmd.Parameters.Add("@Status", SqlDbType.NVarChar).Value = status;
                cmd.Parameters.Add("@Action", SqlDbType.VarChar).Value = "U";
                cmd.Parameters.Add("@Login_or_LogoutDateAndTime", SqlDbType.DateTime).Value = logouttime;
                cmd.Parameters.Add("@LoginSno", SqlDbType.Int);
                cmd.Parameters["@LoginSno"].Direction = ParameterDirection.Output;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
}
