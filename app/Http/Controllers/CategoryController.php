<?php

namespace App\Http\Controllers;


use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;
use Validator; // quản lý lỗi

//các models
use App\Models\tintuc;
use App\Models\category;

class CategoryController extends Controller
{
    public function listCat()
    {
        $list= category::all();
        $manager = view('Admin.category.list-cat')->with('listCat', $list);
        return view('admin_layout')->with('Admin.category.list-cat', $manager);
    }

    public function addCat()
    {
        return view('Admin.category.add-cat');
    }
    public function addCatAction(Request $request)
    {
        $cat = new category();
        $cat->cat_name =$request->input('catName');
        if($request->catName==null)
        {
            //Session::forget('th_err');

            $this->validate($request,[
                'catName'=>'bail|required|min:3|max:50',
            ],[
                'catName.required'=>'Tên loại tin tức không được để trống',
                'catName.max'=>'Tên loại tin tức không được dài quá 50 kí tự',
                'catName.min'=>'Tên loại tin tức không được ngán hơn quá 3 kí tự',
            ]);
        }else
        {
            $cat->save();
            Session::put('msg','Thêm thành công');
            return Redirect::to('/list-cat');
        }
    }

    public function editCat($id)
    {
        $edit = category::where('cat_id', $id)->get();
        $manager = view('Admin.category.edit-cat')->with('editCat', $edit);
        return view('admin_layout')->with('Admin.category.edit-cat', $manager);
    }
    public function editCatAction(Request $request, $id)
    {
        $cat =category::find($id);
        $cat->cat_name =$request->input('catName');
        if($request->catName==null)
        {
            //Session::forget('th_err');

            $this->validate($request,[
                'catName'=>'bail|required|min:3|max:50',
            ],[
                'catName.required'=>'Tên loại tin tức không được để trống',
                'catName.max'=>'Tên loại tin tức không được dài quá 50 kí tự',
                'catName.min'=>'Tên loại tin tức không được ngán hơn quá 3 kí tự',
            ]);
        }else
        {
            $cat->save();
            Session::put('msg','Thay đổi thành công');
            return Redirect::to('/list-cat');
        }
    }

    public function deleteCatAction($id)
    {
        $news=new tintuc();
        // thêm model tintuc vào
        $result = $news->where('cat_id', $id)->exists();

        if($result) {
            Session::put('msg','Danh mục nay đang có tin tức !');
            return Redirect::to('/list-cat');
        } else {
            category::where('cat_id', $id)->delete();
            Session::put('msg','Xóa thành công');
            return Redirect::to('/list-cat');
        }
    }
}
