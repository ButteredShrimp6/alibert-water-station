<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="sample.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <html style="font-size: 16px;" lang="en"><head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Checkout, Contact Us">
    <meta name="description" content="">
    <title>Checkout</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="Checkout.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 5.9.10, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "",
		"logo": "images/316484527_1678752629186571_5287312407575518591_n-removebg-preview.png"
}</script>
    <meta name="theme-color" content="#478ac9"/>
    <meta property="og:title" content="Checkout"/>
    <meta property="og:type" content="website"/>
  <meta data-intl-tel-input-cdn-path="intlTelInput/"/></head>
  <body class="u-body u-xl-mode" data-lang="en"> <header class="u-border-2 u-border-palette-1-dark-1 u-clearfix u-header u-palette-1-light-3 u-header" id="sec-650f"><div class="u-clearfix u-sheet u-sheet-1" style="left: 0px; top: 0px">
        <nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
          <div class="menu-collapse u-custom-font u-font-roboto" style="font-size: 1.125rem; letter-spacing: 0px; font-weight: 700;">
            <a class="u-button-style u-custom-color u-custom-hover-color u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-text-active-color u-custom-text-color u-custom-text-hover-color u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
              <svg class="u-svg-link" viewBox="0 0 24 24"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
              <svg class="u-svg-content" version="1.1" id="menu-hamburger" viewBox="0 0 16 16" x="0px" y="0px" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg"><g><rect y="1" width="16" height="2"></rect><rect y="7" width="16" height="2"></rect><rect y="13" width="16" height="2"></rect>
