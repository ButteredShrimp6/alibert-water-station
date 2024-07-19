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
    public partial class PendingTransaction : System.Web.UI.Page
    {
        static string cookieEmail;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cookieEmail = Request.Cookies["ID_COOKIE"].Value;
                if (Request.Cookies["ID_COOKIE"] != null)
                {
                    this.LoadData();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
           
        }

        private void LoadData()
        {
            string conn = "Server=MYSQL8001.site4now.net;Database=db_a99cbb_alibert;Uid=a99cbb_alibert;Pwd=alibertwaters001";
            MySqlConnection con = new MySqlConnection(conn);
            string query = $"SELECT * from ordertbl where email= '{cookieEmail}' and status = 'pending';";
            MySqlCommand cmd = new MySqlCommand(query, con);
            //cmd.Parameters.AddWithValue("@a1");
            //cmd.Parameters.AddWithValue("@a2", "pending");           
            MySqlDataAdapter msda = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            msda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();

        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Response.Cookies.Remove("ID_COOKIE");
            Response.Cookies["ID_COOKIE"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("Login.aspx");
        }
    }
}