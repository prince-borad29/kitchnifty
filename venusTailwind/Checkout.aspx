<%@ Page Title="" Language="C#" MasterPageFile="~/venusRedesigned.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="venusTailwind.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mx-auto p-6">
        <h1 class="text-3xl font-bold text-center text-gray-900">Checkout</h1>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-6">
            
            <!-- Billing Details -->
            <div class="bg-white p-6 rounded-lg shadow-md">
                <h2 class="text-xl font-semibold mb-4">Billing Details</h2>
                
                <div class="mb-4">
                    <label class="block text-gray-700">Full Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-green-600" />
                </div>

                <div class="mb-4">
                    <label class="block text-gray-700">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-green-600" />
                </div>

                <div class="mb-4">
                    <label class="block text-gray-700">Phone Number</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-green-600" />
                </div>
            </div>

            <!-- Shipping Address -->
            <div class="bg-white p-6 rounded-lg shadow-md">
                <h2 class="text-xl font-semibold mb-4">Shipping Address</h2>

                <div class="mb-4">
                    <label class="block text-gray-700">Street Address</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-green-600" />
                </div>

                <div class="mb-4 grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block text-gray-700">City</label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-green-600" />
                    </div>
                    <div>
                        <label class="block text-gray-700">State</label>
                        <asp:DropDownList ID="ddlState" runat="server" CssClass="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-green-600">
                            <asp:ListItem Text="Select State" Value="" />
                            <asp:ListItem Text="New York" Value="NY" />
                            <asp:ListItem Text="California" Value="CA" />
                            <asp:ListItem Text="Texas" Value="TX" />
                            <asp:ListItem Text="Florida" Value="FL" />
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="block text-gray-700">Zip Code</label>
                    <asp:TextBox ID="txtZipCode" runat="server" CssClass="w-full px-4 py-2 border rounded-lg focus:ring-2 focus:ring-green-600" />
                </div>
            </div>
        </div>

        <!-- Order Summary -->
        <div class="bg-white p-6 mt-6 rounded-lg shadow-md">
            <h2 class="text-xl font-semibold mb-4">Order Summary</h2>

            <div class="mb-4">
                <p class="text-gray-700">Subtotal: <span class="font-semibold text-gray-900">$99.99</span></p>
                <p class="text-gray-700">Shipping: <span class="font-semibold text-gray-900">$5.00</span></p>
                <p class="text-gray-900 font-bold text-lg">Total: <span class="text-green-600">$104.99</span></p>
            </div>

            <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Payment"
                CssClass="w-full bg-green-600 text-white font-bold py-3 rounded-lg hover:bg-green-700 transition duration-300" 
                 />
        </div>
    </div>
</asp:Content>
