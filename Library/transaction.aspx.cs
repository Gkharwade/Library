using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library
{
    public partial class transaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGridData();
            }

        }

        private void LoadGridData()
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Books", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadGridData();
        }
    
        protected void IssueBook(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            string issueQuery = "INSERT INTO Transactions (BookId, MemberId, IssueDate, DueDate) " +
                                "VALUES (@BookId, @MemberId, GETDATE(), DATEADD(DAY, 14, GETDATE()))";

            string updateBookQuery = "UPDATE Books SET Quantity = Quantity - 1 WHERE BookId = @BookId AND Quantity > 0";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand(updateBookQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@BookId", BookId.Value);
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected == 0)
                        {
                            Response.Write("<script>alert('Book not available!');</script>");
                            return;
                        }
                    }

                    using (SqlCommand cmd = new SqlCommand(issueQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@BookId", BookId.Value);
                        cmd.Parameters.AddWithValue("@MemberId", MemberId.Value);
                        cmd.ExecuteNonQuery();
                        ScriptManager.RegisterStartupScript(this, GetType(), "Toast", "showToast('Book Issued Successfully!', 'success');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Toast", $"showToast('{ex.Message}', 'danger');", true);
            }
        }
        protected void ReturnBook(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

            string returnQuery = "UPDATE Transactions SET ReturnDate = GETDATE() " +
                                 "WHERE BookId = @BookId AND MemberId = @MemberId AND ReturnDate IS NULL";

            string updateBookQuery = "UPDATE Books SET Quantity = Quantity + 1 WHERE BookId = @BookId";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand(returnQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@BookId", BookId.Value);
                        cmd.Parameters.AddWithValue("@MemberId", MemberId.Value);
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected == 0)
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Toast", "showToast('No book found!', 'success');", true);
                            return;
                        }
                    }

                    using (SqlCommand cmd = new SqlCommand(updateBookQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@BookId", BookId.Value);
                        cmd.ExecuteNonQuery();
                        ScriptManager.RegisterStartupScript(this, GetType(), "Toast", "showToast('Book Returned Successfully!', 'success');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Toast", "showToast('No active issued book found for this member.', 'warning');", true);
            }
        }
    }
}