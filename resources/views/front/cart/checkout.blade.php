@extends('front.layout.master')
@section('content')

<style>
    .table-bordered {
    border: 1px solid #dee2e6;
}
.stripe-box {
    background-color: #fff;
    cursor: pointer;
    padding: 16px 17px 2px 17px;
}
.stripe-box span:before {
    content: "";
    display: block;
    width: 6px;
    height: 6px;
    background-color: #13aff0;
    border-radius: 50%;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}
.stripe-box span {
    display: inline-block;
    width: 16px;
    height: 16px;
    border: solid #13aff0 1px;
    border-radius: 50%;
    position: relative;
    top: 2px;
    margin: 0 6px 0 0;
}
.stripe-box h6 {
    float: left;padding-top: 12px;
}
ul.card-list {
    text-align: right;
}
ul.card-list li img {
    width: 40px;
}
ul.card-list li {
    display: inline-block;
    margin: 0 4px 0 0;
}
h6.c_title {
    margin-top: 25px;
    font-weight: 600;
}
label.card-info {
    font-size: 14px;
      width: 100%;
}
input.card-number.required {
    width: 100%;
}
.w1, input.card-number.required {
    width: 100%;
    height: 35px;
    border-radius: 5px;
    border: 1px solid #bfaeae;
    padding: 0 10px;
    font-size: 14px;
}
p.card-text.c_hk {
    font-size: 14px;
}
.checkout__input p {
    color: #1c1c1c;
    margin-bottom: 5px;
}
    .C_ard{
        position:relative;
    }
    .C_ard i {
    position: absolute;
    right: 6px;
    top: 7px;
    font-size: 20px;
}
.headin_g h4.mt-4 {
    float: left;
    border-bottom: none;
    clear: both;
    margin-bottom:0px;
}
.headin_g {
    border-bottom: 1px solid #eee;
}

.headin_g input {
    float: right;
    padding-top: 26px;
    display: inline-block;
    margin-top: 20px;
}

label.bill-name {
    width: 100%;
}
.bill-name textarea {
    width: 100%;
}
p.M_taxt {
    font-size: 14px;
    margin: 25px 0;
}
.shipping{
    display:none;
}

.hide{
	display: none;
}
</style>

