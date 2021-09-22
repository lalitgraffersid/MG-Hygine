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
use App\Models\OurEnvironment;
use App\Models\OurEnvironmentImage;
use App\Models\AdminPermission;
use App\DataTables\OurEnvironmentDataTable;
use App\Helpers\AdminHelper;

class OurEnvironmentController extends Controller
{
    //=================================================================

	public function index(OurEnvironmentDataTable $dataTable)
	{
		return $dataTable->render('admin/our_environment/index');
	}

	//=================================================================

	public function edit($id)
	{
		$data = array();
		$data['result'] = OurEnvironment::find($id);
		$data['images'] = OurEnvironmentImage::where('our_environment_id',$id)->get();

		return view('admin/our_environment/edit',$data);
	}

	//=================================================================

	public function update(Request $request)
	{
		try {
			$validator = Validator::make($request->all(), [
				'heading' => 'required',
				'description' => 'required',
			]);
			if ($validator->fails()) { 
			            return redirect('admin/our_environment/edit/'.$request->id)
			                        ->withErrors($validator)
			                        ->withInput();
			} else {			        
		        $data = OurEnvironment::find($request->id);
		        //=========================================================
		        $images = $request->file('image');
				if(!empty($images)) {
					foreach ($images as $key => $image) {
			        	$imagename = rand('1111','9999').'_'.time().'.'.$image->getClientOriginalExtension();
			        	$destinationPath = public_path('/admin/clip-one/assets/our_environment/thumbnail');
		        
				        $img = Image::make($image->getRealPath());

				        $img->resize(100, 100, function ($constraint) {
						    $constraint->aspectRatio();
						})->save($destinationPath.'/'.$imagename);

						$destinationPath = public_path('/admin/clip-one/assets/our_environment/original');
				        $image->move($destinationPath, $imagename);

				        $source_url = public_path().'/admin/clip-one/assets/our_environment/original/'.$imagename;
	        			$destination_url = public_path().'/admin/clip-one/assets/our_environment/original/'.$imagename;
	        			$quality = 40;
	        			AdminHelper::compress_image($source_url, $destination_url, $quality);

	        			$environmentImages = new OurEnvironmentImage;
	        			$environmentImages->our_environment_id = $request->id;
	        			$environmentImages->image = $imagename;
	        			$environmentImages->save();
					}
				}

		        $data->heading = $request->heading;
		        $data->description = $request->description;
		        $data->save();

				session()->flash('message', 'Our Environment page updated successfully');
				Session::flash('alert-type', 'success'); 
				return redirect('admin/our_environment/index');
			}
		} catch (\Exception $e) {
	        Log::error($e->getMessage());
	        session()->flash('message', 'Some error occured during save Our Environment page');
            Session::flash('alert-type', 'error');
           	return redirect('admin/our_environment/edit/'.$request->id);
        }
	}

    //===================================================

    //===================================================

    public function imageDelete($id){
		
		try {
			$data = OurEnvironmentImage::find($id);

			$file1 = public_path().'/admin/clip-one/assets/our_environment/thumbnail/'.$data->image;
			$file2 = public_path().'/admin/clip-one/assets/our_environment/original/'.$data->image;
			File::delete($file1, $file2);

			$delete = OurEnvironmentImage::where('id',$id)->delete();
		
			return response()->json(['msg'=>'success']);
	    } catch (\Exception $e) {
            Log::error($e->getMessage());
		    return response()->json(['msg'=>'error']);
        }
    }

}
