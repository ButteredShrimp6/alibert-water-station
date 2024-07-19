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
using System.Data;
using System.IO;


namespace sample.AdminPages.pages
{
    public partial class Users : System.Web.UI.Page
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
                " order by customertbl.email", " order by customertbl.email desc",
                " order by fullName", " order by fullName desc",
                " order by address", " order by address desc",
            };
            return sortStringsForQuery;
        }

        private HtmlButton[] GetSortButtons()
        {
            HtmlButton[] sortButtons =
            {
                emailSortAsc, emailSortDesc,
                nameSortAsc, nameSortDesc,
                addressSortAsc, addressSortDesc,
            };
            return sortButtons;
        }

        private HiddenField[] GetHiddenFieldStates()
        {
            HiddenField[] hiddenFieldState =
            {
                emailSortAscHF, emailSortDescHF,
                nameSortAscHF, nameSortDescHF,
                addressSortAscHF, addressSortDescHF,
            };
            return hiddenFieldState;
        }

        // helper methods

        private void ConvertDataTableToPDF(DataTable dataTable, string fileName)
        {
            // Create a new PDF document
            Document document = new Document();

            // Set the response content type to PDF
            Response.ContentType = "application/pdf";

            // Set the response headers to force the browser to download the PDF
            Response.AddHeader("content-disposition", "attachment;filename=" + fileName + ".pdf");
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
        private void PopulateListView()
        {
            // get tbSearch value
            var textToSearch = tbSearch.Text.Trim();
            var status = statusDDL.SelectedValue;
            var customerType = customerTypeDDL.SelectedValue;

            // get cmd for our data table then concat it with the sort string
            var cmd = GetCommandForDataTable(status, customerType, textToSearch);

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
        private MySqlCommand GetCommandForDataTable(string status, string customerType, string textToSearch)
        {
            MySqlCommand cmd = new MySqlCommand();

            // build the query using a string builder
            var query = new StringBuilder();

            // starting string for our query
            query.Append("SELECT customertbl.email, customertbl.mobileNum, customertbl.customerType, customertbl.status, CONCAT(customertbl.fname, ' ', customertbl.lname) AS fullName, ");
            query.Append("CONCAT_WS(' ', addresstbl.province, addresstbl.city, addresstbl.houseNumber, addresstbl.building, addresstbl.street, addresstbl.bsv, addresstbl.landmark) AS address ");
            query.Append("FROM customertbl INNER JOIN addresstbl ON customertbl.email = addresstbl.email ");

            // if search bar has a value, adjust the query
            if (!string.IsNullOrWhiteSpace(textToSearch))
            {
                // use LIKE operator to search for records based on the search bar
                query.Append("WHERE (customertbl.email LIKE CONCAT('%', @email, '%')");
                query.Append(" OR CONCAT(customertbl.fname, ' ', customertbl.lname) LIKE CONCAT('%', @fullName, '%')");
                query.Append(" OR CONCAT_WS(' ', addresstbl.province, addresstbl.city, addresstbl.houseNumber, addresstbl.building, addresstbl.street, addresstbl.bsv, addresstbl.landmark) LIKE CONCAT('%', @address, '%')");
                query.Append(" OR customerType LIKE CONCAT('%', @customerType, '%')");
                query.Append(" OR mobileNum LIKE CONCAT('%', @mobileNum, '%'))");

                // give the parameters in the query some arguments 
                cmd.Parameters.AddWithValue("@email", textToSearch);
                cmd.Parameters.AddWithValue("@fullName", textToSearch);
                cmd.Parameters.AddWithValue("@address", textToSearch);
                cmd.Parameters.AddWithValue("@customerType", textToSearch);
                cmd.Parameters.AddWithValue("@mobileNum", textToSearch);

                // if status is not 'all', add an 'AND' operator to filter data based on the status selected
                if (status != "all")
                {
                    query.Append(" AND customertbl.status = @status");
                    cmd.Parameters.AddWithValue("@status", status);
                }
                if (customerType != "all")
                {
                    query.Append(" AND customertbl.customerType = @customerType");
                    cmd.Parameters.AddWithValue("@customerType", customerType);
                }
            }
            else
            {
                // we do the same process stated in the previous comment, but now the textToSearch is empty so we remove the 'AND' operator and start the string with a WHERE clause
                if (status != "all")
                {
                    query.Append(" WHERE customertbl.status = @status");
                    cmd.Parameters.AddWithValue("@status", status);
                }
                if (customerType != "all")
                {
                    query.Append(" AND customertbl.customerType = @customerType");
                    cmd.Parameters.AddWithValue("@customerType", customerType);
                }
            }
            // add the query to the CommandText of our cmd plus the SortString from GetSortString() if it has values
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

        protected void customerTypeDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.PopulateListView();
        }
        protected void statusDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.PopulateListView();
        }

        protected void clearBtn_ServerClick(object sender, EventArgs e)
        {
            tbSearch.Text = "";
            this.PopulateListView();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
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

        protected void nameSortAsc_ServerClick(object sender, EventArgs e)
        {
            this.PushSortButton(nameSortAsc, nameSortAscHF);
            this.PopulateListView();
        }

        protected void nameSortDesc_ServerClick(object sender, EventArgs e)
        {
            this.PushSortButton(nameSortDesc, nameSortDescHF);
            this.PopulateListView();
        }

        protected void addressSortAsc_ServerClick(object sender, EventArgs e)
        {
            this.PushSortButton(addressSortAsc, addressSortAscHF);
            this.PopulateListView();
        }

        protected void addressSortDesc_ServerClick(object sender, EventArgs e)
        {
            this.PushSortButton(addressSortDesc, addressSortDescHF);
            this.PopulateListView();
        }


        protected void OrderListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            // reference to the record
            ListViewDataItem item = e.Item as ListViewDataItem;

            // controls needed for the commands
            Label statusLabel = item.FindControl("statusLbl") as Label;
            DropDownList statusDropDown = item.FindControl("userStatusDDL") as DropDownList;
            Button statusButton = item.FindControl("statusBtn") as Button;
            HiddenField email = item.FindControl("emailHF") as HiddenField;

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
                    string updateQuery = "UPDATE customertbl SET status=@newStatus WHERE email=@email";
                    cmd.Parameters.AddWithValue("@newStatus", statusDropDown.SelectedValue);
                    cmd.Parameters.AddWithValue("@email", email.Value);
                    cmd.CommandText = updateQuery;
                    int rowsAffected = db.ExecuteUpdateQuery(cmd);
                    cmd.Parameters.Clear();
                    this.PopulateListView();
                    cmd.Dispose();
                }
            }
        }

        protected void btnPdf_ServerClick(object sender, EventArgs e)
        {
            var textToSearch = tbSearch.Text.Trim();
            var status = statusDDL.SelectedValue;
            var customerType = customerTypeDDL.SelectedValue;
            var cmd = GetCommandForDataTable(status, customerType, textToSearch);
            var table = db.GetDataTable(cmd);
            cmd.Dispose();
            this.ConvertDataTableToPDF(table, "Users");
        }
    }
}