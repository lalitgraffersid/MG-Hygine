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
use App\Models\DiscountCoupon;
use App\Models\AdminPermission;
use App\DataTables\DiscountCouponDataTable;
use App\Helpers\AdminHelper;

class DiscountCouponController extends Controller
{
    //=================================================================

	public function index(DiscountCouponDataTable $dataTable)
	{
		return $dataTable->render('admin/discount_coupon/index');
	}

	//=================================================================

	public function add()
	{
		$data = [];
		$data['coupon_code'] = AdminHelper::generate_coupon_code(6);

		return view('admin/discount_coupon/add',$data);
	}

	//=================================================================

	public function save(Request $request)
	{
		try {
			$validator = Validator::make($request->all(), [
				'title' => 'required',
				'coupon_code' => 'required',
				'discount' => 'required',
				'users_limit' => 'required',
				'valid_from' => 'required',
				'valid_to' => 'required',
			]);
			if ($validator->fails()) { 
	            return redirect('admin/discount_coupon/add')
	                        ->withErrors($validator)
	                        ->withInput();
			} else {			        
		        $data = new DiscountCoupon;
		        //=========================================================
		        $data->title = $request->title;
		        $data->coupon_code = $request->coupon_code;
		        $data->discount = $request->discount;
		        $data->users_limit = $request->users_limit;
		        $data->valid_from = $request->valid_from;
		        $data->valid_to = $request->valid_to;
		        $data->save();

				session()->flash('message', 'Discount Coupon added successfully');
				Session::flash('alert-type', 'success'); 
				return redirect('admin/discount_coupon/index');
			}
		} catch (\Exception $e) {
	        Log::error($e->getMessage());
	        session()->flash('message', 'Some error occured during save Discount Coupon');
            Session::flash('alert-type', 'error');
           	return redirect('admin/discount_coupon/add');
        }
	}

	//=================================================================

	public function edit($id)
	{
		$data = array();
		$data['result'] = DiscountCoupon::find($id);

		return view('admin/discount_coupon/edit',$data);
	}

	//=================================================================

	public function update(Request $request)
	{
		try {
			$validator = Validator::make($request->all(), [
				'title' => 'required',
				'coupon_code' => 'required',
				'discount' => 'required',
				'users_limit' => 'required',
				'valid_from' => 'required',
				'valid_to' => 'required',
			]);
			if ($validator->fails()) { 
	            return redirect('admin/discount_coupon/edit/'.$request->id)
	                        ->withErrors($validator)
	                        ->withInput();
			} else {			        
		        $data = DiscountCoupon::find($request->id);
		        //=========================================================
		        $data->title = $request->title;
		        $data->coupon_code = $request->coupon_code;
		        $data->discount = $request->discount;
		        $data->users_limit = $request->users_limit;
		        $data->valid_from = $request->valid_from;
		        $data->valid_to = $request->valid_to;
		        $data->save();

				session()->flash('message', 'Discount Coupon updated successfully');
				Session::flash('alert-type', 'success'); 
				return redirect('admin/discount_coupon/index');
			}
		} catch (\Exception $e) {
	        Log::error($e->getMessage());
	        session()->flash('message', 'Some error occured during save Discount Coupon');
            Session::flash('alert-type', 'error');
           	return redirect('admin/discount_coupon/edit/'.$request->id);
        }
	}

	//=================================================================

	public function delete($id){
		
		try {
			$delete = DiscountCoupon::where('id',$id)->delete();
		
			session()->flash('message', 'Discount Coupon deleted successfully');
	        Session::flash('alert-type', 'success');

	        return redirect('admin/discount_coupon/index');
	    } catch (\Exception $e) {
            Log::error($e->getMessage());
		    session()->flash('message', 'Some error occured');
            Session::flash('alert-type', 'error');

          	return redirect('admin/discount_coupon/index');
        }
    }

    //===================================================
	
	public function status(Request $request, $id){
		
		try {
			
			$User = DiscountCoupon::find($id);
			
			if($User->status == '1')
			{
				$status = '0';
			} 
			else 
			{
				$status = '1';
			}
			$User->status = $status;
			$User->save();
			
		
			session()->flash('message', 'Discount Coupon status updated successfully');
	        Session::flash('alert-type', 'success');
	        return redirect('admin/discount_coupon/index');
	    } catch (\Exception $e) {
            Log::error($e->getMessage());
		    session()->flash('message', 'Some error occured during status update');
            Session::flash('alert-type', 'error');
          return redirect('admin/discount_coupon/index');
        }
    }

    //===================================================

}
