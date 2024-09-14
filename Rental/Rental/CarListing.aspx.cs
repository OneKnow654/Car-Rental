using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Data.SqlClient;
namespace Rental
{


    public partial class CarListing : System.Web.UI.Page
    {
        protected List<Car> cars;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCars();
            }
        }

        private void LoadCars()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CarRentalDBConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT carid, Model, PricePerDay,img FROM Cars";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    cars = new List<Car>();
                    while (reader.Read())
                    {
                        Car car = new Car
                        {
                            Id = Convert.ToInt32(reader["carId"]),
                            Model = reader["Model"].ToString(),
                            PricePerDay = Convert.ToDecimal(reader["PricePerDay"]),
                            Path = reader["img"].ToString()
                        };
                        cars.Add(car);
                    }
                }
            }
        }

        public class Car
        {
            public int Id { get; set; }
            public string Model { get; set; }
            public decimal PricePerDay { get; set; }
            public string Path { get; set; }
        }
    }


}