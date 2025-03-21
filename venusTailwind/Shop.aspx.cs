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
            }

        }
    }
}