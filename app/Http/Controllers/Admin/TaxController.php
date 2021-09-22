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
use App\Models\Tax;
use App\Models\AdminPermission;
use App\DataTables\TaxDataTable;
use App\Helpers\AdminHelper;

class TaxController extends Controller
{
    //=================================================================

	public function index(TaxDataTable $dataTable)
	{
		return $dataTable->render('admin/tax/index');
	}

	//=================================================================

	public function edit($id)
	{
		$data = array();
		$data['result'] = Tax::find($id);

		return view('admin/tax/edit',$data);
	}

	//=================================================================

	public function update(Request $request)
	{
		try {
			$validator = Validator::make($request->all(), [
				'tax' => 'required',
			]);
			if ($validator->fails()) { 
	            return redirect('admin/tax/edit'.'/'.$request->id)
	                        ->withErrors($validator)
	                        ->withInput();
			} else {
		        $data = Tax::find($request->id);
		        //=========================================================
		        $data->tax = $request->tax;
		        $data->save();

				session()->flash('message', 'Tax updated successfully');
				Session::flash('alert-type', 'success'); 
				return redirect('admin/tax/index');
			}
		} catch (\Exception $e) {
	        Log::error($e->getMessage());
	        session()->flash('message', 'Some error occured during update Tax');
            Session::flash('alert-type', 'error');
           	return redirect('admin/tax/edit'.'/'.$request->id);
        }
	}

	//=================================================================

	public function status(Request $request, $id){
		
		try {
			
			$data = Tax::find($id);
			
			if($data->status == '1')
			{
				$status = '0';
			} 
			else 
			{
				$status = '1';
			}
			$data->status = $status;
			$data->save();
			
		
			session()->flash('message', 'Tax status update successfully');
	        Session::flash('alert-type', 'success');
	        return redirect('admin/tax/index');
	    } catch (\Exception $e) {
            Log::error($e->getMessage());
		    session()->flash('message', 'Some error occured during status update');
            Session::flash('alert-type', 'error');
          return redirect('admin/tax/index');
        }
    }

    //===================================================

}
