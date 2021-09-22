<?php
namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Validator;
use Input;
use Auth;
use Cookie;
use Session;
use DB;
use Image;
use File;
use Exception;
use Stripe;
use Mail;
use App\Helpers\AdminHelper;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\Product;
use App\Models\Cart;
use App\Models\CartLimit;
use App\Models\Tax;
use App\Models\DiscountCoupon;
use App\Models\Shipping;
use App\Models\County;
use App\Models\Customer;
use App\Models\ShippingAddress;
use App\Models\Order;
use App\Models\Setting;

class CartController extends Controller
{
    //=================================================================

	public function add2Cart(Request $request)
	{
		$session_id = Session::getId();
		$product = Product::find($request->id);
		$tax = Tax::first();

		if (!empty($request->size) && !empty($request->color)) {
			$size = $request->size;
			$color = $request->color;
		}else{
			$size = '';
			$color = '';
		}

		$checkSessionCart = Cart::where('session_id',$session_id)->first();
		if (!empty($checkSessionCart)) {
			$cart_id = $checkSessionCart->cart_id;
			$checkExistProduct = Cart::where('session_id',$session_id)->where('product_id',$product->id)->first();
			if (!empty($checkExistProduct)) {
				$sub_total = $request->qty * $request->price;

				if ($tax->status == '1') {
					$tax_amount = $sub_total * $tax->tax / 100;
				}else{
					$tax_amount = '0';
				}
				$total = $tax_amount + $sub_total;

				$saveCart = Cart::find($checkExistProduct->id);
				$saveCart->size = $size;
				$saveCart->color = $color;
				$saveCart->price = $request->price;
				$saveCart->quantity = $request->qty;
				$saveCart->sub_total = $sub_total;
				$saveCart->tax_amount = $tax_amount;
				$saveCart->total = $total;
			}else{
				$sub_total = $request->qty * $request->price;
				if ($tax->status == '1') {
					$tax_amount = $sub_total * $tax->tax / 100;
				}else{
					$tax_amount = '0';
				}
				$total = $tax_amount + $sub_total;

				$saveCart = new Cart;
				$saveCart->session_id = $session_id;
				$saveCart->cart_id = $cart_id;
				$saveCart->product_id = $product->id;
				$saveCart->size = $size;
				$saveCart->color = $color;
				$saveCart->price = $request->price;
				$saveCart->quantity = $request->qty;
				$saveCart->sub_total = $sub_total;
				$saveCart->tax_amount = $tax_amount;
				$saveCart->total = $total;
			}
		}else{
			$cart_id = AdminHelper::generate_cart_id(8);
			$sub_total = $request->qty * $request->price;
			if ($tax->status == '1') {
				$tax_amount = $sub_total * $tax->tax / 100;
			}else{
				$tax_amount = '0';
			}
			$total = $tax_amount + $sub_total;

			$saveCart = new Cart;
			$saveCart->session_id = $session_id;
			$saveCart->cart_id = $cart_id;
			$saveCart->product_id = $product->id;
			$saveCart->size = $size;
			$saveCart->color = $color;
			$saveCart->price = $request->price;
			$saveCart->quantity = $request->qty;
			$saveCart->sub_total = $sub_total;
			$saveCart->tax_amount = $tax_amount;
			$saveCart->total = $total;
		}

		if ($saveCart->save()) {
			return response()->json([
				'status' => 'success'
			]);
		}else{
			return response()->json([
				'status' => 'error'
			]);
		}
	}

	//=================================================================

