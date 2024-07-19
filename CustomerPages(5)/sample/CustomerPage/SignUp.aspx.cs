using MySql.Data.MySqlClient;
using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sample
{
    public partial class SignUp : System.Web.UI.Page
    {
        string verifyCode;
        //String email, fname, lname, mobNum, password;
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //email = Request.Form["email"].ToString();
            //fname = Request.Form["fname"].ToString();
            //lname = Request.Form["lname"].ToString();
            //mobNum = Request.Form["mobNum"].ToString();
            //password = Request.Form["password"].ToString();
            
            
            string conn = "Server=MYSQL8001.site4now.net;Database=db_a99cbb_alibert;Uid=a99cbb_alibert;Pwd=alibertwaters001";
            MySqlConnection cmd = new MySqlConnection(conn);
            cmd.Open();
            string cmd1 = $"insert into customertbl values (\"{email.Text}\",\"{fname.Text}\",\"{lname.Text}\",\"{mobNum.Text}\",\"{password.Text}\",'{DropDownList1.SelectedValue}', 'active');";
            MySqlCommand cmd2 = new MySqlCommand(cmd1,cmd);
            cmd2.ExecuteNonQuery();
            cmd.Close();

            // email
            const int MaxLength = 5;
            var unique = Guid.NewGuid();
            string uniqueCode = unique.ToString();

            if (uniqueCode.Length > MaxLength)
                uniqueCode = uniqueCode.Substring(0, MaxLength);
            verifyCode = uniqueCode;
            MailMessage msg = new MailMessage("alibertstation@outlook.com", email.Text, "Verify Account for Alibert", "Verification Code is: " + verifyCode);
            msg.IsBodyHtml = true;
            SmtpClient sclient = new SmtpClient("smtp.office365.com", 587);
            sclient.UseDefaultCredentials = false;
            NetworkCredential credentials = new NetworkCredential("alibertstation@outlook.com", "waterstation-001");
            sclient.Credentials = credentials;
            sclient.EnableSsl = true;
            Session["vCode"] = verifyCode;
            sclient.Send(msg);
            Response.Redirect("VerifyEmail.aspx");
            //Response.Redirect("Login.aspx");
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Response.Cookies.Remove("ID_COOKIE");
            Response.Cookies["ID_COOKIE"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("Login.aspx");
        }
    }
}