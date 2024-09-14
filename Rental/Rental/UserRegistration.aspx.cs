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
  

    public partial class UserRegistration : System.Web.UI.Page
    {
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["CarRentalDBConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Users (FirstName, LastName, Email, Password, PhoneNumber, Address) VALUES (@FirstName, @LastName, @Email, @Password, @PhoneNumber, @Address)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@FirstName", FirstNameTextBox.Text);
                    command.Parameters.AddWithValue("@LastName", LastNameTextBox.Text);
                    command.Parameters.AddWithValue("@Email", EmailTextBox.Text);
                    command.Parameters.AddWithValue("@Password", PasswordTextBox.Text); // Consider hashing passwords
                    command.Parameters.AddWithValue("@PhoneNumber", PhoneNumberTextBox.Text);
                    command.Parameters.AddWithValue("@Address", AddressTextBox.Text);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
            Response.Redirect("Login.aspx");
        }
    }

}