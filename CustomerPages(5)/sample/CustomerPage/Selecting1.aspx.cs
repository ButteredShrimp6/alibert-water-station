using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sample
{
    public partial class Selecting1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["ID_COOKIE"] == null)
            {
                Response.Redirect("Login.aspx");
            }

        }

        protected void addtoCart_Click(object sender, EventArgs e)
        {
            Response.Write($"<script>alert('Your total price has been successfully listed on the Check Out.');</script>");
            Response.Redirect("Checkout.aspx");
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Response.Cookies.Remove("ID_COOKIE");
            Response.Cookies["ID_COOKIE"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("Login.aspx");
        }

        protected void prodQuantity2_SelectedIndexChanged(object sender, EventArgs e)
        {
            var quantity = double.Parse(prodQuantity2.SelectedValue) * 70;
            totalQPrice2.Text = quantity.ToString();
        }
    }
}