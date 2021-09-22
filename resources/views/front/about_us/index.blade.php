@extends('front.layout.master')
@section('content')

<section class="hes_derimg">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="headeing_image">
                    <h4>About Us</h4>
                    <p><strong><a href="{{route('home')}}">Home ></a></strong> <span>About us</span></p>
                </div>
            </div>
        </div>
    </div>
</section>

  <section class="product_section layout_padding">
    <div class="container">
      <div class="row">
        <div class="col-sm-6 col-lg-6">
          <div class="about">
         <img src="{{ url('/public/admin/clip-one/assets/about_us') }}/{{$result->image}}" alt="">  
          </div>
        </div>
        <div class="col-sm-6 col-lg-6">
          <div class="about_textbox">
           <h1 class="about_m_h">{{$result->heading}}</h1>
           <p>{!! $result->description !!}</p>
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