<section class="hes_derimg">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="headeing_image">
                    <h4>Checkout</h4>
                    <p><strong><a href="{{route('home')}}">Home ></a></strong> <span>Checkout</span></p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="product_section layout_padding">
  	<div class="container">
  		<div class="row"></div>
  		<form role="form" action="{{ route('stripe.post') }}" method="post" class="require-validation" data-cc-on-file="false" data-stripe-publishable-key="{{ env('STRIPE_KEY') }}" >
		<div class="checkout__form">
	   		{{ csrf_field() }}
	   		@if (count($errors) > 0)       
             	<div class='alert alert-danger text-white alert-dismissable' style="background-color: #e2401c;">
                	<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            		@foreach ($errors->all() as $error)
                   		<span>{{ $error }}</span><br/>
                	@endforeach    
             	</div>         
          	@endif
	      	<div class="row">
	         	<div class="col-lg-6 col-md-6">
	         		<h4>Billing Details</h4>
	            	<div class="row">
	               		<div class="col-lg-6">
	                  		<div class="checkout__input">
	                     		<p>Fist Name<span style="color: red;">*</span></p>
	                     		<input type="text" name="first_name" required>
	                  		</div>
	               		</div>
		               	<div class="col-lg-6">
		                  	<div class="checkout__input">
		                     	<p>Last Name<span style="color: red;">*</span></p>
		                     	<input type="text" name="last_name" required>
		                  	</div>
		               	</div>
		            </div>
		            <div class="checkout__input">
		               	<p>Country<span>*</span></p>
		               	<select name="country">
		               		<option value="Ireland">Ireland</option>
		               	</select>
		            </div>
		            <div class="checkout__input">
		               	<p>Street address<span style="color: red;">*</span></p>
		               	<input type="text" name="street_address" placeholder="House number and street name" required>
		            </div>
		            <div class="checkout__input">
		               	<input type="text" name="appartment" placeholder="Apartment, suite, unit, etc. (optional)">
		            </div>
		            <div class="checkout__input">
		            	<p>Town / City<span style="color: red;">*</span></p>
		               	<input type="text" name="town_city" required>
		            </div>
		            <div class="checkout__input">
		            	<p>County<span style="color: red;">*</span></p>
		               	<select name="county" class="select12">
							@foreach($counties as $county)
								<option value="{{$county->county}}">{{$county->county}}</option>
							@endforeach
						</select>
		            </div>
		            <div class="checkout__input">
		            	<p>Eircode (optional)</p>
		               	<input type="text" name="eircode">
		            </div>
		            <div class="checkout__input">
		            	<p>Phone <span style="color: red;">*</span></p>
		               	<input type="tel" name="phone" required>
		            </div>
		            <div class="checkout__input">
		            	<p>Email address <span style="color: red;">*</span></p>
		               	<input type="email" name="email" required>
		            </div>
	            
	              	<div class="row">
	                  	<div class="col-md-12">
	                      	<div class="headin_g">
	                      		<h4 class="mt-4">SHIP TO A DIFFERENT ADDRESS?</h4>
	                      		<input type="checkbox" id="vehicle1" name="shipping_address" value="1">
	                      		<div class="clear"></div>
	                      	</div>
	                  	</div>
	              	</div>
	          
	            	<div class="shipping">
	            		<div class="row">
			               <div class="col-lg-6">
		                  		<div class="checkout__input">
		                     		<p>Fist Name<span style="color: red;">*</span></p>
		                     		<input type="text" name="first_name1">
		                  		</div>
		               		</div>
			               	<div class="col-lg-6">
			                  	<div class="checkout__input">
			                     	<p>Last Name<span style="color: red;">*</span></p>
			                     	<input type="text" name="last_name1">
			                  	</div>
			               	</div>
			            </div>
			            <div class="checkout__input">
			               	<p>Country<span>*</span></p>
			               	<select name="country1">
			               		<option value="Ireland">Ireland</option>
			               	</select>
			            </div>
			            <div class="checkout__input">
			               	<p>Street address<span style="color: red;">*</span></p>
			               	<input type="text" name="street_address1" placeholder="House number and street name">
			            </div>
			            <div class="checkout__input">
			               	<input type="text" name="appartment1" placeholder="Apartment, suite, unit, etc. (optional)">
			            </div>
			            <div class="checkout__input">
			            	<p>Town / City<span style="color: red;">*</span></p>
			               	<input type="text" name="town_city1">
			            </div>
			            <div class="checkout__input">
			            	<p>County<span style="color: red;">*</span></p>
			               	<select name="county1" class="select12">
								@foreach($counties as $county)
									<option value="{{$county->county}}">{{$county->county}}</option>
								@endforeach
							</select>
			            </div>
			            <div class="checkout__input">
			            	<p>Eircode (optional)</p>
			               	<input type="text" name="eircode1">
			            </div>
		            </div>
		            <div class="row">  
		             	<div class="col-lg-12">
		                 	<p class="M_taxt">Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our</p>
		                </div>
		             	<div class="col-lg-12">
		                 	<label class="bill-name">Order notes (optional) <textarea name="notes" rows="6" placeholder="Notes about your order, e.g. special notes for delivery."></textarea></label>
		                </div>
		            </div>
            	</div>
	         
	         <!-----leftside----->
	           <div class="col-lg-6 col-md-6">
	            	<div class="checkout__order">
	        			<div class="checkout-form-panel">
							<h3 class="biling-hdng">YOUR ORDER</h3>

							<table class="table table-bordered">
								<tbody>
								    <tr style="background-color: #f7f7f7;">
									<th class="subtotal-cus">PRODUCT</th>
									<th class="subtotal-cus">SUBTOTAL</th>
								</tr>

								@foreach($results as $key => $result)
								<?php 
		                        $product = DB::table('products')->where('id',$result->product_id)->first();
		                        ?>
								<tr>
									<td>{{$product->title}}  × {{$result->quantity}}</td>
									<td><div><span class="cart-proce-color">€ {{number_format($result->sub_total,2)}}</span></div></td>
								</tr>
								@endforeach
								
								<tr>
									<th>Subtotal</th>
									<td><span class="cart-proce-color">€ {{number_format($sub_total,2)}}</span></td>
								</tr>

								@if($discount != '0' && !empty($discount))
								<tr>
									<th>Discount</th>
									<td class="cart-proce-color">€ {{number_format($discount,2)}}</td>
								</tr>
								@endif
								
								<tr>
									<th>Shipping</th>
									<td>
										<div><label><input type="radio" name="price" checked> {{$result->shipping_method}}:</label> <span class="cart-proce-color">€ {{number_format($result->shipping_price,2)}}</span></div>
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

							</tbody>
							</table>


							<div class="stripe-box">
								<h6><span></span>Stripe</h6>
								<ul class="card-list">
									<li><img src="{{asset('assets/front/images/mastercard.svg')}}" alt=""></li>
									<li><img src="{{asset('assets/front/images/amex.svg')}}" alt=""></li>
									<li><img src="{{asset('assets/front/images/visa.svg')}}" alt=""></li>
								</ul>
							</div>

							<div class="card-details">
								<h6 class="c_title">Pay with your credit card via Stripe.</h6>

								<label class="card-info">Card Number <span style="color: red;">*</span>
									<div style="display: flex;" class="C_ard">
									    <i class="fa fa-credit-card"></i>
									    <input type="" name="card_number" placeholder="1234 1234 1234 1234" maxlength="16" class=" card-number required" onkeydown="checkCardFormat(event)" autocomplete="off" size="20" required=""><i class="icofont-credit-card"></i></div></label>
							</div>

							<div class="row">
								<div class="col-lg-4">
									<label class="card-info">Expiry Month <span style="color: red;">*</span>
									<div style="display: flex;"><input type="text" name="expiry_month" id="expiry_month" placeholder="MM" class=" w1 card-icon card-expiry-month required" size="2" data-inputmask-alias="expiry_month" data-inputmask-inputformat="MM" data-mask="" required="" inputmode="text"></div></label>
								</div>

								<div class="col-lg-4">
									<label class="card-info">Expiry Year <span style="color: red;">*</span>
									<div style="display: flex;"><input type="text" name="expiry_year" id="expiry_year" placeholder="YYYY" class=" w1 card-icon card-expiry-year required" size="2" data-inputmask-alias="expiry_year" data-inputmask-inputformat="YYYY" data-mask="" required="" inputmode="text"></div></label>
								</div>

								<div class="col-lg-4">
									<label class="card-info">Card Code (CVC) <span style="color: red;">*</span>
									<div style="display: flex;"><input type="text" name="cvv" id="cvv" placeholder="CVC" maxlength="16" class=" w1 card-icon card-cvc required" autocomplete="off" size="4" required="" inputmode="text"></div></label>
									<div id="errorCvv_number " class="error" style="display:none;">
	                                   Please enter CVV number.
	                               </div>
								</div>

		                        <div class='col-md-12 error form-group hide'>
		                            <div class='alert-danger alert'>Please correct the errors and try
		                                again.</div>
		                        </div>

		                        <input type="hidden" name="total_amount" value="{{$grand_total}}">

								<div class="col-lg-12 mt-3 ">
										<p class="card-text c_hk">Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our <a href="#">privacy policy</a>.</p>

										<button class="proceed-btn placeorder site-btn">PLACE ORDER</button>
								</div>
							</div>

						</div>
		            </div>
		         </div>
		      </div>
		   </form>
   
   
   
