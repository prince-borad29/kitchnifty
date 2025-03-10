<%@ Page Title="" Language="C#" MasterPageFile="~/venusRedesigned.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="venusTailwind.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mx-auto max-w-5xl px-4 py-6">
        
        <!-- Profile Header -->
        <div class="bg-white shadow-md rounded-lg p-6 flex flex-col md:flex-row items-center">
            <img src="images/person_2.jpg" alt="Profile Picture" class="w-28 h-28 rounded-full object-cover border-4 border-green-500">
            <div class="ml-6 text-center md:text-left">
                <h2 class="text-2xl font-semibold">John Doe</h2>
                <p class="text-gray-600"><i class="fas fa-envelope mr-2"></i> johndoe@example.com</p>
                <p class="text-gray-600"><i class="fas fa-phone mr-2"></i> +1 (555) 123-4567</p>
                <p class="text-gray-500 text-sm"><i class="fas fa-calendar mr-2"></i> Member since January 2024</p>
            </div>
        </div>

        <!-- Profile Information -->
        <div class="bg-white shadow-md rounded-lg p-6 mt-6">
            <h3 class="text-xl font-semibold mb-4">Profile Information</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700">First Name</label>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-input w-full p-2 border rounded-md" />
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Last Name</label>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-input w-full p-2 border rounded-md" />
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input w-full p-2 border rounded-md" TextMode="Email" />
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Phone</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-input w-full p-2 border rounded-md" />
                </div>
            </div>
            <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" CssClass="mt-4 w-60 bg-green-600 text-white py-2 rounded-md hover:bg-green-700 cursor-pointer transition" />
        </div>

        <!-- Order History -->
        <div class="bg-white shadow-md rounded-lg p-6 mt-6">
            <h3 class="text-xl font-semibold mb-4">Order History</h3>
            <div class="overflow-x-auto">
                <table class="w-full border-collapse border border-gray-300">
                    <thead class="bg-gray-100">
                        <tr>
                            <th class="p-2 border">Order ID</th>
                            <th class="p-2 border">Date</th>
                            <th class="p-2 border">Items</th>
                            <th class="p-2 border">Status</th>
                            <th class="p-2 border">Total</th>
                            <th class="p-2 border">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="hover:bg-gray-50 text-center">
                            <td class="p-2 border">#12345</td>
                            <td class="p-2 border">Jan 8, 2024</td>
                            <td class="p-2 border">3 items</td>
                            <td class="p-2 border"><span class="bg-green-500 text-white px-2 py-1 rounded">Delivered</span></td>
                            <td class="p-2 border">$299.00</td>
                            <td class="p-2 border">
                                <asp:Button class="text-blue-500 hover:underline" ID="Button1" runat="server" Text="View Details" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Address Section -->
        <div class="bg-white shadow-md rounded-lg p-6 mt-6">
            <h3 class="text-xl font-semibold mb-4">My Addresses</h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="bg-gray-50 border rounded-lg p-4">
                    <h4 class="text-lg font-semibold flex items-center"><i class="fas fa-home mr-2"></i>Home Address</h4>
                    <p class="text-gray-600 text-sm">123 Main Street, New York, NY 10001, USA</p>
                    <div class="mt-3 flex space-x-2">
                        
                        <button class="text-blue-500 hover:underline">Edit</button>
                        <button class="text-red-500 hover:underline">Delete</button>
                    </div>
                </div>
                <div class="bg-gray-50 border rounded-lg p-4">
                    <h4 class="text-lg font-semibold flex items-center"><i class="fas fa-building mr-2"></i>Office Address</h4>
                    <p class="text-gray-600 text-sm">456 Business Ave, New York, NY 10002, USA</p>
                    <div class="mt-3 flex space-x-2">
                        <button class="text-blue-500 hover:underline">Edit</button>
                        <button class="text-red-500 hover:underline">Delete</button>
                    </div>
                </div>
            </div>
            <button class="mt-4 w-60 bg-green-600 text-white py-2 rounded-md hover:bg-green-700 transition cursor-pointer">
                <i class="fas fa-plus mr-2"></i>Add New Address
            </button>
            
        </div>

    </div>
</asp:Content>

