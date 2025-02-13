using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Net;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Xml.Linq;

namespace Library
{
    public partial class Member : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
        }
      
        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            string query = "insert into Members(Name , Email, Phone, Address) values(@Name,@Email,@Mobile,@address)";
            try
            {
                string Name = name.Value;
                string Email = email.Value;
                string Mobile = phone.Value;
                string Address = address.Value;
                SqlConnection conn = new SqlConnection(connectionString);
                conn.Open();
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", Name);
                cmd.Parameters.AddWithValue("@Email", Email);
                cmd.Parameters.AddWithValue("@Mobile", Mobile);
                cmd.Parameters.AddWithValue("@address", Address);


                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    MessageBox.Show("Member inserted successfully!");
                }
                else
                {
                    MessageBox.Show("Member data not entered properly");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
    }


            



        

    
