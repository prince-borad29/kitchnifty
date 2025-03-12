<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="venusTailwind.Admin.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="mb-4">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
                Add Product
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalCenterTitle">Add Product</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div>
                                <div class="form-group">
                                    <label for="txtProductName">Product Name</label>
                                    <asp:TextBox ID="txtProductName" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtProductPrice">Product Price</label>
                                    <asp:TextBox ID="txtProductPrice" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtProductQty">Product Qty</label>
                                    <asp:TextBox ID="txtProductQty" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="txtProductDesc">Product Description</label>
                                    <asp:TextBox ID="txtProductDesc" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="imgMainProduct">Product Main Image</label>
                                    <asp:FileUpload ID="imgMainProduct" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label>Product Images</label><br />
                                    <button type="button" class="btn btn-secondary" onclick="openMediaLibrary()">Select Product Images</button>

                                    <!-- Hidden field to store selected image names (comma-separated) -->
                                    <asp:HiddenField ID="hfSelectedImages" runat="server" />

                                    <!-- Image preview area -->
                                    <div id="selectedImagesPreview" class="d-flex flex-wrap mt-2"></div>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnAdd" class="btn btn-primary" OnClick="btnAdd_Click" runat="server" Text="Add" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Media Library Modal -->
        <div class="modal fade" id="mediaLibraryModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Media Library</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div id="mediaGallery" class="d-flex flex-wrap"></div>
                        <p id="noImagesMsg" style="display: none;">No images uploaded</p>
                        <button class="btn btn-success mt-2" onclick="document.getElementById('uploadFile').click()">Upload Image</button>
                        <input type="file" id="uploadFile" hidden multiple />
                    </div>
                </div>
            </div>
        </div>


        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Product List</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Position</th>
                                <th>Office</th>
                                <th>Age</th>
                                <th>Start date</th>
                                <th>Salary</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>Tiger Nixon</td>
                                <td>System Architect</td>
                                <td>Edinburgh</td>
                                <td>61</td>
                                <td>2011/04/25</td>
                                <td>$320,800</td>
                            </tr>
                            <tr>
                                <td>Garrett Winters</td>
                                <td>Accountant</td>
                                <td>Tokyo</td>
                                <td>63</td>
                                <td>2011/07/25</td>
                                <td>$170,750</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
    <!-- /.container-fluid -->

    <script>
        let selectedImages = [];

        function openMediaLibrary(productId = 0) {
            // Load images based on productId
            $.get(`Products.aspx?getImages=1&productId=${productId}`, function (data) {
                if (data.trim() === '') {
                    $('#noImagesMsg').show();
                } else {
                    $('#noImagesMsg').hide();
                    $('#mediaGallery').html(data);
                }
                $('#mediaLibraryModal').modal('show');
            });
        }

        function selectImage(fileName, imgElement) {
            if (selectedImages.includes(fileName)) {
                selectedImages = selectedImages.filter(img => img !== fileName);
                $(imgElement).removeClass('selected');
            } else {
                if (selectedImages.length >= 9) {
                    alert('You can select up to 9 images only.');
                    return;
                }
                selectedImages.push(fileName);
                $(imgElement).addClass('selected');
            }
            updateSelectedImagesPreview();
        }

        function updateSelectedImagesPreview() {
            $('#selectedImagesPreview').empty();
            selectedImages.forEach(img => {
                $('#selectedImagesPreview').append(`<img src='/uploads/library/${img}' width='80' height='80' class='m-1' />`);
            });
            $('#<%= hfSelectedImages.ClientID %>').val(selectedImages.join(','));
        }

        // Upload new images
        $('#uploadFile').change(function () {
            let files = this.files;
            if (files.length + $('#mediaGallery img').length > 9) {
                alert('Cannot upload more than 9 images total.');
                return;
            }
            let formData = new FormData();
            $.each(files, function (i, file) {
                formData.append('file[]', file);
            });
            $.ajax({
                url: 'Products.aspx?uploadImage=1',
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                success: function () { openMediaLibrary(); } // Refresh library
            });
        });

    </script>

</asp:Content>
