<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CostCenterPage.aspx.cs" Inherits="WebApplication7.CostCenterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cost Center Page</title>
</head>
<body>
    <form id="formCostCenter" runat="server">
        <div>
            <h2>Cost Center Page</h2>
            <h3><asp:Literal runat="server" ID="lblMessage" /></h3>
           
   <asp:GridView ID="gvUsers" runat="server" OnRowDataBound="gvUsers_RowDataBound">
    <Columns>
       
        <asp:TemplateField HeaderText="PA1">
            <ItemTemplate>
                <asp:Label ID="lblPA1" runat="server"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="PA2">
            <ItemTemplate>
                <asp:Label ID="lblPA2" runat="server"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="PA3">
            <ItemTemplate>
                <asp:Label ID="lblPA3" runat="server"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>





            
        </div>
    </form>
</body>
</html>
