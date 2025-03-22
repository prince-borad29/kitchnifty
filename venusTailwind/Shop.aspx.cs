using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace venusTailwind
{
    public partial class Shop : System.Web.UI.Page
    {
        DBConnect db;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DBConnect();
            if (!IsPostBack)
            {
                fillCategory();
                fillRepeater();
            }

        }

        void fillRepeater()
        {
            ds = db.selectProducts();
            rptProducts.DataSource = ds;
            rptProducts.DataBind();
        }

        void fillRepeater(DataSet ds)
        {
            rptProducts.DataSource = ds;
            rptProducts.DataBind();
        }
        void fillCategory()
        {
            ds = db.fetchCategory();
            ddlCategory.DataSource = ds.Tables[0];
            ddlCategory.DataTextField = ds.Tables[0].Columns["category_name"].ToString();
            ddlCategory.DataValueField = ds.Tables[0].Columns["category_id"].ToString();
            ddlCategory.DataBind();
            ddlCategory.Items.Insert(0, new ListItem("All", "0"));
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlCategory.SelectedValue);

            if (id > 0)
            {
                ViewState["catId"] = ddlCategory.SelectedValue;
                ddlCategory.SelectedValue = ViewState["catId"].ToString();
                fillCategory();
                ds = db.selectProducts(id);
                fillRepeater(ds);
            }
            else
            {
                fillCategory();
                fillRepeater();
            }
        }

        protected void viewbtn_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            // Encode id
            string id1 = HttpUtility.UrlEncode(id.ToString());

            // Create query string 
            string queryString = $"id={id1}";

            // Encrypt query string
            string encryptedValue = QueryStringEncryptionHelper.Encrypt(queryString);

            // Redirect with query string
            Response.Redirect("Product-detail.aspx?data=" + encryptedValue);
        }

        protected void btnAddToCart_Command(object sender, CommandEventArgs e)
        {
            if (Session["uid"] != null)
            {
                int result = db.InsertCartData(Convert.ToInt32(Session["uid"]), Convert.ToInt32(e.CommandArgument), 1);

                if (result > 0)
                {
                    Response.Write("Added Successfully");
                }
            }
            else
            {
                Response.Redirect("Signin.aspx");
            }
        }

        protected void rptProducts_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HiddenField hfProductId = (HiddenField)e.Item.FindControl("hfProductId");
                ImageButton addToCart = (ImageButton)e.Item.FindControl("btnAddToCart");
                ImageButton goToCart = (ImageButton)e.Item.FindControl("btnGotoCart");

                int productId = Convert.ToInt32(hfProductId.Value);
                int count = db.CartItemCount(
                    Convert.ToInt32(Session["uid"]),
                    productId
                    );

                if (count > 0)
                {
                    addToCart.Visible = false;
                    goToCart.Visible = true;
                }
            }
        }

        protected void btnGotoCart_Command(object sender, CommandEventArgs e)
        {
            //redirect to cart
        }
    }
}