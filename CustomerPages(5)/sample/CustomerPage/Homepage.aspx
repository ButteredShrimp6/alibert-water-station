<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="sample.WebForm1" %>

<!DOCTYPE html>
<html style="font-size: 16px;" lang="en"><head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Alibert Water Refilling Station, Quality Water, Trusted by Families, Our Services, Services, Join Alibert">
    <meta name="description" content="">
    <title>HomePage</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="HomePage.css" media="screen">
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
    <meta property="og:title" content="HomePage">
    <meta property="og:type" content="website">
  <meta data-intl-tel-input-cdn-path="intlTelInput/"></head>
  <body data-home-page="HomePage.html" data-home-page-title="HomePage" class="u-body u-xl-mode" data-lang="en">
      <form id="form1" runat="server">
          <header class="u-border-2 u-border-palette-1-dark-1 u-clearfix u-header u-palette-1-light-3 u-header" id="sec-650f"><div class="u-clearfix u-sheet u-sheet-1" style="left: 0px; top: 0px">
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
                    <asp:Button ID="Button1" runat="server" OnClick="Logout_Click" CssClass="u-button-style u-hover-palette-1-light-1 u-nav-link u-white" Text="Log Out" />
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
    <section class="u-carousel u-slide u-block-7a7c-1" id="carousel_d439" data-interval="5000" data-u-ride="carousel">
      <ol class="u-absolute-hcenter u-carousel-indicators u-block-7a7c-2">
        <li data-u-target="#carousel_d439" class="u-active u-grey-30" data-u-slide-to="0"></li>
        <li data-u-target="#carousel_d439" class="u-grey-30" data-u-slide-to="1"></li>
        <li data-u-target="#carousel_d439" class="u-grey-30" data-u-slide-to="2"></li>
      </ol>
      <div class="u-carousel-inner" role="listbox">
        <div class="u-active u-align-center u-carousel-item u-clearfix u-image u-shading u-section-1-1" src="" data-image-width="1195" data-image-height="671">
          <div class="u-clearfix u-sheet u-sheet-1">
            <h1 class="u-text u-text-default u-title u-text-1">Alibert Water Refilling Station</h1>
          </div>
        </div>
        <div class="u-align-center u-carousel-item u-clearfix u-image u-shading u-section-1-2" src="" data-image-width="2048" data-image-height="1536">
          <div class="u-clearfix u-sheet u-sheet-1">
            <h1 class="u-text u-text-default u-title u-text-1">Quality Water</h1>
          </div>
        </div>
        <div class="u-align-center u-carousel-item u-clearfix u-image u-shading u-section-1-3" src="" data-image-width="1536" data-image-height="1445">
          <div class="u-clearfix u-sheet u-sheet-1">
            <h1 class="u-text u-text-default u-title u-text-1">Trusted by Families</h1>
          </div>
        </div>
      </div>
      <a class="u-absolute-vcenter u-carousel-control u-carousel-control-prev u-text-grey-30 u-block-7a7c-3" href="#carousel_d439" role="button" data-u-slide="prev">
        <span aria-hidden="true">
          <svg class="u-svg-link" viewBox="0 0 477.175 477.175"><path d="M145.188,238.575l215.5-215.5c5.3-5.3,5.3-13.8,0-19.1s-13.8-5.3-19.1,0l-225.1,225.1c-5.3,5.3-5.3,13.8,0,19.1l225.1,225
                    c2.6,2.6,6.1,4,9.5,4s6.9-1.3,9.5-4c5.3-5.3,5.3-13.8,0-19.1L145.188,238.575z"></path></svg>
        </span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="u-absolute-vcenter u-carousel-control u-carousel-control-next u-text-grey-30 u-block-7a7c-4" href="#carousel_d439" role="button" data-u-slide="next">
        <span aria-hidden="true">
          <svg class="u-svg-link" viewBox="0 0 477.175 477.175"><path d="M360.731,229.075l-225.1-225.1c-5.3-5.3-13.8-5.3-19.1,0s-5.3,13.8,0,19.1l215.5,215.5l-215.5,215.5
                    c-5.3,5.3-5.3,13.8,0,19.1c2.6,2.6,6.1,4,9.5,4c3.4,0,6.9-1.3,9.5-4l225.1-225.1C365.931,242.875,365.931,234.275,360.731,229.075z"></path></svg>
        </span>
        <span class="sr-only">Next</span>
      </a>
    </section>
    <section class="u-clearfix u-palette-1-dark-1 u-section-2" id="sec-6a2b">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-align-center u-text u-text-1">Our Services</h2>
        <p class="u-align-center u-large-text u-text u-text-variant u-text-2"> The business provides water delivery and pickup for its customers. In the process of refilling your gallons,
             we ensure that we first wash and sanitize your gallons before refilling it. After refilling with our trusted filtered water,
             we then seal it and make sure the container won't get contaminated and will arrive to your home safely. For best service, we provide
             a delivery for customers that prefers to get their drinking water delievered right at their front step. We ensure we provide you quality water. </p>
      </div>
    </section>
    <section class="u-align-center u-clearfix u-section-3" id="sec-ea9e">
      <div class="u-align-left u-clearfix u-sheet u-sheet-1">
        <div class="u-list u-list-1">
          <div class="u-repeater u-repeater-1">
            <div class="u-container-style u-hover-feature u-list-item u-repeater-item u-shape-rectangle u-list-item-1">
              <div class="u-container-layout u-similar-container u-container-layout-1"><span class="u-icon u-icon-1"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 59.066 59.066" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-e215"></use></svg><svg class="u-svg-content" viewBox="0 0 59.066 59.066" x="0px" y="0px" id="svg-e215" style="enable-background:new 0 0 59.066 59.066;"><path d="M52.844,27.116C52.412,26.396,51.689,26,50.805,26c-0.004,0-0.008,0-0.012,0c-1.667,0.006-3.673,0.667-5.235,1.724
	c-1.441,0.975-3.53,2.782-5.293,5.863c-0.331,0.578-0.874,0.97-1.455,1.063c-0.002-0.134-0.001-0.287-0.001-0.432
	c0-0.309,0.001-0.677-0.012-1.083V11c0-2.206-1.794-4-4-4s-4,1.794-4,4v15.5c0,0.275-0.225,0.5-0.5,0.5s-0.5-0.225-0.5-0.5V4
	c0-2.206-1.794-4-4-4s-4,1.794-4,4v22.5c0,0.275-0.225,0.5-0.5,0.5s-0.5-0.225-0.5-0.5v-18c0-1.93-1.57-3.5-3.5-3.5
	s-3.5,1.57-3.5,3.5v20c0,0.275-0.225,0.5-0.5,0.5s-0.5-0.225-0.5-0.5V16c0-1.93-1.57-3.5-3.51-3.5c-1.93,0-3.5,1.57-3.5,3.5
	l0.002,27.197c0.968,13.983,9.545,15.869,17.808,15.869c6.846,0,12.995-3.396,16.027-8.824c0.39-0.63,1.445-2.289,2.696-4.254
	c3.128-4.914,5.748-9.041,6.135-9.775c0.863-1.634,1.826-2.911,2.784-3.693c0.867-0.708,1.397-1.611,1.828-2.404
	C53.29,29.703,53.484,28.186,52.844,27.116z M51.256,29.259c-0.4,0.729-0.777,1.3-1.282,1.712c-1.18,0.964-2.285,2.413-3.287,4.309
	c-0.381,0.723-3.794,6.086-6.053,9.635c-1.258,1.976-2.318,3.642-2.733,4.314c-2.701,4.834-8.182,7.838-14.304,7.838
	c-10.542,0-15.123-4.059-15.81-13.938V16c0-0.827,0.673-1.5,1.51-1.5c0.827,0,1.5,0.673,1.5,1.5v12.5c0,1.379,1.121,2.5,2.5,2.5
	s2.5-1.121,2.5-2.5v-20c0-0.827,0.673-1.5,1.5-1.5s1.5,0.673,1.5,1.5v18c0,1.379,1.121,2.5,2.5,2.5s2.5-1.121,2.5-2.5V4
	c0-1.103,0.897-2,2-2s2,0.897,2,2v22.5c0,1.379,1.121,2.5,2.5,2.5s2.5-1.121,2.5-2.5V11c0-1.103,0.897-2,2-2s2,0.897,2,2v22.166
	c0.013,0.411,0.012,0.758,0.012,1.05c-0.002,0.895-0.003,1.541,0.49,2.024c0.413,0.403,0.948,0.428,1.326,0.432
	c1.361-0.031,2.655-0.833,3.376-2.092c1.571-2.748,3.41-4.344,4.677-5.199c1.232-0.834,2.851-1.376,4.123-1.381
	c0.001,0,0.003,0,0.004,0c0.214,0,0.263,0.063,0.292,0.1C51.294,28.35,51.303,28.979,51.256,29.259z"></path></svg>
            
            
          </span>
                <h3 class="u-align-center u-text u-text-default u-text-1">Sanitize</h3>
                <p class="u-align-center u-text u-text-2">We ensure the cleanliness of your containers in every refill. Guaranteed containers are entirely sanitized and cleaned.</p>
              </div>
            </div>
            <div class="u-align-center u-container-style u-hover-feature u-list-item u-repeater-item u-shape-rectangle u-list-item-2">
              <div class="u-container-layout u-similar-container u-container-layout-2"><span class="u-file-icon u-icon u-icon-2"><img src="images/4552857.png" alt=""></span>
                <h3 class="u-align-center u-text u-text-default u-text-3">Refill</h3>
                <p class="u-align-center u-text u-text-4">We refill only with the certified and purified drinking water. Regularly checked by laboratory inspections.</p>
              </div>
            </div>
            <div class="u-container-style u-hover-feature u-list-item u-repeater-item u-shape-rectangle u-list-item-3">
              <div class="u-container-layout u-similar-container u-container-layout-3"><span class="u-file-icon u-icon u-icon-3"><img src="images/3556584.png" alt=""></span>
                <h3 class="u-align-center u-text u-text-default u-text-5">Seal</h3>
                <p class="u-align-center u-text u-text-6">After refilling, we make sure to seal our newly refilled container to ensure cleanliness and safety.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      
      
    </section>
    <section class="u-align-center u-clearfix u-section-4" id="sec-1ced">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-clearfix u-expanded-width u-gutter-10 u-layout-wrap u-layout-wrap-1">
          <div class="u-layout">
            <div class="u-layout-row">
              <div class="u-container-style u-layout-cell u-left-cell u-size-15 u-size-30-md u-layout-cell-1" src="">
                <div class="u-container-layout u-container-layout-1">
                  <img class="u-absolute-hcenter u-expanded-height u-image u-image-1" src="images/alibert4.jpg" data-image-width="473" data-image-height="808">
                </div>
              </div>
              <div class="u-align-left u-container-style u-layout-cell u-size-15 u-size-30-md u-layout-cell-2">
                <div class="u-container-layout u-container-layout-2">
                  <h3 class="u-text u-text-1">Our Products</h3>
                  <p class="u-text u-text-2">Selection of water containers are available to be reused and refill. With our services, we ensure a trusted drinking water for your family.</p>
                </div>
              </div>
              <div class="u-container-style u-image u-layout-cell u-size-15 u-size-30-md u-image-2" src="" data-image-width="515" data-image-height="548">
                <div class="u-container-layout u-container-layout-3"></div>
              </div>
              <div class="u-align-left u-container-style u-layout-cell u-right-cell u-size-15 u-size-30-md u-layout-cell-4">
                <div class="u-container-layout u-container-layout-4">
                  <h3 class="u-text u-text-3">Purified Water</h3>
                  <p class="u-text u-text-4">We guarantee we serve you with certified purified drinking water from our station to your home.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="u-align-center u-clearfix u-section-5" id="sec-a930">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-text u-text-default u-text-1">Services</h2>
        <p class="u-text u-text-2">For your convenience, we offer home delivery right on your doorstep.</p>
        <div class="u-expanded-width u-gallery u-layout-grid u-lightbox u-show-text-on-hover u-gallery-1">
          <div class="u-gallery-inner u-gallery-inner-1">
            <div class="u-effect-fade u-gallery-item">
              <div class="u-back-slide" data-image-width="1536" data-image-height="1384">
                <img class="u-back-image u-expanded" src="images/334433535_573184371542996_323083822452322756_n.jpg">
              </div>
              <div class="u-over-slide u-shading u-over-slide-1">
                <h3 class="u-gallery-heading"></h3>
                <p class="u-gallery-text"></p>
              </div>
            </div>
            <div class="u-effect-fade u-gallery-item">
              <div class="u-back-slide" data-image-width="1488" data-image-height="1277">
                <img class="u-back-image u-expanded" src="images/311895460_630874002157684_2238859776289616070_n1.jpg">
              </div>
              <div class="u-over-slide u-shading u-over-slide-2">
                <h3 class="u-gallery-heading"></h3>
                <p class="u-gallery-text"></p>
              </div>
            </div>
            <div class="u-effect-fade u-gallery-item">
              <div class="u-back-slide" data-image-width="1536" data-image-height="2048">
                <img class="u-back-image u-expanded" src="images/337462618_548887383976919_6282022607186032485_n.jpg">
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
    <section class="u-align-center u-clearfix u-section-6" id="sec-c1f3">
      <div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-text u-text-1">Join Alibert Today</h2>
        <div class="u-carousel u-gallery u-gallery-slider u-layout-carousel u-lightbox u-no-transition u-show-text-none u-gallery-1" id="carousel-f035" data-interval="5000" data-u-ride="carousel">
          <ol class="u-absolute-hcenter u-carousel-indicators u-carousel-indicators-1">
            <li data-u-target="#carousel-f035" data-u-slide-to="0" class="u-active u-grey-70 u-shape-circle" style="width: 10px; height: 10px;"></li>
            <li data-u-target="#carousel-f035" data-u-slide-to="1" class="u-grey-70 u-shape-circle" style="width: 10px; height: 10px;"></li>
          </ol>
          <div class="u-carousel-inner u-gallery-inner" role="listbox">
            <div class="u-active u-carousel-item u-gallery-item u-carousel-item-1">
              <div class="u-back-slide" data-image-width="1853" data-image-height="1127">
                <img class="u-back-image u-expanded" src="images/311979960_472421848199687_8547895855616819208_n1.jpg">
              </div>
              <div class="u-align-center u-over-slide u-shading u-valign-bottom u-over-slide-1">
                <h3 class="u-gallery-heading">Sample Title</h3>
                <p class="u-gallery-text">Sample Text</p>
              </div>
            </div>
            <div class="u-carousel-item u-gallery-item u-carousel-item-2">
              <div class="u-back-slide" data-image-width="2048" data-image-height="1536">
                <img class="u-back-image u-expanded" src="images/alibert2.jpg">
              </div>
              <div class="u-align-center u-over-slide u-shading u-valign-bottom u-over-slide-2">
                <h3 class="u-gallery-heading">Sample Title</h3>
                <p class="u-gallery-text">Sample Text</p>
              </div>
            </div>
          </div>
          <a class="u-absolute-vcenter u-carousel-control u-carousel-control-prev u-grey-70 u-icon-circle u-opacity u-opacity-70 u-spacing-10 u-text-white u-carousel-control-1" href="#carousel-f035" role="button" data-u-slide="prev">
            <span aria-hidden="true">
              <svg viewBox="0 0 451.847 451.847"><path d="M97.141,225.92c0-8.095,3.091-16.192,9.259-22.366L300.689,9.27c12.359-12.359,32.397-12.359,44.751,0
