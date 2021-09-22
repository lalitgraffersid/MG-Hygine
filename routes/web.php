<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Route::get('/', function () {
  //  return view('welcome');
//});

//Auth::routes();

if(version_compare(PHP_VERSION, '7.2.0', '>=')) {
    error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING);
}


Route::get('/clear-cache', function() {
    Artisan::call('cache:clear');
    return "Cache is cleared";
});


Route::get('/admin', array('as'=>'admin.login','uses' => 'Admin\LoginController@index'));
Route::POST('/admin/dologin', 'Admin\LoginController@postLogin');

Route::group(['prefix'=> 'admin','middleware' => ['auth']] , function(){
	Route::get('dashboard', ['as'=>'admin.dashboard', 'uses'=>'Admin\DashboardController@index']);
	Route::get('/logout', ['as'=>'admin.logout', 'uses'=>'Admin\LoginController@getLogout']);
});

Route::group(['prefix'=> 'admin','middleware' => ['auth','UserRole']] , function(){
	Route::get('setting/index', ['as'=>'setting.index', 'uses'=>'Admin\SettingController@index']);
    Route::POST('setting/update', ['as'=>'setting.update', 'uses'=>'Admin\SettingController@update']);

	/*actions Start*/
	Route::get('actions/index',['as'=>'actions.index','uses'=>'Admin\ModulesController@index']);
	Route::get('actions/add',['as'=>'actions.add','uses'=>'Admin\ModulesController@actionsAdd']);
	Route::POST('actions/save',['as'=>'actions.save','uses'=>'Admin\ModulesController@actionsSave']);
	Route::get('actions/edit/{id}',['as'=>'actions.edit','uses'=>'Admin\ModulesController@edit']);
	Route::POST('actions/update',['as'=>'actions.update','uses'=>'Admin\ModulesController@update']);
	Route::get('actions/delete/{id}',['as'=>'actions.delete','uses'=>'Admin\ModulesController@delete']);
	/*actions End*/

	/*Section Start*/
	Route::get('sections/index',['as'=>'sections.index','uses'=>'Admin\ModulesController@sectionsList']);
	Route::get('sections/add',['as'=>'sections.add','uses'=>'Admin\ModulesController@sectionsAdd']);
	Route::POST('sections/save',['as'=>'sections.save','uses'=>'Admin\ModulesController@sectionsSave']);
	Route::get('sections/edit/{id}',['as'=>'sections.edit','uses'=>'Admin\ModulesController@sectionsEdit']);
	Route::POST('sections/update',['as'=>'sections.update','uses'=>'Admin\ModulesController@sectionsUpdate']);
	Route::get('sections/delete/{id}',['as'=>'sections.delete','uses'=>'Admin\ModulesController@sectionsDelete']);
	/*Section End*/

	/*Roles Start*/
	Route::get('roles/index',['as'=>'roles.index','uses'=>'Admin\ModulesController@rolesList']);
	Route::get('roles/add',['as'=>'roles.add','uses'=>'Admin\ModulesController@rolesAdd']);
	Route::POST('roles/save',['as'=>'roles.save','uses'=>'Admin\ModulesController@rolesSave']);
	Route::get('roles/edit/{id}',['as'=>'roles.edit','uses'=>'Admin\ModulesController@rolesEdit']);
	Route::POST('roles/update',['as'=>'roles.update','uses'=>'Admin\ModulesController@rolesUpdate']);
	Route::get('roles/delete/{id}',['as'=>'roles.delete','uses'=>'Admin\ModulesController@rolesDelete']);
	/*Roles End*/

  	/// Admin User ////
    Route::get('users/index', ['as'=>'users.index',  'uses'=>'Admin\UserController@index']);
    Route::get('users/add', ['as'=>'users.add', 'uses'=>'Admin\UserController@add']);
    Route::POST('users/save', ['as'=>'users.save', 'uses'=>'Admin\UserController@save']);
    Route::get('users/edit/{id}', ['as'=>'users.edit', 'uses'=>'Admin\UserController@edit']);
    Route::POST('users/update', ['as'=>'users.update', 'uses'=>'Admin\UserController@update']);
    Route::get('users/delete/{id}', ['as'=>'users.delete', 'uses'=>'Admin\UserController@delete']);
    Route::get('users/view/{id}', ['as'=>'users.view', 'uses'=>'Admin\UserController@view']);
    Route::get('users/password/{id}', ['as'=>'users.password', 'uses'=>'Admin\UserController@reset_password']);
    Route::POST('users/password/save', ['as'=>'users.password.save', 'uses'=>'Admin\UserController@savePassword']);
    Route::get('users/status/{id}', ['as'=>'users.status', 'uses'=>'Admin\UserController@status']);
    Route::get('users/view/{id}', ['as'=>'users.view', 'uses'=>'Admin\UserController@view']);
     //end users //


    /// Brands ////
    Route::get('brands/index', ['as'=>'brands.index',  'uses'=>'Admin\BrandController@index']);
    Route::get('brands/add', ['as'=>'brands.add',  'uses'=>'Admin\BrandController@add']);
    Route::POST('brands/save', ['as'=>'brands.save',  'uses'=>'Admin\BrandController@save']);
    Route::get('brands/edit/{id}', ['as'=>'brands.edit', 'uses'=>'Admin\BrandController@edit']);
    Route::POST('brands/update', ['as'=>'brands.update', 'uses'=>'Admin\BrandController@update']);
    Route::get('brands/delete/{id}', ['as'=>'brands.delete', 'uses'=>'Admin\BrandController@delete']);
    Route::get('brands/status/{id}', ['as'=>'brands.status', 'uses'=>'Admin\BrandController@status']);

    /// Categories ////
    Route::get('categories/index', ['as'=>'categories.index',  'uses'=>'Admin\CategoryController@index']);
    Route::get('categories/add', ['as'=>'categories.add',  'uses'=>'Admin\CategoryController@add']);
    Route::POST('categories/save', ['as'=>'categories.save',  'uses'=>'Admin\CategoryController@save']);
    Route::get('categories/edit/{id}', ['as'=>'categories.edit', 'uses'=>'Admin\CategoryController@edit']);
    Route::POST('categories/update', ['as'=>'categories.update', 'uses'=>'Admin\CategoryController@update']);
    Route::get('categories/delete/{id}', ['as'=>'categories.delete', 'uses'=>'Admin\CategoryController@delete']);
    Route::get('categories/status/{id}', ['as'=>'categories.status', 'uses'=>'Admin\CategoryController@status']);

    /// products ////
    Route::get('products/index', ['as'=>'products.index',  'uses'=>'Admin\ProductController@index']);
    Route::get('products/add', ['as'=>'products.add',  'uses'=>'Admin\ProductController@add']);
    Route::POST('products/save', ['as'=>'products.save',  'uses'=>'Admin\ProductController@save']);
    Route::get('products/edit/{id}', ['as'=>'products.edit', 'uses'=>'Admin\ProductController@edit']);
    Route::POST('products/update', ['as'=>'products.update', 'uses'=>'Admin\ProductController@update']);
    Route::get('products/delete/{id}', ['as'=>'products.delete', 'uses'=>'Admin\ProductController@delete']);
    Route::get('products/status/{id}', ['as'=>'products.status', 'uses'=>'Admin\ProductController@status']);
    Route::get('products/image/delete/{id}', ['as'=>'products.image.delete', 'uses'=>'Admin\ProductController@imageDelete']);
    Route::post('getCategory', ['as'=>'getCategory.delete', 'uses'=>'Admin\ProductController@getCategory']);

    Route::get('products/import', ['as'=>'products.import',  'uses'=>'Admin\ProductController@import']);
    Route::POST('products/import/csv', ['as'=>'products.import.csv',  'uses'=>'Admin\ProductController@importProductCsv']);


    // Our Environment ////
    Route::get('our_environment/index', ['as'=>'our_environment.index',  'uses'=>'Admin\OurEnvironmentController@index']);
    Route::get('our_environment/edit/{id}', ['as'=>'our_environment.edit', 'uses'=>'Admin\OurEnvironmentController@edit']);
    Route::get('our_environment/image/delete/{id}', ['as'=>'our_environment.image.delete', 'uses'=>'Admin\OurEnvironmentController@imageDelete']);
    Route::POST('our_environment/update', ['as'=>'our_environment.update', 'uses'=>'Admin\OurEnvironmentController@update']);

    // About Us ////
    Route::get('about_us/index', ['as'=>'about_us.index',  'uses'=>'Admin\AboutUsController@index']);
    Route::get('about_us/edit/{id}', ['as'=>'about_us.edit', 'uses'=>'Admin\AboutUsController@edit']);
    Route::POST('about_us/update', ['as'=>'about_us.update', 'uses'=>'Admin\AboutUsController@update']);

    /// terms & conditions ////
    Route::get('terms_and_conditions/index', ['as'=>'terms_and_conditions.index',  'uses'=>'Admin\TermsConditionController@index']);
    Route::get('terms_and_conditions/edit/{id}', ['as'=>'terms_and_conditions.edit', 'uses'=>'Admin\TermsConditionController@edit']);
    Route::POST('terms_and_conditions/update', ['as'=>'terms_and_conditions.update', 'uses'=>'Admin\TermsConditionController@update']);

    /// Privacy Policy ////
    Route::get('privacy_policy/index', ['as'=>'privacy_policy.index',  'uses'=>'Admin\PrivacyPolicyController@index']);
    Route::get('privacy_policy/edit/{id}', ['as'=>'privacy_policy.edit', 'uses'=>'Admin\PrivacyPolicyController@edit']);
    Route::POST('privacy_policy/update', ['as'=>'privacy_policy.update', 'uses'=>'Admin\PrivacyPolicyController@update']);

    /// Refund Policy ////
    Route::get('refund_policy/index', ['as'=>'refund_policy.index',  'uses'=>'Admin\RefundPolicyController@index']);
    Route::get('refund_policy/edit/{id}', ['as'=>'refund_policy.edit', 'uses'=>'Admin\RefundPolicyController@edit']);
    Route::POST('refund_policy/update', ['as'=>'refund_policy.update', 'uses'=>'Admin\RefundPolicyController@update']);

    /// Shipping/Delivery Policy ////
    Route::get('shippingdelivery_policy/index', ['as'=>'shippingdelivery_policy.index',  'uses'=>'Admin\ShippingDeliveryPolicyController@index']);
    Route::get('shippingdelivery_policy/edit/{id}', ['as'=>'shippingdelivery_policy.edit', 'uses'=>'Admin\ShippingDeliveryPolicyController@edit']);
    Route::POST('shippingdelivery_policy/update', ['as'=>'shippingdelivery_policy.update', 'uses'=>'Admin\ShippingDeliveryPolicyController@update']);


    /// Contacts ////
    Route::get('contacts/index', ['as'=>'contacts.index',  'uses'=>'Admin\ContactController@index']);
    Route::get('contacts/view/{id}', ['as'=>'contacts.view', 'uses'=>'Admin\ContactController@view']);
    Route::get('contacts/delete/{id}', ['as'=>'contacts.delete', 'uses'=>'Admin\ContactController@delete']);


    // Shipping ////
    Route::get('shipping/index', ['as'=>'shipping.index',  'uses'=>'Admin\ShippingController@index']);
    Route::get('shipping/add', ['as'=>'shipping.add', 'uses'=>'Admin\ShippingController@add']);
    Route::POST('shipping/save', ['as'=>'shipping.save', 'uses'=>'Admin\ShippingController@save']);
    Route::get('shipping/edit/{id}', ['as'=>'shipping.edit', 'uses'=>'Admin\ShippingController@edit']);
    Route::POST('shipping/update', ['as'=>'shipping.update', 'uses'=>'Admin\ShippingController@update']);

    // Tax ////
    Route::get('tax/index', ['as'=>'tax.index',  'uses'=>'Admin\TaxController@index']);
    Route::get('tax/edit/{id}', ['as'=>'tax.edit', 'uses'=>'Admin\TaxController@edit']);
    Route::get('tax/status/{id}', ['as'=>'tax.status', 'uses'=>'Admin\TaxController@status']);
    Route::POST('tax/update', ['as'=>'tax.update', 'uses'=>'Admin\TaxController@update']);


    // Cart Limit ////
    Route::get('cart_limit/index',['as'=>'cart_limit.index','uses'=>'Admin\CartLimitController@index']);
    Route::get('cart_limit/edit/{id}',['as'=>'cart_limit.edit','uses'=>'Admin\CartLimitController@edit']);
    Route::POST('cart_limit/update',['as'=>'cart_limit.update','uses'=>'Admin\CartLimitController@update']);


    /// Discount Coupon ////
    Route::get('discount_coupon/index', ['as'=>'discount_coupon.index',  'uses'=>'Admin\DiscountCouponController@index']);
    Route::get('discount_coupon/add', ['as'=>'discount_coupon.add',  'uses'=>'Admin\DiscountCouponController@add']);
    Route::POST('discount_coupon/save', ['as'=>'discount_coupon.save',  'uses'=>'Admin\DiscountCouponController@save']);
    Route::get('discount_coupon/edit/{id}', ['as'=>'discount_coupon.edit', 'uses'=>'Admin\DiscountCouponController@edit']);
    Route::POST('discount_coupon/update', ['as'=>'discount_coupon.update', 'uses'=>'Admin\DiscountCouponController@update']);
    Route::get('discount_coupon/delete/{id}', ['as'=>'discount_coupon.delete', 'uses'=>'Admin\DiscountCouponController@delete']);
    Route::get('discount_coupon/status/{id}', ['as'=>'discount_coupon.status', 'uses'=>'Admin\DiscountCouponController@status']);


    // Orders ////
    Route::get('orders/index',['as'=>'orders.index','uses'=>'Admin\OrderController@index']);
    Route::get('orders/view/{id}',['as'=>'orders.view','uses'=>'Admin\OrderController@view']);

});


//=============================================================================================
/*Front Routes*/


Route::group(['namespace' => 'Front'], function(){

    /*Home*/
    Route::get('/',['as'=>'home','uses'=>'HomeController@index']);
    Route::get('about-us',['as'=>'about_us','uses'=>'CmsController@about_us']);
    Route::get('our-environment',['as'=>'our_environment','uses'=>'CmsController@our_environment']);
    Route::get('privacy-policy',['as'=>'privacy_policy','uses'=>'CmsController@privacy_policy']);
    Route::get('refund-policy',['as'=>'refund_policy','uses'=>'CmsController@refund_policy']);
    Route::get('terms-and-condition',['as'=>'t_c','uses'=>'CmsController@terms_conditions']);
    Route::get('shipping-delivery-policy',['as'=>'shipping_delivery_policy','uses'=>'CmsController@shipping_delivery_policy']);

    /*Products*/
    Route::get('our-brands',['as'=>'our_brands','uses'=>'ProductController@our_brands']);
    Route::get('products/{brand_slug}/{cat_id?}',['as'=>'products','uses'=>'ProductController@products']);
    Route::get('product/{id}',['as'=>'productDetails','uses'=>'ProductController@productDetails']);
    Route::patch('product/getPrice', ['as'=>'product.getPrice', 'uses'=>'ProductController@getPrice']);

    /*cart*/
    Route::POST('add2Cart',['as'=>'add2Cart','uses'=>'CartController@add2Cart']);
    Route::get('cart',['as'=>'cart','uses'=>'CartController@cart']);
    Route::POST('updateCart',['as'=>'updateCart','uses'=>'CartController@updateCart']);
    Route::POST('applyCoupon',['as'=>'applyCoupon','uses'=>'CartController@applyCoupon']);
    Route::POST('changeShippingMethod',['as'=>'changeShippingMethod','uses'=>'CartController@changeShippingMethod']);
    Route::get('removeCart/{id}',['as'=>'removeCart','uses'=>'CartController@removeCart']);
    Route::get('checkout',['as'=>'checkout','uses'=>'CartController@checkout']);

    /*Stripe*/
    Route::POST('stripe/post',['as'=>'stripe.post','uses'=>'CartController@stripePost']);
    Route::get('thankyou/{id}',['as'=>'thankyou','uses'=>'CartController@thankyou']);

    /*Contact Us*/
    Route::get('contact_us',['as'=>'contact_us','uses'=>'ContactController@contact_us']);
    Route::POST('contact/save',['as'=>'contact.save','uses'=>'ContactController@contactSave']);
    Route::get('refresh_captcha', 'ContactController@refreshCaptcha')->name('refresh_captcha');

});
