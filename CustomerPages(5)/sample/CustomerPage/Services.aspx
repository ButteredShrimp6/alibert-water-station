<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="sample.Services" %>

<!DOCTYPE html>
<html style="font-size: 16px;" lang="en"><head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Find Us, Place Order, Receive Order, Our Customers, Contact Us">
    <meta name="description" content="">
    <title>Services</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="Services.css" media="screen">
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
    <meta property="og:title" content="Services">
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
                    <form runat="server"><asp:Button ID="Button1" runat="server" OnClick="Logout_Click" CssClass="u-button-style u-hover-palette-1-light-1 u-nav-link u-white" Text="Log Out" /></form>
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
    <section class="u-clearfix u-grey-10 u-section-1" id="sec-a446">
      <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
        <h2 class="u-align-center u-text u-text-1">Find Us</h2>
        <div class="u-grey-light-2 u-map u-map-1">
          <div class="embed-responsive">
            <iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d241.80868172291667!2d121.3087991105991!3d14.13968930255665!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33bd5c32a93c72dd%3A0x9adfa02c49143508!2sFamorcan%20Natures%20Water%20Refilling%20Station!5e0!3m2!1sen!2sph!4v1684315725970!5m2!1sen!2sph" data-map="JTdCJTIycG9zaXRpb25UeXBlJTIyJTNBJTIybWFwLWVtYmVkJTIyJTJDJTIyYWRkcmVzcyUyMiUzQSUyMkNhbGF1YW4lMkMlMjBMYWd1bmElMkMlMjBQaGlsaXBwaW5lcyUyMiUyQyUyMnpvb20lMjIlM0ExMCUyQyUyMnR5cGVJZCUyMiUzQSUyMnJvYWQlMjIlMkMlMjJsYW5nJTIyJTNBbnVsbCUyQyUyMmFwaUtleSUyMiUzQSUyMkJhbGF5aGFuZ2luJTJDJTIwQ2FsYXVhbiUyMExhZ3VuYSUyMiUyQyUyMm1hcmtlcnMlMjIlM0ElNUIlNUQlMkMlMjJlbWJlZCUyMiUzQSUyMmh0dHBzJTNBJTJGJTJGd3d3Lmdvb2dsZS5jb20lMkZtYXBzJTJGZW1iZWQlM0ZwYiUzRCExbTE4ITFtMTIhMW0zITFkMjQxLjgwODY4MTcyMjkxNjY3ITJkMTIxLjMwODc5OTExMDU5OTEhM2QxNC4xMzk2ODkzMDI1NTY2NSEybTMhMWYwITJmMCEzZjAhM20yITFpMTAyNCEyaTc2OCE0ZjEzLjEhM20zITFtMiExczB4MzNiZDVjMzJhOTNjNzJkZCUyNTNBMHg5YWRmYTAyYzQ5MTQzNTA4ITJzRmFtb3JjYW4lMjUyME5hdHVyZXMlMjUyMFdhdGVyJTI1MjBSZWZpbGxpbmclMjUyMFN0YXRpb24hNWUwITNtMiExc2VuITJzcGghNHYxNjg0MzE1NzI1OTcwITVtMiExc2VuITJzcGglMjIlN0Q="></iframe>
          </div>
        </div>
        <h4 class="u-align-center u-text u-text-2">635 G. Medel St. Soriano Avenue Brgy. Balayhangin<br>Calauan, Calabarzon
        </h4>
      </div>
    </section>
    <section class="u-clearfix u-grey-5 u-section-2" id="sec-ddc3">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-clearfix u-expanded-width u-gutter-10 u-layout-wrap u-layout-wrap-1">
          <div class="u-layout" style="">
            <div class="u-layout-row" style="">
              <div class="u-container-style u-layout-cell u-left-cell u-size-30 u-size-xs-60 u-layout-cell-1" src="">
                <div class="u-container-layout u-container-layout-1">
                  <h2 class="u-align-center u-text u-text-default u-text-1">Place Order</h2>
                  <p class="u-align-center u-text u-text-2">Simply place your desired quantity of drinking water to be delivered. Fill your personal details and confirm.</p>
                  <a href="Products.aspx" class="u-btn u-btn-round u-button-style u-radius-50 u-btn-1">Order Now</a>
                </div>
              </div>
              <div class="u-align-center u-container-style u-image u-layout-cell u-right-cell u-size-30 u-size-xs-60 u-image-1" src="" data-image-width="1853" data-image-height="1127">
                <div class="u-container-layout u-valign-middle u-container-layout-2" src=""></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="u-clearfix u-grey-5 u-section-3" id="sec-4b3a">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-clearfix u-expanded-width u-gutter-10 u-layout-wrap u-layout-wrap-1">
          <div class="u-layout" style="">
            <div class="u-layout-row" style="">
              <div class="u-align-center u-container-style u-image u-layout-cell u-left-cell u-size-30 u-size-xs-60 u-image-1" src="" data-image-width="1536" data-image-height="2048">
                <div class="u-container-layout u-valign-middle u-container-layout-1" src=""></div>
              </div>
              <div class="u-container-style u-layout-cell u-right-cell u-size-30 u-size-xs-60 u-layout-cell-2" src="">
                <div class="u-container-layout u-valign-middle u-container-layout-2">
                  <h2 class="u-align-center u-text u-text-default u-text-1">Receive Order</h2>
                  <p class="u-align-center u-text u-text-2">We make sure to deliver the best quality of drinking water right at your doorstep. Delivery services are available for houses, offices, and restaurants.</p>
                  <%--<a href="HomePage.html" class="u-btn u-btn-round u-button-style u-radius-50 u-btn-1">Order Now</a>--%>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="u-align-center u-clearfix u-section-4" id="sec-e7c6">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-text u-text-default u-text-1">Our Customers</h2>
        <p class="u-text u-text-2">Sample text. Click to select the text box. Click again or double click to start editing the text.</p>
        <div class="u-expanded-width u-gallery u-layout-grid u-lightbox u-show-text-on-hover u-gallery-1">
          <div class="u-gallery-inner u-gallery-inner-1">
            <div class="u-effect-fade u-gallery-item">
              <div class="u-back-slide" data-image-width="1600" data-image-height="1059">
                <img class="u-back-image u-expanded" src="images/DSC_0181.JPG">
              </div>
              <div class="u-over-slide u-shading u-over-slide-1">
                <h3 class="u-gallery-heading"></h3>
                <p class="u-gallery-text"></p>
              </div>
            </div>
            <div class="u-effect-fade u-gallery-item">
              <div class="u-back-slide" data-image-width="259" data-image-height="194">
                <img class="u-back-image u-expanded" src="images/images.jpg">
              </div>
              <div class="u-over-slide u-shading u-over-slide-2">
                <h3 class="u-gallery-heading"></h3>
                <p class="u-gallery-text"></p>
              </div>
            </div>
            <div class="u-effect-fade u-gallery-item">
              <div class="u-back-slide" data-image-width="474" data-image-height="316">
                <img class="u-back-image u-expanded" src="images/OIP1.jpg">
              </div>
              <div class="u-over-slide u-shading u-over-slide-3">
                <h3 class="u-gallery-heading"></h3>
                <p class="u-gallery-text"></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="u-align-center u-clearfix u-section-5" id="sec-ddd5">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-expanded-width u-gallery u-layout-grid u-lightbox u-show-text-on-hover u-gallery-1">
          <div class="u-gallery-inner u-gallery-inner-1">
            <div class="u-effect-fade u-gallery-item">
              <div class="u-back-slide" data-image-width="800" data-image-height="600">
                <img class="u-back-image u-expanded" src="images/image.jpg">
              </div>
              <div class="u-over-slide u-shading u-over-slide-1">
                <h3 class="u-gallery-heading"></h3>
                <p class="u-gallery-text"></p>
              </div>
            </div>
            <div class="u-effect-fade u-gallery-item">
              <div class="u-back-slide" data-image-width="736" data-image-height="461">
                <img class="u-back-image u-expanded" src="images/103632582_100362328401530_6320524324695579802_n.png">
              </div>
              <div class="u-over-slide u-shading u-over-slide-2">
                <h3 class="u-gallery-heading"></h3>
                <p class="u-gallery-text"></p>
              </div>
            </div>
            <div class="u-effect-fade u-gallery-item">
              <div class="u-back-slide" data-image-width="1280" data-image-height="847">
                <img class="u-back-image u-expanded" src="images/8-billfish-close-wonga-beach-qld-4873_img23.jpg">
              </div>
              <div class="u-over-slide u-shading u-over-slide-3">
                <h3 class="u-gallery-heading"></h3>
                <p class="u-gallery-text"></p>
              </div>
            </div>
          </div>
        </div>
        <div class="u-effect-fade u-gallery-item u-gallery-item-4">
          <div class="u-back-slide">
            <img class="u-back-image u-expanded" src="data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIGlkPSJkZWZhdWx0LWltYWdlLXNvbGlkIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHg9IjBweCIgeT0iMHB4IiB2aWV3Qm94PSIwIDAgNDAwIDI2NSIgc3R5bGU9IndpZHRoOiA0MDBweDsgaGVpZ2h0OiAyNjVweDsiPg0KPHJlY3QgZmlsbD0iI0M2RDhFMSIgd2lkdGg9IjQwMCIgaGVpZ2h0PSIyNjUiLz4NCjxwYXRoIGZpbGw9IiNEOUUzRTgiIGQ9Ik0zOTUuMyw5Ni4yYy01LTAuOC02LjEsMS4xLTguNSwyLjljLTEtMi4zLTIuNi02LjItNy43LTVjMS41LTUuMy0yLjYtOC40LTcuNy04LjRjLTAuNiwwLTEuMiwwLjEtMS44LDAuMg0KCWMtMS44LTQuMS02LTYuOS0xMC43LTYuOWMtNi41LDAtMTEuOCw1LjMtMTEuOCwxMS44YzAsMC40LDAsMC45LDAuMSwxLjNjLTEuMi0wLjgtMi41LTEuMy0zLjktMS4zYy00LjMsMC03LjksNC4yLTcuOSw5LjQNCgljMCwxLjIsMC4yLDIuNCwwLjYsMy41Yy0wLjUtMC4xLTEtMC4xLTEuNi0wLjFjLTYuOSwwLTEyLjUsNS41LTEyLjcsMTIuNGMtMC45LTAuMi0xLjktMC40LTIuOS0wLjRjLTYuNCwwLTExLjcsNS4yLTEyLjUsMTEuOA0KCWMtMS4yLTAuNC0yLjUtMC42LTMuOS0wLjZjLTUuOSwwLTEwLjgsMy44LTEyLjEsOC45Yy0yLjQtMi01LjUtMy4yLTguOS0zLjJjLTYsMC0xMS4xLDMuNy0xMi44LDguOGMtMS41LTEuNC0zLjgtMi4zLTYuMy0yLjMNCgljLTIuMSwwLTQuMSwwLjYtNS41LDEuN2gtMC4xYy0xLjMtNS41LTYuMi05LjUtMTIuMS05LjVjLTIuNCwwLTQuNywwLjctNi42LDEuOWMtMS40LTAuNy0zLTEuMi00LjgtMS4yYy0wLjMsMC0wLjUsMC0wLjgsMA0KCWMtMS41LTQuMS01LjItNy05LjUtN2MtMy4xLDAtNS45LDEuNS03LjgsMy45Yy0yLjItNC44LTYuOC04LjItMTIuMi04LjJjLTUuNiwwLTEwLjUsMy43LTEyLjUsOC44Yy0yLjEtMC45LTQuNC0xLjUtNi45LTEuNQ0KCWMtNi44LDAtMTIuNSwzLjktMTQuNSw5LjNjLTAuMiwwLTAuNSwwLTAuNywwYy01LjIsMC05LjYsMy4yLTExLjQsNy44Yy0yLjctMi44LTctNC41LTExLjgtNC41Yy0zLjMsMC02LjQsMC45LTguOSwyLjMNCgljLTIuMS02LjUtOC0xMi4yLTE4LjEtOS45Yy0yLjctMi4zLTYuMy0zLjctMTAuMS0zLjdjLTIuNSwwLTQuOCwwLjYtNi45LDEuNmMtMi4yLTUuOS03LjktMTAuMS0xNC42LTEwLjFjLTguNiwwLTE1LjYsNy0xNS42LDE1LjYNCgljMCwwLjksMC4xLDEuNywwLjIsMi41Yy0yLjYtNS03LjgtOC40LTEzLjgtOC40Yy04LjMsMC0xNS4xLDYuNS0xNS42LDE0LjZjLTIuOS0zLjItNy01LjMtMTEuNy01LjNjLTcuNCwwLTEzLjUsNS4xLTE1LjIsMTINCgljLTIuOS0zLjUtOS44LTYtMTQuNy02djExOS4yaDQwMFYxMDJDNDAwLDEwMiw0MDAsOTcsMzk1LjMsOTYuMnoiLz4NCjxwYXRoIGZpbGw9IiM4RUE4QkIiIGQ9Ik00MDAsMjA2LjJjMCwwLTI1LjMtMTkuMi0zMy42LTI1LjdjLTEzLjQtMTAuNi0yMy4xLTEyLjktMzEuNy03cy0yMy45LDE5LjctMjMuOSwxOS43cy01OC45LTYzLjktNjEuNS02Ni40DQoJYy0xLjUtMS40LTMuNi0xLjctNS41LTAuOWMtNS4yLDIuNC0xNy42LDkuNy0yNC41LDEyLjdjLTYuOSwyLjktNDEtNTAuNy00OS42LTUzcy04NC4zLDgzLjMtMTAxLjQsNzUuMXMtMjYuOS0yLjMtMzUuNCwzLjUNCgljLTguNiw1LjktMTEsNS45LTE1LjksOC4ycy0xNy4xLTUuOS0xNy4xLTUuOVYyNjVjMCwwLDQwMCwwLjIsNDAwLDB2LTU4LjhINDAweiIvPg0KPHBhdGggZmlsbD0iIzdFOTZBNiIgZD0iTTMzMy40LDE3OWMtMTMuMS05LjMtNDAsNC42LTU1LjEsMTAuN2MtMjMuNiw5LjYtOTQtNTQuNC0xMDcuMi01OS43YzAsMC00LjIsMy43LTkuNiw3LjYNCgljLTMuNS0wLjQtOC40LTUuNy05LjktNC43Yy00LjYsMy4xLTE3LjgsMTUuNC0yOC4zLDI2LjZjLTEwLjUsMTEuMy0xMS43LDAtMTUuOC0wLjZjLTIuNS0wLjQtNTQuMSw0Mi41LTU4LjcsNDMuMQ0KCUMyMi4zLDIwNS4zLDAsMTk3LjUsMCwxOTcuNVYyNjVsNDAwLTAuMXYtNTMuM0M0MDAsMjExLjYsMzQ0LjgsMTg3LjEsMzMzLjQsMTc5eiIvPg0KPHBhdGggZmlsbD0iIzc4OEY5RSIgZD0iTTAsMjY0Ljl2LTU4LjZjMCwwLDguMiwxLjgsMTEuMyw1LjNjMy4xLDMuNiwyNi4xLTQuMiwyNi4xLDQuN3MwLjUsNC4yLDAuNSwxNC44YzAsMTAuNywyMy00LjIsMzguMS0xOC40DQoJczM0LjktNDkuMiwzNi0zNWMxLDE0LjItMTUuMSwzOS4yLTI0LDU2LjRDNzkuMSwyNTEuNCw1MS43LDI2NSw1MS43LDI2NUwwLDI2NC45eiIvPg0KPHBhdGggZmlsbD0iIzc4OEY5RSIgZD0iTTEwMCwyNjVjMCwwLDY2LjctMTI1LjEsNjguMy0xMTYuOHMtNi44LDI5LjcsMi4xLDI2LjFjOC45LTMuNiwxNC42LTE2LDE4LjgtOS41czE2LjIsMzguNiwyMS45LDMzLjgNCgljNS43LTQuNywyMS40LTEzLjEsMjIuNC02LjVjMSw2LjUtMSw1LjMtNS43LDIwLjJDMjIzLjEsMjI3LjEsMjAwLDI2NSwyMDAsMjY1aC0xMGMwLDAsNi0yNC44LDguNi0zNC45YzIuNi0xMC4xLTMuNy0xOS0xMi04LjMNCglzLTIzLDIyLTI0LDE3LjhzLTUuNy0zMC4zLTE4LjgtMTQuMmMtMTMsMTYtMzMuOCwzOS43LTMzLjgsMzkuN2gtMTBWMjY1eiIvPg0KPHBhdGggZmlsbD0iIzc4OEY5RSIgZD0iTTI0NSwyNjVjMCwwLDE5LjgtNTQuNywzMy40LTY0LjJzNTMuNy0yNy45LDQ2LjktMTMuNmMtNi44LDE0LjItMTEsMzQuNC0yMC4zLDQ5LjgNCgljLTkuNCwxNS40LTE4LjgsMjYuMS0xNC4xLDEzLjZjNC43LTEyLjUsNi40LTIzLjMsMy43LTIzLjFDMjcxLjMsMjI5LjEsMjYwLDI2NSwyNjAsMjY1SDI0NXoiLz4NCjwvc3ZnPg0K">
          </div>
          <div class="u-over-slide u-shading u-over-slide-4">
            <h3 class="u-gallery-heading"></h3>
            <p class="u-gallery-text"></p>
          </div>
        </div>
      </div>
    </section>
    
    
    <footer class="u-align-center u-clearfix u-footer u-palette-1-dark-1 u-footer" id="sec-8c36"><div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-text u-text-1">Contact Us</h2>
        <p class="u-text u-text-2">Address: Soriano Avenue Brgy. Balayhangin Calauan Laguna 4012 Philippines Contact Number: 09352654471 / 09175903037 Email:alibertwaterstation@gmail.com</p>
      </div></footer>
  
  
</body></html>