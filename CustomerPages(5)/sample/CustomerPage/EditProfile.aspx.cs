using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace sample
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        
        static string EmailCookieValue, password;
        protected void Page_Load(object sender, EventArgs e)
        {
            EmailCookieValue= Request.Cookies["ID_COOKIE"].Value;
            password = Request.Cookies["ROLE_COOKIE"].Value;
            LoadData();
        }

        private void LoadData()
        {
            string QUERY = $"SELECT fname, lname, mobileNum from customertbl where email = \"{EmailCookieValue}\" and password = \"{password}\";";
            string conn = "Server=MYSQL8001.site4now.net;Database=db_a99cbb_alibert;Uid=a99cbb_alibert;Pwd=alibertwaters001";
            MySqlConnection sqlconn1 = new MySqlConnection(conn);
            sqlconn1.Open();
            MySqlCommand cmd1 = new MySqlCommand(QUERY, sqlconn1);
            IDataReader reader = cmd1.ExecuteReader();

            List<string> record = new List<string>();
            while (reader.Read())
            {
                for (int i = 0; i < 3; i++)
                {
                    record.Add(reader.GetString(i).ToString());
                }

            }
            sqlconn1.Close();
            
            lname.Text = record[1];
            fname.Text = record[0];
            mobNum.Text = record[2];


           
        }

        //Update Profile Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            string fname = Request.Form["fname"].ToString();
            string lname = Request.Form["lname"].ToString();
            string mobNum = Request.Form["mobNum"].ToString();

            //string conpassword = Request.Form["conPassword"].ToString();


            //String email, fname, lname, mobNum, password;
            string QUERY = $"SELECT * from customertbl where email = \"{EmailCookieValue}\" and password = \"{password}\";";
            string UPDATE = $"UPDATE customertbl set fname = \"{fname}\", lname = \"{lname}\", mobileNum = \"{mobNum}\" ,  password = \"{password}\" where email=\"{EmailCookieValue}\"";


            string conn = "Server=MYSQL8001.site4now.net;Database=db_a99cbb_alibert;Uid=a99cbb_alibert;Pwd=alibertwaters001";
            MySqlConnection sqlconn = new MySqlConnection(conn);
            sqlconn.Open();
            MySqlCommand cmd = new MySqlCommand(QUERY, sqlconn);
            if (cmd.ExecuteNonQuery() != 0)
            {
                cmd = new MySqlCommand(UPDATE, sqlconn);
                cmd.ExecuteNonQuery();
                Response.Redirect("Homepage.aspx");
            }
            else
            {
                MessageBox.Show("Account doesn't exist.");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("SaveAddress.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Response.Cookies.Remove("ID_COOKIE");
            Response.Cookies["ID_COOKIE"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("Login.aspx");
        }
    }
}