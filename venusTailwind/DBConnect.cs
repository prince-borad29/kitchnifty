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
        SqlDataReader dr;

        private string connectionString = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        public DBConnect()
        {
            connection = new SqlConnection(connectionString);
            connection.Open();
        }

        /*
            AUTHENTICATION  
        */
        public int Signup(string unm, string eml, string pwd, string fname, string phone)
        {
            pwd = HashPassword(pwd);

            cmd = new SqlCommand($"INSERT INTO Users(username,email,password_hash,full_name,phone) Values('{unm}','{eml}','{pwd}','{fname}','{phone}')", connection);

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
        
        private bool VerifyPassword(string enteredPassword,string stored,bool logAdmin)
        {
            return enteredPassword == stored;
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
                return VerifyPassword(pwd, ds.Tables[0].Rows[0][2].ToString(),true);
            }
            else
            {
                return false;
            }
        }

        /*
            CATEGORY SECTION 
        */

        public int addCategory(string cnm)
        {
            cmd = new SqlCommand($"INSERT INTO Categories(category_name,is_active) VALUES('{cnm}','{true}')", connection);
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

        public int updateCategory(int id, string cnm)
        {
            cmd = new SqlCommand($"UPDATE Categories SET category_name = '{cnm}' WHERE category_id = '{id}' ", connection);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

        public int isActiveCat(int id, bool status)
        {
            cmd = new SqlCommand($"UPDATE Categories SET is_active = '{status}' WHERE category_id = '{id}' ", connection);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

        public int deleteCategory(int id)
        {
            cmd = new SqlCommand($"DELETE FROM Categories WHERE category_id = '{id}'", connection);
            int res = cmd.ExecuteNonQuery();
            return res;
        }

        /*
            PRODUCT SECTION  
        */
        public int addProdcut(string productName, int catId, decimal price, string desc, string img, string video)
        {
            cmd = new SqlCommand($"INSERT INTO Products(product_name,category_id,price,description,image_url,video_url,is_active) Values('{productName}', '{catId}', '{price}', '{desc}', '{img}', '{video}' , '{true}'); SELECT SCOPE_IDENTITY();", connection);

            return Convert.ToInt32(cmd.ExecuteScalar());
        }

        //when updating image and video both
        public int updateProduct(int productId, string productName, int catId, decimal price, string desc, string img)
        {
            cmd = new SqlCommand($"UPDATE Products SET product_name='{productName}' ,category_id='{catId}',price='{price}',description='{desc}' , image_url = '{img}'  WHERE product_id = '{productId}';", connection);

            return cmd.ExecuteNonQuery();
        }

        //when img and video is not needed to update
        public int updateProduct(int productId, string productName, int catId, decimal price, string desc)
        {
            cmd = new SqlCommand($"UPDATE Products SET product_name='{productName}' ,category_id='{catId}',price='{price}',description='{desc}' WHERE product_id = '{productId}';", connection);

            return cmd.ExecuteNonQuery();
        }

       
        //add other images of product
        public int addOtherImgs(int productId, string otherImgUrls)
        {
            int res = 0;

            string[] splitted = otherImgUrls.ToString().Split(' ');
            int len = splitted.Length;
            for (int i = 0; i < len; i++)
            {
                cmd = new SqlCommand($"INSERT INTO ProductImages(product_id,image_url) VALUES('{productId}' , '{splitted[i]}');", connection);
                int effectded = cmd.ExecuteNonQuery();
                res += effectded;
            }

            return res;
        }

        //update Other Image
        public void updateOtherImg(int id, string imgPath)
        {
            cmd = new SqlCommand($"UPDATE ProductImages SET image_url='{imgPath}' WHERE image_id='{id}'", connection);
            cmd.ExecuteNonQuery();
        }

        //delete Other Image
        public void deleteOtherImg(int id)
        {
            cmd = new SqlCommand($"DELETE FROM ProductImages WHERE image_id='{id}'", connection);
            cmd.ExecuteNonQuery();
        }

        //upload further other image

        public List<string> deleteimgurls(int id)
        {
            List<string> imgurl = new List<string>();
            SqlDataReader reader;
            cmd = new SqlCommand($"SELECT * FROM ProductImages WHERE product_id ='{id}'", connection);
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                imgurl.Add(reader["image_url"].ToString());
            }

            reader.Close();

            return imgurl;
        }

        public int ImageCount(int id)
        {
            cmd = new SqlCommand($"select count(*) from ProductImages where product_id='{id}'", connection);
            return Convert.ToInt32(cmd.ExecuteScalar());
        }

        public int uploadotherimage2(int product_id, string img)
        {
            try
            {
                cmd = new SqlCommand($"INSERT INTO ProductImages(product_id,image_url) VALUES('{product_id}' , '{img}')", connection);
                int res = cmd.ExecuteNonQuery();

                return 1;
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write(ex);
                return 0;
            }
        }

        //delete Products
        public void deleteProduct(int id)
        {
            cmd = new SqlCommand($"delete from Products where product_id='{id}';" +
                $"delete from ProductImages where product_id ='{id}'", connection);

            cmd.ExecuteNonQuery();
        }

        //update Video
        public void updateVideo(int id, string video)
        {
            cmd = new SqlCommand($"update Products set video_url='{video}' where product_id='{id}';", connection);
            cmd.ExecuteNonQuery();
        }

        public string GetvideoUrl(int id)
        {

            SqlDataReader readurl;
            string videoUrl = null;

            cmd = new SqlCommand($"select video_url from Products where product_id = '{id}';", connection);
            readurl = cmd.ExecuteReader();

            while (readurl.Read())
            {
                videoUrl = readurl.GetString(0);
            }

            readurl.Close();
            return videoUrl;
        }

        //product fetch fir repeater
        public List<Product> GetProduct()
        {
            List<Product> products = new List<Product>();

            cmd = new SqlCommand("SELECT * FROM Products; SELECT * FROM ProductImages;", connection);

            dr = cmd.ExecuteReader();

            Dictionary<int, Product> productDictionary = new Dictionary<int, Product>();

            while (dr.Read())
            {
                Product product = new Product
                {
                    Id = dr.GetInt32(0),
                    name = dr.GetString(1),
                    categoryId = dr.GetInt32(2),
                    price = dr.GetDecimal(3),
                    description = dr.GetString(4),
                    img = dr.GetString(5),
                    video = dr.GetString(6),
                    is_active = dr.GetBoolean(7),
                    otherImgs = new List<ProductOtherImages>()
                };

                productDictionary[product.Id] = product;
                products.Add(product);
            }

            if (dr.NextResult())
            {
                while (dr.Read())
                {
                    int product_id = dr.GetInt32(1);

                    if (productDictionary.ContainsKey(product_id))
                    {
                        productDictionary[product_id].otherImgs.Add(new ProductOtherImages
                        {
                            Id = dr.GetInt32(0),
                            imgurl = dr.GetString(2)
                        });
                    }
                }
            }

            dr.Close();
            return products;
        }

        public DataSet selectProduct(int id)
        {
            da = new SqlDataAdapter($"SELECT product_name , category_id , price , description , image_url from Products WHERE product_id = '{id}';", connection);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        //display product in shop page
        public DataSet selectProducts()
        {
            da = new SqlDataAdapter($"SELECT product_id, product_name , category_id , price  , REPLACE(image_url,'../','') AS imageMain from Products;", connection);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        
        public DataSet selectProducts(int catId)
        {
            da = new SqlDataAdapter($"SELECT product_name , category_id , price  , REPLACE(image_url,'../','') AS imageMain from Products WHERE category_id = '{catId}';", connection);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet selectProductdetails(int id)
        {
            da = new SqlDataAdapter($"SELECT product_name , category_id , price , description , REPLACE(image_url,'../','') AS imageMain,REPLACE(video_url,'../','') AS videoUrl from Products WHERE product_id = '{id}';", connection);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet selectProductImages(int id)
        {
            da = new SqlDataAdapter($"SELECT REPLACE(image_url,'../','') AS imageOther FROM productImages WHERE product_id = '{id}'",connection);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }


        /*Add To Cart 
         Section Start */

        public int InsertCartData(int user_id, int product_id, int quatity) {
            cmd = new SqlCommand($"insert into Cart(user_id,product_id,quantity) Values('{user_id}','{product_id}','{quatity}');",connection);

            return cmd.ExecuteNonQuery();
        }

        public int CartItemCount(int user_id,int product_id) {
            cmd = new SqlCommand($"select Count(*) from Cart where user_id = '{user_id}' AND product_id='{product_id}'",connection);

            int count = Convert.ToInt32(cmd.ExecuteScalar());

            return count;
        }

    }
}

public class Product
{
    public int Id { get; set; }
    public string name { get; set; }
    public int categoryId { get; set; }
    public decimal price { get; set; }
    public string description { get; set; }
    public string img { get; set; }
    public string video { get; set; }
    public bool is_active { get; set; }
    public List<ProductOtherImages> otherImgs { get; set; }
}

public class ProductOtherImages
{
    public int Id { get; set; }
    public string imgurl { get; set; }
}

