using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using venusTailwind;

namespace venusTailwind.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (DBConnect.isAdmin() == false)
            //{
            //    Response.Redirect("Login.aspx");
            //}
        }
    }
}