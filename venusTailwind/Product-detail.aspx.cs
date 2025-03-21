using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace venusTailwind
{
    public partial class Product_detail : System.Web.UI.Page
    {
        DBConnect db;
        DataSet ds;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DBConnect();
            if (Request.QueryString["data"] != null)
            {
                string decryptedValue = QueryStringEncryptionHelper.Decrypt(Request.QueryString["data"]);

                // Parse the query string and extract values
                var queryParams = HttpUtility.ParseQueryString(decryptedValue);

                int id = Convert.ToInt32(queryParams["id"]);// Extract price
                ViewState["productId"] = id;

                ds = db.selectProductdetails(id);

                rptProduct.DataSource = ds.Tables[0];
                rptProduct.DataBind();

            }
        }

        protected void rptProduct_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            ds = db.selectProductImages(Convert.ToInt32(ViewState["productId"]));

            Repeater rptOtherImages = (Repeater)e.Item.FindControl("rptOtherImages");
            rptOtherImages.DataSource = ds.Tables[0];
            rptOtherImages.DataBind();

        }
    }
}