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
           
   <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvUsers_RowDataBound">
    <Columns>
        <asp:BoundField DataField="costcenterName" HeaderText="Cost Center" />
        <asp:BoundField DataField="pa1" HeaderText="PA1" />
        <asp:BoundField DataField="pa2" HeaderText="PA2" />
        <asp:BoundField DataField="pa3" HeaderText="PA3" />
    </Columns>
</asp:GridView>




            
        </div>
    </form>
</body>
</html>
