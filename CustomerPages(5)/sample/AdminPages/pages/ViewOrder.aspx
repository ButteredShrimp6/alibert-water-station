<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/Admin.Master" AutoEventWireup="true" CodeBehind="ViewOrder.aspx.cs" Inherits="sample.AdminPages.pages.ViewOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../styles/ViewOrderCss.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="server">
    <div class="viewOrderPage-container">
        <div class="section-container">
            <div class="tb-wrapper">
                <label>Customer Name</label>
                <asp:TextBox ID="tbName" runat="server" ReadOnly="true" CssClass="tb"></asp:TextBox>
            </div>
            <div class="tb-wrapper">
                <label>Order ID</label>
                <asp:TextBox ID="tbOrderID" runat="server" ReadOnly="true" CssClass="tb"></asp:TextBox>
            </div>
            <div class="tb-wrapper">
                <label>Address</label>
                <asp:TextBox ID="tbAddress" runat="server" ReadOnly="true" TextMode="MultiLine" CssClass="tb"></asp:TextBox>
            </div>
        </div>
        <div class="section-container">
            <div class="tb-wrapper">
                <label>Product ID</label>
                <asp:TextBox ID="tbProdID" runat="server" ReadOnly="true" CssClass="tb"></asp:TextBox>
            </div>
            <div class="tb-wrapper">
                <label>Order Date</label>
                <asp:TextBox ID="tbOrderDate" runat="server" ReadOnly="true" CssClass="tb"></asp:TextBox>
            </div>
            <div class="tb-wrapper">
                <label>Delivery Date</label>
                <asp:TextBox ID="tbDeliveryDate" runat="server" ReadOnly="true" CssClass="tb"></asp:TextBox>
            </div>
        </div>
        <div class="section-container">
            <div class="tb-wrapper">
                <label>Product Quantity</label>
                <asp:TextBox ID="tbProdQuantity" runat="server" ReadOnly="true" CssClass="tb"></asp:TextBox>
            </div>
            <div class="tb-wrapper">
                <label>Product Price</label>
                <asp:TextBox ID="tbProdPrice" runat="server" ReadOnly="true" CssClass="tb"></asp:TextBox>
            </div>
            <div class="tb-wrapper">
                <label>Total Price</label>
                <asp:TextBox ID="tbTotal" runat="server" ReadOnly="true" CssClass="tb"></asp:TextBox>
            </div>
        </div>
    </div>
</asp:Content>
