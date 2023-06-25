<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PostDetailResource extends JsonResource
{
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'image' => $this->image,
            'news_content' => $this->news_content,
            'created_at' => date_format($this->created_at, "D, d M Y H:i:s"),
            'id_user' => $this->id_user,
            'author' => $this->whenLoaded('author'),
            'comments' => $this->whenLoaded('comments', function () {
                return collect($this->comments)->each(function ($comment) {
                    $comment->commentator;
                    return $comment;
                });
            }),
            'comment_total' => $this->whenLoaded('comments', function () {
                return $this->comments->count();
            })
        ];
    }
}
