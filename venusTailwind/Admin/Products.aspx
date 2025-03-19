<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="venusTailwind.Admin.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="mb-4">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">Add Product</button>
        </div>

        <!-- Product Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Add Product</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Category</label>
                            <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label>Product Name</label>
                            <asp:TextBox ID="txtProductName" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Product Price</label>
                            <asp:TextBox ID="txtProductPrice" class="form-control" runat="server"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>Product Description</label>
                            <asp:TextBox ID="txtProductDesc" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Product Main Image</label>
                            <asp:FileUpload ID="imgMainProduct" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>Product Video</label>
                            <asp:FileUpload ID="productVideo" runat="server" />
                        </div>
                        <div class="form-group">
                            <label>Product Video</label>
                            <asp:FileUpload ID="productOtherImages" runat="server" AllowMultiple="true" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnAddProduct" class="btn btn-primary" runat="server" Text="Add" OnClick="btnAddProduct_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Products Table -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Product List</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <asp:Repeater OnItemDataBound="rptProduct_ItemDataBound" ID="rptProduct" runat="server">
                        <HeaderTemplate>
                            <table class="table table-bordered table-striped table-hover align-middle text-center">
                                <thead class="table-info">
                                    <tr>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Main Image</th>
                                        <th>Additional Images</th>
                                        <th>Video</th>
                                        <th>Description</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblProductPrice" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                                </td>
                                <td>
                                    <img src='<%# Eval("img") %>' class="img-thumbnail" style="max-width: 100px; height: auto; object-fit: cover;" alt="Main Image" onclick="showImagePreview(this.src)" />

                                </td>
                                <td>
                                    <div class="d-flex flex-wrap gap-3">
                                        <asp:Repeater ID="rptProductImg" runat="server">
                                            <ItemTemplate>
                                                <div class="text-center border p-2 rounded" style="width: 120px;">
                                                    <img src='<%# Eval("imgurl") %>' class="img-thumbnail mb-2" style="width: 100%; height: 80px; object-fit: cover;" onclick="showImagePreview(this.src)" alt="Additional Image" />
                                                    <div class="btn-group w-100" role="group">
                                                        <asp:LinkButton ID="editOtherImage" CommandName='<%# Eval("imgurl") %>' CommandArgument='<%# Eval("Id") %>' OnCommand="editOtherImage_Command" runat="server" CssClass="btn btn-outline-primary btn-sm" title="Edit">
                                            <i class="bi bi-pencil-square"></i>
                                                        </asp:LinkButton>
                                                        <asp:LinkButton ID="deleteOtherImage" CommandName='<%# Eval("imgurl") %>' CommandArgument='<%# Eval("Id") %>' OnCommand="deleteOtherImage_Command" runat="server" CssClass="btn btn-outline-danger btn-sm" title="Delete">
                                            <i class="bi bi-trash"></i>
                                                        </asp:LinkButton>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:LinkButton ID="otherImagesupload" CommandArgument='<%# Eval("Id") %>' runat="server" OnCommand="otherImagesupload_Command" CssClass="btn btn-outline-primary btn-sm" title="Add More">
                            <i class="bi bi-plus-square"></i>
                                        </asp:LinkButton>
                                    </div>
                                </td>
                                <td>
                                    <video width="150" height="100" controls>
                                        <source src='<%# Eval("video") %>' type="video/mp4">
                                        Your browser does not support the video tag.
                                    </video>
                                    <asp:LinkButton ID="video_edit" CommandName='<%# Eval("video") %>' CommandArgument='<%# Eval("Id") %>' OnCommand="video_edit_Command" runat="server" CssClass="btn btn-outline-primary btn-sm mt-2" title="Edit">
                        <i class="bi bi-pencil-square"></i>
                                    </asp:LinkButton>
                                </td>
                                <td>
                                    <asp:Label ID="lblProductDescription" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                                </td>
                                <td>
                                    <div class="btn-group w-100" role="group">
                                        <asp:LinkButton ID="editProduct" CommandName='<%# Eval("img") %>' CommandArgument='<%# Eval("Id") %>' OnCommand="editProduct_Command" runat="server" CssClass="btn btn-outline-primary btn-sm" title="Edit">
                                        <i class="bi bi-pencil-square"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="deleteProduct" CommandName='<%# Eval("img") %>' CommandArgument='<%# Eval("Id") %>' OnCommand="deleteProduct_Command" runat="server" CssClass="btn btn-outline-danger btn-sm" title="Delete">
                                        <i class="bi bi-trash"></i>
                                        </asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>

            </div>
            <iv>
        </div>
    </div>

    <!-- Image Preview Modal Start -->

    <div class="modal fade" id="imagePreviewModal" tabindex="-1" aria-labelledby="imagePreviewModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <img id="modalImage" src="" class="img-fluid rounded" alt="Preview" />
                </div>
            </div>
        </div>
    </div>

    <!-- Image Preview Modal End -->

    <!-- Update Other Image Modal Start -->

    <div class="modal fade" id="fileUploadModal" tabindex="-1" aria-labelledby="fileUploadModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-md">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h5 class="modal-title" id="fileUploadModalLabel">Upload File</h5>
                    <!-- Custom Close Icon -->
                    <button class="close" data-bs-dismiss="modal" aria-label="Close" onclick="closeFileUploadModal()">&times;</button>
                </div>

                <!-- Modal Body -->
                <div class="modal-body text-center">
                    <asp:FileUpload ID="newImg" runat="server" />
                    <div id="newImagePreview"></div>
                    <asp:Button ID="btnUpdateOtherImg" runat="server" Text="Update" CssClass="btn btn-primary mt-5" OnClick="btnUpdateOtherImg_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Update Other Image Modal Start -->

    <!-- Add Other Image Modal Start -->

    <div class="modal fade" id="otherImageUploadModal" tabindex="-1" aria-labelledby="fileUploadModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="otherImageModalLabel">Upload File</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:Label ID="File_Remaining" runat="server" Text=""></asp:Label>
                    <asp:FileUpload ID="otherimageuploadname" runat="server" AllowMultiple="true" />
                    <div id="otherImageModalPreview"></div>
                    <asp:Button ID="otherImageUploadBtn" runat="server" Text="Update" OnClick="otherImageUploadBtn_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- Add Other Image Modal End -->

    <!--Video Update Start-->

        <div class="modal fade" id="videoUpdateModal" tabindex="-1" aria-labelledby="fileUploadModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="videoUpdateModalLabel">Upload File</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                        <asp:FileUpload ID="videoUpdateFileUpload" runat="server"/>
                        <div id="videoUpdateModalPreview"></div>
                        <asp:Button ID="videoUpdate" runat="server" Text="Update" OnClick="videoUpdate_Click" />
                    </div>
                </div>
            </div>
        </div>

    <!--Video Update End-->

    <script>
        document.getElementById('<%= newImg.ClientID %>').addEventListener("change", function (e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('newImagePreview').innerHTML = `
                        <div class="image-preview">
                            <img src="${e.target.result}" >
                        </div>`;
                };
                reader.readAsDataURL(file);//it give status DONE when file is read and at that time onload is triggered
            }
        })
    </script>
</asp:Content>
