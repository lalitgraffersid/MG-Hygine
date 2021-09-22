@extends('admin.layout.master')
@section('content')
 
<style>
.customer-panel{
   background-color: #efefef;
   padding: 18px;
   min-height: 300px;
   border-radius: 6px;
   font-size: 13px;
}
.customer-panel h3{
   font-size: 22px;
   }
ul.customer-list li{
   font-size: 15px;
   margin: 0 0 10px 0;
}
ul.customer-list {
   list-style: none;
   padding: 0;
}
.checkout-table tr td{
   text-align: center;
   padding: 0 0 0 10px;
}
.checkout-hdr{
   text-align: center;
   /*background-color: #ddba67 !important;*/
}
</style>

<div class="content-wrapper">
   <div class="content-header">
      <div class="container-fluid">
         <div class="row mb-2">
            <div class="col-sm-6">
               <h1 class="m-0 text-dark">Order Details</h1>
            </div>
            <div class="col-sm-6">
               <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">Home</a></li>
                  <li class="breadcrumb-item active">Order Details</li>
               </ol>
            </div>
         </div>
      </div>
   </div>

   <section class="content">
      <div class="card">

         <div class="card-body">
            <div class="row">
               <div class="col-md-4">
                  <div class="customer-panel">
                     <h3>General</h3>
                     <div class="web-content">
                        <ul class="customer-list">
                           <li>Order Date: <span>{{date('d F Y',strtotime($result->created_at))}}</span></li>
                           <li>Status: <span>{{$result->status}}</span></li>
                        </ul>
                     </div>
                  </div>
               </div>

               <div class="col-md-4">
                  <div class="customer-panel">
                     <h3>Billing</h3>
                     <div class="web-content">
                        <ul class="customer-list">
                           <li>{{$customer->first_name}} {{$customer->last_name}} <br> 
                              {{$customer->company_name}}</li>
                           <li>{{$customer->street_address}}, {{$customer->county}}<br> 
                              {{$customer->country}}</li>
                           <li>Phone:<br> {{$customer->phone}}</li>
                           <li>Email:<br> {{$customer->email}}</li>
                        </ul>
                     </div>
                  </div>
               </div>

               <div class="col-md-4">
                  <div class="customer-panel">
                     <h3>Shipping</h3>
                     <div class="web-content">
                        <ul class="customer-list">
                           <li>{{$shipping_address->first_name}} {{$shipping_address->last_name}} <br> 
                              {{$shipping_address->company_name}}</li>
                           <li>{{$shipping_address->street_address}}, {{$shipping_address->county}}<br> 
                              {{$shipping_address->country}}</li>
                        </ul>
                     </div>
                  </div>
               </div>

               <div class="col-lg-12 mt-5">
                  <h3>Product Details</h3>
                  <table class="table table-bordered checkout-table">
                     <tr class="checkout-hdr">
                        <th>Image</th>
                        <th>Product Name</th>
                        <th>Size</th>
                        <th>Color</th>
                        <th>Qty</th>
                        <th>Total</th>
                        <th>Tax</th>
                     </tr>
                     @foreach($results as $key => $result)
                     <?php 
                          $product = DB::table('products')->where('id',$result->product_id)->first();
                          $images = DB::table('product_images')->where('product_id',$product->id)->first();
                          ?>
                     <tr>
                        <td><img src="{{url('/public/admin/clip-one/assets/products/original')}}/{{$images->image}}" alt="" class="img-fluid" width="50"></td>
                        <td class="text-left">{{$product->title}}</td>
                        <td>{{$result->size}}</td>
                        <td>{{$result->color}}</td>
                        <td>{{$result->quantity}}</td>
                        <td>€{{$result->price}}</td>
                        <td>€{{$result->tax_amount}}</td>
                     </tr>
                     @endforeach
                  </table>
               </div>

               <div class="col-lg-8">&nbsp;</div>
               <div class="col-lg-4">
                  <div class="total-panel" style="min-height: auto;">

                     <table class="table table-bordered cus-table">
                        <tr>
                           <th>Subtotal</th>
                           <td>€{{$sub_total}}</td>
                        </tr>

                        @if($discount != '0' && !empty($discount))
                        <tr>
                           <th>Discount</th>
                           <td>€ {{$discount}}</td>
                        </tr>
                        @endif

                        <tr>
                           <th style="width: 50%">Shipping ({{$result->shipping_method}})</th>
                           <td>€{{$result->shipping_price}}</td>
                        </tr>

                        <tr>
                           <th>Order Total</th>
                           <td>€{{$grand_total}}</td>
                        </tr>
                     </table>

                  </div>
               </div>

            </div>
         </div>
      </div>
   </section>
</div>
@endsection

@section('script')
<script src="{{asset('assets/admin/plugins/jquery-validation/jquery.validate.min.js')}}"></script>
<script src="{{asset('assets/admin/plugins/jquery-validation/additional-methods.min.js')}}"></script>

<script>
$('.select12').select2({
   theme: 'bootstrap4',
   minimumResultsForSearch: Infinity
});

$(function () {
   $('#quickForm').validate({
      rules: {
         title: {
            required: true
         }
      },
      messages: {
         title: {
            required: "Please enter title",
         }
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


@endsection
  


