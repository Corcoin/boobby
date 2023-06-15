using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Populate the changes table with the recorded changes
                PopulateChangesTable();
            }
        }

        private void PopulateChangesTable()
        {
            // Connect to the SQL Server database
            using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\wired\\source\\repos\\WebApplication7\\WebApplication7\\App_Data\\Database1.mdf;Integrated Security=True"))
            {
                // Construct the SQL query
                string query = "SELECT costcenter, changetype, timestamp FROM changes";

                // Create a SqlCommand object and set the query and connection
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Open the connection
                    connection.Open();

                    // Execute the query and get the results
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Iterate over the result set and populate the table rows dynamically
                        while (reader.Read())
                        {
                            string costCenter = reader["costcenter"].ToString();
                            string changeType = reader["changetype"].ToString();
                            string timestamp = reader["timestamp"].ToString();

                            // Create a new table row
                            HtmlTableRow row = new HtmlTableRow();

                            // Create table cells for each column
                            HtmlTableCell cellCostCenter = new HtmlTableCell();
                            cellCostCenter.InnerText = costCenter;
                            row.Cells.Add(cellCostCenter);

                            HtmlTableCell cellChangeType = new HtmlTableCell();
                            cellChangeType.InnerText = changeType;
                            row.Cells.Add(cellChangeType);

                            HtmlTableCell cellTimestamp = new HtmlTableCell();
                            cellTimestamp.InnerText = timestamp;
                            row.Cells.Add(cellTimestamp);

                            // Add the row to the changes table
                            tblChanges.Rows.Add(row);
                        }
                    }
                }
            }
        }

    }
}