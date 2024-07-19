<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="sample.SignUp" %>

<!DOCTYPE html>
<form id="form1" runat="server">
<html style="font-size: 16px;" lang="en"><head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Contact Us">
    <meta name="description" content="">
    <title>SignUp</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="SignUp.css" media="screen">
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
    <meta property="og:title" content="SignUp">
    <meta property="og:type" content="website">
  <meta data-intl-tel-input-cdn-path="intlTelInput/">
    <style type="text/css">
        .auto-style3 {
            left: 55px;
            top: 0px;
            width: 214px;
        }
        .auto-style4 {
            left: 402px;
            top: -58px;
            width: 230px;
        }
        .auto-style5 {
            left: 56px;
            top: -65px;
            width: 307px;
        }
        .auto-style6 {
            left: 53px;
            top: -124px;
            width: 259px;
        }
        .auto-style7 {
            left: 53px;
            top: -175px;
            width: 248px;
        }
        .auto-style8 {
            left: 425px;
            top: -225px;
            width: 248px;
        }
        .auto-style9 {
            font-size: x-small;
        }
        </style>
</head>
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
                 <li class="u-nav-item">
                        <a class="u-button-style u-hover-palette-1-light-1 u-nav-link u-white" href="Login.aspx">Log In</a>
                    </li>
                    <li class="u-nav-item">
                        <a class="u-button-style u-hover-palette-1-light-1 u-nav-link u-white" href="SignUp.aspx">Sign Up</a>
                    </li>         
                   
            
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
    <section class="u-clearfix u-image u-section-1" id="sec-c004" data-image-width="1300" data-image-height="1300">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-container-style u-group u-radius-35 u-shape-round u-white u-group-1" style="left: 0px; top: 0px; height: 630px">
          <div class="u-container-layout u-container-layout-1">
            <h3 class="u-text u-text-default u-text-1">Create an Alibert Account</h3>
            <a href="Login.aspx" class="u-active-none u-border-2 u-border-no-left u-border-no-right u-border-no-top u-border-palette-1-base u-bottom-left-radius-0 u-bottom-right-radius-0 u-btn u-btn-rectangle u-button-style u-hover-none u-none u-radius-0 u-text-hover-palette-2-base u-top-left-radius-0 u-top-right-radius-0 u-btn-1">Login</a>
            <p class="u-text u-text-default u-text-2">Already have an account?</p>
              
              
              <div>
            <p class="u-text u-text-default u-text-3" style="left: 0px; top: 0px; width: 214px">First Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fname" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Letters only" ControlToValidate="fname" ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
            </p>
              </div>
              
              
             <%--<input type="text" id="fname" name="fname" class="auto-style3"><br><br>--%>
               <asp:TextBox ID="fname" runat="server" class="auto-style3" Width="294px"></asp:TextBox>
              <br><br>
                 

            <p class="u-text u-text-default u-text-4" style="left: 102px; top: -61px; width: 237px">Last Name<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lname" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Letters only" ControlToValidate="lname" ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>

            </p>

               <%--<input type="text" id="lname" name="lname" class="auto-style4"><br>--%>
              <asp:TextBox ID="lname" runat="server" class="auto-style4" Width="294px"></asp:TextBox>
              <br>
                  
                  
            <p class="u-text u-text-default u-text-5" style="left: -1px; top: -66px; width: 673px">Mobile Number<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="mobNum" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
              <strong>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Mobile number should be 11 digits" ControlToValidate="mobNum" ForeColor="Red" ValidationExpression="[0-9]{11}"></asp:RegularExpressionValidator>
              </strong>
            
            </p>
              <%--<input type="text" id="mobNum" name="mobNum" class="auto-style5"><br><br>--%>
            
              <asp:TextBox ID="mobNum" runat="server" class="auto-style5" Width="294px"></asp:TextBox>
              
              <br><br>

            <p class="u-text u-text-default u-text-6" style="left: -1px; top: -125px; margin-left: 57px">Email<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="email" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
           
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Email values only" ControlToValidate="email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

            </p>
               <%--<input type="text" id="email" name="email" class="auto-style6"><br><br>--%>
               <asp:TextBox ID="email" runat="server" class="auto-style6" Width="294px"></asp:TextBox>
              <br><br>

              <p class="u-text u-text-default u-text-4" style="left: 102px; top: -200px; width: 237px">Customer Type<br />
                  <asp:DropDownList ID="DropDownList1" runat="server">
                      <asp:ListItem>Regular</asp:ListItem>
                      <asp:ListItem>Corporate</asp:ListItem>
                  </asp:DropDownList>

            <p class="u-text u-text-default u-text-7" style="left: 0px; top: -180px; width: 399px">Password<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="password" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Must have a digit and a special character" ControlToValidate="password" CssClass="auto-style9" ForeColor="Red" ValidationExpression="^.*(?=.{1,})(?=.*[\d])(?=.*[\W]).*$"></asp:RegularExpressionValidator>
            </p>
              
              
            </p>
              <%--<input type="text" id="password" name="password" class="auto-style7"><br><br>--%>
               <asp:TextBox ID="password" runat="server" class="auto-style7" Width="294px" TextMode="Password"></asp:TextBox>
              <br><br>
            <p class="u-text u-text-default u-text-8" style="left: 37px; top: -229px; width: 186px">Confirm Password<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="conPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
              
            
            </p>
              <%--<input type="text" id="conPassword" name="conPassword" class="auto-style8"><br><br>--%>
               <asp:TextBox ID="conPassword" runat="server" class="auto-style8" Width="294px" TextMode="Password"></asp:TextBox>
              <br>
              <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="conPassword" ErrorMessage="Incorrect Password" ForeColor="Red"></asp:CompareValidator>
              <br>


                 
            <p class="u-text u-text-palette-5-base u-text-9" style="left: 8px; top: -282px">By signing up you agree to our&nbsp; Terms and Conditions&nbsp; and&nbsp; Privacy Policy</p>
              <p></p>
              <p></p>
              <asp:Button ID="createAccountBtn" runat="server" href="https://nicepage.com/website-mockup" class="u-align-center u-btn u-btn-round u-button-style u-radius-11 u-btn-1" Height ="10%" Width="100%" Text="Create Account" OnClick="Button1_Click" style="left: 5px; top: -297px"></asp:Button>
          </div>
        </div>
      </div>
    </section>
    
    
    <footer class="u-align-center u-clearfix u-footer u-palette-1-dark-1 u-footer" id="sec-8c36"><div class="u-clearfix u-sheet u-sheet-1">
        <h2 class="u-text u-text-1">Contact Us</h2>
        <p class="u-text u-text-2">Address: Soriano Avenue Brgy. Balayhangin Calauan Laguna 4012 Philippines Contact Number: 09352654471 / 09175903037 Email:alibertwaterstation@gmail.com</p>
      
      </div></footer>
   
  </form>
</body></html>