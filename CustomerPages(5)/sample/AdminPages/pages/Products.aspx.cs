using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using MySql.Data.MySqlClient;
using System.Text;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Data;

namespace sample.AdminPages.pages
{
    public partial class Products : System.Web.UI.Page
    {
        DbHandler db = new DbHandler();
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
                " order by productID", " order by productID desc",
                " order by productName", " order by productName desc",
                " order by pricePerGallon", " order by pricePerGallon desc",
            };
            return sortStringsForQuery;
        }

        private HtmlButton[] GetSortButtons()
        {
            HtmlButton[] sortButtons =
            {
                idSortAsc, idSortDesc,
                nameSortAsc, nameSortDesc,
                priceSortAsc, priceSortDesc
            };
            return sortButtons;
        }

        private HiddenField[] GetHiddenFieldStates()
        {
            HiddenField[] hiddenFieldState =
            {
                idSortAscHF, idSortDescHF,
                nameSortAscHF, nameSortDescHF,
                priceSortAscHF, priceSortDescHF,
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

        private bool IsImageFile(HttpPostedFile file)
        {
            if (file != null && file.ContentLength > 0)
            {
                string fileExtension = Path.GetExtension(file.FileName);

                // Check if the file extension is a recognized image format
                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
                if (allowedExtensions.Contains(fileExtension.ToLower()))
                {
                    try
                    {
                        // Attempt to load the file as an image
                        using (System.Drawing.Image image = System.Drawing.Image.FromStream(file.InputStream))
                        {
                            // File is a valid image
                            return true;
                        }
                    }
                    catch (Exception ex)
                    {
                        // File is not a valid image
                        return false;
                    }
                }
            }

            // File is not an image or no file was selected
            return false;
        }

        private void ClearInputs()
        {
            // hide error labels
            lblProdNameError.Visible = false;
            lblProdPriceError.Visible = false;
            lblImageUploadError.Visible = false;
            
            // clear input controls
            tbProductName.Text = "";
            tbProductPrice.Text = "";
            ddlProductStatus.ClearSelection();
        }

        private void PopulateListView()
        {
            // get statusDDL and tbSearch value
            var status = prodStatusDDL.SelectedValue;
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
            ProductListView.DataSource = table;
            ProductListView.DataBind();
            cmd.Dispose();
        }

        private MySqlCommand GetCommandForDataTable(string status, string textToSearch)
        {
            MySqlCommand cmd = new MySqlCommand();
            var query = new StringBuilder();

            query.Append("SELECT * FROM productstbl ");

            if (!string.IsNullOrWhiteSpace(textToSearch))
            {
                query.Append("WHERE (productID LIKE CONCAT('%', @productID, '%')");
                query.Append(" OR (productName LIKE CONCAT('%', @productName, '%')");
                query.Append(" OR pricePerGallon LIKE CONCAT('%', @pricePerGallon, '%'))");

                cmd.Parameters.AddWithValue("@productID", textToSearch);
                cmd.Parameters.AddWithValue("@productName", textToSearch);
                cmd.Parameters.AddWithValue("@pricePerGallon", textToSearch);

                if (status != "all")
                {
                    query.Append(" AND status = @status");
                    cmd.Parameters.AddWithValue("@status", status);
                }
            }
            else if (status != "all")
            {
                query.Append("WHERE status = @status");
                cmd.Parameters.AddWithValue("@status", status);
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

        protected string GetImageSrc(object imageData)
        {
            byte[] imageBytes = (byte[])imageData;
            string base64String = Convert.ToBase64String(imageBytes);

            return "data:image;base64," + base64String;
        }

        // event handler methods
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // regex for the product price to only accept valid numbers
            string regex = @"^(?!$)(?!0\d)\d*(\.\d+)?$";

            // use helper methods to determin if inputs are valid
            var prodNameNotEmpty = !string.IsNullOrEmpty(tbProductName.Text);
            var priceIsValid = Regex.IsMatch(tbProductPrice.Text, regex);
            var isImage = this.IsImageFile(fuProductImage.PostedFile);
            // if all inputs are valid, perform the insertion or update based on context
            if (priceIsValid && isImage && prodNameNotEmpty)
            {
                // hide the labels that show the error
                lblProdPriceError.Visible = false;
                lblImageUploadError.Visible = false;
                lblProdNameError.Visible = false;

                // convert the image into binary
                var fileBytes = fuProductImage.FileBytes;
                var cmd = new MySqlCommand();
                var query = new StringBuilder();
                if (btnSubmit.Text == "Update")
                {
                    // update 
                    query.Append("UPDATE productstbl SET ");
                    query.Append("productName = @productName, ");
                    query.Append("pricePerGallon = @pricePerGallon, ");
                    query.Append("status = @status, ");
                    query.Append("image = @image ");
                    query.Append("WHERE productID = @productID");
                    cmd.Parameters.AddWithValue("@productName", tbProductName.Text);
                    cmd.Parameters.AddWithValue("@pricePerGallon", tbProductPrice.Text);
                    cmd.Parameters.AddWithValue("@status", ddlProductStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@image", fileBytes);
                    cmd.Parameters.AddWithValue("@productID", mainProdIdHF.Value);
                    cmd.CommandText = query.ToString();
                    btnSubmit.Text = "Add";
                    btnCancel.Visible = false;
                    int rowsAffected = db.ExecuteUpdateQuery(cmd);
                    cmd.Dispose();
                    this.ClearInputs();
                    this.PopulateListView();
                    return;
                }
                else
                {
                    // insert
                    query.Append("INSERT INTO productstbl (productName, pricePerGallon, status, image) ");
                    query.Append("VALUES (@productName, @pricePerGallon, @status, @image)");
                    cmd.Parameters.AddWithValue("@productName", tbProductName.Text);
                    cmd.Parameters.AddWithValue("@pricePerGallon", tbProductPrice.Text);
                    cmd.Parameters.AddWithValue("@status", ddlProductStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@image", fileBytes);
                    cmd.CommandText = query.ToString();
                    int rowsAffected = db.ExecuteInsertQuery(cmd);
                    cmd.Dispose();
                    this.ClearInputs();
                    this.PopulateListView();
                    return;
                }
            }
            // this section is for checking each input individually then display the error thru a label
            if (!prodNameNotEmpty)
            {
                lblProdNameError.Visible = true;
            }
            if (!priceIsValid)
            {
                lblProdPriceError.Visible = true;
            }
            if (!isImage)
            {
                lblImageUploadError.Visible = true;
            }
        }

        protected void btnClearInputs_Click(object sender, EventArgs e)
        {
            this.ClearInputs();
        }

        protected void ProductListView_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            this.DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.PopulateListView();
        }

        protected void prodStatusDDL_SelectedIndexChanged(object sender, EventArgs e)
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            this.ClearInputs();
            btnCancel.Visible = false;
            btnSubmit.Text = "Add";
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

        protected void ProductListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            var cmd = new MySqlCommand();

            // reference to the record
            ListViewDataItem item = e.Item as ListViewDataItem;

            // controls needed for the commands
            HiddenField productID = item.FindControl("productIDHF") as HiddenField;

            if (e.CommandName == "UpdateProduct")
            {
                btnSubmit.Text = "Update";
                btnCancel.Visible = true;
                mainProdIdHF.Value = productID.Value;
                string query = "SELECT * FROM productstbl WHERE productID = @productID";
                cmd.Parameters.AddWithValue("@productID", productID.Value);
                cmd.CommandText = query;
                var table = db.GetDataTable(cmd);
                tbProductName.Text = table.Rows[0][1].ToString();
                tbProductPrice.Text = table.Rows[0][2].ToString();
                ddlProductStatus.SelectedValue = table.Rows[0][3].ToString();
            }
        }

        protected void btnPdf_ServerClick(object sender, EventArgs e)
        {
            // get statusDDL and tbSearch value
            var status = prodStatusDDL.SelectedValue;
            var textToSearch = tbSearch.Text.Trim();

            // get cmd for our data table 
            var cmd = GetCommandForDataTable(status, textToSearch);

            // using the object db GetDataTable method to get a data table using our cmd
            var table = db.GetDataTable(cmd);
            cmd.Dispose();

            this.ConvertDataTableToPDF(table, "Products");
        }
    }
}