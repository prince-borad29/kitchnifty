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
            ddlCategory.DataTextField = ds.Tables[0].Columns[1].ToString();
            ddlCategory.DataValueField = ds.Tables[0].Columns[0].ToString();  
            ddlCategory.DataBind();
            
            ddlUpdateCategory.DataSource = ds.Tables[0];
            ddlUpdateCategory.DataTextField = ds.Tables[0].Columns[1].ToString();
            ddlUpdateCategory.DataValueField = ds.Tables[0].Columns[0].ToString();  
            ddlUpdateCategory.DataBind();

            fillRepeater();

        }

        protected void rptProduct_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Product product = (Product)e.Item.DataItem;

                Repeater rpt2 = (Repeater)e.Item.FindControl("rptProductImg");
                rpt2.DataSource = product.otherImgs;
                rpt2.DataBind();
            }
        }

        protected void btnUpdateOtherImg_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ViewState["otherImageId"]);
            string currentImg = ViewState["otherImageUrl"].ToString().Substring(11);

            if (newImg.HasFile)
            {
                string folder = Server.MapPath("~/uploads/");
                if (Directory.Exists(folder))
                {
                    string[] images = Directory.GetFileSystemEntries(folder);
                    foreach (string img in images)
                    {
                        string filename = Path.GetFileName(img);

                        if (filename == currentImg)
                        {
                            //delete existing img
                            string deletePath = Server.MapPath("~/uploads/" + currentImg);
                            File.Delete(deletePath);

                            //give new name to new img
                            string newImgName = Guid.NewGuid() + Path.GetExtension("uploads/" + newImg.FileName);
                            string newImgPath = Server.MapPath("~/uploads/" + newImgName);
                            newImg.SaveAs(newImgPath);


                            db.updateOtherImg(id, "../uploads/"+newImgName);
                            fillRepeater();
                            break;
                        }
                    }
                }
            }
        }

        protected void deleteOtherImage_Command(object sender, CommandEventArgs e)
        {
            string folder = Server.MapPath("~/uploads/");

            if (Directory.Exists(folder))
            {
                string[] images = Directory.GetFileSystemEntries(folder);
                bool isImg = false;
                foreach (string img in images)
                {
                    string filename = Path.GetFileName(img);
                    string finding = e.CommandName.ToString().Substring(11);

                    if (filename == finding)
                    {
                        string deletePath = Server.MapPath("~/uploads/" + finding);
                        File.Delete(deletePath);


                        db.deleteOtherImg(Convert.ToInt16(e.CommandArgument));

                        isImg = true;
                        break;
                    }
                }

                if (isImg)
                {
                    fillRepeater();
                    Response.Write("Mali Gyo Photo");
                }
                else
                {
                    Response.Write("NO photo");
                }
            }
        }

        protected void otherImagesupload_Command(object sender, CommandEventArgs e)
        {
            ViewState["otherImageUploadId"] = e.CommandArgument;

            ViewState["alreadyUploaded"] = db.ImageCount(Convert.ToInt32(ViewState["otherImageUploadId"]));

            ViewState["maxLen"] = 9; // You can dynamically count uploaded files from DB or folder
            ViewState["remaining"] = Convert.ToInt16(ViewState["maxLen"]) - Convert.ToInt16(ViewState["alreadyUploaded"]);

            File_Remaining.Text = "Files Remaining uploads : " + ViewState["remaining"];

            string script = "<script>otherImageUploadModal();</script>";

            ClientScript.RegisterStartupScript(this.GetType(), "otherImageUploadModal", script);
        }

        protected void otherImageUploadBtn_Click(object sender, EventArgs e)
        {
            HttpFileCollection uploadedFiles = Request.Files;
            List<HttpPostedFile> finalFilesToUpload = new List<HttpPostedFile>();
           
            // Check if files exceed limit
            int till = 5 + Convert.ToInt16(ViewState["remaining"]);
            int lastIndex = uploadedFiles.Count - 2;
            int totalFilesUploaded = otherimageuploadname.PostedFiles.Count;

            if (totalFilesUploaded > Convert.ToInt16(ViewState["remaining"]))
            {
                // Take last 'remaining' files
                for (int i = 5; i < till ; i++)
                {
                    finalFilesToUpload.Add(uploadedFiles[i]);
                }
            }
            else
            {
                // All selected files are within limit
                for (int i = 5; i <= lastIndex; i++)
                {
                    finalFilesToUpload.Add(uploadedFiles[i]);
                }
            }
            // Now process finalFilesToUpload

            foreach (HttpPostedFile file in finalFilesToUpload)
            {
                if (file.ContentLength > 0)
                {
                    string newImgName = Guid.NewGuid() + Path.GetExtension(file.FileName);
                    string newImgPath = Server.MapPath("~/uploads/" + newImgName);
                    file.SaveAs(newImgPath);

                    db.uploadotherimage2(Convert.ToInt16(ViewState["otherImageUploadId"]), "../uploads/" + newImgName);
                }
            }
            fillRepeater();
            Response.Write($"{finalFilesToUpload.Count} file(s) uploaded successfully!");
        }

        protected void videoUpdate_Click(object sender, EventArgs e)
        {
            //Video Update Logic

            int id = Convert.ToInt32(ViewState["videoId"]);

            if (videoUpdateFileUpload.HasFile)
            {
                string folder = Server.MapPath("~/videos/");
                bool isEdited = false;

                string urlExists = db.GetvideoUrl(id);

                if (urlExists != null && urlExists != string.Empty)
                {
                    string currentVideo = (ViewState["currentVideo"]).ToString().Substring(10);
                    if (Directory.Exists(folder))
                    {
                        string[] videos = Directory.GetFileSystemEntries(folder);
                        foreach (string video in videos)
                        {
                            string filename = Path.GetFileName(video);

                            if (filename == currentVideo)
                            {
                                //delete existing video
                                string deletePath = Server.MapPath("~/videos/" + currentVideo);
                                File.Delete(deletePath);

                                //give new name to new video
                                string newVideoName = Guid.NewGuid() + Path.GetExtension("videos/" + videoUpdateFileUpload.FileName);
                                string newVideoPath = Server.MapPath("~/videos/" + newVideoName);
                                videoUpdateFileUpload.SaveAs(newVideoPath);

                                db.updateVideo(id, "../videos/" + newVideoName);

                                isEdited = true;
                                fillRepeater();
                                break;
                            }
                        }
                    }
                }
                else
                {
                    //give new name to new video
                    string newVideoName = Guid.NewGuid() + Path.GetExtension("videos/" + videoUpdateFileUpload.FileName);
                    string newVideoPath = Server.MapPath("~/videos/" + newVideoName);
                    videoUpdateFileUpload.SaveAs(newVideoPath);

                    db.updateVideo(id, "../videos/" + newVideoName);

                    isEdited = true;
                    fillRepeater();
                }

                if (isEdited)
                {
                    Response.Write("VIDEO UPDATED");
                }
                else
                {
                    Response.Write("VIDEO NOT UPDATED");
                }


            }
        }

        protected void video_edit_Command(object sender, CommandEventArgs e)
        {
            //update Modal

            ViewState["videoId"] = e.CommandArgument;
            ViewState["currentVideo"] = e.CommandName;

            string script = "<script>videoUpdateModal();</script>";

            ClientScript.RegisterStartupScript(this.GetType(), "videoUpdateModal", script);
        }

        protected void deleteProduct_Command(object sender, CommandEventArgs e)
        {
            List<string> imgurl = db.deleteimgurls(Convert.ToInt32(e.CommandArgument));
            string vid_url = db.GetvideoUrl(Convert.ToInt32(e.CommandArgument));

            if (imgurl.Count > 0)
            {
                foreach (var url in imgurl)
                {
                    File.Delete(Server.MapPath(url));
                }
            }

            File.Delete(Server.MapPath(vid_url));
            File.Delete(Server.MapPath(e.CommandName));

            db.deleteProduct(Convert.ToInt32(e.CommandArgument));

            fillRepeater();
        }

        protected void editOtherImage_Command(object sender, CommandEventArgs e)
        {
            //update Other Image

            ViewState["otherImageId"] = e.CommandArgument;
            ViewState["otherImageUrl"] = e.CommandName;

            string script = "<script>openFileUploadModal()</script>";

            ClientScript.RegisterStartupScript(this.GetType(), "ModalOtherImagerUpdate", script);
        }

        protected void editProduct_Command(object sender, CommandEventArgs e)
        {
            ViewState["updateProductId"] = e.CommandArgument;

            ds = db.selectProduct(Convert.ToInt32(ViewState["updateProductId"]));

            txtUpdateName.Text = ds.Tables[0].Rows[0]["product_name"].ToString();
            txtUpdateDesc.Text = ds.Tables[0].Rows[0]["description"].ToString();
            txtUpdatePrice.Text = ds.Tables[0].Rows[0]["price"].ToString();
            ddlUpdateCategory.SelectedValue = ds.Tables[0].Rows[0]["category_id"].ToString();
            ViewState["UpdateMainImgUrl"] = ds.Tables[0].Rows[0]["image_url"].ToString();

            ClientScript.RegisterStartupScript(this.GetType(),"updateProduct", "<script>openProductUpdateModal()</script>");
        }

        protected void btnUpdateProduct_Click(object sender, EventArgs e)
        {
            string currentImg = ViewState["UpdateMainImgUrl"].ToString().Substring(11) , newImg = "";

            if (flUpdateMainImg.HasFile)
            {
                string folder = Server.MapPath("~/uploads/");
                if (Directory.Exists(folder))
                {
                    string[] images = Directory.GetFileSystemEntries(folder);
                    foreach (string img in images)
                    {
                        string filename = Path.GetFileName(img);

                        if (filename == currentImg)
                        {
                            //delete existing img
                            string deletePath = Server.MapPath("~/uploads/" + currentImg);
                            File.Delete(deletePath);

                            //give new name to new img
                            string newImgName = Guid.NewGuid() + Path.GetExtension("uploads/" + flUpdateMainImg.FileName);
                            string newImgPath = Server.MapPath("~/uploads/" + newImgName);
                            flUpdateMainImg.SaveAs(newImgPath);

                            db.updateProduct(
                                Convert.ToInt32(ViewState["updateProductId"]),
                                txtUpdateName.Text,
                                Convert.ToInt32(ddlUpdateCategory.SelectedValue),
                                Convert.ToDecimal(txtUpdatePrice.Text),
                                txtUpdateDesc.Text
                                , "../uploads/" + newImgName);
                            fillRepeater();
                            break;
                        }
                    }
                }
            }
            else
            {
                db.updateProduct(
                               Convert.ToInt32(ViewState["updateProductId"]),
                               txtUpdateName.Text,
                               Convert.ToInt32(ddlUpdateCategory.SelectedValue),
                               Convert.ToDecimal(txtUpdatePrice.Text),
                               txtUpdateDesc.Text
                               );
                fillRepeater();
            }

        }

        void fillRepeater() {
            List<Product> products = db.GetProduct();
            //ViewState["products"] = products;

            rptProduct.DataSource = products;
            rptProduct.DataBind();
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
                    mainImageUrl = "../uploads/" + mainImageName;
                }

                //video of product
                if (productVideo.HasFile)
                {
                    string video = Guid.NewGuid() + Path.GetExtension(productVideo.FileName);
                    string videopath = Server.MapPath("~/videos/" + video);
                    productVideo.SaveAs(videopath);
                    videoUrl = "../videos/" + video;
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
                            otherImagesUrls += "../uploads/" + fileName + ' ';
                        }
                    }

                    otherImagesUrls = otherImagesUrls.Trim();//trim to remove space added after last url and also for in start there are space

                    // Insert into Database
                    int productId = db.addProdcut(
                        txtProductName.Text,
                        Convert.ToInt16(ddlCategory.SelectedValue),
                        Convert.ToDecimal(txtProductPrice.Text),
                        txtProductDesc.Text,
                        mainImageUrl,
                        videoUrl
                        ); 


                    int res = db.addOtherImgs(productId, otherImagesUrls); // Add multiple image URLs

                    if (res >= 1)
                    {
                        Response.Write("<script>alert('Product Added Successfully');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Failed to Add Product. Please Try Again.')</script>");
                    }

                    fillRepeater();
                }

            }
            catch (Exception error)
            {
                string errorMsg = error.Message;
            }
        }
    }
}