
<?php $__env->startSection('content'); ?>

<style>           
input.btn.btn-primary1.px-5{
    background: #7a9200;
    margin-top: 23px;
    border: 1px solid #7a9200;
    color: #fff;
}
.info.bg-white.p-4 p{
    color: #000;
}
.info.bg-white.p-4 p span{
	font-weight: 700;
}
span.text:hover {
    color:#e6e6e6;
}
.block-23.mb-3 ul li {
    margin-bottom: 16px;
}  
.block-23.mb-3 ul li {
    margin-bottom: 16px;
}
.contact-section .contact-info p a:hover{
    color: #da760f;
}
/*---------new--------*/
 .inpu {
    float: left;
    width: 33%;
}   
.inpu input {
    width: 36px;
    height: 26px;
}
.ftco-section {
    padding: 6em 0;
    position: relative;
}

.bg-light {
    background: #f7f6f2 !important;
}
.w-100 {
    width: 100% !important;
}
.contact-section .info {
    width: 100%;
}
.contact-section .contact-form {
    width: 100%;
}
.form-control {
    height: 52px !important;
    background: #fff !important;
    color: #000000 !important;
            font-size: 18px;
        }
        
 .block-9 .form-control {
    outline: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    font-size: 15px;
}
.inpu {
    float: left;
   
}
.capcha {
    width: 62%;
    border: 1px solid #d4d4d4;
}
.capcha {
    width: 55%;    padding: 7px;
    border: 1px solid #d4d4d4;
}
/*---------new--------*/
        
</style>

<section class="hes_derimg">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="headeing_image">
                    <h4>Contact</h4>
                    <p><strong><a href="<?php echo e(route('home')); ?>">Home ></a></strong> <span>Contact</span></p>
                </div>
            </div>
        </div>
    </div>
</section>
<!--===header===-->

<section class="ftco-section contact-section bg-light">
    <div class="container">
      	<div class="row d-flex mb-5 contact-info">
            <div class="w-100"></div>
            <div class="col-md-4 d-flex">
                <div class="info bg-white p-4">
	               <p><span>Address :</span>  <br><?php echo e($settings->address); ?></p>
	            </div>
            </div>
            <div class="col-md-4 d-flex">
                <div class="info bg-white p-4">
	               <p><span>Ph &amp; Phone :</span> <a href="#"> <br><?php echo e($settings->phone); ?></a></p>
                </div>
            </div>
            <div class="col-md-4 d-flex">
                <div class="info bg-white p-4">
	               <p><span>Email:</span> <a href="mailto:info@yoursite.com"> <strong><?php echo e($settings->email); ?></strong></a></p>
	            </div>
            </div>
        </div>
    </div>
      
    <div class="container">
        <div class="row block-9">
            <div class="col-md-6 order-md-last d-flex">
                <form id="quickForm" action="<?php echo e(route('contact.save')); ?>" method="POST">
                              <?php echo e(csrf_field()); ?>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <input type="text" name="name" class="form-control" placeholder="Your Name">
                            </div>  
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                            <input type="number" name="phone" class="form-control" placeholder=" Phone Number">
                        </div>  
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="email" name="email" class="form-control" placeholder="Email Address">
                    </div>
                    <div class="form-group">
                        <input type="text" name="subject" class="form-control" placeholder="subject">
                    </div>
                    <div class="form-group">
                        <textarea name="comment" class="form-control" rows="6"></textarea>
                    </div>
                    <div class="form-group">
                        <span class="captcha_span"><?php echo captcha_img('flat'); ?></span>
                        <button type="button" class="btn btn-info btn-refresh refresh-button">Refresh</button>

                        <input id="captcha" type="text" class="form-control" placeholder="Enter Captcha" name="captcha" autocomplete="off">

                        <?php if($errors->has('captcha')): ?>
                            <span class="help-block" style="color: red;">
                                <strong>Entered captcha value is wrong! Try Again.</strong>
                            </span>
                        <?php endif; ?>
                    </div>
             
                    <div class="form-group">
                        <input type="submit" value="Send Message" class="btn btn-primary1  px-5">
                    </div>
                </form>
            </div>

            <div class="col-md-6 d-flex">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2382.9093610153495!2d-6.357386684585453!3d53.326976183863664!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x48670c96f8b3fc27%3A0xc86450d4b70e9823!2sMG%20Hygiene%20%26%20Cleaning%20Supplies!5e0!3m2!1sen!2sin!4v1619417750932!5m2!1sen!2sin" width="100%" height="" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            </div>
        </div>
    </div>
</section>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('script'); ?>

<script src="<?php echo e(asset('assets/admin/plugins/jquery-validation/jquery.validate.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/admin/plugins/jquery-validation/additional-methods.min.js')); ?>"></script>

<script>
$(function () {
    $('#quickForm').validate({
        rules: {
            name: {
                required: true
            },
            email: {
                required: true
            },
            subject: {
                required: true
            },
            phone: {
                required: true
            },
            comment: {
                required: true
            },
            captcha: {
               required: true
            },
        },
        messages: {
            name: {
                required: "Please enter Name",
            },
            email: {
                required: "Please enter email",
            },
            subject: {
                required: "Please enter subject",
            },
            phone: {
                required: "Please enter contact number",
            },
            comment: {
                required: "Please enter comment",
            },
            captcha: {
               required: "Please enter captcha",
            },
      },
      errorElement: 'span',
      errorPlacement: function (error, element) {
         error.addClass('invalid-feedback');
         element.closest('.form-group').append(error);
      },
      highlight: function (element, errorClass, validClass) {
         $(element).addClass('is-invalid');
      },
      unhighlight: function (element, errorClass, validClass) {
         $(element).removeClass('is-invalid');
      }
   });
});
</script>

<script type="text/javascript">
   $(".btn-refresh").click(function(){
      $.ajax({
         type:'GET',
         url:'<?php echo e(url("refresh_captcha")); ?>',
         success:function(data){
            $(".captcha_span").html(data.captcha);
         },
           error: function(data) {
             alert('Try Again.');
           }
      });
   });
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('front.layout.master', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\mg\resources\views/front/contact_us.blade.php ENDPATH**/ ?>