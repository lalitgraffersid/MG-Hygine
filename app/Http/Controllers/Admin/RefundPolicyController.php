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
use App\Models\RefundPolicy;
use App\Models\AdminPermission;
use App\DataTables\RefundPolicyDataTable;
use App\Helpers\AdminHelper;

class RefundPolicyController extends Controller
{
    //=================================================================

	public function index(RefundPolicyDataTable $dataTable)
	{
		return $dataTable->render('admin/refund_policy/index');
	}

	//=================================================================

	public function edit($id)
	{
		$data = array();
		$data['result'] = RefundPolicy::find($id);

		return view('admin/refund_policy/edit',$data);
	}

	//=================================================================

	public function update(Request $request)
	{
		try {
			$validator = Validator::make($request->all(), [
				'heading' => 'required',
				'description' => 'required'
			]);
			if ($validator->fails()) { 
			            return redirect('admin/refund_policy/edit/'.$request->id)
			                        ->withErrors($validator)
			                        ->withInput();
			} else {			        
		        $data = RefundPolicy::find($request->id);
		        //=========================================================
		        $data->heading = $request->heading;
		        $data->description = $request->description;
		        $data->save();

				session()->flash('message', 'Refund Policy updated successfully');
				Session::flash('alert-type', 'success'); 
				return redirect('admin/refund_policy/index');
			}
		} catch (\Exception $e) {
	        Log::error($e->getMessage());
	        session()->flash('message', 'Some error occured during save Refund Policy');
            Session::flash('alert-type', 'error');
           	return redirect('admin/refund_policy/edit/'.$request->id);
        }
	}

    //=================================================================

}