</div>
</div>
</section>

@endsection

@section('script')
<script src="{{asset('assets/admin/plugins/inputmask/jquery.inputmask.min.js')}}"></script>
<script>
$(document).ready(function(){
  $("#vehicle1").click(function(){
   $(".shipping").toggle('slow');
  });
});
</script>


<script>
    var num;

$(".button-count:first-child").click(function () {
  num = parseInt($("input:text").val());
  if (num > 1) {
    $("input:text").val(num - 1);
  }
  if (num == 2) {
    $(".button-count:first-child").prop("disabled", true);
  }
  if (num == 10) {
    $(".button-count:last-child").prop("disabled", false);
  }
});

$(".button-count:last-child").click(function () {
  num = parseInt($("input:text").val());
  if (num < 10) {
    $("input:text").val(num + 1);
  }
  if (num > 0) {
    $(".button-count:first-child").prop("disabled", false);
  }
  if (num == 9) {
    $(".button-count:last-child").prop("disabled", true);
  }
});

</script>

<script>
	$(document).ready(function(){
		$('#expiry_month').inputmask('99', { 'placeholder': 'MM' });
		$('#expiry_year').inputmask('9999', { 'placeholder': 'YYYY' });
		$('#cvv').inputmask('999', { 'placeholder': 'CVC' });

		$('.select12').select2({
		   	theme: 'bootstrap4',
		   	//minimumResultsForSearch: Infinity
		});

		$('.DifferPanel').on('click', function(){
			$('.dif-add').slideToggle();
		});

		// $("#ClickCoupon").on('click', function(){
		// 	$(".coupon-panel").slideToggle();
		// });
	});
