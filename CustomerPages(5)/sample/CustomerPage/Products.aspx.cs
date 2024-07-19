using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sample
{
    public partial class Products : System.Web.UI.Page
    {
        DbHandler db = new DbHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.LoadData();
            }
        }
        private void LoadData()
        {
            var cmd = new MySqlCommand();
            var query = "SELeCT * from productstbl where status = @status";
            cmd.Parameters.AddWithValue("@status", "active");
            cmd.CommandText = query;

            var table = db.GetDataTable(cmd);
            Repeater1.DataSource = table;
            Repeater1.DataBind();
            cmd.Dispose();
        }
        protected string GetImageSrc(object imageData)
        {
            byte[] imageBytes = (byte[])imageData;
            string base64String = Convert.ToBase64String(imageBytes);

            return "data:image;base64," + base64String;
        }
    
        protected void Logout_Click(object sender, EventArgs e)
        {
            Response.Cookies.Remove("ID_COOKIE");
            Response.Cookies["ID_COOKIE"].Expires = DateTime.Now.AddDays(-1);
            Response.Redirect("Login.aspx");
        }

        protected void Repeater1_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {
            if (Request.Cookies["ID_COOKIE"] != null)
            {
                Label item = (Label)e.Item.FindControl("LblContainer");
                HiddenField hf = (HiddenField)e.Item.FindControl("HiddenField1");
                Session["ProductName"] = item.Text;
                Session["productID"] = hf.Value;
                Response.Redirect("Selecting.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}