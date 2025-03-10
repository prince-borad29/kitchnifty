<%@ Page Title="" Language="C#" MasterPageFile="~/venusRedesigned.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="venusTailwind.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Why Choose Us Section -->
    <div class="px-6 py-12 bg-gray-100">
        <div class="max-w-7xl mx-auto">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8 items-center">
                <!-- Text Content -->
                <div>
                    <h2 class="text-3xl font-bold text-gray-800">Why Choose Us</h2>
                    <p class="text-gray-600 mt-3">Donec vitae odio quis nisl dapibus malesuada. Nullam ac aliquet velit.</p>

                    <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 mt-6">
                        <div class="bg-white shadow p-4 rounded-lg text-center">
                            <img src="images/truck.svg" class="w-12 h-12 mx-auto" />
                            <h3 class="text-lg font-semibold mt-3">Fast & Free Shipping</h3>
                            <p class="text-sm text-gray-500">Quick delivery with zero extra cost.</p>
                        </div>
                        <div class="bg-white shadow p-4 rounded-lg text-center">
                            <img src="images/bag.svg" class="w-12 h-12 mx-auto" />
                            <h3 class="text-lg font-semibold mt-3">Easy to Shop</h3>
                            <p class="text-sm text-gray-500">User-friendly shopping experience.</p>
                        </div>
                        <div class="bg-white shadow p-4 rounded-lg text-center">
                            <img src="images/support.svg" class="w-12 h-12 mx-auto" />
                            <h3 class="text-lg font-semibold mt-3">24/7 Support</h3>
                            <p class="text-sm text-gray-500">Always here to assist you.</p>
                        </div>
                        <div class="bg-white shadow p-4 rounded-lg text-center">
                            <img src="images/return.svg" class="w-12 h-12 mx-auto" />
                            <h3 class="text-lg font-semibold mt-3">Hassle-Free Returns</h3>
                            <p class="text-sm text-gray-500">Easy & quick returns process.</p>
                        </div>
                    </div>
                </div>

                <!-- Image -->
                <div>
                    <img src="images/why-choose-us-img.jpg" class="w-full h-full object-cover rounded-lg shadow-lg" />
                </div>
            </div>
        </div>
    </div>

    <!-- Testimonials Section -->
    <div class="px-6 py-12 bg-white">
        <div class="max-w-7xl mx-auto text-center">
            <h2 class="text-3xl font-bold text-gray-800">Testimonials</h2>
        </div>

        <div class="max-w-4xl mx-auto mt-8">
            <div class="relative">
                <div class="flex overflow-x-auto space-x-6 snap-x snap-mandatory pb-4">
                    <!-- Testimonial 1 -->
                    <div class="min-w-[300px] bg-gray-100 p-6 rounded-lg snap-center shadow">
                        <p class="text-gray-600 italic">"Amazing shopping experience! Will definitely return."</p>
                        <div class="mt-4 flex flex-col items-center">
                            <img src="images/person-1.png" class="w-14 h-14 rounded-full object-cover" />
                            <h3 class="font-semibold mt-2">Maria Jones</h3>
                            <span class="text-sm text-gray-500">CEO, XYZ Inc.</span>
                        </div>
                    </div>

                    <!-- Testimonial 2 -->
                    <div class="min-w-[300px] bg-gray-100 p-6 rounded-lg snap-center shadow">
                        <p class="text-gray-600 italic">"Excellent service and top-quality products."</p>
                        <div class="mt-4 flex flex-col items-center">
                            <img src="images/person-1.png" class="w-14 h-14 rounded-full object-cover" />
                            <h3 class="font-semibold mt-2">John Doe</h3>
                            <span class="text-sm text-gray-500">Founder, ABC Ltd.</span>
                        </div>
                    </div>

                    <!-- Testimonial 3 -->
                    <div class="min-w-[300px] bg-gray-100 p-6 rounded-lg snap-center shadow">
                        <p class="text-gray-600 italic">"Fast delivery and great support!"</p>
                        <div class="mt-4 flex flex-col items-center">
                            <img src="images/person-1.png" class="w-14 h-14 rounded-full object-cover" />
                            <h3 class="font-semibold mt-2">Emma Smith</h3>
                            <span class="text-sm text-gray-500">Manager, DEF Corp.</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

