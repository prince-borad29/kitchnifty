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

    <div class="container mx-auto px-4 py-6">
        <div class="flex flex-wrap items-center justify-between gap-4">

            <!-- Category Filter -->
            <div class="w-full sm:w-auto">
                <label for="ddlCategory" class="block text-sm font-medium text-gray-700">Category</label>
                <asp:DropDownList AutoPostBack="true" ID="ddlCategory" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" runat="server" CssClass="block w-full px-3 py-2 border rounded-lg shadow-sm focus:ring focus:ring-blue-300">
                </asp:DropDownList>
            </div>

            <!-- Price Filter -->
            <%--<div class="w-full sm:w-auto">
            <label for="ddlPrice" class="block text-sm font-medium text-gray-700">Price</label>
            <asp:DropDownList ID="ddlPrice" runat="server" CssClass="block w-full px-3 py-2 border rounded-lg shadow-sm focus:ring focus:ring-blue-300">
                <asp:ListItem Text="All Prices" Value="" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Under ₹500" Value="500"></asp:ListItem>
                <asp:ListItem Text="₹500 - ₹1000" Value="1000"></asp:ListItem>
                <asp:ListItem Text="₹1000 - ₹5000" Value="5000"></asp:ListItem>
            </asp:DropDownList>
        </div>--%>

            <!-- Sorting Options -->
            <%-- <div class="w-full sm:w-auto">
            <label for="ddlSort" class="block text-sm font-medium text-gray-700">Sort By</label>
            <asp:DropDownList ID="ddlSort" runat="server" CssClass="block w-full px-3 py-2 border rounded-lg shadow-sm focus:ring focus:ring-blue-300">
                <asp:ListItem Text="Default" Value="default" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Price: Low to High" Value="low-high"></asp:ListItem>
                <asp:ListItem Text="Price: High to Low" Value="high-low"></asp:ListItem>
                <asp:ListItem Text="Newest Arrivals" Value="newest"></asp:ListItem>
            </asp:DropDownList>
        </div>--%>

            <!-- Submit Button -->
            <%--   <div class="w-full sm:w-auto mt-2 sm:mt-6">
            <asp:Button ID="btnFilter" runat="server" Text="Apply Filters"
                CssClass="px-4 py-2 bg-blue-600 text-white font-semibold rounded-lg shadow hover:bg-blue-700 transition" 
                 />
        </div>--%>
        </div>
    </div>


    <!-- Product Section -->
    <%--   <div id="products" class="untree_co-section product-section before-footer-section px-4 py-6">
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
                        <div class="flex justify-between items-center mt-3">
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/shopping-bag.png" class="btn btn-primary btn-sm add-to-cart" />
                            <asp:ImageButton ID="ImageButton2" runat="server" class="btn btn-secondary btn-sm view-item" ImageUrl="~/images/view.png" />
                        </div>
                    </div>
                </div>
                <!-- Add more product cards here -->
            </div>
        </div>
    </div>--%>

    <asp:Repeater ID="rptProducts" runat="server" OnItemDataBound="rptProducts_ItemDataBound">
        <HeaderTemplate>
            <div class="untree_co-section product-section before-footer-section px-4 py-6">
                <div class="container mx-auto">
                    <div class="grid grid-cols-2 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-6">
        </HeaderTemplate>

        <ItemTemplate>
            <!-- Product Card -->
            <div class="bg-white shadow-lg rounded-lg overflow-hidden">
                <img src='<%# Eval("imageMain") %>' alt="Product Image"
                    class="w-full h-48 object-cover rounded-t-lg" />
                <div class="p-4">
                    <h3 class="text-lg font-semibold text-gray-800"><%# Eval("product_name") %></h3>
                    <div class="flex justify-between items-center mt-2">
                        <span class="text-green-600 font-bold">₹<%# Eval("price") %></span>
                    </div>
                    <div class="flex justify-between items-center mt-3 space-x-2">
                        <asp:HiddenField ID="hfProductId" Value='<%# Eval("product_id") %>' runat="server" />

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:ImageButton ID="btnAddToCart" runat="server"
                            ImageUrl="~/images/shopping-bag.png"
                            OnCommand="btnAddToCart_Command"
                            CommandArgument='<%# Eval("product_id") %>'
                            class="btn bg-amber-500 hover:bg-green-600 text-white font-semibold shadow-md px-4 py-2 rounded-lg" />

                        <asp:ImageButton ID="btnGotoCart" runat="server"
                            ImageUrl="~/images/shopping-bag.png"
                            OnCommand="btnGotoCart_Command"
                            CommandArgument='<%# Eval("product_id") %>'
                            class="btn bg-green-500 hover:bg-amber-600 text-white font-semibold shadow-md px-4 py-2 rounded-lg"
                            Visible="false"/>
                            </ContentTemplate>
                             <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnAddToCart" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnGotoCart" EventName="Click" />
                </Triggers>
                        </asp:UpdatePanel>

                        <asp:ImageButton ID="viewbtn" runat="server"
                            ImageUrl="~/images/view.png"
                            OnCommand="viewbtn_Command"
                            CommandArgument='<%# Eval("product_id") %>'
                            class="btn bg-red-500 hover:bg-red-600 text-white font-semibold shadow-md px-4 py-2 rounded-lg" />
                    </div>

                </div>
            </div>
        </ItemTemplate>

        <FooterTemplate>
            </div>
            </div>
        </div>
        </FooterTemplate>
    </asp:Repeater>



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
