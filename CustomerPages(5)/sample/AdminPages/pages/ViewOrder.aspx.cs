using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;


namespace sample.AdminPages.pages
{
    public partial class ViewOrder : System.Web.UI.Page
    {
        private DbHandler db = new DbHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PopulateControls();
        }

        private void PopulateControls()
        {
            // query to retrive order details
            var cmd = new MySqlCommand();
            string orderID = Request.QueryString["orderID"];
            var query = new StringBuilder();
            query.Append("SELECT ordertbl.*, ");
            query.Append("CONCAT(customertbl.fname, ' ', customertbl.lname) AS fullName, ");
            query.Append("CONCAT_WS(' ', addresstbl.province, addresstbl.city, addresstbl.houseNumber, addresstbl.building, ");
            query.Append("addresstbl.street, addresstbl.bsv, addresstbl.landmark) AS address ");
            query.Append("FROM ordertbl INNER JOIN ");
            query.Append("customertbl ON ordertbl.email = customertbl.email ");
            query.Append("INNER JOIN addresstbl ON ordertbl.email = addresstbl.email ");
            query.Append("WHERE ordertbl.orderID = @orderID ");
            cmd.Parameters.AddWithValue("@orderID", orderID);
            cmd.CommandText = query.ToString();
            var table = db.GetDataTable(cmd);
            cmd.Dispose();

            // populate controls based on the data table
            tbOrderID.Text = table.Rows[0][0].ToString();
            tbOrderDate.Text = table.Rows[0][2].ToString();
            tbDeliveryDate.Text = table.Rows[0][3].ToString();
            tbProdID.Text = table.Rows[0][4].ToString();
            tbProdPrice.Text = table.Rows[0][5].ToString();
            tbProdQuantity.Text = table.Rows[0][6].ToString();
            tbTotal.Text = table.Rows[0][7].ToString();
            tbName.Text = table.Rows[0][9].ToString();
            tbAddress.Text = table.Rows[0][10].ToString();
        }
    }
}