</script>

<script type="text/javascript" src="https://js.stripe.com/v2/"></script>
<script type="text/javascript">
  	function checkCardFormat(e) {
     	// Allow: backspace, delete, tab, escape, enter and .
     	if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
            // Allow: Ctrl+A, Command+A
            (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
            // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
            // let it happen, don't do anything
            return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
   	}

  	$(function() {
      	var $form         = $(".require-validation");
        $('form.require-validation').bind('submit', function(e) {
          	var $form         = $(".require-validation"),
              	inputSelector = ['input[type=email]', 'input[type=password]',
                               'input[type=text]', 'input[type=file]',
                               'textarea','select'].join(', '),
              	$inputs       = $form.find('.required').find(inputSelector),
              	$errorMessage = $form.find('div.error'),
              	valid         = true;
              	$errorMessage.addClass('hide');
              	$('.has-error').removeClass('has-error');
          	$inputs.each(function(i, el) {
	            var $input = $(el);
	            if ($input.val() === '') {
	              	$input.parent().addClass('has-error');
	              	$errorMessage.removeClass('hide');
	              	e.preventDefault();
	            }
          	});

          	if (!$form.data('cc-on-file')) {
            	e.preventDefault();
            	Stripe.setPublishableKey($form.data('stripe-publishable-key'));
            	Stripe.createToken({
	              	number: $('.card-number').val(),
	              	cvc: $('.card-cvc').val(),
	              	exp_month: $('.card-expiry-month').val(),
	              	exp_year: $('.card-expiry-year').val()
            	}, stripeResponseHandler);
          	}
        });

        function stripeResponseHandler(status, response) {
          	if (response.error) {
              	$('.error')
                  	.removeClass('hide')
                  	.find('.alert')
                  	.text(response.error.message);
          	} else {
          		// token contains id, last4, and card type
              	var token = response['id'];
              	// insert the token into the form so it gets submitted to the server
              	$form.find('input[type=text]').empty();
              	$form.append("<input type='hidden' name='stripeToken' value='" + token + "'/>");
              	$form.get(0).submit();
       		}
      	}
  	});
</script>
@endsection