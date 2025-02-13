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
    public partial class Login : System.Web.UI.Page
    {
        string ConnectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        string query = "SELECT Count(1) FROM Users where Username=@Emailid AND Password=@Pwd";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Submit(object sender, EventArgs e)
        {
            try
            {
                string username = email_id.Value;
                string password = Password1.Value;
                SqlConnection con = new SqlConnection(ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("Emailid", username);
                cmd.Parameters.AddWithValue("Pwd", password);
                int usercount = Convert.ToInt32(cmd.ExecuteScalar());
                if (usercount > 0)
                {
                    MessageBox.Show("you have login succesfully");
                    Session["username"] = username;
                    Response.Redirect("Dashboard.aspx", false);

                }
                else
                {
                    MessageBox.Show("Invalid username or password.");
                }
            }

            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                MessageBox.Show(ex.Message);
            }
        }
    }
}