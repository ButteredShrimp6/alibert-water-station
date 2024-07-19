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
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string verifyCode, cusEmail;
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void forgotBtn_Click(object sender, EventArgs e)
        {
            cusEmail = emailTxtBox.Text;
            const int MaxLength = 5;
            var unique = Guid.NewGuid();
            string uniqueCode = unique.ToString();

            if (uniqueCode.Length > MaxLength)
                uniqueCode = uniqueCode.Substring(0, MaxLength);
            verifyCode = uniqueCode;
            MailMessage msg = new MailMessage("alibertstation@outlook.com", emailTxtBox.Text, "Verify Account for Alibert", "Verification Code for Forgot Password is " + verifyCode);
            msg.IsBodyHtml = true;
            SmtpClient sclient = new SmtpClient("smtp.office365.com", 587);
            sclient.UseDefaultCredentials = false;
            NetworkCredential credentials = new NetworkCredential("alibertstation@outlook.com", "waterstation-001");
            sclient.Credentials = credentials;
            sclient.EnableSsl = true;
            Session["vForgot"] = verifyCode;
            Session["fEmail"] = cusEmail;
            sclient.Send(msg);
            Response.Redirect("VerifyForgotPassword.aspx");
        }
        protected void Logout_Click(object sender, EventArgs e)
        {
            Response.Cookies.Remove("ID_COOKIE");
            Response.Cookies["ID_COOKIE"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("Login.aspx");
        }
    }
}