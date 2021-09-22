@extends('front.emails.emailMaster')
@section('content')
<div class="row" id="divID">
    <div class="col-md-12">
        <span>Hello,</span><br>
        <p>Your order has been placed successfully, Please find details given below: </p>
      <div class="tbl">
        <table id="customers" class="table table-bordered table-striped table-hover" style="border: solid #d6d6d6 2px; padding: 10px;">

            <tr style="background-color: #ccc;">
              <td style="padding: 10px;">Name</td>
              <td style="padding: 10px;">{{ $customer->first_name }} {{ $customer->last_name }}</td>
            </tr>

            <tr>
              <td style="padding: 10px;">Phone</td>
              <td style="padding: 10px;">{{ $customer->phone }}</td>
            </tr>

            <tr style="background-color: #ccc;">
              <td style="padding: 10px;">Email</td>
              <td style="padding: 10px;">{{ $customer->email }}</td>
            </tr>

            <tr>
              <td style="padding: 10px;">Billing</td>
              <td style="padding: 10px;">
                  {{ $customer->street_address }}, {{ $customer->county }}, {{ $customer->country }}
              </td>
            </tr>
            
            @if(!empty($shipping_data))
            <tr>
              <td style="padding: 10px;">Shipping</td>
              <td style="padding: 10px;">
                  {{ $shipping_data != '' ? $shipping_data->street_address : '' }}, {{ $shipping_data != '' ? $shipping_data->county : $customer->county }}, {{ $shipping_data != '' ? $shipping_data->street_address : $customer->country }}
              </td>
            </tr>
            @else
            <tr>
              <td style="padding: 10px;">Shipping</td>
              <td style="padding: 10px;">
                  {{ $customer->street_address }}, {{ $customer->county }}, {{ $customer->country }}
              </td>
            </tr>
            @endif

            <tr style="background-color: #ccc;">
              <td style="padding: 10px;">Notes</td>
              <td style="padding: 10px;">{{ $order[0]->notes }}</td>
            </tr>
        </table><br>
        
        
        <table id="customers" class="table table-bordered table-striped table-hover" style="width: 100%; border: solid #d6d6d6 2px; padding: 10px;">
            <tr style="background-color: #ccc;">
              <th style="padding: 10px;">Product</th>
              <th style="padding: 10px;">Size</th>
              <th style="padding: 10px;">Color</th>
              <th style="padding: 10px;">Qty</th>
              <th style="padding: 10px;">Price</th>
            </tr>

            @foreach($orders as $key => $result)
            <?php 
           $product = DB::table('products')->where('id',$result->product_id)->first();
           ?>

            <tr>
              <td style="padding: 10px;text-align:center">{{$product->title}}</td>
              <td style="padding: 10px;text-align:center">{{$result->size}}</td>
              <td style="padding: 10px;text-align:center">{{$result->color}}</td>
              <td style="padding: 10px;text-align:center">{{$result->quantity}}</td>
              <td style="padding: 10px;text-align:center">€{{$result->price}}</td>
            </tr>
            @endforeach

        </table>
      </div>

      <div class="pull-right delivr" style="margin-top: 15px; margin-bottom: 15px; float: right;">
        <table id="customers" class="table table-bordered table-striped table-hover" style="border: solid #d6d6d6 2px; padding: 10px;"> 
          <tbody>

            <tr style="background-color: #ccc;">
               <td style="padding: 10px;"><strong>Sub Total </strong></td>
               <td style="padding: 10px;"> <strong>€{{$sub_total}} </strong></td> 
            </tr>

            @if($discount != '0' && !empty($discount))
            <tr style="background-color: #ccc;">
               <td style="padding: 10px;"><strong>Discount </strong></td>
               <td style="padding: 10px;"> <strong>€{{$discount}} </strong></td> 
            </tr>
            @endif

            <tr style="background-color: #ccc;">
               <td style="padding: 10px;"><strong>Shipping Price </strong></td>
               <td style="padding: 10px;"> <strong>€{{$orders[0]->shipping_price}} </strong></td> 
            </tr>

            <tr style="background-color: #ccc;">
               <td style="padding: 10px;"><strong>Total </strong></td>
               <td style="padding: 10px;"> <strong>€{{$orders[0]->g_total}} </strong></td> 
            </tr>
          
          </tbody>
        </table>
      </div>
    </div>
  </div>

  @stop