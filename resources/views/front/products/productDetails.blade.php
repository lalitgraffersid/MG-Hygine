@extends('front.layout.master')
@section('content')
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

 <!-----slider----->
  <!--<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">-->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
  
  <style>
  body {
  background-color: lightgray;
  /*padding: 2em;*/
/*   display: flex;
  justify-content: center;
  flex-flow: row wrap; */
}

.action.cart-div {
    display: none;
}

  </style>

 <!-----slider----->


</head>


<!-- ///////////////////////////////////// -->
<section class="hes_derimg product">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="headeing_image">
                    						<h3 class="product-title">{{$result->title}}</h3>

                    <p><strong><a href="{{route('home')}}">Home ></a></strong> <span>{{$result->title}}</span></p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="deatile">
    <div class="container">
		<div class="card">
			<div class="container-fliud">
				<div class=" row prductPd">
					
					<div class="preview col-md-6">
						<div class="preview-pic tab-content mb-2">
						    <!--<img src="{{url('/public/admin/clip-one/assets/products/original')}}/{{$images[0]->image}}" alt="img">-->
						  <div class="tab-pane active" id="pic-1"><img class="d_tiel_img" src="{{url('/public/admin/clip-one/assets/products/original')}}/{{$images[0]->image}}" /></div>
					</div>
					
				 <!--<img src="{{url('/public/admin/clip-one/assets/products/original')}}/{{$images[0]->image}}" alt="img">-->
					<!--<div class="owl-carousel owl-theme">-->
                        
     <!--                   @foreach($images as $image)-->
     <!--                   <div class="item">-->
     <!--                       <a href="{{url('/public/admin/clip-one/assets/products/original')}}/{{$image->image}}" data-lightbox="gallery">-->
     <!--                           <img src="{{url('/public/admin/clip-one/assets/products/original')}}/{{$image->image}}" alt="">-->
     <!--                       </a>-->
     <!--                   </div>-->
     <!--                   @endforeach-->
    
     <!--               </div>-->


                        <!--=======slider========-->
                        
     <div id="gallery">
  
    <div id="image-gallery">
     
        @foreach($images as $image)
        <div class="image1">
          <div class="img-wrapper">
            <a href="{{url('/public/admin/clip-one/assets/products/original')}}/{{$image->image}}">
                <img src="{{url('/public/admin/clip-one/assets/products/original')}}/{{$image->image}}" class="img-responsive ligh_t"></a>
            <div class="img-overlay">
              <i class="fa fa-plus-circle" aria-hidden="true"></i>
            </div>
          </div>
        </div>
        @endforeach
       
      </div><!-- End row -->
    </div><!-- End image gallery -->

 
                        <!--=======slider========-->

					</div>
					
					
					<div class="details col-md-6">
						<h3 class="product-title">{{$result->title}}</h3>
						<!-- <div class="rating">
							<div class="stars">
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star"></span>
								<span class="fa fa-star"></span>
							</div>
							<span class="review-no">41 reviews</span>
						</div> -->
						<p class="product-description">{{$result->description}}</p>
						@if($result->variants == '1')
							<select name="variant_option" id="variant_option" class="form-control">
								<option value="">Select Variant</option>
								@foreach ($sizes as $key => $value)
		                          	<option value="{{$value}}" data-id="{{$key}}" >{{$value}} - {{$colors[$key]}}</option>
		                        @endforeach
							</select><br>

							<h5 class="price">Size: <span id="size_span"></span></h5>
							<h5 class="price">Color: <span id="color_span"></span></h5>
							<h5 class="price">Price: <span>€</span><span id="price_span"></span></h5>


							<input type="hidden" name="size" id="size_input" >
							<input type="hidden" name="color" id="color_input" >
							<input type="hidden" name="price" id="price_input" >
						@else
							<!--<h4 class="price">Price: <span>€{{$result->price}}</span></h4>-->
							<input type="hidden" name="size" id="size_input" value="">
							<input type="hidden" name="color" id="color_input" value="">
							<!--<input type="hidden" name="price" id="price_input" value="{{$result->price}}">-->
						@endif
						
						<div class="action cart-div">
							<div class="control">
								<button class="bttn bttn-left" id="minus">
								   <span class="decrese">-</span>
								</button>
								<input type="number" name="quantity" class="input" id="input">
								<button class="bttn bttn-right" id="plus">
								  <span class="decrese">+</span>
								</button>
							</div>
							<!--<a class="add-to-cart btn btn-default add2Cart" href="javascript:void(0)" data-id="{{$result->id}}">Add to cart</a>-->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

