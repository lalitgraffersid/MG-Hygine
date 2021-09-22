<?php
namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Auth;
use Cookie;
use Illuminate\Http\Request;
use Validator;
use Input;
use Session;
use DB;
use Image;
use File;
use Mail;
use Illuminate\Support\Facades\Log;
use Exception;
use App\Models\Contact;
use App\Models\Setting;

class ContactController extends Controller
{
	//====================================

	public function contact_us()
	{
		$data = [];
		$data['settings'] = Setting::first();

		return view('front/contact_us',$data);
	}

	//====================================

	public function contactSave(Request $request)
	{
		try {
			$validator = Validator::make($request->all(), [
				'name'       => 'required',
				'email'      => 'required',
				'phone' 	 => 'required',
				'comment' 	 => 'required',
				'captcha' 	 => 'required|captcha'
			]);
			if ($validator->fails()) { 	
	            return redirect('contact_us')
	                        ->withErrors($validator)
	                        ->withInput();
			} else { 		        
	        	$contact = new Contact;
		        $contact->name = $request->name;
		        $contact->email = $request->email;
		        $contact->phone = $request->phone;
		        $contact->comment = $request->comment;
	        	$contact->save();

	        	$setting = Setting::first();
	        
				$data = array(
		            'name' => $request->name,
		            'email' => $request->email,
		            'phone' => $request->phone,
		            'subject' => 'MG Hygiene Contact Us Form Submission',
		            'comment' => $request->comment,
		            'admin_email' => $setting->email,
		            'title' => 'MG Hygiene::Contact'
	        	);
			
	        	Mail::send('front.emails.emailContact', $data, function ($message) use ($data) {
		    		$message->from('focusedq@testdmcconsultancy.com', 'MG Hygiene Contact');
					$message->to($data['admin_email']);
		    		$message->subject('MG Hygiene::Contact!');
	    		});

        		if (Mail::failures()) {
			       	session()->flash('message', 'Mail not sent!');
					Session::flash('alert-type', 'error'); 
					return redirect('contact_us');
		    	}

	        	//==== end mail script ======
				session()->flash('message', 'Thank you, Mail sent successfully.');
				Session::flash('alert-type', 'success'); 
				return redirect('contact_us');
			}
		} catch (\Exception $e) {
	        Log::error($e->getMessage());
	        session()->flash('message', 'Some error occured during mail sent');
            Session::flash('alert-type', 'error');
           	return redirect('contact_us');  
        }
	}
	
	//====================================


	public function refreshCaptcha()
    {
        return response()->json([
            'captcha'=> captcha_img('flat')
        ]);
    }


}
