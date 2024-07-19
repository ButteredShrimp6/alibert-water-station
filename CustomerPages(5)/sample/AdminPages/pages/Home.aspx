<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="sample.AdminPages.pages.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/HomeCss.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="container">
      <div class="row">
        <div class="card">
            <label class="category-label">Products</label>
            <asp:Label ID="productLbl" runat="server" Text="Label" CssClass="count-label"></asp:Label>
            <a id="productLink" runat="server" href="Products.aspx">
                <i class="fa-solid fa-eye"></i>
                View Details
            </a>
            <i class="fa-solid fa-shop master-icons card-icon"></i>
        </div>
        <div class="card">
            <label class="category-label">Orders</label>
            <asp:Label ID="orderLbl" runat="server" Text="Label" CssClass="count-label"></asp:Label>
            <a id="orderLink" runat="server" href="Orders.aspx">
                <i class="fa-solid fa-eye"></i>
                View Details
            </a>
            <i class="fa-sharp fa-solid fa-basket-shopping master-icons card-icon"></i>
        </div>
      </div>
      <div class="row">
        <div class="card">
            <label class="category-label">Users</label>
            <asp:Label ID="usersLbl" runat="server" Text="Label" CssClass="count-label"></asp:Label>
            <a id="usersLink" runat="server" href="Users.aspx">
                <i class="fa-solid fa-eye"></i>
                View Details
            </a>
            <i class="fa-solid fa-user master-icons card-icon"></i>
        </div>
        <div class="card">
            <label class="category-label">Sales</label>
            <asp:Label ID="salesLbl" runat="server" Text="Label" CssClass="count-label"></asp:Label>
            <a id="salesLink" runat="server" href="Sales.aspx">
                <i class="fa-solid fa-eye"></i>
                View Details
            </a>
            <i class="fa-solid fa-square-poll-horizontal master-icons card-icon"></i>
        </div>
      </div>
    </div>
</asp:Content>
