
<?php $__env->startSection('content'); ?>

<section class="hes_derimg about">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="headeing_image">
                    <h4>About Us</h4>
                    <p><strong><a href="<?php echo e(route('home')); ?>">Home ></a></strong> <span>About us</span></p>
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
         <img src="<?php echo e(url('/public/admin/clip-one/assets/about_us')); ?>/<?php echo e($result->image); ?>" alt="">  
          </div>
        </div>
        <div class="col-sm-6 col-lg-6">
          <div class="about_textbox">
           <h1 class="about_m_h"><?php echo e($result->heading); ?></h1>
           <p><?php echo $result->description; ?></p>
          </div>
        </div>
     
      </div>
    </div>
  </section>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>
<script>
	
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layout.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/hm3hczr3zv0q/public_html/demo/mg_hygiene/resources/views/front/about_us/index.blade.php ENDPATH**/ ?>