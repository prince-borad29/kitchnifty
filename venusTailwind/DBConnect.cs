using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace venusTailwind
{
    public class DBConnect
    {
        private SqlCommand cmd;
        private SqlConnection connection;
        private SqlDataAdapter da;
        private DataSet ds;
        private string connectionString = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        public DBConnect()
        {
            connection = new SqlConnection(connectionString);
            connection.Open();
        }

        public int Signup(string unm, string eml, string pwd, string fname, string phone)
        {
            pwd = HashPassword(pwd);

            cmd = new SqlCommand($"INSERT INTO Users(username,email,password_hash,full_name,phone,created_at,is_active) Values('{unm}','{eml}','{pwd}','{fname}','{phone}','{DateTime.Now}','{true}')", connection);

            int res = cmd.ExecuteNonQuery();

            return res;
        }

        public bool Login(string eml, string pwd)
        {

            da = new SqlDataAdapter($"select user_id,username,email,password_hash from Users where email='{eml}'", connection);

            ds = new DataSet();

            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                HttpContext.Current.Session["uid"] = ds.Tables[0].Rows[0][0].ToString();
                HttpContext.Current.Session["username"] = ds.Tables[0].Rows[0][1].ToString();
                HttpContext.Current.Session["isLoggedIn"] = true;
                return VerifyPassword(pwd, ds.Tables[0].Rows[0][3].ToString());
            }
            else
            {
                return false;
            }
        }

        public void Logout()
        {
            HttpContext.Current.Session.RemoveAll();
            HttpContext.Current.Session.Abandon();
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(bytes);
            }
        }


        private bool VerifyPassword(string enteredPassword, string storedHash)
        {
            string hashedPassword = HashPassword(enteredPassword);
            return hashedPassword == storedHash;
        }

        public static bool isLoggedIn()
        {
            if (Convert.ToBoolean(HttpContext.Current.Session["isLoggedIn"]) == true)
            {
                return true;
            }

            return false;
        }

        public static bool isAdmin()
        {
            if (Convert.ToBoolean(HttpContext.Current.Session["isAdmin"]) == true)
            {
                return true;
            }

            return false;
        }

        public bool loginAdmin(string eml, string pwd)
        {
            da = new SqlDataAdapter($"select username,email,password from admin where email='{eml}'", connection);

            ds = new DataSet();

            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                HttpContext.Current.Session["usernameAdmin"] = ds.Tables[0].Rows[0][0].ToString();
                HttpContext.Current.Session["isAdmin"] = true;
                return VerifyPassword(pwd, ds.Tables[0].Rows[0][2].ToString());
            }
            else
            {
                return false;
            }
        }

        //public DataSet Fetch
    }
}