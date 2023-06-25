<?php

namespace App\Http\Middleware;

use App\Models\Post;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class PostOwner
{
    public function handle(Request $request, Closure $next): Response
    {
        $currentUser = Auth::user();
        $post = Post::findOrFail($request->id);

        if ($post->id_user != $currentUser->id) {
            return response()->json(['message' => 'Data tidak ditemukan!'], 404);
        }
        return $next($request);
    }
}
