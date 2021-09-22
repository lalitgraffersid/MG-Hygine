<?php
namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;

use Auth;
use Cookie;
use Illuminate\Http\Request;
use Validator;
use Input;
use App\Models\User;
use App\Models\Setting;
use App\Models\Brand;
use Session;
use DB;
use Image;
use File;
use Illuminate\Support\Facades\Log;
use Exception;

class HomeController extends Controller
{
    //====================================

	public function index()
	{
		$data = array();
		$data['results'] = Brand::where('status','1')->paginate(6);

		return view('front/home/index',$data);
	}
	//====================================



}
