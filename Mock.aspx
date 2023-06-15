<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mock.aspx.cs" Inherits="WebApplication7.mock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .dropdown {
            font-size: 18px;
            color: #333;
        }

        .label {
            font-size: 18px;
            color: #333;
        }

        .button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="formMock" runat="server">
        <div>
            <h2>Mock Page</h2>
            <asp:DropDownList ID="ddlPerson" runat="server" OnSelectedIndexChanged="ddlPerson_SelectedIndexChanged" AutoPostBack="true" CssClass="dropdown"></asp:DropDownList>
            <br />
            <asp:Label ID="lblPA1" runat="server" CssClass="label"></asp:Label>
            <br />
            <asp:Label ID="lblPA2" runat="server" CssClass="label"></asp:Label>
            <br />
            <asp:Label ID="lblPA3" runat="server" CssClass="label"></asp:Label>
            <br />
            <asp:Button ID="btnSelectPerson" runat="server" Text="Select" OnClick="btnSelectPerson_Click" CssClass="button" />
        </div>
    </form>
</body>
</html>
