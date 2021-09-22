@extends('front.layout.master')
@section('content')

<section class="top-space">
	<div class="container-xxl container-xl container-md container-sm">
		<div class="row">
			<div class="col-lg-12 mb-4">
				<div class="web-content text-center">
					<h4>Brands</h4>
				</div>
			</div>
			
			<div class="col-lg-12">
			    <div class="customer-logos slider">
			      	@foreach($dealers as $dealer)
      					<div class="slide"><img src="{{url('/public/admin/clip-one/assets/dealers/original')}}/{{$dealer->image}}" alt=""></div>
      				@endforeach
			   </div>
			</div>
		</div>
	</div>
</section>
	
	

<section class="top-space">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 mb-3">
			</div>
			<div class="col-sm-12">
				<div class="category-filter mb-3">
					<button class="btn btn-outline-primary category-button active mr-3" data-filter="all">All</button>
					@foreach($dealers as $key => $dealer)
	    				<button class="btn btn-outline-primary category-button mr-3" data-filter="{{$dealer->name}}">{{$dealer->name}}</button>
	    			@endforeach
				</div>
			</div>
		</div>

		<div class="row">
			@foreach($dealers as $key => $dealer)
			<?php
				$products = DB::table('products')
                    			->where('dealer_id',$dealer->id)
                    			->get();
                foreach ($products as $key1 => $value) {
                	$product_image = DB::table('product_images')
                    					->where('product_id',$value->id)
                    					->first();
			?>
				<div class="col-sm-6 col-md-4 col-lg-3 filter {{$dealer->name}} mb-4">
				  	<img src="{{url('/public/admin/clip-one/assets/products/original')}}/{{$product_image->image}}" class="img-fluid">
				</div>
			<?php } ?>
			@endforeach
		</div>
	</div>
</section>

@endsection