<?php 

$session_id = Session::getId();
$carts = DB::table('carts')->where('session_id',$session_id)->get();
$cartSubtotal = DB::table('carts')->where('session_id',$session_id)->sum('sub_total');
$settings = DB::table('settings')->first();
$current_route = \Request::route()->getName();

?>

<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <link rel="icon" href="images/f.png"  />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Mg_hygine</title>


  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="{{asset('assets/front/css/bootstrap.css')}}" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet"> <!-- range slider -->

  <!-- font awesome style -->
  <link href="{{asset('assets/front/css/font-awesome.min.css')}}" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="{{asset('assets/front/css/style.css')}}" rel="stylesheet" />
  <link href="{{asset('assets/front/css/custam.css')}}" rel="stylesheet" />
  <link href="{{asset('assets/front/css/docs.theme.min.css')}}" rel="stylesheet" />
  <link href="{{asset('assets/front/css/owl.carousel.min.css')}}" rel="stylesheet" />
  <link href="{{asset('assets/front/css/owl.theme.default.min.css')}}" rel="stylesheet" />
  <!-- responsive style -->
  <link href="{{asset('assets/front/css/responsive.css')}}" rel="stylesheet" />

  <link rel="stylesheet" href="{{asset('assets/admin/plugins/select2/css/select2.min.css')}}">
  <link rel="stylesheet" href="{{asset('assets/admin/plugins/toastr/toastr.min.css')}}">

  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css'>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css'>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.green.min.css'>
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.10.0/css/lightbox.min.css'>
  <link href="{{asset('assets/front/css/owl.css')}}" rel="stylesheet" />

<style>

    


.dropdown {
  position: relative;
  display: block !important;
}

.dropdown-content {
  display: none;
  position: absolute;
  right: 0;
  background-color: #f9f9f9;
    min-width: 200px;
    box-shadow: 0px 8px 16px 0px rgb(0 0 0 / 20%);
    z-index: 1;
    margin: 0;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #f1f1f1;}
.dropdown:hover .dropdown-content {display: block;}
</style>
</head>

<body>

  <div class="hero_area">
    <!-- header section strats -->
    <header class="header_section">
        <div class="header_top">
            <div class="container">
                <div class="top_nav_container">
                    <div class="contact_nav">
                        Email: &nbsp; <a href="#"><span> {{$settings->email}} </span></a>
                        Call: &nbsp; <a href="#"><span> {{$settings->phone}}</span></a>
                    </div>
    
                   
                </div>
            </div>
        </div>
        
        <div class="header_bottom">
            <div class="container">
                <nav class="navbar navbar-expand-lg custom_nav-container ">
                    <a class="navbar-brand" href="{{route('home')}}">
                        <img class="logo" src="{{asset('assets/front/images/img/logo.png')}}" alt="logo">
                    </a>

                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class=""> </span></button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ">
                            <li class="nav-item {{$current_route == 'home' ? 'active' : ''}}">
                                <a class="nav-link {{$current_route == 'home' ? 'cont' : ''}}" href="{{route('home')}}">HOME </a>
                            </li>
                            <li class="nav-item {{$current_route == 'about_us' ? 'active' : ''}}">
                                <a class="nav-link {{$current_route == 'about_us' ? 'cont' : ''}}" href="{{route('about_us')}}"> ABOUT US</a>
                            </li>
                            
                            <li class="dropdown">
  <a class="dropbtn nav-link {{$current_route == 'our_brands' ? 'cont' : ''}}" href="{{route('our_brands')}}">PRODUCTS</a>

  <ul class="dropdown-content" style="left:0;">
   <li> <a href="https://testdmcconsultancy.com/demo/mg_hygiene/products/greyland-chemical">Greyland Chemical</a></li>
   <li><a href="https://testdmcconsultancy.com/demo/mg_hygiene/products/taski">Taski	</a></li>
   <li> <a href="https://testdmcconsultancy.com/demo/mg_hygiene/products/vileda">Vileda</a></li>
   <li><a href="https://testdmcconsultancy.com/demo/mg_hygiene/products/mp-hygiene-products">MP Hygiene Products</a></li>
   <li> <a href="https://testdmcconsultancy.com/demo/mg_hygiene/products/diversey">Diversey</a></li>
   <li><a href="https://testdmcconsultancy.com/demo/mg_hygiene/products/tork">Tork</a></li>
   <li> <a href="https://testdmcconsultancy.com/demo/mg_hygiene/products/paper-products">Paper Products</a></li>
   <li><a href="https://testdmcconsultancy.com/demo/mg_hygiene/products/mopping-systems">Mopping System's</a></li>
   <li> <a href="https://testdmcconsultancy.com/demo/mg_hygiene/products/sacksbin-liners-bins">Sacks,Bin Liners & Bins	</a></li>
   
</ul>
</li>
                            <li class="nav-item {{$current_route == 'our_environment' ? 'active' : ''}}">
                                <a class="nav-link {{$current_route == 'our_environment' ? 'cont' : ''}}" href="{{route('our_environment')}}">OUR ENVIROMENT</a>
                            </li>
                            <li class="nav-item {{$current_route == 'contact_us' ? 'active' : ''}}">
                                <a  class="nav-link {{$current_route == 'contact_us' ? 'cont' : ''}}" href="{{route('contact_us')}}">CONTACT US</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </header>
    <!-- end header section -->