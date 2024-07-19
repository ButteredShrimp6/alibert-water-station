using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace sample
{
    public partial class Checkout : System.Web.UI.Page
    {
        static string EMAILCOOKIES;

        DateTime deliveryTime;
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime time = DateTime.Now;
            TextBox2.Attributes["min"] = time.ToString();
            TimeSpan tm = new TimeSpan(19, 0, 0);
            TextBox2.Attributes["max"] = tm.ToString();
            EMAILCOOKIES = Request.Cookies["ID_COOKIE"].Value;
            TextBox1.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
            subtotal.Text = Session["totalPrice"].ToString();
            containerTypelbl.Text = Session["productName"].ToString();
            quantitylbl.Text = Session["quantity"].ToString();
            this.MathComputations();
            //Put Here Code to Load all necessary details into the CheckoutPages
            this.LoadData();
     
        }

        protected void MathComputations() 
        {
            float st = float.Parse(subtotal.Text);

            float delFee = 0;
            totallbl.Text = (st+delFee).ToString();
            grandtotal.Text = totallbl.Text;
        }

        protected void LoadData()
        {
            try
            {


                string conn = "Server=MYSQL8001.site4now.net;Database=db_a99cbb_alibert;Uid=a99cbb_alibert;Pwd=alibertwaters001";
                MySqlConnection conn2 = new MySqlConnection(conn);
                conn2.Open();
                string command = $"select * from customertbl where email = '{EMAILCOOKIES}';";
                MySqlCommand cmd = new MySqlCommand(command, conn2);
                IDataReader reader = cmd.ExecuteReader();
                reader.Read();
                namelbl.Text = reader.GetString(1) + " " + reader.GetString(2);
                mobNum.Text = reader.GetString(3);
                emaillbl.Text = reader.GetString(0);
                conn2.Close();
                conn2.Open();
                string command2 = $"select * from addresstbl where email = '{EMAILCOOKIES}';";
                MySqlCommand cmd1 = new MySqlCommand(command2, conn2);
                IDataReader reader1 = cmd1.ExecuteReader();
                reader1.Read();
                if (reader1.GetValue(0) != null)
                {
                    string address = $"{reader1.GetString(3)}, {reader1.GetString(5)}, {reader1.GetString(6)}, {reader1.GetString(4)} \n" +
                        $" {reader1.GetString(1)}, {reader1.GetString(2)}";
                    addresslbl.Text = address;

                }
                else
                {
                    Response.Redirect("SaveAddress.aspx");
                }

            }

            catch (Exception ex)
            {
                Response.Redirect("SaveAddress.aspx");
            }
        }

        protected void DisplayItem()
        {
            string conn = "Server=MYSQL8001.site4now.net;Database=db_a99cbb_alibert;Uid=a99cbb_alibert;Pwd=alibertwaters001";
            MySqlConnection conn2 = new MySqlConnection(conn);
            string command = $"select * from customertbl where email = '{EMAILCOOKIES}';";
            MySqlCommand cmd = new MySqlCommand(command, conn2);
            IDataReader reader = cmd.ExecuteReader();
            namelbl.Text = reader.GetString(1) + " " + reader.GetString(2);
            mobNum.Text = reader.GetString(3);
            emaillbl.Text = reader.GetString(0);
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Response.Cookies.Remove("ID_COOKIE");
            Response.Cookies["ID_COOKIE"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("Login.aspx");
        }

       

        protected void PlaceorderBtn_Click(object sender, EventArgs e)
        {
            const int MaxLength = 6;
            var unique = Guid.NewGuid();
            string uniqueid = unique.ToString();

            if (uniqueid.Length > MaxLength)
                uniqueid = uniqueid.Substring(0, MaxLength);
            string orderID = "order" + uniqueid;


            string orderDate = DateTime.UtcNow.ToString("yyyy-MM-dd HH:mm:dd");
            string b = TextBox1.Text + " " + TextBox2.Text;
            DateTime a = DateTime.Parse(b);
            string deliveryDate = a.ToString("yyyy-MM-dd HH:mm:dd");
            string productName = containerTypelbl.Text;
            string conn = "Server=MYSQL8001.site4now.net;Database=db_a99cbb_alibert;Uid=a99cbb_alibert;Pwd=alibertwaters001";
            string getproductPrice = $"select pricePerGallon from productstbl where productName = '{productName}'";
            MySqlConnection con = new MySqlConnection(conn);
            con.Open();
            MySqlCommand gerprpr = new MySqlCommand(getproductPrice, con);
            IDataReader reader = gerprpr.ExecuteReader();
            reader.Read();
            int productPrice = int.Parse(reader.GetString(0));
            int productQty = int.Parse(quantitylbl.Text);
            int totalPrice = int.Parse(grandtotal.Text);
            con.Close();
            con.Open();
            string cmd1 = $"INSERT INTO ordertbl VALUES ('{orderID}','{EMAILCOOKIES}','{orderDate}','{deliveryDate}','{productName}',{productPrice},{productQty},{totalPrice},'pending'); ";
            MySqlCommand cmd = new MySqlCommand(cmd1, con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("PendingTransaction.aspx");
        }
    }

}