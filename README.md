![Logo](https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg)

# Rest API Blog Laravel 10

Halo, saya `I Gede Gelgel Abdiutama`. Dalam repository ini saya membuat sebuah project API dalam layanan web service untuk sistem blog menggunakan Framework Laravel versi 10. API ini dibuat untuk menunjang kebutuhan praktikum dalam kuliah Sistem Terdistribusi Undiksha, dan akan dikembangkan lagi untuk project-project yang relevan agar API ini dapat berkembang dan bermanfaat untuk pengguna.

## Features

-   Keamanan Autentikasi Pengguna (Sanctum Laravel)
-   API Resource (Collection)
-   API Token
-   CRUD Data Blog
-   Symlink Storage Public

## Dokumentasi API

### Fitur 1: Autentikasi Login & Logout

##### Login

```http
POST /api/login
```

##### Logout

```http
GET /api/logout
```

| Parameter       | Type     | Description           |
| :-------------- | :------- | :-------------------- |
| `email`         | `string` | Email **Required**    |
| `password`      | `string` | Password **Required** |
| `Authorization` | `string` | Bearer `token_api`    |

Tambahkan Token API yang diperoleh pada Header setiap request dan API siap digunakan.

### Fitur 2: Postingan

##### Membuat Postingan

```http
POST /api/posts
```

##### Melihat Semua Posts

```http
GET /api/posts
```

##### Melihat Detail Postingan

```http
GET /api/posts/{id}
```

##### Update Postingan

```http
POST /api/posts/{id}
```

##### Hapus Postingan

```http
DEL /api/posts/{id}
```

| Parameter       | Type     | Description                                              |
| :-------------- | :------- | :------------------------------------------------------- |
| `title`         | `string` | Judul Postingan **Required**                             |
| `fileImage`     | `file`   | File Gambar Postingan (jpeg, png, jpg, gif) **Required** |
| `news_contents` | `string` | Deskripsi isi Postingan **Required**                     |

### Fitur 3: Komentar Postingan

##### Membuat Komentar

```http
POST /api/comment
```

##### Update Komentar

```http
PATCH /api/comment/{post_id}?{comments_content}
```

##### Hapus Komentar

```http
DEL /api/comment/{post_id}
```

| Parameter          | Type     | Description                         |
| :----------------- | :------- | :---------------------------------- |
| `post_id`          | `int`    | ID Postingan **Required**           |
| `comments_content` | `string` | Isi Komentar Postingan **Required** |

## Instalasi

Clone project

```bash
  git clone https://github.com/odetv/web-blog-api-laravel.git
```

Masuk ke directory project

```bash
  cd web-blog-api-laravel
```

Jalankan composer install

```bash
  composer install
```

Buat file .env

```bash
  cp .env.example .env
```

Untuk menjalankan project ini, pastikan environment berikut disesuaikan pada file .env

`APP_URL`

`DB_CONNECTION`

`DB_HOST`

`DB_PORT`

`DB_DATABASE`

`DB_USERNAME`

`DB_PASSWORD`

####

Generate key

```bash
  php artisan key:generate
```

Jalankan Migrate Database

```bash
  php artisan migrate
```

Jalankan server

```bash
  php artisan serve
```

## Screenshots

![App Screenshot](https://telegra.ph/file/089070e44efddd4b04872.png)
