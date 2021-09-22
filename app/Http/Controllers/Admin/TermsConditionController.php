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
use App\Models\TermsCondition;
use App\Models\AdminPermission;
use App\DataTables\TermsConditionDataTable;
use App\Helpers\AdminHelper;

class TermsConditionController extends Controller
{
    //=================================================================

	public function index(TermsConditionDataTable $dataTable)
	{
		return $dataTable->render('admin/terms_and_conditions/index');
	}

	//=================================================================

	public function edit($id)
	{
		$data = array();
		$data['result'] = TermsCondition::find($id);

		return view('admin/terms_and_conditions/edit',$data);
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
			            return redirect('admin/terms_and_conditions/edit/'.$request->id)
			                        ->withErrors($validator)
			                        ->withInput();
			} else {			        
		        $data = TermsCondition::find($request->id);
		        //=========================================================
		        $data->heading = $request->heading;
		        $data->description = $request->description;
		        $data->save();

				session()->flash('message', 'Terms and conditions updated successfully');
				Session::flash('alert-type', 'success'); 
				return redirect('admin/terms_and_conditions/index');
			}
		} catch (\Exception $e) {
	        Log::error($e->getMessage());
	        session()->flash('message', 'Some error occured during save Terms and conditions');
            Session::flash('alert-type', 'error');
           	return redirect('admin/terms_and_conditions/edit/'.$request->id);
        }
	}

    //===================================================

}