	public function cart()
	{
		$data = [];
		$data['session_id'] = Session::getId();
		$data['result'] = Cart::where('session_id',$data['session_id'])->first();
		$data['results'] = Cart::where('session_id',$data['session_id'])->get();
		$data['sub_total'] = Cart::where('session_id',$data['session_id'])->sum('sub_total');
		$data['discount'] = Cart::where('session_id',$data['session_id'])->sum('coupon_amount');
		$tax = Tax::first();
		$fixed_shipping = Shipping::where('shipping_method','Fixed')->first();
		$free_shipping = Shipping::where('shipping_method','Free')->first();

		foreach ($data['results'] as $key => $value) {
			$product = Product::find($value->product_id);
			$checkCouponExist = DiscountCoupon::where('coupon_code',$value->coupon_code)->first();

			$sub_total = $value->quantity * $value->price;

			if (!empty($value->coupon_code)) {
				$coupon_code = $value->coupon_code;
				$coupon_amount = $sub_total * $checkCouponExist->discount / 100;
			}else{
				$coupon_code = '';
				$coupon_amount = '0';
			}

			$total = $sub_total - $coupon_amount;

			if ($tax->status == '1') {
				$tax_amount = $total * $tax->tax / 100;
			}else{
				$tax_amount = '0';
			}

			$gTotal = $total + $tax_amount;

			$saveCart = Cart::find($value->id);
			$saveCart->quantity = $value->quantity;
			$saveCart->sub_total = $sub_total;
			$saveCart->coupon_code = $coupon_code;
			$saveCart->coupon_amount = $coupon_amount;
			$saveCart->tax_amount = $tax_amount;
			$saveCart->total = $gTotal;
			$saveCart->save();
		}

		if ($data['sub_total'] >= $free_shipping->cart_amount) {
			$shipping_method = 'Free';
			$shipping_price = '0';
		}else{
			$shipping_method = 'Fixed';
			$shipping_price = $fixed_shipping->price;
		}

		Cart::where('session_id',$data['session_id'])->update([
			'shipping_method' => $shipping_method,
			'shipping_price' => $shipping_price
		]);
		$data['shipping_method'] = $shipping_method;
		$data['shipping_price'] = $shipping_price;

		$total_amount = Cart::where('session_id',$data['session_id'])->sum('total');

		$data['grand_total'] = $total_amount + $shipping_price;
	    
	    $data['tax_amount'] = Cart::where('session_id',$data['session_id'])->sum('tax_amount');

		return view('front.cart.index',$data);
	}

	//=================================================================

	public function updateCart(Request $request)
	{
		$data = $request->all();
	    $myValue=  array();
	    parse_str($data['form'], $myValue);

		$session_id = Session::getId();
		$tax = Tax::first();

		foreach ($myValue['id'] as $key => $id) {
			$product = Product::find($myValue['product_id'][$key]);
			$cartData = Cart::where('id',$id)->first();

			$sub_total = $myValue['quantity'][$key] * $cartData->price;
			if ($tax->status == '1') {
				$tax_amount = $sub_total * $tax->tax / 100;
			}else{
				$tax_amount = '0';
			}
			$total = $tax_amount + $sub_total;

			$saveCart = Cart::find($id);
			$saveCart->quantity = $myValue['quantity'][$key];
			$saveCart->sub_total = $sub_total;
			$saveCart->tax_amount = $tax_amount;
			$saveCart->total = $total;
			$saveCart->save();
		}

		return response()->json(['status' => 'success']);
	}

	//=================================================================

	public function removeCart($id)
	{
		Cart::where('id',$id)->delete();

		return response()->json(['status' => 'success']);
	}

	//=================================================================

	public function applyCoupon(Request $request)
	{
		$data = $request->all();
	    $myValue=  array();
	    parse_str($data['form'], $myValue);


	    $todayDate = date('Y-m-d');
	    $checkCouponExist = DiscountCoupon::where('coupon_code',$myValue['coupon'])
	    						->where('status','1')
	    						->where('valid_from','<=',$todayDate)
	    						->where('valid_to','>=',$todayDate)
	    						->first();
	    if (empty($checkCouponExist)) {
	    	return response()->json(['status' => 'invalid_coupon']);
	    }
		$tax = Tax::first();

		foreach ($myValue['id'] as $key => $id) {
			$product = Product::find($myValue['product_id'][$key]);

			$sub_total = $myValue['quantity'][$key] * $product->price;
			if ($tax->status == '1') {
				$tax_amount = $sub_total * $tax->tax / 100;
			}else{
				$tax_amount = '0';
			}
			$coupon_amount = $sub_total * $checkCouponExist->discount / 100;
			$total = ($tax_amount + $sub_total) - $coupon_amount;

			$saveCart = Cart::find($id);
			$saveCart->quantity = $myValue['quantity'][$key];
			$saveCart->sub_total = $sub_total;
			$saveCart->coupon_code = $myValue['coupon'];
			$saveCart->coupon_amount = $coupon_amount;
			$saveCart->tax_amount = $tax_amount;
			$saveCart->total = $total;
			$saveCart->save();
		}

		return response()->json(['status' => 'success']);
	}

	//=================================================================

	public function changeShippingMethod(Request $request)
	{
		$session_id = Session::getId();

		Cart::where('session_id',$session_id)->update([
			'shipping_method' => $request->shipping_method,
			'shipping_price' => $request->shipping_price
		]);

		return response()->json(['status' => 'success']);
	}

	//=================================================================

	public function checkout()
	{
		$data = [];
		$data['session_id'] = Session::getId();
		$data['result'] = Cart::where('session_id',$data['session_id'])->first();
		$data['results'] = Cart::where('session_id',$data['session_id'])->get();
		$data['sub_total'] = Cart::where('session_id',$data['session_id'])->sum('sub_total');
		$data['total'] = Cart::where('session_id',$data['session_id'])->sum('total');
		$data['discount'] = Cart::where('session_id',$data['session_id'])->sum('coupon_amount');
		$data['grand_total'] = $data['total'] + $data['result']->shipping_price;
		$data['counties'] = County::get();
		$data['tax_amount'] = Cart::where('session_id',$data['session_id'])->sum('tax_amount');

		return view('front.cart.checkout',$data);
	}

