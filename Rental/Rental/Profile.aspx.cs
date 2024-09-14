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
    

    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["CarRentalDBConnectionString"].ConnectionString;
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        string query = "SELECT FirstName, LastName, Email, PhoneNumber, Address FROM Users WHERE UserID = @UserID";
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@UserID", Session["UserID"]);
                            connection.Open();
                            SqlDataReader reader = command.ExecuteReader();
                            if (reader.Read())
                            {
                                FirstNameTextBox.Text = reader["FirstName"].ToString();
                                LastNameTextBox.Text = reader["LastName"].ToString();
                                EmailTextBox.Text = reader["Email"].ToString();
                                PhoneNumberTextBox.Text = reader["PhoneNumber"].ToString();
                                AddressTextBox.Text = reader["Address"].ToString();
                            }
                        }
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["CarRentalDBConnectionString"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "UPDATE Users SET FirstName = @FirstName, LastName = @LastName, Email = @Email, PhoneNumber = @PhoneNumber, Address = @Address WHERE UserID = @UserID";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@FirstName", FirstNameTextBox.Text);
                        command.Parameters.AddWithValue("@LastName", LastNameTextBox.Text);
                        command.Parameters.AddWithValue("@Email", EmailTextBox.Text);
                        command.Parameters.AddWithValue("@PhoneNumber", PhoneNumberTextBox.Text);
                        command.Parameters.AddWithValue("@Address", AddressTextBox.Text);
                        command.Parameters.AddWithValue("@UserID", Session["UserID"]);

                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }
            }
        }
    }

}