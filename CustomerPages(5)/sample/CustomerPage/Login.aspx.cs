using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Security.Permissions;
using System.Web;
using System.Web.Helpers;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using MySql.Data.MySqlClient;
using Org.BouncyCastle.Tls.Crypto.Impl.BC;
using System.Windows.Forms;
using System.Windows;
using System.Web.Configuration;

namespace sample
{
    public partial class Login : System.Web.UI.Page
    {
        String email, password;
        private object message;
        MySqlDataReader Reader;
        MySqlCommand Command;
        MySqlConnection Connection;
        static string EmailCookie, RoleCookie;

        public object MessageBox { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            email = emailTxtBox.Text;
            password = passwordTxtBox.Text;

            if (email == "alibert@admin.com" && password == "alibertadmin123")
            {
                Response.Redirect("~/AdminPages/pages/Home.aspx");
            }
            else
            {
                string SQLCOUNT = $"SELECT COUNT(*) FROM customertbl WHERE email= \"{email}\" AND password = \"{password}\";";
                LoadDataBaseConnection(SQLCOUNT);
                int MySqlCount = Convert.ToInt32(Command.ExecuteScalar());
                if (MySqlCount == 1)
                {
                    string MYSQLSelect = $"select * from customertbl where email = \"{email}\" and password=\"{password}\";";
                    LoadDataBaseConnection(MYSQLSelect);
                    Reader = Command.ExecuteReader();
                    Reader.Read();
                    if (Reader["email"].ToString() != email && Reader["password"].ToString() != password)
                    {

                    }
                    else
                    {
                        CreateCookies(email, password);
                        Response.Redirect("Homepage.aspx");
                        Reader.Close();
                    }


                }
            }

        }
        private void CreateCookies(string email, string password)
        {
            string ASelect = $"select * from customertbl where email = \"{email}\" and password=\"{password}\";";
            LoadDataBaseConnection(ASelect);
            Reader = Command.ExecuteReader();
            Reader.Read();

            HttpCookie IDcookie = new HttpCookie("ID_COOKIE");
            HttpCookie Rcookie = new HttpCookie("ROLE_COOKIE");

            IDcookie.Value = Reader["email"].ToString();
            Rcookie.Value = Reader["password"].ToString();  

            Response.Cookies.Add(IDcookie);
            Response.Cookies.Add(Rcookie);

            Reader.Close();
        }

        private void LoadDataBaseConnection(string MySqlQuery)
        {
            string conn = "Server=MYSQL8001.site4now.net;Database=db_a99cbb_alibert;Uid=a99cbb_alibert;Pwd=alibertwaters001";
            MySqlConnection cmd = new MySqlConnection(conn);
            cmd.Open();
            Command = new MySqlCommand(MySqlQuery, cmd);
            Command.ExecuteNonQuery();

        }
        protected void Redirect_Role()
        {

            if (Request.Cookies["ID_COOKIE"] != null)
            {
                EmailCookie = Request.Cookies["ID_COOKIE"].Value;
                RoleCookie = Request.Cookies["ROLE_COOKIE"].Value;

                if (email == "alibert@admin.com" && password == "alibertadmin123")
                {
                    //Redirect to Admin pages
                    Response.Redirect("Services.aspx");
                    Reader.Close();
                    Connection.Close();
                }
                else
                {
                    //Redirect to User homepage
                    Response.Redirect("Homepage.aspx");
                    Reader.Close();
                    Connection.Close();
                }
                    
            }
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Response.Cookies.Remove("ID_COOKIE");
            Response.Cookies["ID_COOKIE"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("Login.aspx");
        }

    }
}