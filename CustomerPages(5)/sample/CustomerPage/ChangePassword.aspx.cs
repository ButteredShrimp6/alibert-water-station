using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sample
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        string cusEmail;
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            cusEmail = Session["fEmail"].ToString();
        }

        protected void changePassBtn_Click(object sender, EventArgs e)
        {
            string conn = "Server=MYSQL8001.site4now.net;Database=db_a99cbb_alibert;Uid=a99cbb_alibert;Pwd=alibertwaters001";
            MySqlConnection cmd = new MySqlConnection(conn);
            cmd.Open();
            string cmd1 = $"UPDATE customertbl SET password = @a1 WHERE email ='" + cusEmail+ "';";
            MySqlCommand cmd2 = new MySqlCommand(cmd1, cmd);
            cmd2.Parameters.AddWithValue("@a1", password.Text.ToString());
            cmd2.ExecuteNonQuery();
            cmd.Close();
            Response.Redirect("Login.aspx");
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Response.Cookies.Remove("ID_COOKIE");
            Response.Cookies["ID_COOKIE"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("Login.aspx");
        }
    }
}