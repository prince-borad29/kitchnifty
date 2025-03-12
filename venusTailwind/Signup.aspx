<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="venusTailwind.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registration</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body class="flex items-center justify-center min-h-screen bg-gray-100">
    <div class="w-full max-w-lg bg-white shadow-lg rounded-lg p-6">
        <h2 class="text-2xl font-bold text-center text-gray-700 mb-4">Registration</h2>
        <form runat="server" class="space-y-4">
            <div>
                <label for="txtFullName" class="block text-gray-600">Full Name</label>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="Enter full name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="txtFullName" ErrorMessage="Full Name is required" CssClass="text-red-500 text-sm" Display="Dynamic" />
            </div>

            <div>
                <label for="txtEmail" class="block text-gray-600">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" CssClass="text-red-500 text-sm" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid email format" ValidationExpression="^[^\s@]+@[^\s@]+\.[^\s@]+$" CssClass="text-red-500 text-sm" Display="Dynamic" />
            </div>

            <div>
                <label for="txtPhone" class="block text-gray-600">Phone</label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="Enter your phone number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone is required" CssClass="text-red-500 text-sm" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="Enter a valid phone number" ValidationExpression="^([7-9]{1})([0-9]{9})$" CssClass="text-red-500 text-sm" Display="Dynamic" />
            </div>

            <div>
                <label for="txtUsername" class="block text-gray-600">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" placeholder="Enter username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required" CssClass="text-red-500 text-sm" Display="Dynamic" />
            </div>

            <div class="relative">
                <label for="txtPassword" class="block text-gray-600">Password</label>
                <div class="relative">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 pr-10" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                    <span onclick="togglePassword('txtPassword', 'eyeIcon1')" class="absolute right-3 top-3 cursor-pointer text-gray-500">
                        <i id="eyeIcon1" class="fa-solid fa-eye"></i>
                    </span>
                </div>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" CssClass="text-red-500 text-sm" Display="Dynamic" />
            </div>

            <div class="relative">
                <label for="txtRepeatPassword" class="block text-gray-600">Repeat Password</label>
                <div class="relative">
                    <asp:TextBox ID="txtRepeatPassword" runat="server" CssClass="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 pr-10" TextMode="Password" placeholder="Repeat your password"></asp:TextBox>
                    <span onclick="togglePassword('txtRepeatPassword', 'eyeIcon2')" class="absolute right-3 top-3 cursor-pointer text-gray-500">
                        <i id="eyeIcon2" class="fa-solid fa-eye"></i>
                    </span>
                </div>
                <asp:RequiredFieldValidator ID="rfvRepeatPassword" runat="server" ControlToValidate="txtRepeatPassword" ErrorMessage="Please confirm your password" CssClass="text-red-500 text-sm" Display="Dynamic" />
                <asp:CompareValidator ID="cvPasswords" runat="server" ControlToValidate="txtRepeatPassword" ControlToCompare="txtPassword" ErrorMessage="Passwords do not match" CssClass="text-red-500 text-sm" Display="Dynamic" />
            </div>

            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="w-full bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600 transition" OnClick="btnRegister_Click" />

            <div class="text-center mt-3">
                <a href="Login.aspx" class="text-blue-500 hover:underline">Already have an account? Login here</a>
            </div>
        </form>
    </div>

    <script>
        function togglePassword(inputId, iconId) {
            var passwordField = document.getElementById(inputId);

            var eyeIcon = document.getElementById(iconId);
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
