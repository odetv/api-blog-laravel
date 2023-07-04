<?php

use App\Http\Controllers\AuthenticationController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\PostController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get("/storage-link", function () {
    $targetFolder = storage_path("app/public");
    $linkFolder = $_SERVER['DOCUMENT_ROOT'] . '/storage';
    symlink($targetFolder, $linkFolder);
});

Route::post('/login', [AuthenticationController::class, 'login']); //Login
Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/user', [AuthenticationController::class, 'getUser']); //Get User
    Route::post('/logout', [AuthenticationController::class, 'logout']); //Logout
    Route::get('/me', [AuthenticationController::class, 'me']); //Check Token API User
    Route::post('/posts', [PostController::class, 'store']); //Create Posts
    Route::post('/posts/{id}', [PostController::class, 'update'])->middleware('post-owner'); //Update Posts
    Route::delete('/posts/{id}', [PostController::class, 'destroy'])->middleware('post-owner'); //Delete Posts

    Route::post('/comment', [CommentController::class, 'store']); //Create Comments
    Route::patch('/comment/{id}', [CommentController::class, 'update'])->middleware('comment-owner'); //Update Comments
    Route::delete('/comment/{id}', [CommentController::class, 'destroy'])->middleware('comment-owner'); //Delete Comments
});

Route::get('/posts', [PostController::class, 'index']); //Show All Posts
Route::get('/posts/{id}', [PostController::class, 'showDetails']); //Show Details Posts