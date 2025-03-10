<%@ Page Title="" Language="C#" MasterPageFile="~/venusRedesigned.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="venusTailwind.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section -->
    <div class="bg-gray-100 py-20">
        <div class="container mx-auto px-4 flex flex-col lg:flex-row items-center justify-between">
            <div class="lg:w-1/2">
                <h1 class="text-4xl font-bold text-gray-900">Modern Interior <span class="block text-blue-500">Design Studio</span></h1>
                <p class="mt-4 text-gray-700">Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit. Aliquam vulputate velit imperdiet dolor tempor tristique.</p>
                <a href="#" class="mt-6 inline-block bg-blue-500 text-white px-6 py-2 rounded-lg">Explore</a>
            </div>
            <div class="lg:w-1/2 mt-8 lg:mt-0">
                <img src="images/sofa.png" class="w-full" alt="Modern Interior">
            </div>
        </div>
    </div>
    
    <!-- Product Section -->
    <div class="container mx-auto py-16 px-4">
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            <div>
                <h2 class="text-2xl font-bold text-gray-900">Crafted with excellent material.</h2>
                <p class="mt-4 text-gray-700">Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit.</p>
                <a href="shop.html" class="mt-4 inline-block bg-gray-900 text-white px-6 py-2 rounded-lg">Explore</a>
            </div>
            
            <div class="bg-white p-4 rounded-lg shadow">
                <img src="images/product-1.png" class="w-full rounded-md" alt="Nordic Chair">
                <h3 class="mt-4 text-lg font-bold">Nordic Chair</h3>
                <strong class="text-blue-500">$50.00</strong>
            </div>
            <div class="bg-white p-4 rounded-lg shadow">
                <img src="images/product-2.png" class="w-full rounded-md" alt="Kruzo Aero Chair">
                <h3 class="mt-4 text-lg font-bold">Kruzo Aero Chair</h3>
                <strong class="text-blue-500">$78.00</strong>
            </div>
            <div class="bg-white p-4 rounded-lg shadow">
                <img src="images/product-3.png" class="w-full rounded-md" alt="Ergonomic Chair">
                <h3 class="mt-4 text-lg font-bold">Ergonomic Chair</h3>
                <strong class="text-blue-500">$43.00</strong>
            </div>
        </div>
    </div>

    <!-- We Help Section -->
    <div class="bg-gray-100 py-16">
        <div class="container mx-auto px-4 flex flex-col lg:flex-row items-center justify-between">
            <div class="lg:w-1/2 grid grid-cols-2 gap-4">
                <img src="images/img-grid-1.jpg" class="rounded-lg shadow" alt="Interior Design">
                <img src="images/img-grid-2.jpg" class="rounded-lg shadow" alt="Interior Design">
                <img src="images/img-grid-3.jpg" class="rounded-lg shadow col-span-2" alt="Interior Design">
            </div>
            <div class="lg:w-1/2 mt-8 lg:mt-0 lg:pl-12">
                <h2 class="text-2xl font-bold text-gray-900">We Help You Make Modern Interior Design</h2>
                <p class="mt-4 text-gray-700">Donec facilisis quam ut purus rutrum lobortis. Donec vitae odio quis nisl dapibus malesuada.</p>
                <ul class="mt-4 space-y-2 text-gray-700">
                    <li>✔ Donec vitae odio quis nisl dapibus malesuada</li>
                    <li>✔ Donec vitae odio quis nisl dapibus malesuada</li>
                    <li>✔ Donec vitae odio quis nisl dapibus malesuada</li>
                    <li>✔ Donec vitae odio quis nisl dapibus malesuada</li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>

