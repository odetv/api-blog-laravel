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

    // public function showEager($id)
    // {
    //     $post = Post::findOrFail($id);
    //     return new PostDetailResource($post);
    // }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required|max:255',
            'news_content' => 'required',
        ]);

        if ($request->fileImage) {
            $fileImageName = $this->generateRandomString();
            $extension = $request->fileImage->extension();

            Storage::putFileAs('image', $request->fileImage, $fileImageName . '.' . $extension);
        }
        $request['image'] = $fileImageName . '.' . $extension;
        $request['id_user'] = Auth::user()->id;
        $post = Post::create($request->all());
        return new PostDetailResource($post->loadMissing('author:id,username'));
    }

    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'title' => 'required|max:255',
            'news_content' => 'required',
        ]);

        $post = Post::findOrFail($id);
        $post->update($request->all());

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
