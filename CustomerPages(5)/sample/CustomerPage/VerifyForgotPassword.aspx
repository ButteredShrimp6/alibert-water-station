<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerifyForgotPassword.aspx.cs" Inherits="sample.VerifyForgotPassword" %>

<style type="text/css">
    .auto-style1 {
        margin-left: 63;
    }
    .auto-style2 {
        height: 118px;
    }
    </style>
<form id="form1" runat="server">

<<!DOCTYPE html>
<html style="font-size: 16px;" lang="en"><head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Contact Us">
    <meta name="description" content="">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="LogIn.css" media="screen">
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
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="LogIn">
    <meta property="og:type" content="website">
  <meta data-intl-tel-input-cdn-path="intlTelInput/"></head>
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
            <%if (Request.Cookies["ID_COOKIE"] == null)
                {
            %>                
                    <li class="u-nav-item">
                        <a class="u-button-style u-hover-palette-1-light-1 u-nav-link u-white" href="Login.aspx">Log In</a>
                    </li>
                    <li class="u-nav-item">
                        <a class="u-button-style u-hover-palette-1-light-1 u-nav-link u-white" href="SignUp.aspx">Sign Up</a>
                    </li>
                
             <%  }
                 else
                 {
             %>
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
                    <asp:Button ID="Button3" runat="server" OnClick="Logout_Click" CssClass="u-button-style u-hover-palette-1-light-1 u-nav-link u-white" Text="Log Out" />
                </li>
            <%
                 }
            %>            
              </ul>
            </div>
            </ul>
           </div>
        </nav>
        <a href="Homepage.aspx" class="u-image u-logo u-image-1" data-image-width="1188" data-image-height="210" title="Products" rel="nofollow">
          <img src="images/316484527_1678752629186571_5287312407575518591_n-removebg-preview.png" class="u-logo-image u-logo-image-1">
        </a>
                   <div class="u-align-right">
              </div>
      </div></header>
    <section class="u-clearfix u-image u-section-1" id="sec-54b8" data-image-width="1300" data-image-height="1300">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-container-style u-group u-radius-36 u-shape-round u-white u-group-1">
          <div class="u-container-layout u-container-layout-1">
            <h3 class="u-text u-text-default u-text-1">Forgot Password</h3>
            
            <h5 class="u-text u-text-default u-text-3">Verification Code for Forgot Password<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="verificationTxt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
              </h5>

            

            <asp:TextBox ID="verificationTxt" runat="server" CssClass="auto-style1" Width="294px"></asp:TextBox>
              <div align="center">
                  <p class="auto-style2">

                  </p>
                  <p>

                  </p>
                  

            <asp:Button ID="verifyTxt" runat="server" href="https://nicepage.com/website-mockup" class="u-align-center u-btn u-btn-round u-button-style u-radius-11 u-btn-1" Height ="12%" Width="100%" OnClick="verifyBtn_Click" Text="Forgot Password"></asp:Button>
                </div>
                 <%--<a href="https://nicepage.com/website-mockup" class="u-align-center u-btn u-btn-round u-button-style u-radius-11 u-btn-2" id="btnForgot">Forgot Password</a>--%>
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
  
</form>
  
</body></html>
