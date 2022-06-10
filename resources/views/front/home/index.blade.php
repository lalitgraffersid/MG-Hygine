@extends('front.layout.master')
@section('content')

    <!-- slider section -->
    <section class="slider_section topslide">
    <div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
   
    <div class="carousel-item active">
  <img class="s_li_der" src="{{asset('assets/front/images/img/banner.png')}}" alt="s1lde1">
  <div class="carousel-caption">
    
  </div>
</div>
     <div class="carousel-item">
  <img  class="s_li_der" src="{{asset('assets/front/images/img/banner.png')}}" alt="s1lde1">
  <div class="carousel-caption">
  
  </div>
</div>
   <div class="carousel-item">
  <img  class="s_li_der" src="{{asset('assets/front/images/img/banner.png')}}" alt="s1lde1">
  <div class="carousel-caption">
   
  </div>
</div>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div>
    </section>
    <!-- end slider section -->
  </div>


  <!-- product section -->

  <section class="product_section layout_padding">
    <div class="container">
<!--
      <div class="heading_container heading_center">
        <h2>
          About Us
        </h2>
      </div>
-->
      <div class="row">
        <div class="col-sm-6 col-lg-6">
          <div style="text-align: center;" class="about">
         <img style="width: 30%;" src="{{asset('assets/front/images/img/logo.png')}}" alt="">  
          </div>
        </div>
        <div class="col-sm-6 col-lg-6">
          <div class="about_textbox">
           <h1 class="about_m_h">About MG Hygiene</h1>
           <p>We are suppliers of quality hygiene and catering products to the Cleaning, Catering and Hospitality industries and offer quality and reliable products you can count on. Our friendly and professional staff are here to answer any questions you may have about our company or our products.
          <br><br>Please browse our Web site for further information  on our products and services. If  you have any questions or would like to speak with a MG-Hygiene representative, please email us at  sales@mghygiene.ie or</p>
           <p>call us on - 01 429 8710.</p>
           <a class="a_text_btn" href="{{route('about_us')}}">Read more</a>
          </div>
        </div>
     
      </div>
<!--
      <div class="btn_box">
        <a href="" class="view_more-link">
          View More
        </a>
      </div>
-->
    </div>
  </section>

  <!-- end product section -->


  <!-- why us section -->

<section class="why_us_section layout_padding_brand">
   <div class="container">
      <div class="heading_container heading_center">
         <h2 class="o_r_brand pt-0 pb-3">Our Brands</h2>
      </div>
      <div class="row">
         
         @foreach($results as $result)
         <div class="col-md-4">
            <div class="box_our ">
               <div class="image">
                   <a href="{{route('products',$result->brand_slug)}}">
                  <div class="box9">
                     <img src="{{url('/public/admin/clip-one/assets/brands/original')}}/{{$result->image}}">
                        <div class="box-content">
                           <h3 class="title">{{$result->name}}</h3>
                           <ul class="icon pr_icon"> 
                              <li><i class="fa fa-link"></i></li>
                           </ul>
                        </div>
                    </div>
                    </div>
               </div>
               <!--<div class="about_text">-->
               <!--   <h3>{{$result->name}}</h3>-->
               <!--   <a href="{{route('products',$result->brand_slug)}}">View All <i class="fa fa-caret-right" aria-hidden="true"></i></a>-->
               <!--</div>-->
            </div>
        
         @endforeach
         </div>
      </div>
    </div>
  </section>

  <!-- end why us section -->


  <!-- Envermint section -->

<section class="enverment">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
             <div class="enverment_inner">
                    <h1>Our<br>
Enviroment</h1>
           <p>At MG Hygiene we take our environmental responsibilities very seriously</p>
            
            <a class="read_more"  href="{{route('our_environment')}}">Read More</a>
             </div>
            </div>
        </div>
    </div>
    
</section>

  
  <!-- end Envermint section -->
  
  
  
<!------clean--tipes----->
<section class="clin-tips">
    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <div class="tips">
                    <ul>
                        <li class="cl">Cleaning Tips</li>
                        <li class="cont">Contact Us</li>
                        <div class="clear"></div>
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-12">
                <div class="sli_der">
                    <h3>What our clients say</h3>
                    <p>"Good prices, reliable service, if they don't have it, they’ll find it...they make my job that little bit easier<br> and I can’t ask for more than that..."</p>
                    <a href="@">Kevin in the Catering Industry</a>
                </div>
            </div>
        </div>
        
    </div>
    
</section>

@endsection

@section('script')
<script>
	
</script>
@endsection