	//==================================================================

	public function stripePost(Request $request)
    {
    	// echo "<pre>";
     //    print_r($request->all());
     //    die;

        $session_id = Session::getId();

        $checkExistCustomer = Customer::where('phone',$request->phone)
        						->where('email',$request->email)
        						->first();

        if (!empty($checkExistCustomer)) {
        	$customer_id = $checkExistCustomer->id;

        	if (!empty($request->shipping_address) && $request->shipping_address == '1') {
        		$validator = Validator::make($request->all(), [
					'first_name1' => 'required',
					'last_name1' => 'required',
					'street_address1' => 'required',
					'town_city1' => 'required',
					'county1' => 'required',
				]);
				if ($validator->fails()) { 
				    session()->flash('message', 'Please fill all required fields for DIFFERENT ADDRESS!');
					Session::flash('alert-type', 'error'); 
					return back();
				} else {
					$shipping_address = new ShippingAddress;
		        	$shipping_address->customer_id = $customer_id;
		        	$shipping_address->first_name1 = $request->first_name1;
		        	$shipping_address->last_name1 = $request->last_name1;
		        	$shipping_address->company_name1 = $request->company_name1;
		        	$shipping_address->country1 = 'Ireland';
		        	$shipping_address->county1 = $request->county1;
		        	$shipping_address->street_address1 = $request->street_address1;
		        	$shipping_address->town_city1 = $request->town_city1 != '' ? $request->town_city1 : '';
		        	$shipping_address->eircode1 = $request->eircode1 != '' ? $request->eircode1 : '';
		        	$shipping_address->save();

		        	$shipping_address_id = $shipping_address->id;
				}
        	}else{
        		$shipping_address_id = '';
        	}
        }else{
        	$customer = new Customer;
        	$customer->first_name = $request->first_name;
        	$customer->last_name = $request->last_name;
        	$customer->company_name = $request->company_name;
        	$customer->country = 'Ireland';
        	$customer->county = $request->county;
        	$customer->street_address = $request->street_address;
        	$customer->town_city = $request->town_city != '' ? $request->town_city : '';
        	$customer->eircode = $request->eircode != '' ? $request->eircode : '';
        	$customer->phone = $request->phone;
        	$customer->email = $request->email;
        	$customer->save();

        	if (!empty($request->shipping_address) && $request->shipping_address == '1') {
        		$validator = Validator::make($request->all(), [
					'first_name1' => 'required',
					'last_name1' => 'required',
					'street_address1' => 'required',
					'town_city1' => 'required',
					'county1' => 'required',
				]);
				if ($validator->fails()) { 
		            session()->flash('message', 'Please fill all required fields!');
					Session::flash('alert-type', 'error'); 
					return back();
				} else {
					$shipping_address = new ShippingAddress;
		        	$shipping_address->customer_id = $customer->id;
		        	$shipping_address->first_name1 = $request->first_name1;
		        	$shipping_address->last_name1 = $request->last_name1;
		        	$shipping_address->company_name1 = $request->company_name1;
		        	$shipping_address->country1 = 'Ireland';
		        	$shipping_address->county1 = $request->county1;
		        	$shipping_address->street_address1 = $request->street_address1;
		        	$shipping_address->town_city1 = $request->town_city1 != '' ? $request->town_city1 : '';
		        	$shipping_address->eircode1 = $request->eircode1 != '' ? $request->eircode1 : '';
		        	$shipping_address->save();

		        	$shipping_address_id = $shipping_address->id;
				}
        	}else{
        		$shipping_address_id = '';
        	}
        	$customer_id = $customer->id;
        }

        $customerData = Customer::where('id',$customer_id)->first();
        //$bookingData = Booking::where('session_id',$request->session_id)->first();

        $address = $customerData->street_address.', '.$customerData->county.', '.$customerData->country;

        //============get form details
        $this->regis['first_name'] = $customerData->first_name;
        $this->regis['email'] = $customerData->email;
        $this->regis['phone'] = $customerData->phone;
        $this->regis['country'] = $customerData->country;
        $this->regis['city'] = $customerData->county;
        $this->regis['address'] = $address;
        //$this->regis['collect'] = $request->collect;
        Session::put('list', $this->regis); 

        //$vat = config('constants.vat');
        $total = $request->total_amount;

        Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));

         // Unique order ID 
        $orderId = strtoupper(str_replace('.','',uniqid('', true))); 

        //=======================================
        $charge = Stripe\Charge::create ([
            "amount" => $total * 100,
            //"currency" => "EUR",
            "currency" => "INR",
            "source" => $request->stripeToken,
            "description" => $request->notes,
            'metadata' => array( 
                'order_id' => $orderId,
                'email' => $customerData->email,
                'phone' => $customerData->phone,
                'name' => $customerData->first_name,
                'address' => $address
            )
        ]);

        // Retrieve charge details 
        $chargeJson = $charge->jsonSerialize();

        // Check whether the charge is successful 
        if($chargeJson['amount_refunded'] == 0 && empty($chargeJson['failure_code']) && $chargeJson['paid'] == 1 && $chargeJson['captured'] == 1){

	        // Order details  
	        $transactionID = $chargeJson['balance_transaction']; 
	        $paidAmount = $chargeJson['amount']; 
	        $paidCurrency = $chargeJson['currency']; 
	        $payment_status = $chargeJson['status'];

	        //=============================
	        if($charge['status'] == 'succeeded') {
	        	$cart_data = Cart::where('session_id',$session_id)->get();

	        	foreach ($cart_data as $key => $value) {
	        		$order = new Order;
	        		$order->customer_id = $customer_id;
	        		$order->shipping_address_id = $shipping_address_id;
	        		$order->session_id = $value->session_id;
	        		$order->order_id = $orderId;
	        		$order->cart_id = $value->cart_id;
	        		$order->product_id = $value->product_id;
	        		$order->size = $value->size;
	        		$order->color = $value->color;
	        		$order->price = $value->price;
	        		$order->quantity = $value->quantity;
	        		$order->sub_total = $value->sub_total;
	        		$order->coupon_code = $value->coupon_code;
	        		$order->coupon_amount = $value->coupon_amount;
	        		$order->shipping_method = $value->shipping_method;
	        		$order->shipping_price = $value->shipping_price;
	        		$order->tax_amount = $value->tax_amount;
	        		$order->total = $value->total;
	        		$order->g_total = $request->total_amount;
	        		$order->txn_id = $transactionID;
	        		$order->status = $payment_status;
	        		$order->notes = $request->notes;
	        		$order->save();

	        		$cart_id = $value->cart_id;
	        	}

	            Cart::where('session_id',$session_id)->delete();

	            $orders = Order::where('cart_id',$cart_id)->get();
	            if (!empty($shipping_address_id)) {
	            	$shipping_data = Shipping::find($shipping_address_id);
	            }else{
	            	$shipping_data = '';
	            }
	            $sub_total = Order::where('cart_id',$cart_id)->sum('sub_total');
				$discount = Order::where('cart_id',$cart_id)->sum('coupon_amount');

	            $setting = Setting::first();
				$data = array(
		            'customer' => $customerData,
		            'shipping_data' => $shipping_data,
		            'sub_total' => $sub_total,
		            'discount' => $discount,
		            'orders' => $orders,
		            'subject' => 'Order Placed - MG Hygiene.',
		            'admin_email' => $setting->email,
		            'title' => 'MG Hygiene::Order Placed'
	        	);
			
	        	Mail::send('front.emails.emailOrder', $data, function ($message) use ($data) {
		    		$message->from('focusedq@testdmcconsultancy.com', 'MG Hygiene');
					$message->to('vikas.nagar@commediait.com');
					$message->bcc($data['admin_email']);
		    		$message->subject('MG Hygiene::Order Placed');
	    		});

        		if (Mail::failures()) {
			       	session()->flash('message', 'Mail not sent!');
					Session::flash('alert-type', 'error'); 
					return redirect('contact_us');
		    	}

	            session()->flash('message', 'Order Placed, E-mail sent to your id Please check!');
	            Session::flash('alert-type', 'success');
	            return redirect('thankyou'.'/'.$cart_id);
         	}
        } else {
            session()->flash('message', 'Payment error!');
            Session::flash('alert-type', 'error');
            return redirect()->back();
     	}
    }


    //=================================================================

	public function thankyou($cart_id)
	{
		$data = [];
		$data['session_id'] = Session::getId();
		$data['result'] = Order::where('cart_id',$cart_id)->first();
		$data['results'] = Order::where('cart_id',$cart_id)->get();
		$data['sub_total'] = Order::where('cart_id',$cart_id)->sum('sub_total');
		$data['total'] = Order::where('cart_id',$cart_id)->sum('total');
		$data['discount'] = Order::where('cart_id',$cart_id)->sum('coupon_amount');
		$data['grand_total'] = $data['total'] + $data['result']->shipping_price;
		$data['tax_amount'] = Cart::where('session_id',$data['session_id'])->sum('tax_amount');

		return view('front.cart.thankyou',$data);
	}

}
