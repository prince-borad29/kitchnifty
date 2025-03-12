using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace venusTailwind
{
    public partial class Signup : System.Web.UI.Page
    {
        DBConnect db;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new DBConnect();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            db.Signup(txtUsername.Text, txtEmail.Text, txtPassword.Text, txtFullName.Text, txtPhone.Text);
            Response.Redirect("login.aspx");
        }
    }
}