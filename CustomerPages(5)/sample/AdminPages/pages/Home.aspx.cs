using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace sample.AdminPages.pages
{
    public partial class Home : System.Web.UI.Page
    {
        DbHandler db = new DbHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PopulateControls();
        }

        private void PopulateControls()
        {
            var cmd = new MySqlCommand();

            // queries
            var queryForProducts = "SELECT COUNT(*) FROM productstbl";
            var queryForOrders = "SELECT COUNT(*) FROM ordertbl";
            var queryForUsers = "SELECT COUNT(*) FROM customertbl";
            var queryForSales = "SELECT SUM(totalPrice) FROM ordertbl WHERE status='delivered'";

            // for orders
            cmd.CommandText = queryForProducts;
            var table = db.GetDataTable(cmd);
            productLbl.Text = table.Rows[0][0].ToString();

            // for products
            cmd.CommandText = queryForOrders;
            table = db.GetDataTable(cmd);
            orderLbl.Text = table.Rows[0][0].ToString(); ;

            // for users
            cmd.CommandText = queryForUsers;
            table = db.GetDataTable(cmd);
            usersLbl.Text = table.Rows[0][0].ToString();

            // for sales
            cmd.CommandText = queryForSales;
            table = db.GetDataTable(cmd);
            salesLbl.Text = "Php." +  table.Rows[0][0].ToString();
        }

    }
}