using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace sample
{

    public partial class SaveAddress : System.Web.UI.Page
    {
        static string EmailCookie;
        MySqlConnection conn;
        MySqlCommand cmd;

        String  province, city, houseNum, building, street, bsv, landmark;
        protected void Page_Load(object sender, EventArgs e)
        {
            EmailCookie = Request.Cookies["ID_COOKIE"].Value;
        }

        protected void saveAddressBtn_Click(object sender, EventArgs e)
        {
            province = Request.Form["province"].ToString();
            city = Request.Form["city"].ToString();
            houseNum = Request.Form["houseNum"].ToString();
            building = Request.Form["building"].ToString();
            street = Request.Form["street"].ToString();
            bsv = Request.Form["bsv"].ToString();
            landmark = Request.Form["landmark"].ToString();

            string con = "Server=MYSQL8001.site4now.net;Database=db_a99cbb_alibert;Uid=a99cbb_alibert;Pwd=alibertwaters001";
            conn = new MySqlConnection(con);
            conn.Open();
            string cmd1 = $"insert into addresstbl values (\"{EmailCookie}\",\"{province}\",\"{city}\",\"{houseNum}\",\"{building}\",\"{street}\",\"{bsv}\",\"{landmark}\");";
            cmd = new MySqlCommand(cmd1, conn);
            cmd.ExecuteNonQuery();
            Response.Redirect("Checkout.aspx");

            
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Response.Cookies.Remove("ID_COOKIE");
            Response.Cookies["ID_COOKIE"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("Login.aspx");
        }
    }
}