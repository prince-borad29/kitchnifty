using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace venusTailwind.Admin
{
    public partial class Products : System.Web.UI.Page
    {
            DBConnect db = new DBConnect();
        private string mainImageUrl = "" , videoUrl = "" , otherImagesUrls="";
        private DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {

            ds = db.fetchCategory();

            ddlCategory.DataSource = ds.Tables[0];
            ddlCategory.DataTextField = "category_name"; 
            ddlCategory.DataValueField = "category_id";  
            ddlCategory.DataBind();

        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            try
            {
                //main image of product
                if (imgMainProduct.HasFile)
                {
                    string mainImageName = Guid.NewGuid() + Path.GetExtension(imgMainProduct.FileName);
                    string mainImagePath = Server.MapPath("~/uploads/" + mainImageName);
                    imgMainProduct.SaveAs(mainImagePath);
                    mainImageUrl = "uploads/" + mainImageName;
                }

                //video of product
                if (productVideo.HasFile)
                {
                    string video = Guid.NewGuid() + Path.GetExtension(productVideo.FileName);
                    string videopath = Server.MapPath("~/videos/" + video);
                    productVideo.SaveAs(videopath);
                    videoUrl = "videos/" + video;
                }

                //other imgs of product
                if (productOtherImages.HasFiles) {
                    /* 	
                 * Handle Multiple Images
                 * Request.Files is a collection that contains all the files uploaded by a client during a single HTTP request, usually when submitting a form with enctype="multipart/form-data".
                 * HttpFileCollection is a class in ASP.NET that holds this collection of uploaded files.
                 */

                    HttpFileCollection files = Request.Files;

                    for (int i = 0; i < files.Count; i++)
                    {
                        /*
                             HttpPostedFile : 
                                       Provide aceess to individual file uploaded by client
                        */
                        HttpPostedFile file = files[i];

                        // Process only multiImageInput files (skip empty and other fields)
                        if (file != null && file.ContentLength > 0 && file.FileName != imgMainProduct.FileName && file.ContentType.StartsWith("image/"))
                        {
                            /*
                             * Guid.NewGuid() generates a globally unique identifier (GUID).
                             * A GUID is a 128-bit integer (16 bytes) that is virtually guaranteed to be unique across space and time.
                             */
                            string fileName = Guid.NewGuid() + Path.GetExtension(file.FileName);
                            string filePath = Server.MapPath("~/uploads/" + fileName);
                            file.SaveAs(filePath);
                            otherImagesUrls += "uploads/" + fileName + ' ';
                        }
                    }

                    otherImagesUrls = otherImagesUrls.Trim();//trim to remove space added after last url and also for in start there are space

                    // Insert into Database
                    int productId = db.addProdcut(
                        txtProductName.Text,
                        Convert.ToInt16(ddlCategory.DataValueField),
                        Convert.ToDecimal(txtProductPrice.Text),
                        txtProductDesc.Text,
                        mainImageUrl,
                        videoUrl
                        ); // Add product name and main image


                    int res = db.addOtherImgs(productId, otherImagesUrls); // Add multiple image URLs

                    if (res >= 1)
                    {
                        Response.Write("<script>alert('Product Added Successfully'); window.location='ProductAdd.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Failed to Add Product. Please Try Again.')</script>");
                    }
                }


            }
            catch (Exception error)
            {
                string errorMsg = error.Message;
            }
        }
    }
}