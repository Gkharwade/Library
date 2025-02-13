using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace Library
{
    public partial class R1 : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        string query = "INSERT INTO Users( [Username],[Password],[Role]) VALUES (@Emailid,@Password,@Role)";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            try
            {
                string Email = Email1.Value;
                string Roles=role.Value;
               
                string Password = PWD.Value;
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("Emailid", Email);
             
                cmd.Parameters.AddWithValue("Password", Password);
                cmd.Parameters.AddWithValue("Role", Roles);

                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    MessageBox.Show("User inserted successfully!");
                }
                else
                {
                    MessageBox.Show("User data not entered properly");
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}