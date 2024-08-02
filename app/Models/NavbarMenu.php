<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NavbarMenu extends Model
{
    use HasFactory;

    public function category_navbar()
    {
        return $this->belongsTo(Category::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
}
