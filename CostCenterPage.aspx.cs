using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public partial class CostCenterPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["costCenter"] != null)
                {
                    string selectedCostCenter = Request.QueryString["costCenter"];
                    DataTable users = GetUsersByCostCenter(selectedCostCenter);

                    if (users.Rows.Count > 0)
                    {
                        gvUsers.DataSource = users;
                        gvUsers.DataBind();
                    }
                    else
                    {
                        lblMessage.Text = "No users found for the selected cost center.";
                    }
                }
                else
                {
                    lblMessage.Text = "No cost center selected.";
                }
            }
        }


        private DataTable GetUsersByCostCenter(string costCenter)
        {
            DataTable users = new DataTable();

            using (SqlConnection connection = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\wired\\source\\repos\\WebApplication7\\WebApplication7\\App_Data\\Database1.mdf;Integrated Security=True;Connect Timeout=3500"))
            {
                string query = "SELECT * FROM leaders WHERE costcenter = @CostCenter";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CostCenter", costCenter);
                    connection.Open();

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(users);
                    }
                }
            }

            return users;
        }
        protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Access the data item and perform any necessary actions
                DataRowView rowView = e.Row.DataItem as DataRowView;
                if (rowView != null)
                {
                    string costCenterName = rowView["costcenterName"].ToString();
                    string pa1 = rowView["pa1"].ToString();
                    string pa2 = rowView["pa2"].ToString();
                    string pa3 = rowView["pa3"].ToString();

                    // Perform actions based on the data values
                    // For example, you can set the text of a label control in the row:
                    Label lblCostCenter = e.Row.FindControl("lblCostCenter") as Label;
                    if (lblCostCenter != null)
                    {
                        lblCostCenter.Text = costCenterName;
                    }
                }
            }
        }


    }
}
