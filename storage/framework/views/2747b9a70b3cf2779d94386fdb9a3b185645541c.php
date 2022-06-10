
<?php $__env->startSection('content'); ?>

<section class="hes_derimg">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="headeing_image">
                    <h4>Shopping Cart</h4>
                    <p><strong><a href="<?php echo e(route('home')); ?>">Home ></a></strong> <span>Cart</span></p>
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
							<?php $__currentLoopData = $results; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $result): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
							<?php 
	                        $product = DB::table('products')->where('id',$result->product_id)->first();
	                        $productImages = DB::table('product_images')->where('product_id',$result->product_id)->first();
	                        ?>
							<tr>
							
								<td class="text-center" ><a href="<?php echo e(route('productDetails',$product->id)); ?>"><img src="<?php echo e(url('/public/admin/clip-one/assets/products/original')); ?>/<?php echo e($productImages->image); ?>" alt="" class="img-fluid d-block mx-auto" width="100"></a></td>
								<td class="text-center" ><a href="<?php echo e(route('productDetails',$product->id)); ?>" class="cartproname"><?php echo e($product->title); ?></a></td>
								<td class="cart-proce-color text-center">€ <?php echo e(number_format($result->price,2)); ?></td>
								<td class="text-center"><div class="control text-center">
									<button type="button" class="bttn bttn-left minus" id="minus">
									   <span>-</span>
									</button>
									<input type="hidden" name="id[]" value="<?php echo e($result->id); ?>">
									<input type="hidden" name="product_id[]" value="<?php echo e($result->product_id); ?>">
									<input type="hidden" name="cart_id" value="<?php echo e($result->cart_id); ?>">
									<input type="hidden" name="coupon_code" value="<?php echo e($result->coupon_code); ?>">
									<input type="number" name="quantity[]" class="input" id="input" value="<?php echo e($result->quantity); ?>">
									<button type="button" class="bttn bttn-right plus" id="plus">
									  <span>+</span>
									</button>
								</div></td>
								<td class="cart-proce-color  text-center">€<?php echo e(number_format($result->sub_total,2)); ?></td>
									<td class="text-center"><a  class="act_ion" href="javascript:void(0)" class="delt-pro removeCart" data-id="<?php echo e($result->id); ?>">X</a></td>
							</tr>
							<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

						<?php if(count($results)>0): ?>
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
						<?php endif; ?>
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
								<td class="cart-proce-color">€ <?php echo e(number_format($sub_total,2)); ?></td>
							</tr>

							<?php if($discount != '0' && !empty($discount)): ?>
							<tr>
								<th>Discount</th>
								<td class="cart-proce-color">€ <?php echo e($discount); ?></td>
							</tr>
							<?php endif; ?>

							<tr>
								<th>Shipping</th>
								<td>
									<div><label><input type="radio" name="shipping_method" value="<?php echo e($shipping_method); ?>" data-id="<?php echo e($shipping_price); ?>" checked required> <?php echo e($shipping_method); ?>:</label> <span class="cart-proce-color">€ <?php echo e(number_format($shipping_price,2)); ?></span></div>
								</td>
							</tr>

							<?php if($tax_amount != '0'): ?>
							<tr>
								<th>Tax</th>
								<td class="cart-proce-color">€ <?php echo e(number_format($tax_amount,2)); ?></td>
							</tr>
							<?php endif; ?>

							<tr>
								<th>Total</th>
								<td><span class="cart-proce-color">€ <?php echo e(number_format($grand_total,2)); ?></span></td>
							</tr>
						</table>

						<?php if(count($results)>0): ?>
							<a href="<?php echo e(route('checkout')); ?>" class="proceed-btn">PROCEED TO CHECKOUT</a>
						<?php endif; ?>
					</div>
				</div>
				
			</div>
		</div>
	</section>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>
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
           	url: "<?php echo e(url('updateCart')); ?>",
           	method: "post",
           	data: {_token: '<?php echo e(csrf_token()); ?>', form: form},
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
	           	url: "<?php echo e(url('applyCoupon')); ?>",
	           	method: "post",
	           	data: {_token: '<?php echo e(csrf_token()); ?>', form: form},
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
           	url: "<?php echo e(url('changeShippingMethod')); ?>",
           	method: "post",
           	data: {_token: '<?php echo e(csrf_token()); ?>', shipping_price: shipping_price, shipping_method: shipping_method},
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
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layout.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/hm3hczr3zv0q/public_html/demo/mg_hygiene/resources/views/front/cart/index.blade.php ENDPATH**/ ?>