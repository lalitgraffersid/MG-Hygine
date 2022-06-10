
<?php $__env->startSection('content'); ?>



<section class="hes_derimg product">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="headeing_image">
                    <h4 class="brand">Our Brands</h4>
                    <p><strong><a href="<?php echo e(route('home')); ?>">Home ></a></strong> <span>Our Brands</span></p>
                </div>
            </div>
        </div>
    </div>
</section>
<!--===header===-->

 
  <!-- product section -->
<div class="container">
    <div class="heading_container heading_center">
        <h2 class="o_r_brand">Our Brands</h2>
    </div>
      
    <div class="row">

    	<?php $__currentLoopData = $results; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $result): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
        <div class="col-md-4">
          	<div class="box_our ">
           		<div class="image test">
           		    <a href="<?php echo e(route('products',$result->brand_slug)); ?>">
                	<div class="box9">
                        <img src="<?php echo e(url('/public/admin/clip-one/assets/brands/original')); ?>/<?php echo e($result->image); ?>">
                        <div class="box-content">
                            <h3 class="title"><?php echo e($result->name); ?></h3>
                            <ul class="icon brand">   
                                <li><i class="fa fa-link"></i></li>
                            </ul>
                        </div>
                    </div> 
                    </a>
           		</div>
         	</div>
        </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

    </div>

    <div class="row">
		<div class="col-lg-12 text-center">
			<div class="mb-4">
				<?php echo e($results->links()); ?>

			</div>
		</div>
	</div>

</div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layout.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/hm3hczr3zv0q/public_html/demo/mg_hygiene/resources/views/front/products/our_brands.blade.php ENDPATH**/ ?>