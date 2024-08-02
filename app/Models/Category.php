<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    protected $fillable = [
        'category_name',
    ];

    public function posts()
    {
        return $this->belongsToMany(Post::class, 'post_categories');
    }

    public function navbar_category()
    {
        return $this->hasMany(NavbarMenu::class);
    }

    public function navbarMenus()
    {
        return $this->hasMany(NavbarMenu::class);
    }

}
