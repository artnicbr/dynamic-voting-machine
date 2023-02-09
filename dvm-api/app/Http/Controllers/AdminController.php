<?php

namespace App\Http\Controllers;

use Laravel\Lumen\Routing\Controller as BaseController;
use Illuminate\Http\Request;
use \DB as DB;

use App\Admin;

class AdminController extends BaseController
{
    //
    public function login(Request $request){
        $user = $request->post("user"); 
        $pass = hash("sha256", $request->post("pass"));

        $result = DB::select("SELECT * FROM admin WHERE LOGIN = ? AND PASS = ?", [$user, $pass]);

        return $result;
    }
}
