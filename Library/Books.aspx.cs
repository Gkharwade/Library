using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library
{
    public partial class Books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            string query = "INSERT INTO Books (Title, Author, ISBN, Publisher, Category, Quantity) VALUES (@Title, @Author, @ISBN, @Publisher, @Category, @Quantity)";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                   
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {

                        cmd.Parameters.AddWithValue("@Title",btitle.Value);
                        cmd.Parameters.AddWithValue("@Author",Author.Value);
                        cmd.Parameters.AddWithValue("@ISBN",ISBN.Value);  
                        cmd.Parameters.AddWithValue("@Publisher",Publisher.Value);
                        cmd.Parameters.AddWithValue("@Category", Category.Value);
                        cmd.Parameters.AddWithValue("@Quantity", int.Parse(Quantity.Value));


                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            Response.Write("<script>alert('Book added successfully!');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Failed to add book.');</script>");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }


}
    