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
            aria-hidden="true">
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
                    <table class="table table-bordered" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Image</th>
                                <th>Images</th>
                                <th>Video</th>
                                <th>Description</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <asp:Repeater ID="rptProduct" runat="server">
                                    <ItemTemplate>
                                        <td> 
                                            <asp:Label ID="lblProductName" runat="server" Text='<%#Eval("product_name") %>'></asp:Label>
                                        </td>
                                        <td> 
                                            <asp:Label ID="lblProductPrice" runat="server" Text='<%#Eval("price") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Image ID="productMainImg" ImageUrl='<%#Eval("image_url") %>' runat="server" />
                                        </td>
                                        <td>
                                            <asp:Repeater ID="rptProductImg" runat="server">
                                                <ItemTemplate>
                                                    <asp:Image ID="productOtherImg" ImageUrl='<%#Eval("image_url") %>' runat="server" />
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </td>
                                        <td>
                                            <video width="100" height="100" controls>
                                                <source src='<%# Eval("video_url") %>' type="video/mp4"/>
                                                Can't Load Video
                                            </video>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblProductDescription" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <iv>
        </div>
    </div>

</asp:Content>
