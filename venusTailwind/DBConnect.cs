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


        /*
            CATEGORY SECTION 
        */

        public int addCategory(string cnm,string desc)
        {
            cmd = new SqlCommand($"INSERT INTO Categories(category_name,description,is_active) VALUES('{cnm}','{desc}','{true}')",connection);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

        public DataSet fetchCategory()
        {
            ds = new DataSet();
            da = new SqlDataAdapter("SELECT * FROM Categories", connection);
            da.Fill(ds);

            return ds;
        }
        public DataSet fetchCategory(int id)
        {
            ds = new DataSet();
            da = new SqlDataAdapter($"SELECT * FROM Categories WHERE category_id = '{id}'", connection);
            da.Fill(ds);

            return ds;
        }

        public int updateCategory(int id, string cnm, string desc)
        {
            cmd = new SqlCommand($"UPDATE Categories SET category_name = '{cnm}' , description = '{desc}' WHERE category_id = '{id}' ",connection);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

        public int isActiveCat(int id,bool status)
        {
            cmd = new SqlCommand($"UPDATE Categories SET is_activev = '{status}' WHERE category_id = '{id}' ", connection);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

        public int deleteCategory(int id)
        {
            cmd = new SqlCommand($"DELETE FROM Categories WHERE category_id = '{id}'",connection);
            int res = cmd.ExecuteNonQuery();
            return res;
        } 

        /*
            PRODUCT SECTION  
        */

    }
}