// RentalConfirmation.aspx.cs

using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace Rental
{
    public partial class RentalConfirmation : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayRentalDetails();
            }
        }

        private void DisplayRentalDetails()
        {
            // Retrieve rental information from session or query string
            int rentalID = Convert.ToInt32(Request.QueryString["RentalID"]); // Assuming RentalID is passed as a query string

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CarRentalDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT c.Make, c.Model, c.Color, c.PricePerDay, r.RentalDate, r.ReturnDate, r.TotalAmount
                    FROM Rentals r
                    INNER JOIN Cars c ON r.CarID = c.CarID
                    WHERE r.RentalID = @RentalID";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@RentalID", rentalID);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblCarInfo.Text = reader["Make"]+""+reader["Model"]+"," +reader["Color"]+", ₹"+reader["PricePerDay"]+" per day";
                    lblRentalDateValue.Text = Convert.ToDateTime(reader["RentalDate"]).ToString("dd MMM yyyy");
                    lblReturnDateValue.Text = reader["ReturnDate"] != DBNull.Value ? Convert.ToDateTime(reader["ReturnDate"]).ToString("dd MMM yyyy") : "N/A";
                    lblTotalAmountValue.Text = "₹"+reader["TotalAmount"];
                }
            }
        }
    }
}