c12.354,12.354,12.354,32.388,0,44.748L173.525,225.92l171.903,171.909c12.354,12.354,12.354,32.391,0,44.744
c-12.354,12.365-32.386,12.365-44.745,0l-194.29-194.281C100.226,242.115,97.141,234.018,97.141,225.92z"></path></svg>
            </span>
            <span class="sr-only">
              <svg viewBox="0 0 451.847 451.847"><path d="M97.141,225.92c0-8.095,3.091-16.192,9.259-22.366L300.689,9.27c12.359-12.359,32.397-12.359,44.751,0
c12.354,12.354,12.354,32.388,0,44.748L173.525,225.92l171.903,171.909c12.354,12.354,12.354,32.391,0,44.744
c-12.354,12.365-32.386,12.365-44.745,0l-194.29-194.281C100.226,242.115,97.141,234.018,97.141,225.92z"></path></svg>
            </span>
          </a>
          <a class="u-absolute-vcenter u-carousel-control u-carousel-control-next u-grey-70 u-icon-circle u-opacity u-opacity-70 u-spacing-10 u-text-white u-carousel-control-2" href="#carousel-f035" role="button" data-u-slide="next">
            <span aria-hidden="true">
              <svg viewBox="0 0 451.846 451.847"><path d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744
L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284
c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z"></path></svg>
            </span>
            <span class="sr-only">
              <svg viewBox="0 0 451.846 451.847"><path d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744
L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284
c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z"></path></svg>
            </span>
          </a>
        </div>
        <a href="Products.aspx" class="u-btn u-btn-round u-button-style u-hover-palette-1-light-1 u-palette-1-base u-radius-50 u-btn-1">Order Now</a>
      </div>
    </section>
    
    
    <footer class="u-align-center u-clearfix u-footer u-palette-1-dark-1 u-footer" id="sec-8c36"><div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-text u-text-1">Contact Us</h2>
        <p class="u-text u-text-2">Address: Soriano Avenue Brgy. Balayhangin Calauan Laguna 4012 Philippines Contact Number: 09352654471 / 09175903037 Email:alibertwaterstation@gmail.com</p>
      </div></footer>
   
  
      </form>
  
</body></html>
