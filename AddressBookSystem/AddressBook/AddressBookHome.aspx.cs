using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AddressBookSystem.AddressBook
{
    public partial class AddressBookHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string connection()
        {
            string connectionstring = ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString;
            return connectionstring;
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(connection());
                using (con)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("AddContact");
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@FirstName", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@LastName", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@Address", TextBox3.Text);
                    cmd.Parameters.AddWithValue("@City", TextBox4.Text);
                    cmd.Parameters.AddWithValue("@State", State.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@Pincode", TextBox6.Text);
                    cmd.Parameters.AddWithValue("@Phone", TextBox7.Text);
                    cmd.Parameters.AddWithValue("@Email", TextBox8.Text);
                    cmd.Parameters.Add("@default", SqlDbType.Int, 0);
                    cmd.Parameters["@default"].Direction = ParameterDirection.Output;
                    cmd.ExecuteNonQuery();
                    int message = (int)cmd.Parameters["@default"].Value;
                    if (message == 1)
                    {
                        Label9.Text = "First Name Already Exists";
                        Label9.ForeColor = System.Drawing.Color.Red;
                    }
                    else if (message == 2)
                    {
                        Label9.Text = "Email Already Exists";
                        Label9.ForeColor = System.Drawing.Color.Orange;
                    }
                    else
                    {
                        Label9.Text = "Contact Added Successfully";
                        Label9.ForeColor = System.Drawing.Color.Blue;
                        Response.Redirect("List.aspx");
                    }
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("List.aspx");
        }
    }
}