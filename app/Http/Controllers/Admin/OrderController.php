<?php
namespace App\Http\Controllers\Admin;

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
use App\Models\Customer;
use App\Models\Product;
use App\Models\Order;
use App\Models\Shipping;
use App\Models\AdminPermission;
use App\DataTables\OrderDataTable;
use App\Helpers\AdminHelper;

class OrderController extends Controller
{
    //=================================================================

	public function index(OrderDataTable $dataTable)
	{
		return $dataTable->render('admin/orders/index');
	}

	

	//=================================================================

	public function view($cart_id)
	{
		$data = [];
		$data['session_id'] = Session::getId();
		$data['result'] = Order::where('cart_id',$cart_id)->first();
		$data['customer'] = Customer::where('id',$data['result']->customer_id)->first();
		$data['results'] = Order::where('cart_id',$cart_id)->get();
		$data['sub_total'] = Order::where('cart_id',$cart_id)->sum('sub_total');
		$data['total'] = Order::where('cart_id',$cart_id)->sum('total');
		$data['discount'] = Order::where('cart_id',$cart_id)->sum('coupon_amount');
		$data['grand_total'] = $data['total'] + $data['result']->shipping_price;
		$data['discount'] = Order::where('cart_id',$cart_id)->sum('coupon_amount');

		if (!empty($data['result']->shipping_address_id)) {
			$shipping_address = Shipping::find($data['result']->shipping_address_id);
		}else{
			$shipping_address = '';
		}

		$data['shipping_address'] = $data['customer'];

		return view('admin/orders/view',$data);
	}

}
