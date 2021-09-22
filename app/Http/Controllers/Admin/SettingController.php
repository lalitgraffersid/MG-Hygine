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
use App\Models\Setting;
use App\Models\AdminPermission;
use App\Helpers\AdminHelper;

class SettingController extends Controller
{
    //=================================================================

	public function index()
	{
		$data = array();
		$data['result'] = Setting::first();

		return view('admin/setting/index',$data);
	}

	//=================================================================

	public function update(Request $request)
	{
		try {
			$validator = Validator::make($request->all(), [
				'phone' => 'required',
				'email' => 'required',
				'address' => 'required',
			]);
			if ($validator->fails()) { 
			            return redirect('admin/setting/index')
			                        ->withErrors($validator)
			                        ->withInput();
			} else {			        
		        $data = Setting::find($request->id);
		        //=========================================================
		        $data->phone = $request->phone;
		        $data->email = $request->email;
		        $data->address = $request->address;
		        $data->save();

				session()->flash('message', 'Setting updated successfully');
				Session::flash('alert-type', 'success'); 
				return redirect('admin/setting/index');
			}
		} catch (\Exception $e) {
	        Log::error($e->getMessage());
	        session()->flash('message', 'Some error occured during save setting');
            Session::flash('alert-type', 'error');
           	return redirect('admin/setting/index');
        }
	}

	//=================================================================

}
