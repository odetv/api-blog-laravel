<?php

namespace App\Http\Controllers;

use App\Http\Resources\PostDetailResource;
use App\Http\Resources\PostResource;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class PostController extends Controller
{
    public function index()
    {
        // $posts = Post::with('author:id,username')->get();
        // return PostDetailResource::collection($posts);
        $posts = Post::all();
        return PostDetailResource::collection($posts->loadMissing(['author:id,username', 'comments:id,post_id,user_id,comments_content,created_at']));
    }

    public function showDetails($id)
    {
        $post = Post::with('author:id,username')->findOrFail($id);
        return new PostDetailResource($post->loadMissing(['author:id,username', 'comments:id,post_id,user_id,comments_content,created_at']));
    }

    // public function store(Request $request)
    // {
    //     $validated = $request->validate([
    //         'title' => 'required|max:255',
    //         'news_content' => 'required',
    //     ]);

    //     $image = null;
    //     if ($request->fileImage) {
    //         $fileImageName = $this->generateRandomString();
    //         $extension = $request->fileImage->extension();
    //         $image = $fileImageName . '.' . $extension;
    //         Storage::putFileAs('image', $request->fileImage, $image);
    //     }
    //     $request['image'] = $image;
    //     $request['id_user'] = Auth::user()->id;
    //     $post = Post::create($request->all());

    //     return new PostDetailResource($post->loadMissing('author:id,username'));
    // }

    // public function update(Request $request, $id)
    // {
    //     $validated = $request->validate([
    //         'title' => 'required|max:255',
    //         'news_content' => 'required',
    //     ]);

    //     $post = Post::findOrFail($id);

    //     // Hapus gambar lama jika ada
    //     if ($post->image) {
    //         Storage::delete('image/' . $post->image);
    //     }

    //     $image = null;
    //     if ($request->fileImage) {
    //         $fileImageName = $this->generateRandomString();
    //         $extension = $request->fileImage->extension();
    //         $image = $fileImageName . '.' . $extension;
    //         Storage::putFileAs('image', $request->fileImage, $image);
    //     }

    //     $post->update([
    //         'title' => $request->title,
    //         'news_content' => $request->news_content,
    //         'image' => $image,
    //         'id_user' => Auth::user()->id,
    //     ]);

    //     return new PostDetailResource($post->loadMissing('author:id,username'));
    // }


    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|max:255',
            'news_content' => 'required',
            'fileImage' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048', // Batasan jenis dan ukuran file gambar (opsional)
        ]);

        $image = null;
        if ($request->hasFile('fileImage') && $request->file('fileImage')->isValid()) {
            $fileImageName = $this->generateRandomString();
            $extension = $request->file('fileImage')->getClientOriginalExtension();
            $image = $fileImageName . '.' . $extension;
            $request->file('fileImage')->storeAs('public/image', $image);
        }

        $request->merge([
            'image' => $image,
            'id_user' => Auth::user()->id,
        ]);

        $post = Post::create($request->all());

        return new PostDetailResource($post->loadMissing('author:id,username'));
    }


    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'title' => 'required|max:255',
            'news_content' => 'required',
            'fileImage' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048', // Batasan jenis dan ukuran file gambar (opsional)
        ]);

        $post = Post::findOrFail($id);

        // Hapus gambar lama jika ada
        if ($post->image && $request->hasFile('fileImage') && $request->file('fileImage')->isValid()) {
            Storage::delete('public/image/' . $post->image);
        }

        $image = $post->image;
        if ($request->hasFile('fileImage') && $request->file('fileImage')->isValid()) {
            $fileImageName = $this->generateRandomString();
            $extension = $request->file('fileImage')->getClientOriginalExtension();
            $image = $fileImageName . '.' . $extension;
            $request->file('fileImage')->storeAs('public/image', $image);
        }

        $post->update([
            'title' => $request->title,
            'news_content' => $request->news_content,
            'image' => $image,
            'id_user' => Auth::user()->id,
        ]);

        return new PostDetailResource($post->loadMissing('author:id,username'));
    }




    public function destroy($id)
    {
        $post = Post::findOrFail($id);
        $post->delete();

        return new PostDetailResource($post->loadMissing('author:id,username'));
    }

    function generateRandomString($length = 10)
    {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[random_int(0, $charactersLength - 1)];
        }
        return $randomString;
    }
}
