<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>index</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/index.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
</head>
<body data-spy="scroll" data-target="#navbarNav">
     <!---Navigation Bar--->
     <div id="nav-bar">
        <nav class="navbar navbar-expand-lg navbar-light bg-lights">
     <a class="navbar-brand" href="#"><img style=width:150px src="images/websitelogo.png"></a>
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
       <span class="navbar-toggler-icon"></span>
     </button>
     <div class="collapse navbar-collapse" id="navbarNav">
       <ul class="navbar-nav ml-auto">
         <li class="nav-item active">
           <a class="nav-link" href="#top">HOME <span class="sr-only">(current)</span></a>
         </li>
         <li class="nav-item">
            <a class="nav-link" href="#">LOGIN</a>
          </li>
         <li class="nav-item">
           <a class="nav-link" href="#about">ABOUT US</a>
         </li>
         <li class="nav-item">
           <a class="nav-link" href="#services">SERVICES</a>
         </li>
        
          <li class="nav-item">
           <a class="nav-link" href="#contact">CONTACT</a>
       </ul>
     </div>
   </nav>
    </div>
    <!--intro-->
    <div class="container intro" id="top">
        <div class="row custom-section d-flex align-items-center">
          <div class="col-12 col-lg-4 title">
            <h2 id="title1">CRM</h2>
            <h3 id="title2">Customers</h3>
            <p id="title3">relationship is important!</p>

          </div>
          <div class="col-12 col-lg-8 imagebanner">
            <img src="images/mainbenner.png" alt="banner">
          </div>
        </div>
    </div>
     <!--About-->
<div id="about">
  <div class="container">
    <h2 class="aboutus">About Us</h2>
  <div class="row"> 
    <div class="col-md-5">
      <img  src="images/integrateDB.svg" width="100%" alt="integrate">
   </div>
  <div class="col-md-7">
   
     <div class="about-content">
       <p>
      Customer relationship management (CRM) is the process of managing interactions with existing as well as past and potential customers. It is one of many different approaches that allow a company to manage and analyse its own interactions with its past, current and potential customers.It uses data analysis about customers' history with a company to improve business relationships with customers, specifically focusing on customer retention and ultimately driving sales growth.
    </p>
      <p>
      One important aspect of the CRM approach is the systems of CRM compile data from a range of different communication channels, including a company's website, telephone, email, live chat, marketing materials and more recently, social media.Through the CRM approach and the systems used to facilitate it, businesses learn more about their target audiences and how to best cater for their needs.</p>
     </div>
     
  </div>

  </div>
  </div>
  </div> 
  <!----services----->
<section id="services">
  <div class="container">
    <h2 class="aboutus">Our Services</h2>
      <div class="row" class="space">
        <div class="col-md-4">
             <div class="card text-center">
              <img src="images/integration.jpg"  height=200px width=100px class="card-img-top">
              <div class="card-body">
                <h4 class="card-title" style="color: #2b8ccd; font-weight: bold;">Integration</h4>
                <p class="card-text"><ul class="decnone">
                      <li>Integrate DB</li>
                      <li>Integrate XL</li>
                </ul></p>
              </div>
             </div>
        </div>
        <div class="col-md-4">
          <div class="card text-center">
            <img src="images/analysis.jpg" height=200px width=100px class="card-img-top">
            <div class="card-body">
              <h4 class="card-title" style="color: #2b8ccd; font-weight: bold;">Analysis</h4>
              <p class="card-text"><ul class="decnone">
                     <li>RFM analysis</li>
                    <li>Customer Segmentation</li>    
              </ul></p>
            </div>
           </div>  
        </div> 
        <div class="col-md-4">
          <div class="card text-center">
            <img src="images/operations.jpg" height=200px width=100px class="card-img-top">
            <div class="card-body">
              <h4 class="card-title" style="color: #2b8ccd; font-weight: bold;">Operations</h4>
              <p class="card-text"><ul class="decnone">
                    <li>Manage leads/sales team</li>
                    <li>Marketting</li>
              </ul></p>
            </div>
           </div>
       </div>
      </div>
  </div>
 </section>
    <!---slider------>
<div id="slider">
    <div id="headerSlider" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#headerSlider" data-slide-to="0" class="active"></li>
        <li data-target="#headerSlider" data-slide-to="1"></li>
        <li data-target="#headerSlider" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="images/crm1.jpg" class="d-block w-100" >
            
        </div>
        <div class="carousel-item">
          <img src="images/crm2.jpg" class="d-block w-100" >
           
        </div>
        <div class="carousel-item">
          <img src="images/crm3.png" class="d-block w-100" >
           
        </div>
      </div>
      <a class="carousel-control-prev" href="#headerSlider" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#headerSlider" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    </div>
    <!----Get-in-touch---->
<section id="contact">
  <div class="container">
    <h1 style="color:#2b8ccd;">Contact Us</h1>
     <div class="row">
       <div class="col-md-6">
        <form class="contact-form">
             <div class="form-group">
               <input type="text" id="addborder1" class="form-control" placeholder="Your Name" required>
             </div>
              <div class="form-group">
               <input type="text"  id="addborder2" class="form-control" placeholder="Your Phone no" required>
             </div>
              <div class="form-group">
               <input type="email"  id="addborder3" class="form-control" placeholder="Your E-mail" required>
             </div>
              <div class="form-group">
               <textarea class="form-control"  id="addborder4" placeholder="Feedback" rows="4" required></textarea>
             </div>
            <button type="submit" class="btn btn-primary">SEND MESSAGE</button>
           </form>    
       </div>
       <div class="col-md-6 contact-info">
         <div  class="follow"><b>Address: <i class="fa fa-map-marker"></i></b>XYZ road,India</div>
         <div  class="follow"><b>Toll free number:   <i class="fa fa-phone"></i></b>1800 3011 3333</div>
         <div  class="follow"><b>Email:   <i class="fa fa-envelope-o"></i></b>mail.crm.co.in</div>
         <div  class="follow"><label><b>Get Social:</b></label>
           <a href="https://www.facebook.com"><i class=" fa fa-facebook"></i></a>
           <a href="https://twitter.com"><i class=" fa fa-twitter"></i></a>
           <a href="https://www.youtube.com"><i class=" fa fa-youtube-play"></i></a>
           <a href="#"><i class=" fa fa-google-plus"></i></a>
         </div>
       </div>
      </div>
  </div>
 </section>
 <!----Footer----->
 <section id ="footer">
  <div class="container text-center">
   <p> Made by <b>Codebreakerzzzz</b></p>
  </div>
 </section>
</body>
</html>