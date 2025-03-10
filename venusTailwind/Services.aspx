<%@ Page Title="" Language="C#" MasterPageFile="~/venusMasterSetup.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="venusMasterPageSetup.Shop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mx-auto py-10">
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
            <!-- Product Card 1 -->
            <div class="bg-white shadow-md rounded-lg overflow-hidden">
                <a href="Product-detail.aspx">
                    <img src="images/product-7.png" class="w-full h-48 object-cover">
                </a>
                <div class="p-4 flex justify-between items-center">
                    <div>
                        <h3 class="text-lg font-semibold">Nordic Chair</h3>
                        <p class="text-gray-600">$50.00</p>
                    </div>
                    <div class="flex space-x-2">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/shopping-bag.png" CssClass="w-8 h-8" />
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/view.png" CssClass="w-8 h-8" OnClick="ImageButton2_Click" />
                    </div>
                </div>
            </div>
            
            <!-- Product Card 2 -->
            <div class="bg-white shadow-md rounded-lg overflow-hidden">
                <a href="Product-detail.aspx">
                    <img src="images/product-9.png" class="w-full h-48 object-cover">
                </a>
                <div class="p-4">
                    <h3 class="text-lg font-semibold">Ergonomic Chair</h3>
                    <p class="text-gray-600">$43.00</p>
                </div>
            </div>
            
            <!-- Product Card 3 -->
            <div class="bg-white shadow-md rounded-lg overflow-hidden">
                <a href="Product-detail.aspx">
                    <img src="images/product-2.png" class="w-full h-48 object-cover">
                </a>
                <div class="p-4">
                    <h3 class="text-lg font-semibold">Kruzo Aero Chair</h3>
                    <p class="text-gray-600">$78.00</p>
                </div>
            </div>
            
            <!-- Product Card 4 -->
            <div class="bg-white shadow-md rounded-lg overflow-hidden">
                <a href="Product-detail.aspx">
                    <img src="images/product-3.png" class="w-full h-48 object-cover">
                </a>
                <div class="p-4">
                    <h3 class="text-lg font-semibold">Ergonomic Chair</h3>
                    <p class="text-gray-600">$43.00</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
