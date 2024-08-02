<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Post;

use App\Models\User;

use Illuminate\Support\Facades\Auth;


class DashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('dashboard');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
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
    public function show()
    {
        $id = Auth::user()->id;
        $userPosts = Post::where('user_id', $id)->get();

        if ($userPosts->isEmpty()) {
            return view('dashboard')->with('err', 'You have not posted any post.');
        }
        else
        {
            // foreach ($userPosts as $post) {
            //     echo "Post ID: " . $post->id . "<br>";
            //     echo "Post Title: " . $post->title . "<br>";
            //     echo "Post Content: " . $post->body . "<br><br>";
            // }
            return view('dashboard')->with('data',$userPosts);
        }
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
