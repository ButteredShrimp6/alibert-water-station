<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="sample.AdminPages.pages.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/ProductsCss.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="productsPage-container">
        <div class="add-product-container">
            <h2>Product</h2>
            <div class="add-product-sections">
                <span>
                    <asp:HiddenField ID="mainProdIdHF" runat="server" />
                    <label>Product Name</label>
                </span>
                <div class="tb-wrapper">
                    <asp:TextBox ID="tbProductName" runat="server" CssClass="textbox-style"></asp:TextBox>
                    <asp:Label ID="lblProdNameError" runat="server" Text="invalid name" CssClass="validator" Visible="false"></asp:Label>
                </div>
            </div>
            <div class="add-product-sections">
                <span>
                    <label>Product Price</label>
                </span>
                <div class="tb-wrapper">
                    <asp:TextBox ID="tbProductPrice" runat="server" CssClass="textbox-style"></asp:TextBox>
                    <asp:Label ID="lblProdPriceError" runat="server" Text="invalid price" CssClass="validator" Visible="false"></asp:Label>
                </div>
            </div>
            <div class="add-product-sections">
                <span>
                    <label>Product Image</label>
                </span>
                <div class="tb-wrapper">
                    <asp:FileUpload ID="fuProductImage" runat="server" CssClass="textbox-style"/>
                    <asp:Label ID="lblImageUploadError" runat="server" Text="invalid file" CssClass="validator" Visible="false"></asp:Label>
                </div>
            </div>
            <div class="add-product-sections">
                <span>
                    <label>Product Status</label>
                </span>
                <div class="tb-wrapper">
                    <asp:DropDownList ID="ddlProductStatus" runat="server" CssClass="textbox-style">
                        <asp:ListItem Selected="True">active</asp:ListItem>
                        <asp:ListItem>not active</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="add-product-button-section">
                <asp:Button ID="btnSubmit" runat="server" Text="Add"  CssClass="add-btn" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnClearInputs" runat="server" Text="Clear" CssClass="clear-btn" CausesValidation="False" OnClick="btnClearInputs_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="cancel-btn" Visible="false" OnClick="btnCancel_Click"/>
            </div>
        </div>
        <div class="data-container">
            <div class="dl-container">
                <div class="dl-section">
                    <button id="btnPdf" runat="server" class="dl-buttons" onserverclick="btnPdf_ServerClick">
                        <i class="fa-solid fa-file"></i>
                        PDF
                    </button>
                </div>
             </div>
            <div class="search-sort-container">
                <div class="vertical-align">
                    <label>Search</label>
                    <div class="tbSearch-wrapper">
                        <asp:TextBox ID="tbSearch" runat="server" CssClass="search-bar" placeholder="default"></asp:TextBox>
                        <button runat="server" id="clearBtn" type="button" class="tbsearch-clear-btn" onserverclick="clearBtn_ServerClick"><i class="fa-solid fa-x"></i></button>
                    </div>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="search-btn" OnClick="btnSearch_Click" />
                </div>
                <div class="vertical-align">
                    <label>Status </label>
                    <asp:DropDownList ID="prodStatusDDL" runat="server" CssClass="sort-bar" AutoPostBack="true" OnSelectedIndexChanged="prodStatusDDL_SelectedIndexChanged">
                        <asp:ListItem Selected="True">all</asp:ListItem>
                        <asp:ListItem>active</asp:ListItem>
                        <asp:ListItem>not active</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>
                            Product ID
                            <button runat="server" id="idSortAsc" type="button" class="sort-buttons" onserverclick="idSortAsc_ServerClick"><i class="fa-solid fa-up-long "></i></button>
                            <button runat="server" id="idSortDesc" type="button" class="sort-buttons" onserverclick="idSortDesc_ServerClick"><i class="fa-solid fa-down-long "></i></button>
                            <asp:HiddenField ID="idSortAscHF" runat="server" Value="false"/>
                            <asp:HiddenField ID="idSortDescHF" runat="server" Value="false"/>
                        </th>
                        <th>
                            Name
                            <button runat="server" id="nameSortAsc" type="button" class="sort-buttons" onserverclick="nameSortAsc_ServerClick"><i class="fa-solid fa-up-long "></i></button>
                            <button runat="server" id="nameSortDesc" type="button" class="sort-buttons" onserverclick="nameSortDesc_ServerClick"><i class="fa-solid fa-down-long "></i></button>
                            <asp:HiddenField ID="nameSortAscHF" runat="server" Value="false"/>
                            <asp:HiddenField ID="nameSortDescHF" runat="server" Value="false"/>
                        </th>
                        <th>Image</th>
                        <th>
                            Price
                            <button runat="server" id="priceSortAsc" type="button" class="sort-buttons" onserverclick="priceSortAsc_ServerClick"><i class="fa-solid fa-up-long "></i></button>
                            <button runat="server" id="priceSortDesc" type="button" class="sort-buttons" onserverclick="priceSortDesc_ServerClick"><i class="fa-solid fa-down-long "></i></button>
                            <asp:HiddenField ID="priceSortAscHF" runat="server" Value="false"/>
                            <asp:HiddenField ID="priceSortDescHF" runat="server" Value="false"/>
                        </th>
                        <th>Status</th>
                        <th>Update</th>
                    </tr>
                </thead>
                <asp:ListView ID="ProductListView" runat="server" ItemPlaceholderID="itemPlaceholder" OnPagePropertiesChanging="ProductListView_PagePropertiesChanging" OnItemCommand="ProductListView_ItemCommand">
                <LayoutTemplate>
                    <tbody>
                        <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                    </tbody>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <asp:HiddenField ID="productIDHF" runat="server" Value='<%# Eval("productID") %>' />
                        <td><%# Eval("productID") %></td>
                        <td><%# Eval("productName") %></td>
                        <td>
                            <asp:Image CssClass="image" ID="imgProduct" runat="server" ImageUrl='<%# GetImageSrc(Eval("image")) %>' AlternateText="Product Image" />
                        </td>
                        <td>Php.<%# Eval("pricePerGallon") %></td>
                        <td><%# Eval("status") %></td>
                        <td>
                            <asp:Button ID="statusUpdateButton" runat="server" Text="update" CssClass="edit-status-button" CommandName="UpdateProduct" CausesValidation="false"/>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
            <tr id="emptyRow" runat="server" visible="false">
                <td colspan="6" class="empty">
                    No results to display
                </td>
            </tr>
            </table>
            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ProductListView" PageSize="6" class="datapager">
                <Fields>
                    <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="pagination" FirstPageText="«" PreviousPageText="‹" />
                    <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="pagination" NextPreviousButtonCssClass="pagination" NumericButtonCssClass="pagination" />
                    <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="pagination" LastPageText="»" NextPageText="›" />
                </Fields>
            </asp:DataPager>
        </div>
    </div>
</asp:Content>
