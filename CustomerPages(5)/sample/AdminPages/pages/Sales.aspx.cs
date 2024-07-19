using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Data;
using System.IO;

namespace sample.AdminPages.pages
{
    public partial class Sales : System.Web.UI.Page
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
                " order by fullname", " order by fullName desc",
                " order by email", " order by email desc",
                " order by orderCount", " order by orderCount desc",
                " order by total, total", " order by total desc"
            };
            return sortStringsForQuery;
        }

        private HtmlButton[] GetSortButtons()
        {
            HtmlButton[] sortButtons =
            {
                nameSortAsc, nameSortDesc,
                emailSortAsc, emailSortDesc,
                orderSortAsc, orderSortDesc,
                totalSortAsc, totalSortDesc

            };
            return sortButtons;
        }

        private HiddenField[] GetHiddenFieldStates()
        {
            HiddenField[] hiddenFieldState =
            {
               nameSortAscHF, nameSortDescHF,
               emailSortAscHF, emailSortDescHF,
               orderSortAscHF, orderSortDescHF,
               totalSortAscHF, totalSortDescHF

            };
            return hiddenFieldState;
        }

        // helper methods

        private void ConvertDataTableToPDF(DataTable dataTable, string fileName, string pdfLabel)
        {
            // Create a new PDF document
            Document document = new Document();

            // Create a new memory stream
            MemoryStream memoryStream = new MemoryStream();

            // Create a new PDF writer
            PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);

            // Open the PDF document
            document.Open();

            // Create and add a label to the document
            Paragraph label = new Paragraph(pdfLabel, new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD));
            label.SpacingAfter = 10f; // Set the margin bottom in points (adjust the value as needed)
            document.Add(label);

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

            // Set the response headers for PDF download
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=" + fileName + ".pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            // Write the PDF document to the response output stream
            Response.BinaryWrite(memoryStream.ToArray());
            Response.End();
        }
        private void PopulateListView()
        {
            var textToSearch = tbSearch.Text.Trim();
            var fromDate = tbFromDate.Text.Trim();
            var toDate = tbToDate.Text.Trim();
            var tableCmd = GetCommandForDataTable(textToSearch, fromDate, toDate);

            // populate list view
            var table = db.GetDataTable(tableCmd);
            // check if datatable is empty, then make empty row visible if true
            if (table != null && table.Rows.Count > 0)
            {
                emptyRow.Visible = false;
                tableSalesRow.Visible = true;
            }
            else
            {
                emptyRow.Visible = true;
                tableSalesRow.Visible = false;
            }

            OrderListView.DataSource = table;
            OrderListView.DataBind();

            object sum = table.Compute("sum(total)", string.Empty);
            totalSales_Lbl.Text = "Sum: Php." +  sum.ToString();

            tableCmd.Dispose();
        }

        private MySqlCommand GetCommandForDataTable(string textToSearch, string fromDate, string toDate)
        {
            MySqlCommand cmd = new MySqlCommand();

            // build the query using a string builder
            var query = new StringBuilder();

            // starting string for our query
            query.Append("SELECT * FROM(SELECT CONCAT(customertbl.fname, ' ', customertbl.lname) as fullName, ordertbl.email, COUNT(ordertbl.email) AS orderCount, SUM(ordertbl.totalPrice) AS total ");
            query.Append("FROM ordertbl INNER JOIN customertbl ON ordertbl.email = customertbl.email ");
            if (!string.IsNullOrEmpty(textToSearch))
            {
                if (!string.IsNullOrEmpty(fromDate) && string.IsNullOrEmpty(toDate))
                {
                    query.Append("WHERE ordertbl.orderDate >= @fromDate ");
                    cmd.Parameters.AddWithValue("@fromDate", tbFromDate.Text);
                }
                else if (string.IsNullOrEmpty(fromDate) && !string.IsNullOrEmpty(toDate))
                {
                    query.Append("WHERE ordertbl.orderDate <= @toDate ");
                    cmd.Parameters.AddWithValue("@toDate", tbToDate.Text);
                }
                else if (!string.IsNullOrEmpty(fromDate) && !string.IsNullOrEmpty(toDate))
                {
                    query.Append("WHERE ordertbl.orderDate >= @fromDate and ");
                    query.Append("ordertbl.orderDate <= @toDate ");
                    cmd.Parameters.AddWithValue("@fromDate", tbFromDate.Text);
                    cmd.Parameters.AddWithValue("@toDate", tbToDate.Text);
                }

                query.Append(" and ordertbl.status = 'delivered' group by email, fullName) as subTable ");
                query.Append(GetWhereClause(cmd, textToSearch));
            }
            else
            {
                if (!string.IsNullOrEmpty(fromDate) && string.IsNullOrEmpty(toDate))
                {
                    query.Append("WHERE ordertbl.orderDate >= @fromDate ");
                    cmd.Parameters.AddWithValue("@fromDate", tbFromDate.Text);
                }
                else if (string.IsNullOrEmpty(fromDate) && !string.IsNullOrEmpty(toDate))
                {
                    query.Append("WHERE ordertbl.orderDate <= @toDate ");
                    cmd.Parameters.AddWithValue("@toDate", tbToDate.Text);
                }
                else if (!string.IsNullOrEmpty(fromDate) && !string.IsNullOrEmpty(toDate))
                {
                    query.Append("WHERE ordertbl.orderDate >= @fromDate and ");
                    query.Append("ordertbl.orderDate <= @toDate ");
                    cmd.Parameters.AddWithValue("@fromDate", tbFromDate.Text);
                    cmd.Parameters.AddWithValue("@toDate", tbToDate.Text);
                }
                query.Append(" and ordertbl.status = 'delivered' group by email, fullName) as subTable ");
            }
            cmd.CommandText = query.ToString().Trim() + this.GetSortString();
            return cmd;
        }

        private string GetWhereClause(MySqlCommand cmd, string textToSearch)
        {
            var query = new StringBuilder();
            query.Append(" WHERE fullName LIKE CONCAT('%', @fullName, '%')");
            query.Append(" OR email LIKE CONCAT('%', @email, '%')");
            query.Append(" OR orderCount LIKE CONCAT('%', @orderCount, '%')");
            query.Append(" OR total LIKE CONCAT('%', @total, '%')");

            cmd.Parameters.AddWithValue("@fullName", textToSearch);
            cmd.Parameters.AddWithValue("@email", textToSearch);
            cmd.Parameters.AddWithValue("@orderCount", textToSearch);
            cmd.Parameters.AddWithValue("@total", textToSearch);

            return query.ToString();
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

        protected void btnSearchSales_Click(object sender, EventArgs e)
        {
            this.PopulateListView();
        }

        protected void clearBtn_ServerClick(object sender, EventArgs e)
        {
            tbSearch.Text = "";
            this.PopulateListView();
        }

        protected void btnSearchRecord_Click(object sender, EventArgs e)
        {
            this.PopulateListView();
        }

        protected void nameSortAsc_ServerClick(object sender, EventArgs e)
        {
            PushSortButton(nameSortAsc, nameSortAscHF);
            this.PopulateListView();
        }

        protected void nameSortDesc_ServerClick(object sender, EventArgs e)
        {
            PushSortButton(nameSortDesc, nameSortDescHF);
            this.PopulateListView();
        }

        protected void emailSortAsc_ServerClick(object sender, EventArgs e)
        {
            PushSortButton(emailSortAsc, emailSortAscHF);
            this.PopulateListView();
        }

        protected void emailSortDesc_ServerClick(object sender, EventArgs e)
        {
            PushSortButton(emailSortDesc, emailSortDescHF);
            this.PopulateListView();
        }

        protected void orderSortAsc_ServerClick(object sender, EventArgs e)
        {
            PushSortButton(orderSortAsc, orderSortAscHF);
            this.PopulateListView();
        }

        protected void orderSortDesc_ServerClick(object sender, EventArgs e)
        {
            PushSortButton(orderSortDesc, orderSortDescHF);
            this.PopulateListView();
        }

        protected void totalSortAsc_ServerClick(object sender, EventArgs e)
        {
            PushSortButton(totalSortAsc, totalSortAscHF);
            this.PopulateListView();
        }

        protected void totalSortDesc_ServerClick(object sender, EventArgs e)
        {
            PushSortButton(totalSortDesc, totalSortDescHF);
            this.PopulateListView();
        }

        protected void btnPdf_ServerClick(object sender, EventArgs e)
        {
            var textToSearch = tbSearch.Text.Trim();
            var fromDate = tbFromDate.Text.Trim();
            var toDate = tbToDate.Text.Trim();
            var tableCmd = GetCommandForDataTable(textToSearch, fromDate, toDate);

            // populate list view
            var table = db.GetDataTable(tableCmd);
            object sum = table.Compute("sum(total)", string.Empty);
            this.ConvertDataTableToPDF(table, "SalesReport", "Total Sales: Php." + sum.ToString());
        }
    }
}