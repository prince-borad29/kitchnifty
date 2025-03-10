<%@ Page Title="" Language="C#" MasterPageFile="~/venusRedesigned.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="venusTailwind.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container mx-auto p-8">
        <h1 class="text-3xl font-bold text-center text-gray-900">Contact Us</h1>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 mt-8">

            <!-- Contact Information -->
            <div>
                <div class="bg-white p-6 rounded-lg shadow-md">
                    <h2 class="text-xl font-semibold mb-4">Our Contact Details</h2>

                    <div class="space-y-4">
                        <div class="flex items-center space-x-4">
                            <span class="text-green-600">
                                <i class="bi bi-geo-alt-fill text-2xl"></i>
                            </span>
                            <p class="text-gray-700">43 Raymouth Rd, London 3910</p>
                        </div>

                        <div class="flex items-center space-x-4">
                            <span class="text-green-600">
                                <i class="bi bi-envelope-fill text-2xl"></i>
                            </span>
                            <p class="text-gray-700">info@yourdomain.com</p>
                        </div>

                        <div class="flex items-center space-x-4">
                            <span class="text-green-600">
                                <i class="bi bi-telephone-fill text-2xl"></i>
                            </span>
                            <p class="text-gray-700">+1 294 3925 3939</p>
                        </div>
                    </div>
                </div>

                <!-- Google Map -->
                <div class="mt-6">
                    <iframe class="w-full h-64 rounded-lg shadow-md"
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.835434509365!2d144.95373511531556!3d-37.81720974201412!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad642af0f11fd81%3A0x5045675218cee17!2sMelbourne%20VIC%2C%20Australia!5e0!3m2!1sen!2s!4v1614308435915!5m2!1sen!2s"
                        allowfullscreen="" loading="lazy"></iframe>
                </div>
            </div>

            <!-- Contact Form -->
            <div class="bg-white p-6 rounded-lg shadow-md">
                <h2 class="text-xl font-semibold mb-4">Send Us a Message</h2>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="text-gray-700">First Name</label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-green-600" />
                    </div>
                    <div>
                        <label class="text-gray-700">Last Name</label>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-green-600" />
                    </div>
                </div>

                <div class="mt-4">
                    <label class="text-gray-700">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-green-600" />
                </div>

                <div class="mt-4">
                    <label class="text-gray-700">Message</label>
                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" CssClass="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-green-600" Rows="4"/>
                </div>

                <div class="mt-6">
                    <asp:Button ID="btnSubmit" runat="server" Text="Send Message"
                        CssClass="w-full bg-green-600 text-white font-bold py-3 rounded-lg hover:bg-green-700 transition duration-300" />
                </div>
            </div>

        </div>
    </div>

</asp:Content>