@if(count($related_products)>0) 
<section id="demos">
 	<div class="container mb-4">
     	<div class="row">
       		<div class="col-md-12">
         		<h3 class="product-title text-center">Related Product</h3>
       		</div>
     	</div>
      	<div class="row">
      		@foreach($related_products as $product)
      		<?php 
           		$productImages = DB::table('product_images')->where('product_id',$product->id)->get();
           	?>
	        	<div class="col-md-3">
					<div class="product-grid__product-wrapper">
						<div class="product-grid__product">
							<div class="product-grid__img-wrapper">			
								<img src="{{url('/public/admin/clip-one/assets/products/original')}}/{{$productImages[0]->image}}" alt="Img" class="product-grid__img" />
							</div>
							
							<a class="v_all" href="{{route('productDetails',$product->id)}}"><span class="product-grid__title">{{$product->title}}</span></a>
							@if($result->variants == '1')
                          	<?php
                             	$yourArr = explode(",", $result->prices);
                             	$max = max($yourArr);
                             	$min = min($yourArr);
                          	?>
                             	<!--<span class="product-grid__price">€{{$min}} - €{{$max}}</span>-->
                          	@else
                             	<!--<span class="product-grid__price">€{{$result->price}}</span>-->
                          	@endif
							<div class="product-grid__extend-wrapper cart-div">
								<div class="product-grid__extend">
									<!--<p class="product-grid__description">{{ \Illuminate\Support\Str::limit($result->description, 100, $end='...') }}</p>-->
									<!--<a class="v_all" href="{{route('productDetails',$result->title_slug)}}">-->
									<!--    <span class="product-grid__btn product-grid__add-to-cart"><i class="fa fa-eye"></i> View More</span>	-->
									<!--</a>-->
									<a class="c_btn" href="{{route('productDetails',$product->id)}}">
									    <span class="product-grid__btn product-grid__add-to-cart">View Details</span>	
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			@endforeach
      	</div>
    </div>
</section>
@endif

@endsection

@section('script')
<!-------gallery------->
 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>-->

<script>
// Gallery image hover
$( ".img-wrapper" ).hover(
  function() {
    $(this).find(".img-overlay").animate({opacity: 1}, 600);
  }, function() {
    $(this).find(".img-overlay").animate({opacity: 0}, 600);
  }
);

// Lightbox
var $overlay = $('<div id="overlay"></div>');
var $image = $("<img>");
var $prevButton = $('<div id="prevButton"><i class="fa fa-chevron-left"></i></div>');
var $nextButton = $('<div id="nextButton"><i class="fa fa-chevron-right"></i></div>');
var $exitButton = $('<div id="exitButton"><i class="fa fa-times"></i></div>');

// Add overlay
$overlay.append($image).prepend($prevButton).append($nextButton).append($exitButton);
$("#gallery").append($overlay);

// Hide overlay on default
$overlay.hide();

// When an image is clicked
$(".img-overlay").click(function(event) {
  // Prevents default behavior
  event.preventDefault();
  // Adds href attribute to variable
  var imageLocation = $(this).prev().attr("href");
  // Add the image src to $image
  $image.attr("src", imageLocation);
  // Fade in the overlay
  $overlay.fadeIn("slow");
});

