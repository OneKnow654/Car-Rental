using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace Rental
{
   
   

    public partial class CarDetails : System.Web.UI.Page
    {
        protected Car car;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int carId;
                if (int.TryParse(Request.QueryString["carId"], out carId))
                {
                    LoadCarDetails(carId);
                }
                else
                {
                    // Handle error
                    Response.Redirect("CarListing.aspx");
                }
            }
        }

        private void LoadCarDetails(int carId)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CarRentalDBConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Cars WHERE CarID = @CarID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@CarID", carId);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        lblCarIDValue.Text = reader["CarID"].ToString();
                        lblMakeValue.Text = reader["Make"].ToString();
                        lblModelValue.Text = reader["Model"].ToString();
                        lblYearValue.Text = reader["Year"].ToString();
                        lblColorValue.Text = reader["Color"].ToString();
                        lblPricePerDayValue.Text = reader["PricePerDay"].ToString();
                        lblDescriptionValue.Text = reader["Description"].ToString();
                    }
                }
            }
        }
        protected void btnRent_Click(object sender, EventArgs e)
        {
            int userID = Convert.ToInt32(Session["UserID"]); // Ensure session is properly set
            int carID = Convert.ToInt32(Request.QueryString["CarID"]);
            DateTime rentalDate = Convert.ToDateTime(txtRentalDate.Text);
            DateTime? returnDate = string.IsNullOrEmpty(txtReturnDate.Text) ? (DateTime?)null : Convert.ToDateTime(txtReturnDate.Text);
            decimal totalAmount = CalculateTotalAmount(carID, rentalDate, returnDate);

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CarRentalDBConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Rentals (UserID, CarID, RentalDate, ReturnDate, TotalAmount) VALUES (@UserID, @CarID, @RentalDate, @ReturnDate, @TotalAmount)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userID);
                cmd.Parameters.AddWithValue("@CarID", carID);
                cmd.Parameters.AddWithValue("@RentalDate", rentalDate);
                cmd.Parameters.AddWithValue("@ReturnDate", returnDate.HasValue ? (object)returnDate.Value : DBNull.Value);
                cmd.Parameters.AddWithValue("@TotalAmount", totalAmount);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("RentalConfirmation.aspx?RentalID=" + Rental_ID(carID)); // Redirect to confirmation page or display a message
        }
        private decimal CalculateTotalAmount(int carID, DateTime rentalDate, DateTime? returnDate)
        {
            // Calculate total amount based on car's price per day and rental duration
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CarRentalDBConnectionString"].ConnectionString;
            decimal pricePerDay = 0;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT PricePerDay FROM Cars WHERE CarID = @CarID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CarID", carID);

                conn.Open();
                pricePerDay = Convert.ToDecimal(cmd.ExecuteScalar());
            }

            int days = (returnDate.HasValue ? (returnDate.Value - rentalDate).Days : 1);
            return days * pricePerDay;
        }

        private int Rental_ID(int carID) { 
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CarRentalDBConnectionString"].ConnectionString;
            int id;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT RentalId FROM rentals WHERE CarID = @CarID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CarID", carID);
                
                conn.Open();
                SqlDataReader d = cmd.ExecuteReader();
                if (d.Read())
                {
                     id = Convert.ToInt32(d["RentalID"]);


                }
                else
                {
                    id = 3;
                }
               
            }
            return id;
        }


       
        public class Car
        {
            public int Id { get; set; }
            public string Model { get; set; }
            public decimal PricePerDay { get; set; }
            public string Description { get; set; }
        }
    }

}