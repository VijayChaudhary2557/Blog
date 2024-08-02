<?php

namespace App\Http\Controllers;

use App\Models\NavbarMenu;
use Illuminate\Http\Request;

use App\Models\Category;
use App\Models\Post;

class NavbarMenuController extends Controller
{

    public function index()
    {
        $remove = NavbarMenu::with('category_navbar')->get();
        $data = [];
        $add = Category::all();

        foreach ($remove as $r) {
            foreach ($add as $key => $a) {
                if ($a->id == $r->category_id) {
                    $data[] = $a;
                    unset($add[$key]);
                }
            }
        }

        return view('navbar', compact('add', 'remove', 'data'));

    }

    public function removeCategory($id, $name)
    {
        $navbarMenus = NavbarMenu::where('category_id', $id)->get();

        foreach ($navbarMenus as $menu) {
            $menu->delete();
        }

        return redirect()->route('navbar');

    }

    public function addCategory($id, $name)
    {
        $navbarMenu = new NavbarMenu();
        $navbarMenu->category_id = $id;
        $navbarMenu->save();
        return redirect()->route('navbar');

    }
}
