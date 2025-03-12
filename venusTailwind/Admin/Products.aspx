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
                                    <label for="imgProducts">Product Images</label>
                                    <asp:FileUpload ID="imgProducts" AllowMultiple="true" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnAdd" class="btn btn-primary" runat="server" Text="Add" />
                        </div>
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

</asp:Content>
