@extends('admin.layout.master')
@section('content')
 
<style type="text/css">
   .select12:invalid + .select2 .select2-selection{
       border-color: #dc3545!important;
   }
   .select12:valid + .select2 .select2-selection{
       border-color: #28a745!important;
   }
   *:focus{
     outline:0px;
   }
</style>

<div class="content-wrapper">
   <div class="content-header">
      <div class="container-fluid">
         <div class="row mb-2">
            <div class="col-sm-6">
               <h1 class="m-0 text-dark">Shipping Method</h1>
            </div>
            <div class="col-sm-6">
               <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">Home</a></li>
                  <li class="breadcrumb-item active">Shipping Method Add</li>
               </ol>
            </div>
         </div>
      </div>
   </div>

   <section class="content">
      <div class="container-fluid">
         <div class="row">
            <div class="col-md-12">
               <div class="card card-primary">
                  <div class="card-header">
                     <h3 class="card-title">Add <small>Shipping Method</small></h3>
                  </div>
                  @if (count($errors) > 0)       
                     <div class="alert alert-danger alert-dismissable">
                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                        @foreach ($errors->all() as $error)
                           <span>{{ $error }}</span><br/>
                        @endforeach    
                     </div>         
                  @endif
                  <form id="quickForm" action="{{route('shipping.save')}}" method="POST" enctype="multipart/form-data" >
                     {{csrf_field()}}
                     <div class="card-body">

                        <div class="form-group">
                           <label for="shipping_method">Shipping Method</label>
                           <select name="shipping_method" class="shipping_method form-control" id="shipping_method" data-placeholder="Select Shipping Method" style="width: 100%;" required >
                              <option value="">Select Shipping Method</option>
                              <option value="Fixed">Fixed</option>
                              <option value="Free">Free</option>
                           </select>
                        </div>

                        <div class="form-group">
                           <label for="cart_amount">Cart Amount</label>
                           <input type="number" name="cart_amount" value="{{ old('cart_amount') }}" class="form-control" id="cart_amount" placeholder="Cart Amount" step="any" min="1">
                        </div>

                        <div class="form-group">
                           <label for="price">Price</label>
                           <input type="number" name="price" value="{{ old('price') }}" class="form-control" id="price" placeholder="Price" step="any" min="0">
                        </div>

                     </div>
                     <div class="card-footer">
                        <div>
                           <button type="submit" class="btn btn-primary">Submit</button>
                           <a href="{{route('shipping.index')}}" class="btn btn-default btn-secondary">Back</a>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
            <div class="col-md-6"></div>
         </div>
      </div>
   </section>
</div>
@endsection

@section('script')
<script src="{{asset('assets/admin/plugins/jquery-validation/jquery.validate.min.js')}}"></script>
<script src="{{asset('assets/admin/plugins/jquery-validation/additional-methods.min.js')}}"></script>

<script>

$(function () {
   $('#quickForm').validate({
      rules: {
         shipping_method: {
            required: true
         },
         cart_amount: {
            required: true
         },
         price: {
            required: true
         },
      },
      messages: {
         shipping_method: {
            required: "Please select shipping method!",
         },
         cart_amount: {
            required: "Please enter cart amount!",
         },
         price: {
            required: "Please enter price!",
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
  


