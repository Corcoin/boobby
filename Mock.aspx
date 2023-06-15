<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mock.aspx.cs" Inherits="WebApplication7.mock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
    /* CSS for the Mock Page */
    #formMock {
        margin: 20px;
        padding: 20px;
        background-color: #f2f2f2;
        border: 1px solid #ccc;
        border-radius: 5px;
        width: 300px;
    }

    #formMock h2 {
        font-size: 24px;
        margin-bottom: 10px;
    }

    #formMock label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    #formMock select {
        width: 100%;
        padding: 5px;
        margin-bottom: 10px;
    }

    #formMock button {
        background-color: #4caf50;
        color: #fff;
        padding: 8px 16px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    #formMock button:hover {
        background-color: #45a049;
    }
</style>

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
