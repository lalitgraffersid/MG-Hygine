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
    
                    <div class="user_option_box">
                        <div id="nav">
                            <a class="dropdown-toggle cart-link" href="#">
                                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                                <span>Cart</span><span class="nu">{{count($carts)}}</span>
                            </a>
                            @if(count($carts)>0)

                            
                            <ul class="dropdown czrt_link">
                                <div class="c_drop">
                                @foreach($carts as $cart)
                                <?php 
                                $product = DB::table('products')->where('id',$cart->product_id)->first();
                                $productImages = DB::table('product_images')->where('product_id',$cart->product_id)->first();
                                ?>
                                                           
                                <li>
                                    <button class="removeCart" data-id="{{$cart->id}}">X</button>
                                    <div class="cart-item-panel">
                                        <div class="cart-item"><a href="{{route('productDetails',$product->id)}}"><img src="{{url('/public/admin/clip-one/assets/products/original')}}/{{$productImages->image}}" alt="" class="img-fluid"></a></div>
                                        <div class="cart-title">
                                            <a href="#">{{$product->title}}</a>
                                            <span>{{$cart->quantity}} × €{{$cart->price}}</span>
                                        </div>
                                    </div>
                                </li>
                                
                                @endforeach
                                 </div>

                                 <div class="pointors-panel">
                                    <h4>Subtotal: <span>€{{number_format($cartSubtotal,2)}}</span></h4>
                                    <ul class="cart-pointors">
                                        <li><a href="{{route('cart')}}">View cart</a></li>
                                    </ul>
                                </div>
                            </ul>
                            @endif  
                        </div>
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
                            <li class="nav-item {{$current_route == 'our_brands' ? 'active' : ''}}">
                                <a class="nav-link <?php if($current_route == 'our_brands' || $current_route == 'products' || $current_route == 'productDetails'){echo 'cont';} ?>" href="{{route('our_brands')}}">PRODUCTS</a>
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