using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public partial class mock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Populate the dropdown with cost center names
                PopulateDropdown();
            }
        }

        private void PopulateDropdown()
        {
            // Connect to the SQL Server database
            using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\wired\\source\\repos\\WebApplication7\\WebApplication7\\App_Data\\Database1.mdf;Integrated Security=True;Connect Timeout=3500"))

            {
                // Construct the SQL query
                string query = "SELECT costcentername FROM leaders";

                // Create a SqlCommand object and set the query and connection
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Open the connection
                    connection.Open();

                    // Execute the query and get the results
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Iterate over the result set and add options to the dropdown
                        while (reader.Read())
                        {
                            string costCenterName = reader["costcentername"].ToString();

                            // Create a new option element
                            ListItem item = new ListItem(costCenterName);

                            // Add the option to the dropdown
                            ddlPerson.Items.Add(item);
                        }
                    }
                }
            }
        }

        protected void btnSelectPerson_Click(object sender, EventArgs e)
        {
            // Get the selected value from the dropdown
            string selectedCostCenter = ddlPerson.SelectedValue;

            // Redirect to the CostCenterPage with the selected cost center
            Response.Redirect($"CostCenterPage.aspx?costCenter={selectedCostCenter}");
        }

    }
}
