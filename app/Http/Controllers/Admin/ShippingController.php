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
use App\Models\Category;
use App\Models\Shipping;
use App\Models\AdminPermission;
use App\DataTables\ShippingDataTable;
use App\Helpers\AdminHelper;

class ShippingController extends Controller
{
    //=================================================================

	public function index(ShippingDataTable $dataTable)
	{
		return $dataTable->render('admin/shipping/index');
	}

	//=================================================================

	public function add()
	{
		return view('admin/shipping/add');
	}

	//=================================================================

	public function save(Request $request)
	{
		try {
			$validator = Validator::make($request->all(), [
				'shipping_method' => 'required',
				'cart_amount' => 'required',
				'price' => 'required',
			]);
			if ($validator->fails()) { 
	            return redirect('admin/shipping/add')
	                        ->withErrors($validator)
	                        ->withInput();
			} else {
		        $data = new Shipping;
				//=========================================================
		        $data->shipping_method = $request->shipping_method;
		        $data->cart_amount = $request->cart_amount;
		        $data->price = $request->price;
		        $data->save();

				session()->flash('message', 'Shipping added successfully');
				Session::flash('alert-type', 'success'); 
				return redirect('admin/shipping/index');
			}
		} catch (\Exception $e) {
	        Log::error($e->getMessage());
	        session()->flash('message', 'Some error occured during save Shipping');
            Session::flash('alert-type', 'error');
           	return redirect('admin/shipping/add');
        }
	}

	//=================================================================

	public function edit($id)
	{
		$data = array();
		$data['result'] = Shipping::find($id);

		return view('admin/shipping/edit',$data);
	}

	//=================================================================

	public function update(Request $request)
	{
		try {
			$validator = Validator::make($request->all(), [
				'shipping_method' => 'required',
				'cart_amount' => 'required',
				'price' => 'required',
			]);
			if ($validator->fails()) { 
	            return redirect('admin/shipping/edit'.'/'.$request->id)
	                        ->withErrors($validator)
	                        ->withInput();
			} else {
		        $data = Shipping::find($request->id);
		        //=========================================================
		        $data->shipping_method = $request->shipping_method;
		        $data->cart_amount = $request->cart_amount;
		        $data->price = $request->price;
		        $data->save();

				session()->flash('message', 'Shipping updated successfully');
				Session::flash('alert-type', 'success'); 
				return redirect('admin/shipping/index');
			}
		} catch (\Exception $e) {
	        Log::error($e->getMessage());
	        session()->flash('message', 'Some error occured during update Shipping');
            Session::flash('alert-type', 'error');
           	return redirect('admin/shipping/edit'.'/'.$request->id);
        }
	}

	//=================================================================

}
