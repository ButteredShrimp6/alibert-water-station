<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="sample.AdminPages.pages.Users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/UsersCss.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="usersPage-container">
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
                <div class="search-container">
                    <div class="vertical-align">
                        <label>Search</label>
                        <div class="tbSearch-wrapper">
                            <asp:TextBox ID="tbSearch" runat="server" CssClass="search-bar" placeholder="default"></asp:TextBox>
                            <button runat="server" id="clearBtn" type="button" class="tbsearch-clear-btn" onserverclick="clearBtn_ServerClick"><i class="fa-solid fa-x"></i></button>
                        </div>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="search-btn" OnClick="btnSearch_Click"/>
                    </div>
                    <div class="vertical-align">
                        <label>Customer Type</label>
                        <asp:DropDownList ID="customerTypeDDL" runat="server" CssClass="sort-bar customer-type-ddl" AutoPostBack="true" OnSelectedIndexChanged="customerTypeDDL_SelectedIndexChanged">
                            <asp:ListItem Selected="True">all</asp:ListItem>
                            <asp:ListItem>regular</asp:ListItem>
                            <asp:ListItem>corporate</asp:ListItem>
                        </asp:DropDownList>
                        <label>Status </label>
                        <asp:DropDownList ID="statusDDL" runat="server" CssClass="sort-bar" AutoPostBack="true" OnSelectedIndexChanged="statusDDL_SelectedIndexChanged">
                            <asp:ListItem Selected="True">active</asp:ListItem>
                            <asp:ListItem>not active</asp:ListItem>
                            <asp:ListItem>all</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>
                                User Email
                                <button runat="server" id="emailSortAsc" type="button" class="sort-buttons" onserverclick="emailSortAsc_ServerClick"><i class="fa-solid fa-up-long "></i></button>
                                <button runat="server" id="emailSortDesc" type="button" class="sort-buttons" onserverclick="emailSortDesc_ServerClick"><i class="fa-solid fa-down-long "></i></button>
                                <asp:HiddenField ID="emailSortAscHF" runat="server" Value="false"/>
                                <asp:HiddenField ID="emailSortDescHF" runat="server" Value="false"/>
                            </th>
                            <th>
                                Full Name
                                <button runat="server" id="nameSortAsc" type="button" class="sort-buttons" onserverclick="nameSortAsc_ServerClick"><i class="fa-solid fa-up-long "></i></button>
                                <button runat="server" id="nameSortDesc" type="button" class="sort-buttons" onserverclick="nameSortDesc_ServerClick"><i class="fa-solid fa-down-long "></i></button>
                                <asp:HiddenField ID="nameSortAscHF" runat="server" Value="false"/>
                                <asp:HiddenField ID="nameSortDescHF" runat="server" Value="false"/>
                            </th>
                            <th>
                                Address
                                <button runat="server" id="addressSortAsc" type="button" class="sort-buttons" onserverclick="addressSortAsc_ServerClick"><i class="fa-solid fa-up-long "></i></button>
                                <button runat="server" id="addressSortDesc" type="button" class="sort-buttons" onserverclick="addressSortDesc_ServerClick"><i class="fa-solid fa-down-long "></i></button>
                                <asp:HiddenField ID="addressSortAscHF" runat="server" Value="false"/>
                                <asp:HiddenField ID="addressSortDescHF" runat="server" Value="false"/>
                            </th>
                            <th>
                                 Mobile Number
                                <%--<button runat="server" id="contactNumSortAsc" type="button" class="sort-buttons" onserverclick="contactNumSortAsc_ServerClick"><i class="fa-solid fa-up-long "></i></button>
                                <button runat="server" id="contactNumSortDesc" type="button" class="sort-buttons" onserverclick="contactNumSortDesc_ServerClick"><i class="fa-solid fa-down-long "></i></button>
                                <asp:HiddenField ID="contactNumSortAscHF" runat="server" Value="false"/>
                                <asp:HiddenField ID="contactNumSortDescHF" runat="server" Value="false"/>--%>
                            </th>
                            <th>
                                Customer Type
                            </th>
                            <th>
                                Status
                            </th>
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
                                <asp:HiddenField ID="emailHF" runat="server" Value='<%# Eval("email") %>'/>
                                <td><%# Eval("email") %></td>
                                <td><%# Eval("fullName") %></td>
                                <td>
                                    <asp:TextBox CssClass="tb-address-style" ID="tbAddress" runat="server" Text='<%# Eval("address") %>' TextMode="MultiLine" ReadOnly ="true"></asp:TextBox>
                                </td>
                                <td><%# Eval("mobileNum") %></td>
                                <td><%# Eval("customerType") %></td>
                                <td>
                                    <asp:Label ID="statusLbl" runat="server" Text='<%# Eval("status") %>' CssClass="user-status-lbl"></asp:Label>
                                    <asp:DropDownList ID="userStatusDDL" runat="server" Visible="false" SelectedValue='<%# Eval("status") %>' CssClass="user-status-ddl">
                                        <asp:ListItem Text = "active" Value = "active"></asp:ListItem>
                                        <asp:ListItem Text = "not active" Value = "not active"></asp:ListItem>
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
