<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="sample.AdminPages.pages.Orders" EnableTheming="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/OrdersCss.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <%--<asp:Timer ID="Timer1" runat="server" Interval="5000" OnTick="Timer_Tick"></asp:Timer>--%>
    <div class="orderPage-container">
        <div class="dl-container">
            <div class="dl-section">
                <button runat="server" id="btnPdf" class="dl-buttons" onserverclick="btnPdf_ServerClick">
                    <i class="fa-solid fa-file"></i>
                    PDF
                </button>
                <button runat="server" id="btnPdf2" class="dl-buttons" onserverclick="btnPdf2_ServerClick">
                    <i class="fa-solid fa-file-pdf"></i>
                    DELIVERY
                </button>
            </div>
         </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="search-sort-container">
                    <div class="vertical-align">
                        <label>Search</label>
                        <div class="tbSearch-wrapper">
                            <asp:TextBox ID="tbSearch" runat="server" CssClass="search-bar" placeholder="default"></asp:TextBox>
                            <button runat="server" id="clearBtn" type="button" class="tbsearch-clear-btn" onserverclick="clearBtn_Click"><i class="fa-solid fa-x"></i></button>
                        </div>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="search-btn" OnClick="btnSearch_Click"/>
                    </div>
                    <div class="vertical-align">
                        <label>Today</label>
                        <asp:CheckBox ID="cbToday" runat="server" CssClass="check-box" AutoPostBack="true" OnCheckedChanged="cbToday_CheckedChanged"/>
                        <label>Status </label>
                        <asp:DropDownList ID="statusDDL" runat="server" CssClass="sort-bar" AutoPostBack="true" OnSelectedIndexChanged="statusDDL_SelectedIndexChanged">
                            <asp:ListItem Selected="True">all</asp:ListItem>
                            <asp:ListItem>pending</asp:ListItem>
                            <asp:ListItem>delivered</asp:ListItem>
                            <asp:ListItem>dispatched</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>
                                Order ID
                                <button runat="server" id="idSortAsc" type="button" class="sort-buttons" onserverclick="idSortAsc_ServerClick"><i class="fa-solid fa-up-long "></i></button>
                                <button runat="server" id="idSortDesc" type="button" class="sort-buttons" onserverclick="idSortDesc_ServerClick"><i class="fa-solid fa-down-long "></i></button>
                                <asp:HiddenField ID="idSortAscHF" runat="server" Value="false"/>
                                <asp:HiddenField ID="idSortDescHF" runat="server" Value="false"/>
                            </th>
                            <th>
                                Email
                                <button runat="server" id="emailSortAsc" type="button" class="sort-buttons" onserverclick="emailSortAsc_ServerClick"><i class="fa-solid fa-up-long "></i></button>
                                <button runat="server" id="emailSortDesc" type="button" class="sort-buttons" onserverclick="emailSortDesc_ServerClick"><i class="fa-solid fa-down-long "></i></button>
                                <asp:HiddenField ID="emailSortAscHF" runat="server" Value="false"/>
                                <asp:HiddenField ID="emailSortDescHF" runat="server" Value="false"/>
                            </th>
                            <th>
                                Order Date
                                <button runat="server" id="dateSortAsc" type="button" class="sort-buttons" onserverclick="dateSortAsc_ServerClick"><i class="fa-solid fa-up-long "></i></button>
                                <button runat="server" id="dateSortDesc" type="button" class="sort-buttons" onserverclick="dateSortDesc_ServerClick"><i class="fa-solid fa-down-long "></i></button>
                                <asp:HiddenField ID="dateSortAscHF" runat="server" Value="false"/>
                                <asp:HiddenField ID="dateSortDescHF" runat="server" Value="false"/>
                            </th>
                            <th>
                                Delivery Date
                                <button runat="server" id="delDateSortAsc" type="button" class="sort-buttons" onserverclick="delDateSortAsc_ServerClick"><i class="fa-solid fa-up-long "></i></button>
                                <button runat="server" id="delDateSortDesc" type="button" class="sort-buttons" onserverclick="delDateSortDesc_ServerClick"><i class="fa-solid fa-down-long "></i></button>
                                <asp:HiddenField ID="delDateSortAscHF" runat="server" Value="false"/>
                                <asp:HiddenField ID="delDateSortDescHF" runat="server" Value="false"/>
                            </th>
                            <th>
                                Total Price
                                <button runat="server" id="priceSortAsc" type="button" class="sort-buttons" onserverclick="priceSortAsc_ServerClick"><i class="fa-solid fa-up-long "></i></button>
                                <button runat="server" id="priceSortDesc" type="button" class="sort-buttons" onserverclick="priceSortDesc_ServerClick"><i class="fa-solid fa-down-long "></i></button>
                                <asp:HiddenField ID="priceSortAscHF" runat="server" Value="false"/>
                                <asp:HiddenField ID="priceSortDescHF" runat="server" Value="false"/>
                            </th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <asp:ListView ID="OrderListView" runat="server" ItemPlaceholderID="itemPlaceholder" OnPagePropertiesChanging="OrderListView_PagePropertiesChanging" OnItemCommand="OrderListView_ItemCommand">
                        <LayoutTemplate>
                            <tbody>
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                            </tbody>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <a runat="server" href='<%# "ViewOrder.aspx?orderID=" + Eval("orderID") %>'>
                                        <%# Eval("orderID") %>
                                    </a>
                                </td>
                                <td><%# Eval("email") %></td>
                                <td>
                                    <%# Eval("orderDate", "{0:MM/dd/yyyy}") %><br />
                                    <%# Eval("orderDate", "{0:hh:mm tt}") %>
                                </td>
                                <td>
                                    <%# Eval("deliveryDate", "{0:MM/dd/yyyy}") %><br />
                                    <%# Eval("deliveryDate", "{0:hh:mm tt}") %>
                                </td>
                                <td>Php.<%# Eval("totalPrice") %></td>
                                <td>
                                    <asp:HiddenField ID="orderIDHf" runat="server" Value='<%# Eval("orderID") %>' />
                                    <asp:Label ID="statusLbl" runat="server" Text='<%# Eval("status") %>' CssClass="order-status-lbl"></asp:Label>
                                    <asp:DropDownList ID="recordStatusDDL" runat="server" Visible="false" SelectedValue='<%# Eval("status") %>' CssClass="order-status-ddl">
                                        <asp:ListItem Text = "pending" Value = "pending"></asp:ListItem>
                                        <asp:ListItem Text = "delivered" Value = "delivered"></asp:ListItem>
                                        <asp:ListItem Text = "dispatched" Value = "dispatched"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Button ID="statusBtn" runat="server" Text="update" CssClass="edit-status-button" CommandName="ChangeStatus"/>
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

