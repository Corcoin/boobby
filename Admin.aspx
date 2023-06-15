<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebApplication7.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="formAdminPage" runat="server">
        <div>
            <h2>Admin Page</h2>
            <table id="tblChanges" runat="server">
                <thead>
                    <tr>
                        <th>Cost Center</th>
                        <th>Change Type</th>
                        <th>Timestamp</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Populate table rows dynamically using server-side code -->
                </tbody>
            </table>
        </div>
    </form>
</body>

</html>
