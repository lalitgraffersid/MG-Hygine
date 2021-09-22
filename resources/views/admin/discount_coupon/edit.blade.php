@extends('admin.layout.master')
@section('content')
 
<div class="content-wrapper">
   <div class="content-header">
      <div class="container-fluid">
         <div class="row mb-2">
            <div class="col-sm-6">
               <h1 class="m-0 text-dark">Intro Screen</h1>
            </div>
            <div class="col-sm-6">
               <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">Home</a></li>
                  <li class="breadcrumb-item active">Intro Screen Edit</li>
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
                     <h3 class="card-title">Edit <small>Intro Screen</small></h3>
                  </div>
                  @if (count($errors) > 0)       
                     <div class="alert alert-danger alert-dismissable">
                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                        @foreach ($errors->all() as $error)
                           <span>{{ $error }}</span><br/>
                        @endforeach    
                     </div>         
                  @endif
                  <form id="quickForm" action="{{route('discount_coupon.update')}}" method="POST" enctype="multipart/form-data">
                     {{csrf_field()}}
                     <input type="hidden" name="id" value="{{$result->id}}">

                     <div class="card-body">

                        <div class="form-group">
                           <label for="title">Title</label>
                           <input type="text" name="title" class="form-control" id="title" placeholder="Title" value="{{$result->title}}">
                        </div>
                        
                        <div class="form-group">
                           <label for="coupon_code">Coupon Code</label>
                           <input type="text" name="coupon_code" class="form-control" id="coupon_code" value="{{$result->coupon_code}}">
                        </div>

                        <div class="form-group">
                           <label for="discount">Discount %</label>
                           <input type="number" name="discount" min="0" class="form-control" id="discount" placeholder="Discount %" value="{{$result->discount}}">
                        </div>

                        <div class="form-group">
                           <label for="users_limit">No Of User</label>
                           <input type="number" name="users_limit" min="0" class="form-control" id="users_limit" placeholder="No Of User" value="{{$result->users_limit}}">
                        </div>

                        <div class="form-group">
                           <label for="valid_from">Valid From</label>
                           <input type="date" name="valid_from" min="0" class="form-control" id="valid_from" placeholder="Valid From" value="{{$result->valid_from}}" min="{{date('Y-m-d')}}" max="2050-12-31">
                        </div>

                        <div class="form-group">
                           <label for="valid_to">Valid To</label>
                           <input type="date" name="valid_to" min="0" class="form-control" id="valid_to" placeholder="Valid To" value="{{$result->valid_to}}" min="{{date('Y-m-d')}}" max="2050-12-31">
                        </div>

                     </div>
                     <div class="card-footer">
                        <div>
                           <button type="submit" class="btn btn-primary">Submit</button>
                           <a href="{{route('discount_coupon.index')}}" class="btn btn-default btn-secondary">Back</a>
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
         title: {
            required: true
         },
         coupon_code: {
            required: true
         },
         discount: {
            required: true
         },
         users_limit: {
            required: true
         },
         valid_from: {
            required: true
         },
         valid_to: {
            required: true
         },
      },
      messages: {
         title: {
            required: "Please enter title",
         },
         coupon_code: {
            required: "Please enter coupon code",
         },
         discount: {
            required: "Please enter discount %",
         },
         users_limit: {
            required: "Please enter no of user allowed",
         },
         valid_from: {
            required: "Please select valid from date",
         },
         valid_to: {
            required: "Please select valid to date",
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

@endsection
  


