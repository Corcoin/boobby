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
                // Populate the dropdown with PA values
                PopulateDropdown();
            }
        }

        private void PopulateDropdown()
        {
            // Connect to the SQL Server database
            using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\wired\\source\\repos\\WebApplication7\\WebApplication7\\App_Data\\Database1.mdf;Integrated Security=True;Connect Timeout=3500"))
            {
                // Construct the SQL query
                string query = "SELECT pa3, pa2, pa1 FROM leaders";

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
                            string pa1 = reader["pa1"].ToString();
                            string pa2 = reader["pa2"].ToString();
                            string pa3 = reader["pa3"].ToString();

                            // Create a new option element
                            ListItem item = new ListItem($"{pa1} - {pa2} - {pa3}", $"{pa1}|{pa2}|{pa3}");

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
            string selectedValue = ddlPerson.SelectedValue;

            // Split the selected value into individual PA values
            string[] paValues = selectedValue.Split('|');
            string pa1 = paValues[0];
            string pa2 = paValues[1];
            string pa3 = paValues[2];

            // Redirect to the CostCenterPage with the selected PA values
            Response.Redirect($"CostCenterPage.aspx?pa1={pa1}&pa2={pa2}&pa3={pa3}");
        }
        protected void ddlPerson_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the selected value from the dropdown
            string selectedPerson = ddlPerson.SelectedValue;

            // Retrieve the corresponding data from the database based on the selected person
            // Here, you can fetch the pa1, pa2, and pa3 values for the selected person

            // Update the labels with the retrieved values
            lblPA1.Text = "PA1 value";
            lblPA2.Text = "PA2 value";
            lblPA3.Text = "PA3 value";
        }

    }
}
