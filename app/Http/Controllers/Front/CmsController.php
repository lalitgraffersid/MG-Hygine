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
use Session;
use DB;
use Image;
use File;
use Illuminate\Support\Facades\Log;
use Exception;
use App\Models\AboutUs;
use App\Models\PrivacyPolicy;
use App\Models\RefundPolicy;
use App\Models\TermsCondition;
use App\Models\ShippingDeliveryPolicy;
use App\Models\OurEnvironment;
use App\Models\OurEnvironmentImage;

class CmsController extends Controller
{
    //====================================

	public function about_us()
	{
		$data = [];
		$data['result'] = AboutUs::first();

		return view('front/about_us/index',$data);
	}
	//====================================

	public function privacy_policy()
	{
		$data = [];
		$data['result'] = PrivacyPolicy::first();

		return view('front/privacy_policy/index',$data);
	}
	//====================================

	public function refund_policy()
	{
		$data = [];
		$data['result'] = RefundPolicy::first();

		return view('front/refund_policy/index',$data);
	}
	//====================================

	public function terms_conditions()
	{
		$data = [];
		$data['result'] = TermsCondition::first();

		return view('front/terms_conditions/index',$data);
	}
	//====================================

	public function shipping_delivery_policy()
	{
		$data = [];
		$data['result'] = ShippingDeliveryPolicy::first();

		return view('front/shipping_delivery_policy/index',$data);
	}
	//====================================

	public function our_environment()
	{
		$data = [];
		$data['result'] = OurEnvironment::first();
		$data['images'] = OurEnvironmentImage::get();

		return view('front/our_environment/index',$data);
	}
	//====================================

}
