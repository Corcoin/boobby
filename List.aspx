<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="WebApplication7.List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
    /* CSS for the GridView on the Leaders section */
    #form1 #gvLeaders {
        width: 100%;
        border-collapse: collapse;
    }

    /* CSS for header row */
    #form1 #gvLeaders th {
        background-color: #f2f2f2;
        font-weight: bold;
        padding: 8px;
        text-align: left;
    }

    /* CSS for data rows */
    #form1 #gvLeaders td {
        padding: 8px;
    }

    /* CSS for alternating data rows */
    #form1 #gvLeaders tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    /* CSS for selected row */
    #form1 #gvLeaders tr.selected {
        background-color: #cce6ff;
    }

    /* CSS for hover effect */
    #form1 #gvLeaders tr:hover {
        background-color: #f5f5f5;
        cursor: pointer;
    }
</style>

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Create New Leader</h2>
            <button type="button" onclick="redirectToMockPage()">Go to Mock Page</button>
            <table>
                <tr>
                    <td>Cost Center:</td>
                    <td>
                        <asp:TextBox ID="txtCostCenter" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Cost Center Name:</td>
                    <td>
                        <asp:TextBox ID="txtCostCenterName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>CC Order:</td>
                    <td>
                        <asp:TextBox ID="txtCCOrder" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Parent Area:</td>
                    <td>
                        <asp:TextBox ID="txtParentArea" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>PA3:</td>
                    <td>
                        <asp:TextBox ID="txtPA3" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>PA2:</td>
                    <td>
                        <asp:TextBox ID="txtPA2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>PA1:</td>
                    <td>
                        <asp:TextBox ID="txtPA1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div>
            <h2>Leaders</h2>
            <asp:GridView ID="gvLeaders" runat="server" AutoGenerateColumns="false" OnRowEditing="gvLeaders_RowEditing" DataKeyNames="costcenter"
                OnRowUpdating="gvLeaders_RowUpdating" OnRowCancelingEdit="gvLeaders_RowCancelingEdit"
                OnRowDeleting="gvLeaders_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="costcenter" HeaderText="Cost Center" ReadOnly="true" />
                    <asp:TemplateField HeaderText="Cost Center Name">
                        <ItemTemplate>
                            <asp:Label ID="lblCostCenterName" runat="server" Text='<%# Eval("costcentername") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCostCenterNameEdit" runat="server" Text='<%# Eval("costcentername") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="CC Order">
                        <ItemTemplate>
                            <asp:Label ID="lblCCOrder" runat="server" Text='<%# Eval("CCOrder") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCCOrderEdit" runat="server" Text='<%# Eval("CCOrder") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Parent Area">
                        <ItemTemplate>
                            <asp:Label ID="lblParentArea" runat="server" Text='<%# Eval("parentarea") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtParentAreaEdit" runat="server" Text='<%# Eval("parentarea") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PA3">
                        <ItemTemplate>
                            <asp:Label ID="lblPA3" runat="server" Text='<%# Eval("pa3") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPA3Edit" runat="server" Text='<%# Eval("pa3") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PA2">
                        <ItemTemplate>
                            <asp:Label ID="lblPA2" runat="server" Text='<%# Eval("pa2") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPA2Edit" runat="server" Text='<%# Eval("pa2") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PA1">
                        <ItemTemplate>
                            <asp:Label ID="lblPA1" runat="server" Text='<%# Eval("pa1") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPA1Edit" runat="server" Text='<%# Eval("pa1") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="true" CausesValidation="false" />
                    <asp:CommandField ShowDeleteButton="true" CausesValidation="false" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
     <script>
         function redirectToMockPage() {
             window.location.href = "mock.aspx"; // Replace with the actual URL of the mock page
         }
     </script>

</html>

