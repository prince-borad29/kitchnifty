using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace venusTailwind.Admin
{
    public partial class Category : System.Web.UI.Page
    {
        DBConnect db;
        protected void Page_Load(object sender, EventArgs e)
        {
            fillGrid();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (btnSubmit.Text == "Add")
            {
                db = new DBConnect();
                int insert = db.addCategory(txtcat_name.Text , txtcat_desc.Text);
                if(insert > 0)
                {
                    fillGrid();
                    Response.Write("<script> alert('Category Added Successfully') </script>");
                }
                else
                {

                }              
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
    }
}