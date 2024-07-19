using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sample
{
    public partial class Selecting : System.Web.UI.Page
    {
        String productname, productID;
        //IDataReader reader;
        DbHandler db = new DbHandler();

        protected void Page_Load(object sender, EventArgs e)
        {

            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;


            if (Request.Cookies["ID_COOKIE"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                
                productname = Session["ProductName"].ToString();
                productID = Session["ProductID"].ToString();
                var cmd = new MySqlCommand();
                var query = "SELECT * from productstbl where productID = @productID";
                cmd.Parameters.AddWithValue("@productID", productID);
                cmd.CommandText = query;
                var table = db.GetDataTable(cmd);
                cmd.Dispose();
                productnamelbl.Text = table.Rows[0][1].ToString();
                price.Text = table.Rows[0][2].ToString();
                
                
            }
        }
        protected string GetImageSrc(object imageData)
        {
            byte[] imageBytes = (byte[])imageData;
            string base64String = Convert.ToBase64String(imageBytes);
            return "data:image;base64" + base64String;
        }
        protected void addtoCart_Click(object sender, EventArgs e)
        {
            if (totalQPrice1.Text == "")
            {
                Response.Write($"<script>alert('Enter a valid Quantity.');</script>");
            }
            else
            {
                Response.Write($"<script>alert('Your total price has been successfully listed on the Check Out.');</script>");
                Session["totalPrice"] = totalQPrice1.Text;
                Session["productName"] = productnamelbl.Text;
                Response.Redirect("Checkout.aspx");
            }           
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Response.Cookies.Remove("ID_COOKIE");
            Response.Cookies["ID_COOKIE"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("Login.aspx");
        }

        protected void prodQuantity_SelectedIndexChanged(object sender, EventArgs e)
        {

            var quantity = double.Parse(prodQuantity1.SelectedValue) * int.Parse(price.Text);
            Session["quantity"] = prodQuantity1.SelectedValue;
            totalQPrice1.Text = quantity.ToString();

        }
    }

        
    
}