<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="sample.AdminPages.pages.Sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/SalesCss.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="salesPage-container">
        <div class="dl-container">
            <div class="dl-section">
                <button runat="server" id="btnPdf" class="dl-buttons" onserverclick="btnPdf_ServerClick">
                    <i class="fa-solid fa-file"></i>
                    PDF
                </button>
            </div>
         </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="date-container">
                    <div class="date-wrapper">
                        <label>From Date</label>
                        <asp:TextBox ID="tbFromDate" runat="server" TextMode="Date" CssClass="date"></asp:TextBox>
                    </div>
                    <div class="date-wrapper">
                        <label>To Date</label>
                        <asp:TextBox ID="tbToDate" runat="server" TextMode="Date" CssClass="date"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSearchSales" runat="server" Text="Generate Records" CssClass="search-sales-button" OnClick="btnSearchSales_Click"/>
                </div>
                <h2>Sales Report</h2>
                <div class="search-sort-container">
                <div class="vertical-align">
                    <label>Search</label>
                    <div class="tbSearch-wrapper">
                        <asp:TextBox ID="tbSearch" runat="server" CssClass="search-bar" placeholder="default"></asp:TextBox>
                        <button runat="server" id="clearBtn" type="button" class="tbsearch-clear-btn" onserverclick="clearBtn_ServerClick"><i class="fa-solid fa-x"></i></button>
                    </div>
                    <asp:Button ID="btnSearchRecord" runat="server" Text="Search" CssClass="search-btn" OnClick="btnSearchRecord_Click"/>
                </div>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>
                                Full Name
                                <button runat="server" id="nameSortAsc" type="button" class="sort-buttons" onserverclick="nameSortAsc_ServerClick"><i class="fa-solid fa-up-long "></i></button>
                                <button runat="server" id="nameSortDesc" type="button" class="sort-buttons" onserverclick="nameSortDesc_ServerClick"><i class="fa-solid fa-down-long "></i></button>
                                <asp:HiddenField ID="nameSortAscHF" runat="server" Value="false"/>
                                <asp:HiddenField ID="nameSortDescHF" runat="server" Value="false"/>
                            </th>
                            <th>
                                Email
                                <button runat="server" id="emailSortAsc" type="button" class="sort-buttons" onserverclick="emailSortAsc_ServerClick"><i class="fa-solid fa-up-long "></i></button>
                                <button runat="server" id="emailSortDesc" type="button" class="sort-buttons" onserverclick="emailSortDesc_ServerClick"><i class="fa-solid fa-down-long "></i></button>
                                <asp:HiddenField ID="emailSortAscHF" runat="server" Value="false"/>
                                <asp:HiddenField ID="emailSortDescHF" runat="server" Value="false"/>
                            </th>
                            <th>
                                Total Orders
                                <button runat="server" id="orderSortAsc" type="button" class="sort-buttons" onserverclick="orderSortAsc_ServerClick"><i class="fa-solid fa-up-long "></i></button>
                                <button runat="server" id="orderSortDesc" type="button" class="sort-buttons" onserverclick="orderSortDesc_ServerClick"><i class="fa-solid fa-down-long "></i></button>
                                <asp:HiddenField ID="orderSortAscHF" runat="server" Value="false"/>
                                <asp:HiddenField ID="orderSortDescHF" runat="server" Value="false"/>
                            </th>
                            <th>
                                Total Cost
                                <button runat="server" id="totalSortAsc" type="button" class="sort-buttons" onserverclick="totalSortAsc_ServerClick"><i class="fa-solid fa-up-long "></i></button>
                                <button runat="server" id="totalSortDesc" type="button" class="sort-buttons" onserverclick="totalSortDesc_ServerClick"><i class="fa-solid fa-down-long "></i></button>
                                <asp:HiddenField ID="totalSortAscHF" runat="server" Value="false"/>
                                <asp:HiddenField ID="totalSortDescHF" runat="server" Value="false"/>
                            </th>
                        </tr>
                    </thead>
                    <asp:ListView ID="OrderListView" runat="server" ItemPlaceholderID="itemPlaceholder" OnPagePropertiesChanging="OrderListView_PagePropertiesChanging">
                        <LayoutTemplate>
                            <tbody id="tableBody" runat="server">
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                            </tbody>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("fullName") %></td>
                                <td><%# Eval("email") %></td>
                                <td><%# Eval("orderCount") %></td>
                                <td>Php.<%# Eval("total") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                    <tr id="tableSalesRow" runat="server">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <asp:Label ID="totalSales_Lbl" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr id="emptyRow" runat="server" visible="false">
                        <td colspan="5" class="empty">
                            No results to display
                        </td>
                    </tr>
                </table>
                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="OrderListView" PageSize="6" class="datapager">
                    <Fields>
                        <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="pagination" FirstPageText="«" PreviousPageText="‹" />
                        <asp:NumericPagerField ButtonType="Button" CurrentPageLabelCssClass="pagination" NextPreviousButtonCssClass="pagination" NumericButtonCssClass="pagination" />
                        <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="pagination" LastPageText="»" NextPageText="›" />
                    </Fields>
                </asp:DataPager>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
