<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ImageController extends Controller
{
    public function upload(Request $request)
    {
        if ($request->hasFile('upload')) {
            $file = $request->file('upload');
            $fileName = time() . '_' . $file->getClientOriginalName();
            $file->move(public_path('Images'), $fileName);
            $url = asset('Images/' . $fileName);
            return response()->json(['uploaded' => 1, 'fileName' => $fileName, 'url' => $url]);
        }
        return response()->json(['uploaded' => 0, 'error' => ['message' => 'No file uploaded']], 400);
    }
}
