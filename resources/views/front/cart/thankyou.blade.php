@extends('front.layout.master')
@section('content')

<section class="hes_derimg">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="headeing_image">
                    <h4>Thank You!</h4>
                    <p><strong><a href="{{route('home')}}">Home ></a></strong> <span>Thank You!</span></p>
                </div>
            </div>
        </div>
    </div>
</section>

<section>
  	<div class="container">
	    <div class="row">
	      	<div class="col-md-12">
	        	<div class="thank-top">
	        		<div class="thank">
	          			<h1 class="site-header__title" data-lead-id="site-header-title">THANK YOU!</h1>
						<div class="main-content">
							<i class="fa fa-check main-content__checkmark" id="checkmark"></i>
							<p class="main-content__body" data-lead-id="main-content-body">Thank you! Your order has been placed succussfully.</p>
						</div>
	        		</div>
	      		</div>
	      	</div>
	    </div>
  	</div>
</section>

<!-- <section class="top-space">
	<div class="container">
		<div class="row">

			<div class="col-lg-12">
				<div class="web-content">
					<h1>Thank you! Your order has been placed succussfully.</h1>
				</div>
			</div>

			<div class="col-lg-12 mt-5">
				<h3>Product Details</h3>
				<table class="table table-bordered checkout-table">
					<tr class="checkout-hdr">
						<th>Image</th>
						<th style="width: 50%;">Product Name</th>
						<th>Qty</th>
						<th>Total</th>
						<th>Tax</th>
					</tr>
					@foreach($results as $key => $result)
					<?php 
                    //$product = DB::table('products')->where('id',$result->product_id)->first();
                    ?>
					<tr>
						<td><img src="{{url('/public/admin/clip-one/assets/products/original')}}/{{$product->image}}" alt="" class="img-fluid" width="50"></td>
						<td class="text-left">{{$product->title}}</td>
						<td>{{$result->quantity}}</td>
						<td>€{{number_format($result->price,2)}}</td>
						<td>€{{$result->tax_amount}}</td>
					</tr>
					@endforeach
				</table>
			</div>

			<div class="col-lg-6">&nbsp;</div>
			<div class="col-lg-6">
				<div class="total-panel" style="min-height: auto;">
					<h3 class="checkout-hdr">Order totals</h3>

					<table class="table table-bordered cus-table">
						<tr>
							<th>Subtotal</th>
							<td>€{{number_format($sub_total,2)}}</td>
						</tr>

						@if($discount != '0' && !empty($discount))
						<tr>
							<th>Discount</th>
							<td>€ {{number_format($discount,2)}}</td>
						</tr>
						@endif

						<tr>
							<th>Shipping</th>
							<td>€{{number_format($result->shipping_price,2)}}</td>
						</tr>

						<tr>
							<th>Order Total</th>
							<td>€{{number_format($grand_total,2)}}</td>
						</tr>
					</table>

				</div>
			</div>

		</div>
	</div>
</section> -->


@endsection

@section('script')

@endsection