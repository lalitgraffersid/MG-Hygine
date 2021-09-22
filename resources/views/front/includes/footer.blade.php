<?php
    $settings = DB::table('settings')->first();
?>
<section class="info_section ">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="info_info">
                    <img src="{{asset('assets/front/images/img/botom-logo.png')}}">
                    <p>Eligendi sunt, provident, debitis nemo, facilis cupiditate velit cupiditate velit</p>
                </div>
            </div>
        
            <div class="col-md-3">
                <div class="info_links">
                    <h5>Useful Link</h5>
                    <ul>
                        <li><a href="{{route('home')}}">Home</a></li>
                        <li><a href="{{route('about_us')}}">About Us</a></li>
                        <li><a href="{{route('contact_us')}}">Contact Us</a></li>
                        <li><a href="{{route('privacy_policy')}}">Terms and Condition</a></li>
                    </ul>
                </div>
            </div>
        
            <div class="col-md-3">
                <div class="info_links">
                    <h5>Our Brands</h5>
                    <ul>
                        <li><a href="{{route('our_brands')}}">Products</a></li>
                        <li><a href="#">Cleaning Tips</a></li>
                        <li><a href="{{route('our_environment')}}">Our Environment</a></li>
                    </ul>
                </div>
            </div>

            <div class="col-md-3">
                <div class="info_contact">
                    <h5>Contact Us</h5>
                    <p>
                        <strong class="cl">Address</strong> :{{$settings->address}}
                    </p>
                    <p>
                        <strong class="cl"> Call</strong> : {{$settings->phone}}
                    </p>
                    <p>
                        <strong class="cl">Email</strong> : {{$settings->email}}
                    </p>
            
                    <div class="social_link">
                        <a class="f" href="#"><i class="fa fa-facebook"></i></a>
                        <a class="t" href="#"><i class="fa fa-twitter"></i></a>                      
                        <a class="li" href="#"><i class="fa fa-linkedin"></i></a>
                    </div>
                </div>
            </div>        
        </div>
    </div>
</section>
<!-- end info_section -->

<!-- footer section -->
<footer class="footer_section">
    <div class="container">
        <p>&copy; <span id="displayYear"></span> All Rights Reserved By <a href="{{route('home')}}">MG Hygiene</a></p>
    </div>
</footer>
<!-- footer section -->

<!-- jQery -->
<script src="{{asset('assets/front/js/jquery.min1.js')}}"></script>

<script src="{{asset('assets/front/js/custom.js')}}"></script>
<script src="{{asset('assets/front/js/owl.carousel.js')}}"></script>
<script src="{{asset('assets/front/js/highlight.js')}}"></script>


<script src="{{asset('assets/admin/plugins/toastr/toastr.min.js')}}"></script>
<script src="{{asset('assets/admin/plugins/select2/js/select2.full.min.js')}}"></script>

<script>
    $(function() { // Dropdown toggle
        $('.dropdown-toggle').click(function() {
            $(this).next('.dropdown').slideToggle();
        });

        $(document).click(function(e) 
        { 
            var target = e.target; 
            if (!$(target).is('.dropdown-toggle') && !$(target).parents().is('.dropdown-toggle'))
            { 
                $('.dropdown').slideUp(); 
            }
        });
    });
</script>

<script type="text/javascript">
    @if(Session::has('message'))
        var type = "{{ Session::get('alert-type', 'info') }}";
        switch(type){
            case 'info':
                toastr.info("{{ Session::get('message') }}");
                break;

            case 'warning':
                toastr.warning("{{ Session::get('message') }}");
                break;

            case 'success':
                toastr.success("{{ Session::get('message') }}");
                break;
                
            case 'error':
                toastr.error("{{ Session::get('message') }}");
                break;
        }
   @endif
</script>

<!-- <script>
    $(document).ready(function(){
        $('.add2Cart').on('click',function(){
            var id = $(this).data('id');
            var qty = $(this).closest("div.cart-div").find("input[name='quantity']").val();

            $.ajax({
                url: "{{ url('add2Cart') }}",
                method: "post",
                data: {_token: '{{ csrf_token() }}', id: id, qty: qty},
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
</script> -->

<script>
    $('.removeCart').on('click',function(){
        var id = $(this).data('id');

        $.ajax({
            url: "{{ url('removeCart') }}/"+id,
            method: "GET",
            success: function (response) {
                if(response.status == 'success'){
                    toastr.success('Product removed from cart');
                    setTimeout(function(){
                        location.reload(); 
                    }, 1000);
                }
            }
        });
    });
</script>


<script>
   $(document).ready (function(){
      $("#CartClick").click(function(){
         $(".add-item-panel").slideToggle();
      });
   });
</script>

<!--<script src='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js'></script>-->
<!--<script src='https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.10.0/js/lightbox.min.js'></script>-->
<!--<script src="{{asset('assets/front/js/owl.js')}}"></script>-->


</body>

</html>