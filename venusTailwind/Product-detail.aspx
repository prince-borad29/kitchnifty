<%@ Page Title="" Language="C#" MasterPageFile="~/venusRedesigned.Master" AutoEventWireup="true" CodeBehind="Product-detail.aspx.cs" Inherits="venusTailwind.Product_detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mx-auto p-8">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">

            <!-- Product Gallery -->
            <div class="space-y-4">
            <img id="mainImage" src="images/product-1.png" class="w-full h-[400px] object-contain rounded-lg shadow-md bg-gray-100 p-2" alt="Nordic Chair">
       
                <div class="flex space-x-4">
                    <img src="images/product-1.png" alt="Nordic Chair View 1" class="thumbnail w-20 h-20 cursor-pointer border-2 border-transparent rounded-lg hover:border-green-600">
                    <img src="images/product-2.png" alt="Nordic Chair View 2" class="thumbnail w-20 h-20 cursor-pointer border-2 border-transparent rounded-lg hover:border-green-600">
                    <img src="images/product-3.png" alt="Nordic Chair View 3" class="thumbnail w-20 h-20 cursor-pointer border-2 border-transparent rounded-lg hover:border-green-600">
                </div>
            </div>

            <!-- Product Info -->
            <div class="space-y-6">
                <h2 class="text-3xl font-bold text-gray-900">Nordic Chair</h2>
                <strong class="text-2xl text-green-700">$50.00</strong>

                <p class="text-gray-600">Experience the perfect blend of style and comfort with our Nordic Chair. Crafted with premium materials and designed with modern aesthetics in mind, this chair is perfect for any contemporary space.</p>

                <!-- Quantity Selector -->
                <div class="flex items-center space-x-4">
                    <button type="button" class="bg-gray-300 text-gray-800 px-4 py-2 rounded-lg hover:bg-gray-400" onclick="decreaseQty(event)">−</button>
                    <asp:TextBox ID="QtyTextBox" CssClass="w-12 text-center border rounded-lg" Text="1" runat="server" BorderStyle="None"></asp:TextBox>
                    <button type="button" class="bg-gray-300 text-gray-800 px-4 py-2 rounded-lg hover:bg-gray-400" onclick="increaseQty(event)">+</button>
                </div>

                <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart"
                    CssClass="bg-green-700 text-white py-3 px-6 rounded-lg font-semibold hover:bg-green-800 transition duration-300" />

                <!-- Product Details -->
                <div class="bg-gray-100 p-4 rounded-lg">
                    <h4 class="text-xl font-semibold mb-3">Product Details</h4>

                    <table class="w-full text-gray-700">
                        <tr class="border-b">
                            <td class="py-2 font-semibold">Materials</td>
                            <td>Solid Oak Wood, Premium Fabric</td>
                        </tr>
                        <tr class="border-b">
                            <td class="py-2 font-semibold">Dimensions</td>
                            <td>W: 60cm x D: 65cm x H: 85cm</td>
                        </tr>
                        <tr class="border-b">
                            <td class="py-2 font-semibold">Weight</td>
                            <td>8.5 kg</td>
                        </tr>
                        <tr>
                            <td class="py-2 font-semibold">Assembly</td>
                            <td>Required (Tools Included)</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
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
    </script>

</asp:Content>

