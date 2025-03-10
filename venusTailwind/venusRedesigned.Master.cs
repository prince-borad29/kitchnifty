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
        void removeActive()
        {
            liHomePage.Attributes["class"] = liHomePage.Attributes["class"]?.Replace("text-gray-300", "").Trim();
            liShopPage.Attributes["class"] = liShopPage.Attributes["class"]?.Replace("text-gray-300", "").Trim();
            liAboutPage.Attributes["class"] = liAboutPage.Attributes["class"]?.Replace("text-gray-300", "").Trim();
            liContactPage.Attributes["class"] = liContactPage.Attributes["class"]?.Replace("text-gray-300", "").Trim();

            aHomePage.Attributes["class"] = aHomePage.Attributes["class"]?.Replace("text-gray-300", "").Trim();
            aShopPage.Attributes["class"] = aShopPage.Attributes["class"]?.Replace("text-gray-300", "").Trim();
            aAboutPage.Attributes["class"] = aAboutPage.Attributes["class"]?.Replace("text-gray-300", "").Trim();
            aContactPage.Attributes["class"] = aContactPage.Attributes["class"]?.Replace("text-gray-300", "").Trim();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string currentPage = Path.GetFileName(Request.Url.AbsolutePath).ToLower();

                removeActive();

                switch (currentPage)
                {
                    case "default.aspx":
                        liHomePage.Attributes["class"] += " text-white";
                        aHomePage.Attributes["class"] += " text-white";
                        break;

                    case "shop.aspx":
                        liShopPage.Attributes["class"] += " text-white";
                        aShopPage.Attributes["class"] += " text-white";
                        break;

                    case "about.aspx":
                        liAboutPage.Attributes["class"] += " text-white";
                        aAboutPage.Attributes["class"] += " text-white";
                        break;

                    case "contact.aspx":
                        liContactPage.Attributes["class"] += " text-white";
                        aContactPage.Attributes["class"] += " text-white";
                        break;
                }
            }
        }

        

    }
}