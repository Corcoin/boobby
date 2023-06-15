<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication7.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
    /* CSS for the Login Page */
    #formLogin {
        margin: 20px;
        padding: 20px;
        background-color: #f2f2f2;
        border: 1px solid #ccc;
        border-radius: 5px;
        width: 300px;
    }

    #formLogin h2 {
        font-size: 24px;
        margin-bottom: 10px;
    }

    #formLogin label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    #formLogin input[type="text"],
    #formLogin input[type="password"] {
        width: 100%;
        padding: 5px;
        margin-bottom: 10px;
    }

    #formLogin input[type="button"] {
        background-color: #4caf50;
        color: #fff;
        padding: 8px 16px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    #formLogin input[type="button"]:hover {
        background-color: #45a049;
    }

    #formLogin #lblErrorMessage {
        display: block;
        margin-top: 10px;
        font-weight: bold;
    }
</style>

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
