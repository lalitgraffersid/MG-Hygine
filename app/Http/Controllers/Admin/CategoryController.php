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
use App\Models\Brand;
use App\Models\Category;
use App\Models\AdminPermission;
use App\DataTables\CategoryDataTable;
use App\Helpers\AdminHelper;

class CategoryController extends Controller
{
    //=================================================================

	public function index(CategoryDataTable $dataTable)
	{
		return $dataTable->render('admin/categories/index');
	}

	//=================================================================

	public function add()
	{
		$data = [];
		$data['brands'] = Brand::where('status','1')->get();

		return view('admin/categories/add',$data);
	}

	//=================================================================

	public function save(Request $request)
	{
		try {
			$validator = Validator::make($request->all(), [
				'brand_id' => 'required',
				'title' => 'required',
			]);
			if ($validator->fails()) { 
			            return redirect('admin/categories/add')
			                        ->withErrors($validator)
			                        ->withInput();
			} else {			        
		        $data = new Category;
		        $data->brand_id = $request->brand_id;
		        $data->title = $request->title;
		        $data->save();

				session()->flash('message', 'Category added successfully');
				Session::flash('alert-type', 'success'); 
				return redirect('admin/categories/index');
			}
		} catch (\Exception $e) {
	        Log::error($e->getMessage());
	        session()->flash('message', 'Some error occured during save Category');
            Session::flash('alert-type', 'error');
           	return redirect('admin/categories/add');
        }
	}

	//=================================================================

	public function edit($id)
	{
		$data = array();
		$data['result'] = Category::find($id);
		$data['brands'] = Brand::where('status','1')->get();

		return view('admin/categories/edit',$data);
	}

	//=================================================================

	public function update(Request $request)
	{
		try {
			$validator = Validator::make($request->all(), [
				'brand_id' => 'required',
				'title' => 'required',
			]);
			if ($validator->fails()) { 
			            return redirect('admin/categories/edit/'.$request->id)
			                        ->withErrors($validator)
			                        ->withInput();
			} else {			        
		        $data = Category::find($request->id);
		        $data->brand_id = $request->brand_id;
		        $data->title = $request->title;
		        $data->save();

				session()->flash('message', 'Category updated successfully');
				Session::flash('alert-type', 'success'); 
				return redirect('admin/categories/index');
			}
		} catch (\Exception $e) {
	        Log::error($e->getMessage());
	        session()->flash('message', 'Some error occured during save Category');
            Session::flash('alert-type', 'error');
           	return redirect('admin/categories/edit/'.$request->id);
        }
	}

	//=================================================================

	public function delete($id){
		
		try {
			Category::find($id)->delete();
		
			session()->flash('message', 'Category deleted successfully');
	        Session::flash('alert-type', 'success');

	        return redirect('admin/categories/index');
	    } catch (\Exception $e) {
            Log::error($e->getMessage());
		    session()->flash('message', 'Some error occured');
            Session::flash('alert-type', 'error');

          	return redirect('admin/categories/index');
        }
    }

    //===================================================
	
	public function status(Request $request, $id){
		
		try {
			
			$data = Category::find($id);
			
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
			
		
			session()->flash('message', 'Category status update successfully');
	        Session::flash('alert-type', 'success');
	        return redirect('admin/categories/index');
	    } catch (\Exception $e) {
            Log::error($e->getMessage());
		    session()->flash('message', 'Some error occured during status update');
            Session::flash('alert-type', 'error');
          return redirect('admin/categories/index');
        }
    }

    //===================================================

}
