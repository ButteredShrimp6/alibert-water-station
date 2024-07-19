using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Web.UI.HtmlControls;
using MySql.Data.MySqlClient;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using System.Data;

namespace sample.AdminPages.pages
{
    public partial class Orders : System.Web.UI.Page
    {
        private DbHandler db = new DbHandler();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.PopulateListView();
            }
        }

        // getters
        private String[] GetSortStringQueries()
        {
            String[] sortStringsForQuery = 
            {
                " order by orderID", " order by orderID desc",
                " order by email", " order by email desc",
                " order by orderDate", " order by orderDate desc",
                " order by deliveryDate", " order by deliveryDate desc",
                " order by totalPrice, orderDate", " order by totalPrice desc, orderDate desc"
            };
            return sortStringsForQuery;
        }

        private HtmlButton[] GetSortButtons()
        {
            HtmlButton[] sortButtons = 
            {
                idSortAsc, idSortDesc,
                emailSortAsc, emailSortDesc,
                dateSortAsc, dateSortDesc,
                delDateSortAsc, delDateSortDesc,
                priceSortAsc, priceSortDesc
            };
            return sortButtons;
        }

        private HiddenField[] GetHiddenFieldStates()
        {
            HiddenField[] hiddenFieldState =
            {
                idSortAscHF, idSortDescHF,
                emailSortAscHF, emailSortDescHF,
                dateSortAscHF, dateSortDescHF,
                delDateSortAscHF, delDateSortDescHF,
                priceSortAscHF, priceSortDescHF
            };
            return hiddenFieldState;
        }

        // helper methods
        private void PopulateListView()
        {
            // get statusDDL and tbSearch value
            var status = statusDDL.SelectedValue;
            var textToSearch = tbSearch.Text.Trim();

            // get cmd for our data table then concat it with the sort string
            var cmd = GetCommandForDataTable(status, textToSearch);

            // using the object db GetDataTable method to get a data table using our cmd
            var table = db.GetDataTable(cmd);
       
            // check if datatable is empty, the make empty row visible if true
            if (table != null && table.Rows.Count > 0)
            {
                emptyRow.Visible = false;
            }
            else
            {
                emptyRow.Visible = true;
            }

            // set the table as our control's data source then bind
            OrderListView.DataSource = table;
            OrderListView.DataBind();
            cmd.Dispose();
        }

        private void ConvertDataTableToPDF(DataTable dataTable, string fileName)
        {
            // Create a new PDF document
            Document document = new Document();

            // Set the response content type to PDF
            Response.ContentType = "application/pdf";

            // Set the response headers to force the browser to download the PDF
            Response.AddHeader("content-disposition", "attachment;filename=" + fileName +".pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            // Create a new PDF writer
            PdfWriter writer = PdfWriter.GetInstance(document, Response.OutputStream);

            // Open the PDF document
            document.Open();

            // Create a new table with the same number of columns as the DataTable
            PdfPTable pdfTable = new PdfPTable(dataTable.Columns.Count);

            // Add the column headers from the DataTable to the PDF table
            foreach (DataColumn column in dataTable.Columns)
            {
                pdfTable.AddCell(column.ColumnName);
            }

            // Add the data rows from the DataTable to the PDF table
            foreach (DataRow row in dataTable.Rows)
            {
                foreach (object item in row.ItemArray)
                {
                    pdfTable.AddCell(item.ToString());
                }
            }

            // Add the PDF table to the document
            document.Add(pdfTable);

            // Close the PDF document
            document.Close();

            // Flush the response to the browser
            Response.Flush();
            Response.End();
        }

        private MySqlCommand GetCommandForDataTable(string status, string textToSearch)
        {
            MySqlCommand cmd = new MySqlCommand();
            var query = new StringBuilder();

            query.Append("SELECT * FROM orderTBL ");

            if (!string.IsNullOrWhiteSpace(textToSearch))
            {
                query.Append("WHERE (orderID LIKE CONCAT('%', @orderID, '%')");
                query.Append(" OR email LIKE CONCAT('%', @email, '%')");
                query.Append(" OR orderDate LIKE CONCAT('%', @orderDate, '%')");
                query.Append(" OR deliveryDate LIKE CONCAT('%', @deliveryDate, '%')");
                query.Append(" OR totalPrice LIKE CONCAT('%', @totalPrice, '%')");
                query.Append(" OR status LIKE CONCAT('%', @status, '%'))");

                cmd.Parameters.AddWithValue("@orderID", textToSearch);
                cmd.Parameters.AddWithValue("@email", textToSearch);
                cmd.Parameters.AddWithValue("@orderDate", textToSearch);
                cmd.Parameters.AddWithValue("@deliveryDate", textToSearch);
                cmd.Parameters.AddWithValue("@totalPrice", textToSearch);
                cmd.Parameters.AddWithValue("@status", textToSearch);

                if (status != "all")
                {
                    query.Append(" AND status = @status");
                    cmd.Parameters.AddWithValue("@status", status);
                }
                if (cbToday.Checked)
                {
                    query.Append(" AND DATE(deliveryDate) = CURDATE()");
                }
            }
            else if (status != "all")
            {
                query.Append("WHERE status = @status");
                cmd.Parameters.AddWithValue("@status", status);
                if (cbToday.Checked)
                {
                    query.Append(" AND DATE(deliveryDate) = CURDATE()");
                }
            }
            else if (cbToday.Checked)
            {
                query.Append(" WHERE DATE(deliveryDate) = CURDATE()");
            }

            cmd.CommandText = query.ToString().Trim() + this.GetSortString();
            return cmd;
        }

        // overloaded method
        private MySqlCommand GetCommandForDataTableDelivery(string status, string textToSearch)
        {
            MySqlCommand cmd = new MySqlCommand();
            var query = new StringBuilder();
            query.Append("SELECT ordertbl.orderID, ordertbl.email, CONCAT(customertbl.fname, ' ', customertbl.lname) AS fullName, CONCAT_WS(' ', addresstbl.province, ");
            query.Append("addresstbl.city, addresstbl.houseNumber, addresstbl.building, addresstbl.street, addresstbl.bsv, addresstbl.landmark) AS address, customertbl.mobileNum, ");
            query.Append("TIME(ordertbl.deliveryDate) AS deliveryTime, ordertbl.productID, ordertbl.productPrice, ordertbl.productQuantity, ordertbl.totalPrice FROM ordertbl ");
            query.Append("INNER JOIN customertbl ON ordertbl.email = customertbl.email INNER JOIN addresstbl ON ordertbl.email = addresstbl.email ");
            if (!string.IsNullOrWhiteSpace(textToSearch))
            {
                query.Append("WHERE (orderID LIKE CONCAT('%', @orderID, '%')");
                query.Append(" OR email LIKE CONCAT('%', @email, '%')");
                query.Append(" OR orderDate LIKE CONCAT('%', @orderDate, '%')");
                query.Append(" OR deliveryDate LIKE CONCAT('%', @deliveryDate, '%')");
                query.Append(" OR totalPrice LIKE CONCAT('%', @totalPrice, '%')");
                query.Append(" OR status LIKE CONCAT('%', @status, '%'))");

                cmd.Parameters.AddWithValue("@orderID", textToSearch);
                cmd.Parameters.AddWithValue("@email", textToSearch);
                cmd.Parameters.AddWithValue("@orderDate", textToSearch);
                cmd.Parameters.AddWithValue("@deliveryDate", textToSearch);
                cmd.Parameters.AddWithValue("@totalPrice", textToSearch);
                cmd.Parameters.AddWithValue("@status", textToSearch);

                if (status != "all")
                {
                    query.Append(" AND status = @status");
                    cmd.Parameters.AddWithValue("@status", status);
                }
                if (cbToday.Checked)
                {
                    query.Append(" AND DATE(deliveryDate) = CURDATE()");
                }
            }
            else if (status != "all")
            {
                query.Append("WHERE status = @status");
                cmd.Parameters.AddWithValue("@status", status);
                if (cbToday.Checked)
                {
                    query.Append(" AND DATE(deliveryDate) = CURDATE()");
                }
            }
            else if (cbToday.Checked)
            {
                query.Append(" WHERE DATE(deliveryDate) = CURDATE()");
            }

            cmd.CommandText = query.ToString().Trim() + this.GetSortString();
            return cmd;
        }

        private void PushSortButton(HtmlButton button, HiddenField hf)
        {
            // parallel arrays
            var buttons = GetSortButtons();
            var hiddenFields = GetHiddenFieldStates();

            // if push button is not yet active
            if (hf.Value == "false")
            {
                // change its color to make it look active
                button.Attributes["style"] = "color: rgb(169,169,169);";
                // change the value of its parallel hidden field
                hf.Value = "true";
            }
            else
            {
                // if already active, change its color back to default
                button.Attributes["style"] = "color: rgb(255, 255, 255);";
                // set its parallel hidden field to false meaning not active
                hf.Value = "false";
            }

            // make other buttons not active since we only allow 1 sort button at a time
            foreach (var bh in buttons.Zip(hiddenFields, Tuple.Create))
            {
                if (bh.Item1 != button)
                {
                    bh.Item1.Attributes["style"] = "color: rgb(255, 255, 255);";
                }
                if (bh.Item2 != hf)
                {
                    bh.Item2.Value = "false";
                }
            }
        }

        private string GetSortString()
        {
            // parallel arrays
            var sortStrings = GetSortStringQueries();
            var hiddenFields = GetHiddenFieldStates();

            // find the hidden field with a value of true, then return its sort string value based on the sortStrings array
            for (var i = 0; i < hiddenFields.Length; i++)
            {
                if (hiddenFields[i].Value == "true")
                {
                    return sortStrings[i];
                }
            }
            return "";
        }

        // event handler methods
        protected void OrderListView_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            this.DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.PopulateListView();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.PopulateListView();
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            tbSearch.Text = "";
            this.PopulateListView();
        }

        protected void statusDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.PopulateListView();
        }

        protected void idSortAsc_ServerClick(object sender, EventArgs e)
        {
            this.PushSortButton(idSortAsc, idSortAscHF);
            this.PopulateListView();
        }

        protected void idSortDesc_ServerClick(object sender, EventArgs e)
        {
            this.PushSortButton(idSortDesc, idSortDescHF);
            this.PopulateListView();
        }

        protected void emailSortAsc_ServerClick(object sender, EventArgs e)
        {
            this.PushSortButton(emailSortAsc, emailSortAscHF);
            this.PopulateListView();
        }

        protected void emailSortDesc_ServerClick(object sender, EventArgs e)
        {
            this.PushSortButton(emailSortDesc, emailSortDescHF);
            this.PopulateListView();
        }

        protected void dateSortAsc_ServerClick(object sender, EventArgs e)
        {
            this.PushSortButton(dateSortAsc, dateSortAscHF);
            this.PopulateListView();
        }

        protected void dateSortDesc_ServerClick(object sender, EventArgs e)
        {
            this.PushSortButton(dateSortDesc, dateSortDescHF);
            this.PopulateListView();
        }

        protected void priceSortAsc_ServerClick(object sender, EventArgs e)
        {
            this.PushSortButton(priceSortAsc, priceSortAscHF);
            this.PopulateListView();
        }

        protected void priceSortDesc_ServerClick(object sender, EventArgs e)
        {
            this.PushSortButton(priceSortDesc, priceSortDescHF);
            this.PopulateListView();
        }

        protected void OrderListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            // reference to the record
            ListViewDataItem item = e.Item as ListViewDataItem;

            // controls needed for the commands
            Label statusLabel = item.FindControl("statusLbl") as Label;
            DropDownList statusDropDown = item.FindControl("recordStatusDDL") as DropDownList;
            Button statusButton = item.FindControl("statusBtn") as Button;
            HiddenField orderID = item.FindControl("orderIDHf") as HiddenField;

            if (e.CommandName == "ChangeStatus")
            {
                if (statusButton.Text == "update")
                {
                    // change the properties of the status button and make the other controls visible
                    statusButton.Text = "save";
                    statusButton.Attributes["style"] = "background-color: rgb(178,59,59);";
                    statusLabel.Visible = false;
                    statusDropDown.Visible = true;
                }
                else if (statusButton.Text == "save")
                {
                    // change to the original properties
                    statusButton.Text = "update";
                    statusButton.Attributes["style"] = "background-color: rgb(50,205,50);";
                    statusLabel.Visible = true;
                    statusDropDown.Visible = false;

                    // codes for the update
                    MySqlCommand cmd = new MySqlCommand();
                    string updateQuery = "UPDATE orderTBL SET status=@newStatus WHERE orderID=@orderID";
                    cmd.Parameters.AddWithValue("@newStatus", statusDropDown.SelectedValue);
                    cmd.Parameters.AddWithValue("@orderID", orderID.Value);
                    cmd.CommandText = updateQuery;
                    int rowsAffected = db.ExecuteUpdateQuery(cmd);
                    cmd.Parameters.Clear();
                    this.PopulateListView();
                    cmd.Dispose();
                }
            }
        }

        protected void cbToday_CheckedChanged(object sender, EventArgs e)
        {
            this.PopulateListView();
        }

        protected void btnPdf_ServerClick(object sender, EventArgs e)
        {
            // get statusDDL and tbSearch value
            var status = statusDDL.SelectedValue;
            var textToSearch = tbSearch.Text.Trim();

            // get cmd for our data table 
            var cmd = GetCommandForDataTable(status, textToSearch);

            // using the object db GetDataTable method to get a data table using our cmd
            var table = db.GetDataTable(cmd);
            cmd.Dispose();

            this.ConvertDataTableToPDF(table, "Orders");
        }

        protected void btnPdf2_ServerClick(object sender, EventArgs e)
        {
            // get statusDDL and tbSearch value
            var status = statusDDL.SelectedValue;
            var textToSearch = tbSearch.Text.Trim();

            // get cmd for our data table 
            var cmd = GetCommandForDataTableDelivery(status, textToSearch);

            // using the object db GetDataTable method to get a data table using our cmd
            var table = db.GetDataTable(cmd);
            cmd.Dispose();

            this.ConvertDataTableToPDF(table, "Delivery");
        }

        protected void delDateSortAsc_ServerClick(object sender, EventArgs e)
        {
            this.PushSortButton(delDateSortAsc, delDateSortAscHF);
            this.PopulateListView();
        }

        protected void delDateSortDesc_ServerClick(object sender, EventArgs e)
        {
            this.PushSortButton(delDateSortDesc, delDateSortDescHF);
            this.PopulateListView();
        }
    }
}