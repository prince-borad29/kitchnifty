using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace venusTailwind.Admin
{
    public partial class Category : System.Web.UI.Page
    {
        DBConnect db;
        DataSet ds;

        protected void Page_Load(object sender, EventArgs e)
        {
            fillGrid();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
                db = new DBConnect();
                int insert = db.addCategory(txtcat_name.Text);
                if(insert > 0)
                {
                    fillGrid();
                    Response.Write("<script> alert('Category Added Successfully') </script>");
                }
                else
                {

                }
        }

        void fillGrid()
        {
            db = new DBConnect();

            gvCategory.DataSource = db.fetchCategory();
            gvCategory.DataBind();
        }

        protected void btnEdit_Command(object sender, CommandEventArgs e)
        {
            ViewState["categoryId"] = e.CommandArgument;
            ds = db.fetchCategory(Convert.ToInt32(ViewState["categoryId"]));

            txtcat_update_name.Text = ds.Tables[0].Rows[0]["category_name"].ToString();

            string script = "<script>$(document).ready(function() { $('#exampleModalCenter2').modal('show'); });</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "ShowModal", script);

        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            ViewState["categoryId"] = e.CommandArgument;
            db.deleteCategory(Convert.ToInt32(ViewState["categoryId"]));
            fillGrid();
        }

        protected void updateModalBtn_Click(object sender, EventArgs e)
        {
            db.updateCategory(Convert.ToInt32(ViewState["categoryId"]), txtcat_update_name.Text) ;

            fillGrid();
        }
    }
}