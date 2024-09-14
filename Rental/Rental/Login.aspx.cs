using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Rental
{
    

    public partial class Login : System.Web.UI.Page
    {
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["CarRentalDBConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT UserID, FirstName FROM Users WHERE Email = @Email AND Password = @Password";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", EmailTextBox.Text);
                    command.Parameters.AddWithValue("@Password", PasswordTextBox.Text); 
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        Session["UserID"] = reader["UserID"];
                        Session["Username"] = reader["FirstName"];
                        Response.Redirect("HomePage.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid email or password.')</script>");
                    }
                }
            }
        }
    }

}