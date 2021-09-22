@extends('front.layout.master')
@section('content')

<section class="hes_derimg">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="headeing_image">
                    <h4>Shopping Cart</h4>
                    <p><strong><a href="{{route('home')}}">Home ></a></strong> <span>Cart</span></p>
                </div>
            </div>
        </div>
    </div>
</section>

	<section class="top-space mt-4">
		<div class="container">
			<div class="row">

				<div class="col-lg-12">
				<div class="ch_eck_out_table">
					<table class="table table-bordered">
						<tr class="t_head">
						
							<th class="text-center" >PRODUCT IMAGE</th>
							<th class="text-center" >PRODUCT</th>
							<th class="text-center" >PRICE</th>
							<th class="text-center" >QUANTITY</th>
							<th class="text-center" >SUBTOTAL</th>
								<th class="text-center" >Action</th>
						</tr>
						<form action="" method="POST" id="cart_form">
							@foreach($results as $key => $result)
							<?php 
	                        $product = DB::table('products')->where('id',$result->product_id)->first();
	                        $productImages = DB::table('product_images')->where('product_id',$result->product_id)->first();
	                        ?>
							<tr>
							
								<td class="text-center" ><a href="{{route('productDetails',$product->id)}}"><img src="{{url('/public/admin/clip-one/assets/products/original')}}/{{$productImages->image}}" alt="" class="img-fluid d-block mx-auto" width="100"></a></td>
								<td class="text-center" ><a href="{{route('productDetails',$product->id)}}" class="cartproname">{{$product->title}}</a></td>
								<td class="cart-proce-color text-center">€ {{number_format($result->price,2)}}</td>
								<td class="text-center"><div class="control text-center">
									<button type="button" class="bttn bttn-left minus" id="minus">
									   <span>-</span>
									</button>
									<input type="hidden" name="id[]" value="{{$result->id}}">
									<input type="hidden" name="product_id[]" value="{{$result->product_id}}">
									<input type="hidden" name="cart_id" value="{{$result->cart_id}}">
									<input type="hidden" name="coupon_code" value="{{$result->coupon_code}}">
									<input type="number" name="quantity[]" class="input" id="input" value="{{$result->quantity}}">
									<button type="button" class="bttn bttn-right plus" id="plus">
									  <span>+</span>
									</button>
								</div></td>
								<td class="cart-proce-color  text-center">€{{number_format($result->sub_total,2)}}</td>
									<td class="text-center"><a  class="act_ion" href="javascript:void(0)" class="delt-pro removeCart" data-id="{{$result->id}}">X</a></td>
							</tr>
							@endforeach

						@if(count($results)>0)
						<tr>
							<td colspan="6">
								<!-- <ul class="cart-inputs">
									<li><input type="text" name="coupon" id="coupon" placeholder="Coupon Code"></li>
									<li><a href="javascript:void(0)" id="applyCoupon">Apply Coupon</a></li>
								</ul> -->

								<ul class="cart-inputs cart-btns">
									<li><a href="javascript:void(0)" id="updateCart">Update Cart</a></li>
								</ul>
							</td>
						</tr>
						@endif
						</form>
					</table>
				</div>
				</div>


				<div class="col-lg-6">&nbsp;</div>
				<div class="col-lg-6">
					<div class="total-panel">
						<h3>Cart totals</h3>

						<table class="table table-bordered cus-table">
							<tr>
								<th>Subtotal</th>
								<td class="cart-proce-color">€ {{number_format($sub_total,2)}}</td>
							</tr>

							@if($discount != '0' && !empty($discount))
							<tr>
								<th>Discount</th>
								<td class="cart-proce-color">€ {{$discount}}</td>
							</tr>
							@endif

							<tr>
								<th>Shipping</th>
								<td>
									<div><label><input type="radio" name="shipping_method" value="{{$shipping_method}}" data-id="{{$shipping_price}}" checked required> {{$shipping_method}}:</label> <span class="cart-proce-color">€ {{number_format($shipping_price,2)}}</span></div>
								</td>
							</tr>

							@if($tax_amount != '0')
							<tr>
								<th>Tax</th>
								<td class="cart-proce-color">€ {{number_format($tax_amount,2)}}</td>
							</tr>
							@endif

							<tr>
								<th>Total</th>
								<td><span class="cart-proce-color">€ {{number_format($grand_total,2)}}</span></td>
							</tr>
						</table>

						@if(count($results)>0)
							<a href="{{route('checkout')}}" class="proceed-btn">PROCEED TO CHECKOUT</a>
						@endif
					</div>
				</div>
				
			</div>
		</div>
	</section>

@endsection

@section('script')
<script>
	$('.minus').on('click',function(){
		var input_val = $(this).closest("div.control").find("input[name='quantity[]']").val();
		if (input_val > 1) {
	      	input_val --;

	    	$(this).closest("div.control").find("input[name='quantity[]']").val(input_val);
	  	}
	});

	$('.plus').on('click',function(){
		var input_val = $(this).closest("div.control").find("input[name='quantity[]']").val();
      	input_val ++;

    	$(this).closest("div.control").find("input[name='quantity[]']").val(input_val);
	});

	$('#updateCart').on('click',function(){
		var form = $('#cart_form').serialize();

		$.ajax({
           	url: "{{ url('updateCart') }}",
           	method: "post",
           	data: {_token: '{{ csrf_token() }}', form: form},
           	success: function (response) {
	           	if(response.status == 'success'){
	              	toastr.success('Cart updated successfully');
	          		setTimeout(function(){
	                 	location.reload(); 
	              	}, 1000);
	           	}
            }
        });
	});


	$('#applyCoupon').on('click',function(){
		var coupon_val = $('#coupon').val();
		if ($('#coupon').val() == '') {
			toastr.error('Please enter a coupon code.');
			return false;
		}else{
			var form = $('#cart_form').serialize();

			$.ajax({
	           	url: "{{ url('applyCoupon') }}",
	           	method: "post",
	           	data: {_token: '{{ csrf_token() }}', form: form},
	           	success: function (response) {
		           	if(response.status == 'success'){
		              	toastr.success('Coupon code applied successfully');
		          		setTimeout(function(){
		                 	location.reload(); 
		              	}, 1000);
		           	}
		           	if(response.status == 'invalid_coupon'){
		              	toastr.error('Coupon "'+coupon_val+'" does not exist!');
		           	}
	            }
	        });
		}
	});


	$('input[type=radio][name=shipping_method]').change(function() {
		var shipping_price = $(this).data('id');
		var shipping_method = $(this).val();

		$.ajax({
           	url: "{{ url('changeShippingMethod') }}",
           	method: "post",
           	data: {_token: '{{ csrf_token() }}', shipping_price: shipping_price, shipping_method: shipping_method},
           	success: function (response) {
	           	if(response.status == 'success'){
	              	toastr.success('Shipping method updated successfully');
	          		setTimeout(function(){
	                 	location.reload(); 
	              	}, 1000);
	           	}
            }
        });
	});

</script>
@endsection