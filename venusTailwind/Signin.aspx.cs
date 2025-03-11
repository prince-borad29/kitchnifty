using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace venusTailwind
{
    public partial class Signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DBConnect db = new DBConnect();
            //Response.Write(db.Login(txtEmail.Text,txtPassword.Text));

            bool isLoggedIn = db.Login(txtEmail.Text, txtPassword.Text);

            if (isLoggedIn)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                Response.Write("Invalid Password or Username");
            }
        }
    }
}