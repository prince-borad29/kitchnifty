using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace venusTailwind.Admin
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["getImages"] == "1")
            {
                string productId = Request.QueryString["productId"];
                string path = productId == "0" ? Server.MapPath("~/uploads/library/") : Server.MapPath($"~/uploads/{productId}/");
                var files = Directory.GetFiles(path);
                foreach (var file in files)
                {
                    string fileName = Path.GetFileName(file);
                    Response.Write($"<img src='/uploads/{(productId == "0" ? "library" : productId)}/{fileName}' onclick=\"selectImage('{fileName}', this)\" class='m-1' style='width:100px;height:100px;cursor:pointer;' />");
                }
                Response.End();
            }

            // Upload logic (check for max files)
            if (Request.QueryString["uploadImage"] == "1")
            {
                string path = Server.MapPath("~/uploads/library/");
                if (Directory.GetFiles(path).Length >= 9) Response.End(); // Stop if 9 images exist
                for (int i = 0; i < Request.Files.Count; i++)
                {
                    var file = Request.Files[i];
                    string fileName = Path.GetFileName(file.FileName);
                    string savePath = Path.Combine(path, fileName);
                    if (!File.Exists(savePath)) file.SaveAs(savePath);
                }
                Response.End();
            }

            string[] imageNames = hfSelectedImages.Value.Split(',');
            foreach (string img in imageNames)
            {
                Response.Write(img);
            }


        }
    }
}