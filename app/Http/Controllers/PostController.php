<?php

namespace App\Http\Controllers;

use App\Http\Resources\PostDetailResource;
use App\Http\Resources\PostResource;
use App\Models\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function index()
    {
        $posts = Post::all();
        return PostResource::collection($posts);
    }

    public function showDetails($id)
    {
        $post = Post::with('author:id,username')->findOrFail($id);
        return new PostDetailResource($post);
    }

    // public function showEager($id)
    // {
    //     $post = Post::findOrFail($id);
    //     return new PostDetailResource($post);
    // }
}
