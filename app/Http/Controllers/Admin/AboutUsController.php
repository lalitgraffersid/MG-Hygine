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
use App\Models\AboutUs;
use App\Models\AdminPermission;
use App\DataTables\AboutUsDataTable;
use App\Helpers\AdminHelper;

class AboutUsController extends Controller
{
    //=================================================================

	public function index(AboutUsDataTable $dataTable)
	{
		return $dataTable->render('admin/about_us/index');
	}

	//=================================================================

	public function edit($id)
	{
		$data = array();
		$data['result'] = AboutUs::find($id);

		return view('admin/about_us/edit',$data);
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
			            return redirect('admin/about_us/edit/'.$request->id)
			                        ->withErrors($validator)
			                        ->withInput();
			} else {			        
		        $data = AboutUs::find($request->id);
		        //=====================================================
		        $image = $request->file('image');
				if(!empty($image)) {
					$file1 = '/admin/clip-one/assets/about_us/'.$data->image;
        			File::delete($file1);

		        	$imagename = rand('1111','9999').'_'.time().'.'.$image->getClientOriginalExtension();
					$destinationPath = public_path('/admin/clip-one/assets/about_us');
			        $image->move($destinationPath, $imagename);

			        $source_url = public_path().'/admin/clip-one/assets/about_us/'.$imagename;
        			$destination_url = public_path().'/admin/clip-one/assets/about_us/'.$imagename;
        			$quality = 40;
        			AdminHelper::compress_image($source_url, $destination_url, $quality);
        		}else{
        			$imagename = $data->image;
        		}
		        //=====================================================
		        $data->heading = $request->heading;
		        $data->description = $request->description;
		        $data->image = $imagename;
		        $data->save();

				session()->flash('message', 'AboutUs updated successfully');
				Session::flash('alert-type', 'success'); 
				return redirect('admin/about_us/index');
			}
		} catch (\Exception $e) {
	        Log::error($e->getMessage());
	        session()->flash('message', 'Some error occured during save AboutUs');
            Session::flash('alert-type', 'error');
           	return redirect('admin/about_us/edit/'.$request->id);
        }
	}

    //===================================================

}
