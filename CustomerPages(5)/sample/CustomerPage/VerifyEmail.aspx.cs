using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace sample
{
    public partial class VerifyEmail : System.Web.UI.Page
    {
        string verifyCode;
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            verifyCode = Session["vCode"].ToString();
        }

        protected void verifyBtn_Click(object sender, EventArgs e)
        {
            if (codeTxtBox.Text == verifyCode)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                MessageBox.Show("Incorrect Authentication Code.", "Try Again", MessageBoxButtons.OK,
                MessageBoxIcon.Information);
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