<%@ Page Title="" Language="C#" MasterPageFile="~/venusRedesigned.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="venusTailwind.Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <!-- Hero Section -->
    <div class="relative bg-cover bg-center h-[400px] flex items-center justify-center text-center text-white" style="background-image: url('images/hero-bg.jpg');">
        <div class="bg-black bg-opacity-50 w-full h-full absolute top-0 left-0"></div>
        <div class="relative z-10 px-6">
            <h1 class="text-4xl font-bold">Find Your Perfect Chair</h1>
            <p class="text-lg mt-2">Discover the best furniture at unbeatable prices.</p>
            <a href="#products" class="mt-4 inline-block bg-green-700 text-white px-6 py-2 rounded-lg hover:bg-green-800 transition">Shop Now</a>
        </div>
    </div>

    <!-- Search Bar -->
    <%--<div class="flex justify-center py-6">
        <input type="text" id="searchInput" class="border px-4 py-2 rounded-l-md w-[300px] focus:outline-none focus:ring-2 focus:ring-green-700" placeholder="Search products..." />
        <button onclick="searchProducts()" class="bg-green-700 text-white px-4 py-2 rounded-r-md hover:bg-green-800 transition">
            <i class="fas fa-search"></i>
        </button>
    </div>--%>

    <!-- Product Section -->
    <div id="products" class="untree_co-section product-section before-footer-section px-4 py-6">
        <div class="container mx-auto">
            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                <!-- Product Card -->
                <div class="bg-white shadow-lg rounded-lg overflow-hidden">
                    <a href="Product-detail.aspx" class="block w-full">
                        <img src="images/product-7.png" class="w-full h-full object-cover aspect-[4/3] rounded-lg" />
                    </a>
                    <div class="pl-4 pt-14 pb-4">
                        <h3 class="text-lg font-semibold">Nordic Chair</h3>
                        <strong class="text-green-600">$50.00</strong>
                        <%--<div class="flex justify-between items-center mt-3">
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/shopping-bag.png" class="btn btn-primary btn-sm add-to-cart" />
                            <asp:ImageButton ID="ImageButton2" runat="server" class="btn btn-secondary btn-sm view-item" ImageUrl="~/images/view.png" />
                        </div>--%>
                    </div>
                </div>
                <!-- Add more product cards here -->
            </div>
        </div>
    </div>

    <!-- Search Function -->
    <script>
        function searchProducts() {
            var input = document.getElementById("searchInput").value.toLowerCase();
            var products = document.querySelectorAll(".product-section .bg-white");

            products.forEach(function (product) {
                var title = product.querySelector("h3").textContent.toLowerCase();
                if (title.includes(input)) {
                    product.style.display = "block";
                } else {
                    product.style.display = "none";
                }
            });
        }
    </script>
</asp:Content>
