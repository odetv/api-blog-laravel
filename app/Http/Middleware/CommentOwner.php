<?php

namespace App\Http\Middleware;

use App\Models\Comment;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CommentOwner
{
    public function handle(Request $request, Closure $next): Response
    {
        $user = auth()->user();
        $comment = Comment::findOrFail($request->id);

        if ($comment->user_id != $user->id) {
            return response()->json(['message' => 'Data tidak ditemukan!'], 404);
        }

        return $next($request);
    }
}
