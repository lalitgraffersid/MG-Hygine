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
use App\Models\CartLimit;
use App\Models\AdminPermission;
use App\DataTables\CartLimitDataTable;
use App\Helpers\AdminHelper;

class CartLimitController extends Controller
{
    //=================================================================

	public function index(CartLimitDataTable $dataTable)
	{
		return $dataTable->render('admin/cart_limit/index');
	}

	//=================================================================

	public function edit($id)
	{
		$data = array();
		$data['result'] = CartLimit::find($id);
		$data['categories'] = Category::where('status','1')->get();

		return view('admin/cart_limit/edit',$data);
	}

	//=================================================================

	public function update(Request $request)
	{
		try {
			$validator = Validator::make($request->all(), [
				'category_id' => 'required',
				'minimum' => 'required',
			]);
			if ($validator->fails()) { 
	            return redirect('admin/cart_limit/edit'.'/'.$request->id)
	                        ->withErrors($validator)
	                        ->withInput();
			} else {
		        $data = CartLimit::find($request->id);
		        //=========================================================
		        $data->category_id = $request->category_id;
		        $data->minimum = $request->minimum;
		        $data->save();

				session()->flash('message', 'Cart Limit updated successfully');
				Session::flash('alert-type', 'success'); 
				return redirect('admin/cart_limit/index');
			}
		} catch (\Exception $e) {
	        Log::error($e->getMessage());
	        session()->flash('message', 'Some error occured during update Cart Limit');
            Session::flash('alert-type', 'error');
           	return redirect('admin/cart_limit/edit'.'/'.$request->id);
        }
	}

	//=================================================================

}
