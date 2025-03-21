using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace venusTailwind
{
    public partial class venusRedesigned : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string currentPage = Path.GetFileName(Request.Url.AbsolutePath).ToLower();

            }
        }

        protected void lbLogout_Click(object sender, EventArgs e)
        {
            logout();
        }

        protected void lbLogoutMobile_Click(object sender, EventArgs e)
        {
            logout();
        }

        private void logout()
        {
            DBConnect db = new DBConnect();
            db.Logout();
            Response.Redirect("Default.aspx");
        }
    }
}