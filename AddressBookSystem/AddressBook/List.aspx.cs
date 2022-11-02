using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AddressBookSystem.AddressBook
{
    public partial class List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridview();
            }
        }

        public void BindGridview()
        {
            try
            {
                DataSet ds = new DataSet();
                SqlConnection con = new SqlConnection(connection());
                con.Open();
                using (con)
                {
                    SqlCommand cmd = new SqlCommand("ShowContacts");
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        GridViewdata.DataSource = ds;
                        GridViewdata.DataBind();
                    }
                    else
                    {
                        ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                        GridViewdata.DataSource = ds;
                        GridViewdata.DataBind();
                        GridViewdata.Rows[0].Cells.Clear();
                        GridViewdata.Rows[0].Cells.Add(new TableCell());
                        int ColumnCount = ds.Tables[0].Rows.Count;
                        GridViewdata.Rows[0].Cells[0].ColumnSpan = ColumnCount;
                        GridViewdata.Rows[0].Cells[0].Text = "No Records Found";
                    }
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public string connection()
        {
            string connectionstring = ConfigurationManager.ConnectionStrings["AddressBookConnectionString"].ConnectionString;
            return connectionstring;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddressBookHome.aspx");
        }

        protected void GridViewdata_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewdata.EditIndex = e.NewEditIndex;
            BindGridview();
        }

        protected void GridViewdata_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int Id = Convert.ToInt32(GridViewdata.DataKeys[e.RowIndex].Values["Id"]);
                SqlConnection con = new SqlConnection(connection());
                using (con)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DeleteContact");
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@Id", Id);
                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        Label8.Text = "Deleted Successfully";
                        Label8.ForeColor = System.Drawing.Color.Green;
                        BindGridview();
                    }
                    GridViewdata.EditIndex = -1;
                    BindGridview();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void GridViewdata_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewdata.EditIndex = -1;
            BindGridview();
        }

        protected void GridViewdata_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int Id = Convert.ToInt32(GridViewdata.DataKeys[e.RowIndex].Values["Id"]);
                TextBox firstname = (TextBox)GridViewdata.Rows[e.RowIndex].FindControl("TextBox1");
                TextBox lastname = (TextBox)GridViewdata.Rows[e.RowIndex].FindControl("TextBox2");
                TextBox address = (TextBox)GridViewdata.Rows[e.RowIndex].FindControl("TextBox3");
                string state = ((DropDownList)GridViewdata.Rows[e.RowIndex].FindControl("State")).SelectedValue;
                TextBox city = (TextBox)GridViewdata.Rows[e.RowIndex].FindControl("TextBox4");
                TextBox pincode = (TextBox)GridViewdata.Rows[e.RowIndex].FindControl("TextBox6");
                TextBox phone = (TextBox)GridViewdata.Rows[e.RowIndex].FindControl("TextBox7");
                TextBox email = (TextBox)GridViewdata.Rows[e.RowIndex].FindControl("TextBox8");


                SqlConnection con = new SqlConnection(connection());
                using (con)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UpdateContact");
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@Id", Id);
                    cmd.Parameters.AddWithValue("@FirstName", firstname.Text);
                    cmd.Parameters.AddWithValue("@LastName", lastname.Text);
                    cmd.Parameters.AddWithValue("@Address", address.Text);
                    cmd.Parameters.AddWithValue("@City", city.Text);
                    cmd.Parameters.AddWithValue("@State", state);
                    cmd.Parameters.AddWithValue("@Pincode", pincode.Text);
                    cmd.Parameters.AddWithValue("@Phone", phone.Text);
                    cmd.Parameters.AddWithValue("@Email", email.Text);
                    int check = cmd.ExecuteNonQuery();
                    if (check > 0)
                    {
                        GridViewdata.EditIndex = -1;
                        BindGridview();
                        Label8.Text = "Updated Successfully";
                        Label8.ForeColor = System.Drawing.Color.Green;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}