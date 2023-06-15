<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mock.aspx.cs" Inherits="WebApplication7.mock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="formMock" runat="server">
        <div>
            <h2>Mock Page</h2>
            <asp:DropDownList ID="ddlPerson" runat="server" OnSelectedIndexChanged="ddlPerson_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            <br />
            <asp:Label ID="lblPA1" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblPA2" runat="server"></asp:Label>
            <br />
            <asp:Label ID="lblPA3" runat="server"></asp:Label>
            <br />
            <asp:Button ID="btnSelectPerson" runat="server" Text="Select" OnClick="btnSelectPerson_Click" />
        </div>
    </form>
</body>
</html>