// When the overlay is clicked
$overlay.click(function() {
  // Fade out the overlay
  $(this).fadeOut("slow");
});

// When next button is clicked
$nextButton.click(function(event) {
  // Hide the current image
  $("#overlay img").hide();
  // Overlay image location
  var $currentImgSrc = $("#overlay img").attr("src");
  // Image with matching location of the overlay image
  var $currentImg = $('#image-gallery img[src="' + $currentImgSrc + '"]');
  // Finds the next image
  var $nextImg = $($currentImg.closest(".image").next().find("img"));
  // All of the images in the gallery
  var $images = $("#image-gallery img");
  // If there is a next image
  if ($nextImg.length > 0) { 
    // Fade in the next image
    $("#overlay img").attr("src", $nextImg.attr("src")).fadeIn(800);
  } else {
    // Otherwise fade in the first image
    $("#overlay img").attr("src", $($images[0]).attr("src")).fadeIn(800);
  }
  // Prevents overlay from being hidden
  event.stopPropagation();
});

// When previous button is clicked
$prevButton.click(function(event) {
  // Hide the current image
  $("#overlay img").hide();
  // Overlay image location
  var $currentImgSrc = $("#overlay img").attr("src");
  // Image with matching location of the overlay image
  var $currentImg = $('#image-gallery img[src="' + $currentImgSrc + '"]');
  // Finds the next image
  var $nextImg = $($currentImg.closest(".image").prev().find("img"));
  // Fade in the next image
  $("#overlay img").attr("src", $nextImg.attr("src")).fadeIn(800);
  // Prevents overlay from being hidden
  event.stopPropagation();
});

// When the exit button is clicked
$exitButton.click(function() {
  // Fade out the overlay
  $("#overlay").fadeOut("slow");
});
  </script>

<!-------gallery------->


      
<script>
	var minus = document.querySelector("#minus");
	var plus = document.querySelector("#plus");
	var input = document.querySelector("#input");

	var quantity = 1;

	input.value = quantity;

	minus.addEventListener('click', function(event){
	  	if (quantity > 1) {
	      	quantity --;
	    	input.value = quantity;
	  	}
	});

	plus.addEventListener('click', function(event){
	  	quantity ++;
	  	input.value = quantity;
	});

</script>

<script type="text/javascript">
    $('#variant_option').on('change',function(){
      	var sizes_key = $( "#variant_option option:selected" ).data('id');
      	var product_id = "<?php echo $result->id; ?>"

      	$.ajax({
        	url: "{{ url('product/getPrice') }}",
        	method: "patch",
        	data: {_token: '{{ csrf_token() }}', id: product_id, sizes_key: sizes_key},
        	success: function (response) {
      			if (response.msg == 'success') {
            		$('#size_span').text(response.size);
            		$('#color_span').text(response.color);
            		$('#price_span').text(response.price);

            		$('#size_input').val(response.size);
            		$('#color_input').val(response.color);
            		$('#price_input').val(response.price);
          		}
        	}
      	});
    });
</script>

<script>
    $(document).ready(function(){
        $('.add2Cart').on('click',function(){
        	var variant_option = $( "#variant_option option:selected" ).val();
	      	if (variant_option == '' ) {
	        	toastr.error('Please select variant.', 'error');
	        	$('#variant_option').focus();
	        	return false;
	      	}

            var id = $(this).data('id');
            var size = $('#size_input').val();
            var color = $('#color_input').val();
            var price = $('#price_input').val();
            var qty = $(this).closest("div.cart-div").find("input[name='quantity']").val();

            $.ajax({
                url: "{{ url('add2Cart') }}",
                method: "post",
                data: {_token: '{{ csrf_token() }}', id: id, qty: qty, size: size, color: color, price: price},
                success: function (response) {
                    if(response.status == 'success'){
                        toastr.success('Product added to cart successfully');
                        setTimeout(function(){
                            location.reload(); 
                        }, 1000);
                    }
                }
            });
        });
    });
</script>

@endsection