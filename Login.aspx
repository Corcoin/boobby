<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication7.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="formLogin" runat="server">
        <div>
            <h2>Login Page</h2>
            <!-- Your username and password fields -->
            <label for="txtUsername">Username:</label>
            <input type="text" id="txtUsername" runat="server" />
            <br />
            <label for="txtPassword">Password:</label>
            <input type="password" id="txtPassword" runat="server" />
            <br />
            <!-- Your login button -->
            <input type="button" id="btnLogin" value="Login" onclick="redirectToOtherPage()" />

            <br />
            <span id="lblErrorMessage" runat="server" style="color: red;"></span>
        </div>
    </form>

    <script>
        function redirectToOtherPage() {
            // Redirect to the List.aspx page
            window.location.href = "List.aspx";
        }
    </script>
</body>
</html>