</g></svg>
            </a>
          </div>

         <div class="u-custom-menu u-nav-container">
           <ul class="u-custom-font u-font-roboto u-nav u-unstyled u-nav-1">
               <li class="u-nav-item">
                   <a class="u-button-style u-hover-palette-1-light-2 u-nav-link u-text-active-black u-text-body-color" href="Homepage.aspx" style="padding: 14px 42px;">Home</a>
               </li>
               <li class="u-nav-item">
                   <a class="u-button-style u-hover-palette-1-light-2 u-nav-link u-text-active-black u-text-body-color" href="Products.aspx" style="padding: 14px 42px;">Products</a>
                </li>
               <li class="u-nav-item">
                   <a class="u-button-style u-hover-palette-1-light-2 u-nav-link u-text-active-black u-text-body-color" href="Services.aspx" style="padding: 14px 42px;">Services</a>
                </li>
               <li class="u-nav-item"><a class="u-button-style u-hover-palette-1-light-2 u-nav-link u-text-active-black u-text-body-color" style="padding: 14px 42px;">Account</a>
            <div class="u-nav-popup">
                <ul class="u-border-3 u-border-grey-75 u-h-spacing-45 u-nav u-unstyled u-v-spacing-13">
                <li class="u-nav-item"/>
                    <a class="u-button-style u-hover-palette-1-light-1 u-nav-link u-white" href="YourCart.aspx">Your Cart</a>
                <li class="u-nav-item">
                    <a class="u-button-style u-hover-palette-1-light-1 u-nav-link u-white" href="PendingTransaction.aspx">Pending Transactions</a>
                </li>
                <li class="u-nav-item">
                    <a class="u-button-style u-hover-palette-1-light-1 u-nav-link u-white" href="TransactionHistory.aspx">Your History</a>
                </li>
                <li class="u-nav-item">
                    <a class="u-button-style u-hover-palette-1-light-1 u-nav-link u-white" href="EditProfile.aspx">Edit Profile</a>
                </li>
                <li class="u-nav-item">
                    <asp:Button ID="Button2" runat="server" OnClick="Logout_Click" CssClass="u-button-style u-hover-palette-1-light-1 u-nav-link u-white" Text="Log Out" />
                </li>
              </ul>
            </div>
            </ul>
           </div>
        </nav>
        <a href="Homepage.aspx" class="u-image u-logo u-image-1" data-image-width="1188" data-image-height="210" title="Products" rel="nofollow">
          <img src="images/316484527_1678752629186571_5287312407575518591_n-removebg-preview.png" class="u-logo-image u-logo-image-1"/>
        </a>
                   <div class="u-align-right">
              </div>
      </div></header>
    <section class="u-clearfix u-image u-section-1" id="sec-2864" data-image-width="1300" data-image-height="1300">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-container-style u-group u-radius-30 u-shape-round u-white u-group-1">
          <div class="u-container-layout u-container-layout-1">
            <h4 class="u-text u-text-default u-text-1">Delivery</h4><span class="u-file-icon u-icon u-icon-1"><img src="images/1670915.png" alt=""/></span>
              <h6 class="u-text u-text-default u-text-3">Delivery Date </h6>              
              <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="false" TextMode="Date"></asp:TextBox>
              <asp:TextBox ID="TextBox2" runat="server" TextMode="Time" AutoPostBack="false"></asp:TextBox>
          </div>
        </div>
        <div class="u-container-style u-group u-radius-30 u-shape-round u-white u-group-2">
          <div class="u-container-layout u-container-layout-2">
            <h5 class="u-text u-text-default u-text-2">Delivery Address</h5>
            <a href="SaveAddress.aspx" class="u-active-none u-border-2 u-border-no-left u-border-no-right u-border-no-top u-border-palette-1-base u-bottom-left-radius-0 u-bottom-right-radius-0 u-btn u-btn-rectangle u-button-style u-hover-none u-none u-radius-0 u-top-left-radius-0 u-top-right-radius-0 u-btn-1">Change</a><br />
           
              
              <!-- Address Label -->
              
              <asp:Label runat="server" ID="addresslbl" Text="address here" CssClass="u-text u-text-default u-text-3">Address here</asp:Label><br />


            <h5 class="u-text u-text-default u-text-4">Contant Information</h5><br />
            <a href="EditProfile.aspx" class="u-active-none u-border-2 u-border-no-left u-border-no-right u-border-no-top u-border-palette-1-base u-bottom-left-radius-0 u-bottom-right-radius-0 u-btn u-btn-rectangle u-button-style u-hover-none u-none u-radius-0 u-top-left-radius-0 u-top-right-radius-0 u-btn-2">Change</a><br />
            <asp:Label  runat="server" ID="namelbl" CssClass="u-text u-text-default u-text-5" Text="Name Here"></asp:Label><span class="u-file-icon u-icon u-icon-2"><img src="images/666201.png" alt=""/></span><br />
            <asp:Label runat="server" ID="mobNum" CssClass="u-text u-text-default u-text-6" Text="Mobile Number here"></asp:Label><span class="u-file-icon u-icon u-icon-3"><img src="images/597177.png" alt=""/></span><br />
            <asp:Label runat="server" ID="emaillbl" CssClass="u-text u-text-default u-text-7" Text ="Email Address here"></asp:Label><span class="u-file-icon u-icon u-icon-4"><img src="images/542689.png" alt=""/></span><br />
          </div>
        </div>
        <div class="u-container-style u-group u-radius-30 u-shape-round u-white u-group-3">
          <div class="u-container-layout u-container-layout-3">
            <h2 class="u-text u-text-default u-text-8">Checkout</h2>
            <h6 class="u-text u-text-default u-text-9">Subtotal: </h6>
            ₱<asp:Label CssClass="u-text u-text-default u-text-10" runat="server" Text="" ID="subtotal"></asp:Label>
            <h6 class="u-text u-text-default u-text-11">Delivery Fee:</h6>
            ₱<asp:Label runat="server" ID="deliveryFee" Text="0.00" CssClass="u-text u-text-default u-text-10"></asp:Label>
            <h6 class="u-text u-text-default u-text-13">Total:</h6>
            ₱<asp:Label runat="server" ID="totallbl" Text="" CssClass="u-text u-text-default u-text-10"></asp:Label>
            <h6 class="u-text u-text-default u-text-15">Payment Details</h6>
            <h5 class="u-text u-text-default u-text-16">Cash on Delivery</h5>
            <h6 class="u-text u-text-default u-text-17">Total Amount to Pay:</h6>
            ₱<asp:Label runat="server" ID="grandtotal" Text="" CssClass="u-text u-text-default u-text-10"></asp:Label>                        
            <asp:Button ID="placeorderBtn" runat="server" OnClick="PlaceorderBtn_Click" CssClass="u-btn u-btn-round u-button-style u-hover-palette-1-light-1 u-palette-1-base u-radius-50 u-btn-3" Text="PLACE ORDER" /><br />
          </div>
            
        </div>
        <div class="u-container-style u-group u-radius-30 u-shape-round u-white u-group-4">
          <div class="u-container-layout u-container-layout-4">
            <h5 class="u-text u-text-default u-text-19">Order Summary</h5>
              <h6 class="u-text u-text-default u-text-3">Container Type: </h6><br />
              <asp:Label runat="server" ID="containerTypelbl" Text="Container Type " CssClass="u-text u-text-default u-text-10"></asp:Label><br />
              <h6 class="u-text u-text-default u-text-3">Quantity: </h6><br />
              <asp:Label runat="server" ID="quantitylbl" Text="Quantity " CssClass="u-text u-text-default u-text-10"></asp:Label><br />
          </div>
        </div>
        <div class="u-container-style u-group u-radius-30 u-shape-round u-white u-group-5">
          <div class="u-container-layout u-container-layout-5">
            <h5 class="u-text u-text-default u-text-20">Payment Method</h5>
            <h5 class="u-text u-text-default u-text-21">Cash on Delivery</h5>
          </div>
        </div>
      </div>
    </section>
    
    
    <footer class="u-align-center u-clearfix u-footer u-palette-1-dark-1 u-footer" id="sec-8c36"><div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-text u-text-1">Contact Us</h2>
        <p class="u-text u-text-2">Address: Soriano Avenue Brgy. Balayhangin Calauan Laguna 4012 Philippines Contact Number: 09352654471 / 09175903037 Email:alibertwaterstation@gmail.com</p>
        <p class="u-small-text u-text u-text-default u-text-variant u-text-3">Sample small text. Lorem ipsum dolor sit amet.</p>
      </div></footer>
    <section class="u-backlink u-clearfix u-grey-80">
      <a class="u-link" href="https://nicepage.com/website-templates" target="_blank">
        <span>Website Templates</span>
      </a>
      <p class="u-text">
        <span>created with</span>
      </p>
      <a class="u-link" href="" target="_blank">
        <span>Website Builder Software</span>
      </a>. 
    </section>
  
</body></html>







        </div>
    </form>
</body>
</html>
