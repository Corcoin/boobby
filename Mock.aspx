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
            <asp:DropDownList ID="ddlPerson" runat="server"></asp:DropDownList>
            <br />
            <asp:Button ID="btnSelectPerson" runat="server" Text="Select" OnClick="btnSelectPerson_Click" />
        </div>
    </form>
</body>

</html>
