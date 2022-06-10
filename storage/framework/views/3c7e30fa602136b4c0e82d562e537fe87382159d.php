
<?php $__env->startSection('content'); ?>
<style>
        .nav-link[data-toggle].collapsed:after {
  content: "▾";
}
.nav-link[data-toggle]:not(.collapsed):after {
  content: "▴";
}
        ul.nav.flex-column.flex-nowrap {
    display: block;
    width: 100%;
}
        .nav-link[data-toggle].collapsed:after {
    content: "▾";
    float: right;
}
.nav-link[data-toggle]:not(.collapsed):after {
    content: "▴";
    float: right;
}
ul.nav.flex-column.flex-nowrap li.nav-item a.nav-link.collapsed {
    background-color: #3a4468;
    margin-bottom: 6px;
    color: #fff;
}
ul.nav.flex-column.flex-nowrap li.nav-item a.nav-link {
  background-color: #004778;
    color: #fff;
}
  
  ul.nav.flex-column.flex-nowrap li.nav-item a.nav-link.collapsed:hover{
      background-color: #004778;
    color: #fff;
  }
  a.nav-link.bg_c.py-0 {
      background-color: #02020024!important;
    margin-bottom: 3px;
    margin-top: 6px;
    color: #161b00!important;
}
.t_op {
    background-color: #7a9200;
    color: #fff;
    padding: 8px 16px;
    margin-bottom: 1px;
}
a.nav-link.bg_c.active.py-0 {
    background-color: #2d311a!important;
    color: #fff!important;
}
a.nav-link.bg_c.py-0:hover{
        background-color: #2d311a!important;
    color: #fff!important;
}
</style>
   <section class="hes_derimg product">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="headeing_image">
                    <h4>Product List</h4>
                    <p><strong><a href="<?php echo e(route('home')); ?>">Home ></a></strong> <span>Product</span></p>
                </div>
            </div>
        </div>
    </div>
</section>
<!--===header===-->
<section class="pt-5 pb-5">
  <div class="container">
      <div class="row">
         <div class="col-md-9">
            <div class="row">
               <?php $__currentLoopData = $results; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $result): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
               <?php 
               $images = DB::table('product_images')->where('product_id',$result->id)->get();
               ?>
				     <div class="col-md-4">
				        <div class="product-grid__product-wrapper">
				            <a class="v_all" href="<?php echo e(route('productDetails',$result->id)); ?>">
                           <div class="product-grid__product">
            						<div class="product-grid__img-wrapper">			
            							<img src="<?php echo e(url('/public/admin/clip-one/assets/products/original')); ?>/<?php echo e($images[0]->image); ?>" alt="Img" class="product-grid__img" />
            						</div>
						
						            <a class="v_all" href="<?php echo e(route('productDetails',$result->id)); ?>"><span class="product-grid__title"><?php echo e($result->title); ?></span></a>
                              <?php if($result->variants == '1'): ?>
                              <?php
                                 $yourArr = explode(",", $result->prices);
                                 $max = max($yourArr);
                                 $min = min($yourArr);
                              ?>
                                 <!--<span class="product-grid__price">€<?php echo e($min); ?> - €<?php echo e($max); ?></span>-->
                              <?php else: ?>
                                 <!--<span class="product-grid__price">€<?php echo e($result->price); ?></span>-->
                              <?php endif; ?>
            						<div class="product-grid__extend-wrapper cart-div">
            							<div class="product-grid__extend">
            								<!--<p class="product-grid__description"><?php echo e(\Illuminate\Support\Str::limit($result->description, 100, $end='...')); ?></p>-->
            								<!--<a class="v_all" href="<?php echo e(route('productDetails',$result->title_slug)); ?>">-->
            								<!--    <span class="product-grid__btn product-grid__add-to-cart"><i class="fa fa-eye"></i> View More</span>	-->
            								<!--</a>-->
            								<a class="c_btn" href="<?php echo e(route('productDetails',$result->id)); ?>">
            								    <span class="product-grid__btn product-grid__add-to-cart"> View Details</span>	
            								</a>
            							</div>
            						</div>
                           </div>
                        </a>
                     </div>
                  </div>
               <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
         </div>
            
         <div class="col-md-3">
            <div class="collapse d-md-flex bg-light pt-2" id="sidebar">
               <ul class="nav flex-column flex-nowrap">
                  <div class="t_op">
                     <strong>Filter Products</strong>
                  </div>
                  
                  <?php $__currentLoopData = $brands; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $brand): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                  <?php 
                  $categories = DB::table('categories')->where('brand_id',$brand->id)->where('status','1')->get();
                  ?>
                  <li class="nav-item">
                     <a class="nav-link <?php echo e($brand_slug == $brand->brand_slug ? '' : 'collapsed'); ?>" href="#submenu_<?php echo e($key); ?>" data-toggle="collapse" aria-expanded="<?php echo e($brand_slug == $brand->brand_slug ? 'true' : 'false'); ?>" data-target="#submenu_<?php echo e($key); ?>"><?php echo e($brand->name); ?></a>
                     <div class="collapse <?php echo e($brand_slug == $brand->brand_slug ? 'show' : ''); ?>" id="submenu_<?php echo e($key); ?>">
                        <ul class="flex-column pl-2 nav">
                           <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                              <li class="nav-item"><a class="nav-link bg_c <?php echo e($cat_id == $category->id ? 'active' : ''); ?> py-0" href="<?php echo e(route('products',[$brand->brand_slug,$category->id])); ?>"><?php echo e($category->title); ?></a></li>
                           <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </ul> 
                     </div>
                  </li>
                  <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

               </ul>
            </div>
         </div> 
      </div>
   </div>
</section>

  
<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layout.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/hm3hczr3zv0q/public_html/demo/mg_hygiene/resources/views/front/products/products.blade.php ENDPATH**/ ?>