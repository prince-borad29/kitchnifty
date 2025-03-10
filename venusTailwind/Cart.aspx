<%@ Page Title="" Language="C#" MasterPageFile="~/venusRedesigned.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="venusTailwind.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="bg-white py-8 antialiased dark:bg-gray-900 md:py-16">
        <div class="mx-auto max-w-screen-xl px-4 2xl:px-0">
            <h2 class="text-xl font-semibold text-gray-900 dark:text-white sm:text-2xl">Shopping Cart</h2>

            <div class="mt-6 sm:mt-8 md:gap-6 lg:flex lg:items-start xl:gap-8">
                <!-- Left Side: Cart Items -->
                <div class="mx-auto w-full flex-none lg:max-w-2xl xl:max-w-4xl">

                    <!-- Item 1 -->
                    <div class="rounded-lg border border-gray-200 bg-white p-4 shadow-sm md:p-6">
                        <div class="space-y-4 md:flex md:items-center md:justify-between md:gap-6 md:space-y-0">
                            <img class="h-20 w-20" src="https://flowbite.s3.amazonaws.com/blocks/e-commerce/imac-front.svg" alt="Apple iMac (24-inch)" />
                            <div class="w-full min-w-0 flex-1 space-y-4">
                                <p class="text-base font-medium text-gray-900">Apple iMac (24-inch)</p>
                                <div class="flex items-center gap-4">
                                    <asp:Button ID="btnDecrease1" runat="server" Text="-" CssClass="px-3 py-1 bg-gray-300 text-gray-900 rounded-lg" OnClick="DecreaseQuantity1" />
                                    <asp:Label ID="lblQty1" runat="server" Text="1" CssClass="text-lg font-semibold"></asp:Label>
                                    <asp:Button ID="btnIncrease1" runat="server" Text="+" CssClass="px-3 py-1 bg-gray-300 text-gray-900 rounded-lg" OnClick="IncreaseQuantity1" />
                                </div>
                                <div class="flex items-center gap-4">
                                    <asp:Button ID="btnRemove1" runat="server" Text="Remove" CssClass="text-sm font-medium text-red-600 hover:underline" />
                                </div>
                            </div>
                            <p class="text-base font-bold text-gray-900">$<asp:Label ID="lblPrice1" runat="server" Text="1499.00"></asp:Label></p>
                        </div>
                    </div>

                    <!-- Item 2 -->
                    <div class="rounded-lg border border-gray-200 bg-white p-4 shadow-sm md:p-6 mt-4">
                        <div class="space-y-4 md:flex md:items-center md:justify-between md:gap-6 md:space-y-0">
                            <img class="h-20 w-20" src="https://flowbite.s3.amazonaws.com/blocks/e-commerce/keyboard.svg" alt="Apple Magic Keyboard" />
                            <div class="w-full min-w-0 flex-1 space-y-4">
                                <p class="text-base font-medium text-gray-900">Apple Magic Keyboard</p>
                                <div class="flex items-center gap-4">
                                    <asp:Button ID="btnDecrease2" runat="server" Text="-" CssClass="px-3 py-1 bg-gray-300 text-gray-900 rounded-lg" OnClick="DecreaseQuantity2" />
                                    <asp:Label ID="lblQty2" runat="server" Text="1" CssClass="text-lg font-semibold"></asp:Label>
                                    <asp:Button ID="btnIncrease2" runat="server" Text="+" CssClass="px-3 py-1 bg-gray-300 text-gray-900 rounded-lg" OnClick="IncreaseQuantity2" />
                                </div>
                                <div class="flex items-center gap-4">
                                    <asp:Button ID="btnRemove2" runat="server" Text="Remove" CssClass="text-sm font-medium text-red-600 hover:underline" />
                                </div>
                            </div>
                            <p class="text-base font-bold text-gray-900">$<asp:Label ID="lblPrice2" runat="server" Text="299.00"></asp:Label></p>
                        </div>
                    </div>

                </div>

                <!-- Right Side: Order Summary -->
                <div class="mx-auto mt-6 max-w-4xl flex-1 space-y-6 lg:mt-0 lg:w-full">
                    <div class="space-y-4 rounded-lg border border-gray-200 bg-white p-4 shadow-sm sm:p-6">
                        <p class="text-xl font-semibold text-gray-900">Order Summary</p>
                        <div class="space-y-2">
                            <dl class="flex items-center justify-between gap-4">
                                <dt class="text-base font-normal text-gray-500">Total</dt>
                                <dd class="text-base font-bold text-gray-900">$<asp:Label ID="lblTotal" runat="server" Text="1798.00"></asp:Label></dd>
                            </dl>
                        </div>
                        <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout" CssClass="w-full bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>



