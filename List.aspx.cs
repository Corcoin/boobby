using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApplication7
{
    public partial class List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load the initial data when the page is first loaded
                LoadLeadersData();
            }
        }

        protected void LoadLeadersData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\wired\\source\\repos\\WebApplication7\\WebApplication7\\App_Data\\Database1.mdf;Integrated Security=True"].ConnectionString;
            string query = "SELECT * FROM leaders";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            DataTable dt = new DataTable();
                            dt.Load(reader);
                            gvLeaders.DataSource = dt;
                            gvLeaders.DataBind();
                        }
                    }
                }
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\wired\\source\\repos\\WebApplication7\\WebApplication7\\App_Data\\Database1.mdf;Integrated Security=True"].ConnectionString;
            string query = "INSERT INTO leaders (costcenter, costcentername, CCOrder, parentarea, pa3, pa2, pa1) " +
                           "VALUES (@costcenter, @costcentername, @CCOrder, @parentarea, @pa3, @pa2, @pa1)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@costcenter", txtCostCenter.Text);
                    command.Parameters.AddWithValue("@costcentername", txtCostCenterName.Text);
                    command.Parameters.AddWithValue("@CCOrder", int.Parse(txtCCOrder.Text));
                    command.Parameters.AddWithValue("@parentarea", txtParentArea.Text);
                    command.Parameters.AddWithValue("@pa3", txtPA3.Text);
                    command.Parameters.AddWithValue("@pa2", txtPA2.Text);
                    command.Parameters.AddWithValue("@pa1", txtPA1.Text);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            LoadLeadersData();
            ClearForm();
        }

        protected void gvLeaders_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvLeaders.EditIndex = e.NewEditIndex;
            LoadLeadersData();
        }

        protected void gvLeaders_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvLeaders.Rows[e.RowIndex];
            string costcenter = gvLeaders.DataKeys[e.RowIndex].Values["costcenter"].ToString();
            string costcentername = (row.FindControl("txtCostCenterNameEdit") as TextBox).Text;
            int CCOrder = int.Parse((row.FindControl("txtCCOrderEdit") as TextBox).Text);
            string parentarea = (row.FindControl("txtParentAreaEdit") as TextBox).Text;
            string pa3 = (row.FindControl("txtPA3Edit") as TextBox).Text;
            string pa2 = (row.FindControl("txtPA2Edit") as TextBox).Text;
            string pa1 = (row.FindControl("txtPA1Edit") as TextBox).Text;

            string connectionString = ConfigurationManager.ConnectionStrings["Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\wired\\source\\repos\\WebApplication7\\WebApplication7\\App_Data\\Database1.mdf;Integrated Security=True"].ConnectionString;
            string query = "UPDATE leaders SET costcentername = @costcentername, CCOrder = @CCOrder, parentarea = @parentarea, " +
                           "pa3 = @pa3, pa2 = @pa2, pa1 = @pa1 WHERE costcenter = @costcenter";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@costcentername", costcentername);
                    command.Parameters.AddWithValue("@CCOrder", CCOrder);
                    command.Parameters.AddWithValue("@parentarea", parentarea);
                    command.Parameters.AddWithValue("@pa3", pa3);
                    command.Parameters.AddWithValue("@pa2", pa2);
                    command.Parameters.AddWithValue("@pa1", pa1);
                    command.Parameters.AddWithValue("@costcenter", costcenter);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            gvLeaders.EditIndex = -1;
            LoadLeadersData();
        }

        protected void gvLeaders_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvLeaders.EditIndex = -1;
            LoadLeadersData();
        }

        protected void gvLeaders_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string costcenter = gvLeaders.DataKeys[e.RowIndex].Values["costcenter"].ToString();

            string connectionString = ConfigurationManager.ConnectionStrings["Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\wired\\source\\repos\\WebApplication7\\WebApplication7\\App_Data\\Database1.mdf;Integrated Security=True"].ConnectionString;
            string query = "DELETE FROM leaders WHERE costcenter = @costcenter";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@costcenter", costcenter);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            LoadLeadersData();
        }

        protected void ClearForm()
        {
            txtCostCenter.Text = string.Empty;
            txtCostCenterName.Text = string.Empty;
            txtCCOrder.Text = string.Empty;
            txtParentArea.Text = string.Empty;
            txtPA3.Text = string.Empty;
            txtPA2.Text = string.Empty;
            txtPA1.Text = string.Empty;
        }
    }
}
