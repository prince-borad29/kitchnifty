<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signin.aspx.cs" Inherits="venusTailwind.Signin" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="flex items-center justify-center min-h-screen bg-gray-100">
    <div class="flex flex-col md:flex-row items-center justify-center w-full max-w-4xl bg-white shadow-lg rounded-lg overflow-hidden">
        <div class="hidden md:block w-1/2">
            <img src="https://images.unsplash.com/photo-1592923750193-0caa23a10e1f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGx1eHVyeSUyMGZ1cm5pdHVyZXxlbnwwfDB8MHx8fDA%3D" alt="Login Image" class="object-cover w-full h-full">
        </div>
        <form runat="server" class="w-full md:w-1/2 p-6">
            <h2 class="text-2xl font-bold text-center text-gray-700 mb-4">Login</h2>
            
            <div class="mb-4">
                <label for="txtEmail" class="block text-gray-600 mb-1">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" CssClass="text-red-500 text-sm" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format" ValidationExpression="^[^\s@]+@[^\s@]+\.[^\s@]+$" CssClass="text-red-500 text-sm" Display="Dynamic" />
            </div>
            
            <div class="mb-4 relative">
                <label for="txtPassword" class="block text-gray-600 mb-1">Password</label>
                <div class="relative">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 pr-10" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                    <span id="togglePassword" onclick="togglePassword()" class="absolute right-3 top-3 cursor-pointer text-gray-500">
                        <i id="eyeIcon" class="fa-solid fa-eye"></i>
                    </span>
                </div>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" CssClass="text-red-500 text-sm" Display="Dynamic" />
            </div>
            
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="w-full bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600 transition" OnClick="btnLogin_Click"/>

            <p class="mt-2">Don't Have Account ?  <a href="Signup.aspx" class="text-blue-600">Signup here</a> </p>
        </form>
    </div>
    
    <script>
        function togglePassword() {
            var passwordField = document.getElementById('<%= txtPassword.ClientID %>');
            var eyeIcon = document.getElementById('eyeIcon');
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                eyeIcon.classList.remove('fa-eye');
                eyeIcon.classList.add('fa-eye-slash');
            } else {
                passwordField.type = 'password';
                eyeIcon.classList.remove('fa-eye-slash');
                eyeIcon.classList.add('fa-eye');
            }
        }
    </script>
</body>
</html>