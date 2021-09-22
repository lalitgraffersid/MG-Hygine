<?php
namespace App\Http\Controllers\Front;

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
use Response;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductImage;

class ProductController extends Controller
{
	//=================================================================

	public function our_brands()
	{
		$data = array();
		$data['results'] = Brand::where('status','1')->paginate(6);

		return view('front/products/our_brands',$data);
	}

    //=================================================================

	public function products($brand_slug,$cat_id='')
	{
		$data = array();
		$data['brand_slug'] = $brand_slug;
		$data['cat_id'] = $cat_id;
		$brand = Brand::where('brand_slug',$brand_slug)->first();
		$data['brands'] = Brand::where('status','1')->get();

		if (!empty($cat_id)) {
			$data['results'] = Product::where('brand_id',$brand->id)
								->where('category_id',$cat_id)
								->where('status','1')
								->select('id','brand_id','title','title_slug','price','description','image','status','variants','sizes','colors','prices')
            					->paginate(9);
		}else{
			$data['results'] = Product::where('brand_id',$brand->id)
								->where('status','1')
								->select('id','brand_id','title','title_slug','price','description','image','status','variants','sizes','colors','prices')
            					->paginate(9);
		}

		return view('front/products/products',$data);
	}

	//=================================================================

	public function productDetails($id)
	{
		$data = array();
		$data['result'] = Product::where('id',$id)->first();
		if (!empty($data['result']->sizes)) {
			$data['sizes'] = explode(',', $data['result']->sizes);
			$data['colors'] = explode(',', $data['result']->colors);
		}else{
			$data['sizes'] = '';
			$data['colors'] = '';
		}
		$data['images'] = ProductImage::where('product_id',$id)->get();
		$data['related_products'] = Product::where('brand_id',$data['result']->brand_id)
											->where('id','!=',$data['result']->id)
											->take(6)
											->get();

		return view('front/products/productDetails',$data);
	}

	//=================================================================

	public function getPrice(Request $request)
    {
        $product = Product::find($request['id']);
        $sizes = explode(',', $product->sizes);
        $colors = explode(',', $product->colors);
        $prices = explode(',', $product->prices);
        
        $size = $sizes[$request['sizes_key']];
        $color = $colors[$request['sizes_key']];
        $price = $prices[$request['sizes_key']];

        if (!empty($price)) {
            return Response::json([
                'msg'=>'success',
                'size'=>$size,
                'color'=>$color,
                'price'=>$price,
            ]);
        }else{
            return Response::json([
                'msg'=>'error'
            ]);
        }
    }

}
