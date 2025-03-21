<%@ Page Title="" Language="C#" MasterPageFile="~/venusRedesigned.Master" AutoEventWireup="true" CodeBehind="Product-detail.aspx.cs" Inherits="venusTailwind.Product_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Repeater ID="rptProduct" runat="server" OnItemDataBound="rptProduct_ItemDataBound">
        <ItemTemplate>
            <div class="container mx-auto p-8">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">

                    <!-- Product Gallery -->
                    <div class="space-y-4">

                        <%--<img id="mainImage" src="images/product-1.png" class="w-full h-[400px] object-contain rounded-lg shadow-md bg-gray-100 p-2" alt="Nordic Chair">--%>
                        <asp:Image ID="imgProduct" runat="server" ImageUrl='<%#Eval("imageMain") %>' class="w-full h-[460px] object-contain rounded-lg shadow-md bg-gray-100 p-2" />

                        <div class="grid grid-cols-5 gap-4">
                            <asp:Repeater ID="rptOtherImages" runat="server">
                                <ItemTemplate>
                                    <img src='<%#Eval("imageOther")%>' alt="Nordic Chair View"
                                        class="thumbnail w-20 h-20 cursor-pointer border-2 border-transparent rounded-lg hover:border-green-600">
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                    </div>

                    <!-- Product Info -->
                    <div class="space-y-6">
                        <%--<h2 class="text-3xl font-bold text-gray-900">Nordic Chair</h2>--%>
                        <asp:Label ID="lblProductName" runat="server" Text='<%#Eval("product_name") %>' class="text-3xl font-bold text-gray-900"></asp:Label>
                        <p>
                            ₹<asp:Label ID="lblPrice" runat="server" Text='<%#Eval("price") %>'></asp:Label>
                        </p>


                        <p class="text-gray-600">
                            <asp:Label ID="Label1" class="text-gray-600" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                        </p>

                        <!-- Quantity Selector -->
                        <div class="flex items-center space-x-4">
                            <button type="button" class="bg-gray-300 text-gray-800 px-4 py-2 rounded-lg hover:bg-gray-400" onclick="decreaseQty(event)">−</button>
                            <asp:TextBox ID="QtyTextBox" CssClass="w-12 text-center border rounded-lg" Text="1" runat="server" BorderStyle="None"></asp:TextBox>
                            <button type="button" class="bg-gray-300 text-gray-800 px-4 py-2 rounded-lg hover:bg-gray-400" onclick="increaseQty(event)">+</button>
                        </div>

                        <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart"
                            CssClass="bg-green-700 text-white py-3 px-6 rounded-lg font-semibold hover:bg-green-800 transition duration-300" />

                        <div class="flex">
                            <div class="relative w-50 h-[300px] rounded-2xl overflow-hidden p-3">
                                <video id="vid1" controls class="w-full h-full rounded-lg">
                                    <source src='<%#Eval("videoUrl") %>' type="video/mp4" />
                                    Your browser does not support the video tag.
                                </video>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <asp:Repeater ID="Repeater1" runat="server"></asp:Repeater>
    <%-- <script>
        function increaseQty(e) {
            e.preventDefault();
            var qtyTextBox = document.getElementById('<%= QtyTextBox.ClientID %>');
            if (qtyTextBox) {
                var currentValue = parseInt(qtyTextBox.value) || 1;
                if (currentValue < 99) qtyTextBox.value = currentValue + 1;
            }
        }

        function decreaseQty(e) {
            e.preventDefault();
            var qtyTextBox = document.getElementById('<%= QtyTextBox.ClientID %>');
            if (qtyTextBox) {
                var currentValue = parseInt(qtyTextBox.value) || 1;
                if (currentValue > 1) qtyTextBox.value = currentValue - 1;
            }
        }

        document.addEventListener('DOMContentLoaded', function () {
            const mainImage = document.getElementById('mainImage');
            const thumbnails = document.querySelectorAll('.thumbnail');

            thumbnails.forEach(thumbnail => {
                thumbnail.addEventListener('click', function () {
                    mainImage.src = this.src;
                    mainImage.alt = this.alt;
                });
            });
        });
    </script>--%>
</asp:Content>

