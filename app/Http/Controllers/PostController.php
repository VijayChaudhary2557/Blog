<?php

namespace App\Http\Controllers;

use App\Models\NavbarMenu;
use App\Models\Post;

use App\Models\User;

use App\Models\category;


use Illuminate\Http\Request;

use Illuminate\Pagination\Paginator;

use Illuminate\Pagination\CursorPaginator;

use Illuminate\Support\Facades\Auth;

use Illuminate\Support\Str;

use Illuminate\Support\Facades\Redirect;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $category = Category::all();
        return view('post')->with('category', $category);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {

        $request->validate([
            'title' => 'required',
            'body' => 'required',
            'slug' => 'nullable',
            'category_name' => 'required'
        ]);

        if(Post::where('slug', Str::slug($request->slug))->exists())
        {
            return redirect()->back()->with('err','Slug field must be unique.');
        }

        $category = Category::firstOrCreate(['category_name' => $request->category_name]);


        // Save the post
        $user = $request->user();
        $post = new Post();
        $post->title = $request->title;
        $post->body = $request->body;
        $post->slug = Str::slug($request->slug);
        $user->post()->save($post);

        $post->categories()->attach($category->id);

        return redirect()->route('post')->with('msg', 'Post Successfully created');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Post $post)
    {
        Paginator::useBootstrapFive();
        $post = Post::with('user')->paginate(4);
        $l = count($post);



        return view('miniBlog')->with('post', $post)->with('l', $l);
    }

    public function category($id)
    {

        $category = Category::find($id);
        $post = $category->posts;
        $category_name = $category->category_name;

        $l = count($post);
        $slug = Str::slug($category_name);

        return view('category', ['slug' => $slug])->with('post', $post)->with('l', $l)->with('category', $category_name);

    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $user_id = Auth::user()->id;
        $post = Post::find($id);
        if($post==null)
        {
            return redirect()->back();
        }
        else if ($post['user_id']!=$user_id)
        {
            return redirect()->back();
        }
        if(!$post)
            return redirect('/');
        else
            return view('editPost', compact('post', 'id'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $post = Post::find($id);
        $post->title = $request->title;
        $post->body = $request->body;
        $post->save();
        return redirect()->route('dashboard')->with('msg', 'Post Successfully Updated');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        Post::destroy($id);
        return redirect()->route('dashboard')->with('msg', 'Post Successfully Deleted');
    }


    public function unique_post($slug)
    {
        $post = Post::with('user')->where('slug', $slug)->first(); // Execute the query and get the first result

        return view('unique_post', ['post' => $post]); // Pass the retrieved post to the view
    }



}
