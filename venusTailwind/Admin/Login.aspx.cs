using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace venusTailwind.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DBConnect db = new DBConnect();

            bool isLoggedIn = db.loginAdmin(txtEmail.Text,txtPassword.Text);
            if (isLoggedIn)
            {
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                Response.Write("<h3 style='color:red;'>Username or Password Invalid</h3>");
            }
        }
    }
}