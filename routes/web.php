<?php

use App\Http\Controllers\NavbarMenuController;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\UserController;

use App\Http\Controllers\PostController;

use App\Http\Controllers\DashboardController;

use App\Http\Controllers\ImageController;



Route::get('/', [PostController::class, 'show'])->name('posts');



Route::get('/login', function() {
    return view('login');
})->name('login');



Route::get('/register', function() {
    return view('register');
})->name('register');



Route::post('/store', [UserController::class, 'store'])->name('store');



Route::post('/show', [UserController::class, 'show'])->name('show');



Route::get('/Success', function() {
    return view('message');
})->name('message')->middleware('links');



// Route::get('/Admin', function() {
//     return view('dashboard');
// })->name('dashboard')->middleware('dashboard');



Route::get('/Admin', [DashboardController::class, 'show'])->name('dashboard')->middleware('dashboard');



Route::get('/logout', [UserController::class, 'logout'])->name('logout');



Route::get('/post', [PostController::class, 'index'])->name('post')->middleware('dashboard');



Route::post('/post', [PostController::class, 'create'])->name('postCreate')->middleware('dashboard');



Route::get('/post/edit/{id}', [PostController::class, 'edit'])->name('postEdit')->middleware('dashboard');



Route::post('/post/update/{id}', [PostController::class, 'update'])->name('postUpdate')->middleware('dashboard');



Route::get('/post/delete/{id}', [PostController::class, 'destroy'])->name('postDelete')->middleware('dashboard');



Route::post('/upload_image', [ImageController::class, 'upload'])->name('upload_image')->middleware('dashboard');


Route::get('/Mini-Blog/{slug}', [PostController::class, 'unique_post'])->name('unique_post');

Route::get('/category/{id}/',[PostController::class, 'category'])->name('category');

Route::get('/category/{slug}', function() {
    return view('category');
})->name('category');


Route::get('/navbar', [NavbarMenuController::class, 'index'])->name('navbar');
// ->middleware('dashboard')

Route::get('/remove/category/{id}/{name}', [NavbarMenuController::class, 'removeCategory']);

Route::get('/add/category/{id}/{name}', [NavbarMenuController::class, 'addCategory']);
