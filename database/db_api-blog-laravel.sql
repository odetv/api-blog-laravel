-- MariaDB dump 10.19  Distrib 10.5.23-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: momentki_db_api-kknsongana
-- ------------------------------------------------------
-- Server version	10.5.23-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `comments_content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_user_id_foreign` (`user_id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`, `post_id`, `user_id`, `comments_content`, `created_at`, `updated_at`, `deleted_at`) VALUES (1,1,1,'Keren! Semoga KKN nya lancar.','2023-07-17 01:48:21','2023-07-17 01:48:21',NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2023_06_24_133252_create_posts_table',2),(6,'2023_06_24_133712_create_comments_table',3),(7,'2023_06_25_092355_add_image_column_to_posts_table',4),(8,'2023_07_08_082125_add_remember_token_to_users_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `news_content` text NOT NULL,
  `id_user` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_author_foreign` (`id_user`),
  CONSTRAINT `posts_author_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `title`, `image`, `news_content`, `id_user`, `created_at`, `updated_at`, `deleted_at`) VALUES (1,'Kegiatan KKN Tematik Non Kependidikan Tahun 2023 di Kabupaten Bangli Desa Songan A','EouZX9Jcbl.jpg','Selamat datang di blog kami yang akan mengulas tentang kegiatan Kuliah Kerja Nyata (KKN) yang dilaksanakan di Desa Songan A, Kecamatan Kintamani, Kabupaten Bangli. Kegiatan ini merupakan bagian dari upaya kami untuk turut serta dalam pembangunan dan kemajuan desa yang berkelanjutan. Semoga KKN ini dapat memberikan kontribusi nyata bagi kemajuan Desa Songan A, dan pengalaman ini akan selalu membekas di hati kami sebagai mahasiswa yang peduli terhadap pembangunan daerah.',1,'2023-07-10 09:05:41',NULL,NULL),(2,'Kegiatan Hari Ke-1: Persiapan Pembukaan Kegiatan KKNT di Desa Songan A','D1RLl0GjtV.jpg','Pada tanggal 11 Juli 2023, kami tim KKN Desa Songan A melaksanakan sejumlah kegiatan yang berfokus pada kunjungan ke kantor desa, membersihkan sekitar posko, dan melakukan gladi pembukaan.\n\n1. Kunjungan ke Kantor Desa Pukul 09:00 - 10:45 WITA\nPagi hari kami memulai kegiatan KKN dengan kunjungan ke Kantor Desa Songan A. Rangkaian kegiatan ini bertujuan untuk berinteraksi dengan perangkat desa, mendapatkan pemahaman lebih mendalam tentang tantangan dan potensi desa, dan melakukan prosesi upacara keagamaan yang diyakini oleh umat Hindu yaitu Matur Piuning di Pura Bale Agung dan Puseh serta di Pura Hulundanu Batur. Kegiatan ini sangat bermanfaat bagi kami untuk merumuskan rencana kegiatan KKN yang lebih tepat sasaran dan berdaya guna bagi masyarakat desa.\n\n2. Bersih-bersih Sekitar Posko Pukul 11:00 - 13:00 WITA\nSetelah mendapatkan wawasan dari kunjungan pagi tadi, kami melanjutkan kegiatan dengan membersihkan sekitar posko KKN. Bersama-sama dengan tim, kami membersihkan lingkungan sekitar posko agar menjadi lebih nyaman dan bersih. Selain itu, kegiatan ini juga berfungsi untuk mempererat tali silaturahmi antara kami sebagai mahasiswa KKN. Semangat gotong-royong sangat terasa, dan kebersamaan dalam membersihkan lingkungan positif turut menyemangati kami untuk melanjutkan kegiatan KKN dengan penuh semangat.\n\n3. Gladi Pembukaan Pukul 14:00 - 16:30 WITA\nSebagai puncak dari persiapan acara pembukaan KKN, kami melaksanakan gladi pembukaan yang bertempat di posko. Seluruh anggota tim KKN berkolaborasi untuk memastikan acara pembukaan berjalan dengan lancar dan menyenangkan bagi seluruh peserta. Kami menyusun rangkaian acara dengan baik sehingga gladi pembukaan ini memberikan gambaran tentang bagaimana momentum KKN dapat dimanfaatkan untuk memberikan dampak positif bagi pembangunan desa.',15,'2023-07-11 11:51:57',NULL,NULL),(3,'Kegiatan Hari Ke-2: Pembukaan KKNT dan Observasi Keliling Menyatu dengan Kehidupan Masyarakat','7smJFNIvDi.jpg','Pada tanggal 12 Juli 2023, kami tim KKN Desa Songan A menghadiri acara pembukaan Kuliah Kerja Nyata Tematik (KKNT) Desa Songan A yang diikuti dengan observasi keliling desa. Dua kegiatan ini memberikan kesempatan berharga bagi kami untuk lebih memahami kearifan lokal dan mendekatkan diri dengan kehidupan masyarakat desa.\n\n1. Pembukaan KKNT Desa Songan A Pukul 10:00 - 12:00 WITA\nKami sangat bersemangat menyambut acara pembukaan KKNT Desa Songan A. Acara ini dihadiri oleh para perangkat desa di Kantor Kepala Desa Songan A, dan juga anggota tim mahasiswa KKN Songan A. Acara dimulai dengan sambutan dari kepala desa yang memberikan motivasi dan harapan atas partisipasi kami dalam pengembangan desa. Selanjutnya, setiap tim KKN memperkenalkan diri dan menyampaikan rencana kerja mereka selama masa KKNT. Suasana penuh semangat dan kebersamaan sangat terasa dalam acara tersebut. Melalui pembukaan KKNT ini, kami merasa semakin termotivasi dan bertekad untuk memberikan kontribusi yang terbaik bagi kemajuan Desa Songan A.\n\n2. Observasi Keliling Desa Songan A 15:00 - 17:30 WITA\nSetelah acara pembukaan, kami melanjutkan kegiatan dengan observasi keliling desa. Kami berkeliling bersama tim untuk mengenal lebih dekat lingkungan, budaya, dan kehidupan sehari-hari masyarakat. Kami mengunjungi beberapa tempat penting seperti pusat perekonomian desa, sekolah, tempat ibadah, dan tempat-tempat umum lainnya. Selama perjalanan, kami berkesempatan berbincang dengan beberapa warga yang ramah dan berbagi pengalaman hidup mereka. Observasi keliling ini memberikan wawasan yang tak ternilai tentang dinamika sosial dan budaya desa, serta tantangan yang dihadapi oleh masyarakat setempat.',15,'2023-07-12 11:06:53',NULL,NULL),(4,'Kegiatan Hari Ke-3: Mengenal Desa Songan A Melalui Observasi di Sekolah dan Puskesmas','4OxtIlFsn6.png','Pada tanggal 13 Juli 2023, kami tim KKN Desa Songan A melaksanakan sejumlah kegiatan observasi di sekolah-sekolah dan Puskesmas Desa Songan. Observasi ini memberikan kami pemahaman yang lebih mendalam tentang sistem pendidikan dan pelayanan kesehatan di desa ini, serta interaksi lebih dekat dengan anak-anak dan masyarakat sekitar.\n\n1. Observasi ke SD Negeri 1 dan 4 Songan Pukul 08:00 - 09:00 WITA\nKegiatan pagi dimulai dengan kunjungan ke SD Negeri 1 dan 4 Songan. Kami disambut hangat oleh para guru dan murid-murid yang bersemangat. Selama observasi, kami melihat secara langsung proses kegiatan-kegiatan yang dilakukan oleh siswa. Kami juga berbincang dengan guru-guru mengenai tantangan dalam dunia pendidikan di desa ini, termasuk infrastruktur dan kondisi wilayah disekitar sekolah. Observasi di sekolah-sekolah ini memberi kami wawasan tentang upaya untuk meningkatkan kualitas pendidikan di Desa Songan A.\n\n2. Observasi ke SD Negeri 5 dan 8 Songan Pukul 09:00 - 10:00 WITA\nSetelah itu, kami melanjutkan observasi ke SD Negeri 5 dan 8 Songan. Di sini, kami juga disambut dengan antusiasme oleh para siswa dan staf sekolah. Kami mengamati proses pembelajaran di kelas dan berinteraksi dengan siswa, mereka sangat antusias. Observasi di sekolah-sekolah lainnya ini memperkaya pemahaman kami tentang berbagai aspek pendidikan di Desa Songan A.\n\n3. Observasi ke Puskesmas Desa Songan Pukul 10:00 - 12:00 WITA\nKami beranjak ke Puskesmas Desa Songan. Di sini, kami bertemu dengan para petugas medis dan berdiskusi tentang layanan kesehatan yang disediakan untuk masyarakat. Observasi di Puskesmas ini memberikan kami pemahaman tentang tantangan kesehatan yang dihadapi oleh desa ini dan bagaimana upaya kolaboratif dapat membantu meningkatkan akses dan kualitas layanan kesehatan.',15,'2023-07-13 12:20:01',NULL,NULL),(5,'Kegiatan Hari Ke-4: Pengiriman Surat Observasi Puskesmas dan Semangat Senam Bersama','Ing4rAmQgC.png','Pada tanggal 14 Juli 2023, kami tim KKN Desa Songan A melaksanakan sejumlah kegiatan yang berfokus pada pengiriman surat permohonan ke sekolah, observasi di Puskesmas desa, dan juga menggelar latihan senam bersama. Mari kita lanjutkan perjalanan seru kami dalam mengetahui lebih dalam tentang kehidupan dan aktivitas masyarakat desa ini.\n\n1. Pengiriman Surat Permohonan ke SD Negeri Songan A Pukul 08:00 - 11:00 WITA\nKegiatan kami awali dengan proses pengiriman surat permohonan ke SD Negeri Songan A. Surat ini berisi tentang rencana kegiatan kami di sekolah sebagai bagian dari program KKN. Kami ingin berkolaborasi dengan sekolah untuk memberikan tambahan ilmu dan berbagai kegiatan yang bermanfaat bagi para siswa. Respon dari pihak sekolah sangat positif, dan mereka menyambut baik inisiatif kami untuk berkontribusi di lingkungan sekolah.\n\n2. Observasi ke Puskesmas Pukul 09:00 - 11:00 WITA\nKami melanjutkan kegiatan untuk mengobservasi Puskesmas Desa Songan. Kami bertemu dengan para petugas medis dan berbincang tentang pelayanan kesehatan yang disediakan untuk masyarakat. Kami juga berdiskusi tentang upaya-upaya untuk meningkatkan kesadaran masyarakat tentang pentingnya kesehatan dan pencegahan penyakit. Observasi ini memberikan kami pemahaman lebih mendalam tentang sistem kesehatan di desa dan peran Puskesmas dalam memberikan pelayanan kesehatan yang berkelanjutan.\n\n3. Latihan Senam Pukul 16:00 - 17:00 WITA\nKami mengadakan latihan senam bersama tim yang bertempat di Posko KKNT untuk persiapan tampil di beberapa SD tujuan. Selain itu kegiatan ini bertujuan untuk mendorong gaya hidup sehat dan aktif di posko.',15,'2023-07-14 13:31:12',NULL,NULL),(6,'Kegiatan Hari Ke-5: Semangat Sehat Gotong Royong dan Kesadaran Bencana dalam KKNT','6AAU14f2Ms.png','Pada tanggal 15 Juli 2023, kami tim KKN Desa Songan A melakukan serangkaian kegiatan yang berfokus pada senam sehat bersama murid-murid SD, gotong royong bersama masyarakat desa, dan sosialisasi pentingnya pengurangan risiko bencana.\n\n1. Senam Healthy Week di SD 1 Songan dan SD 8 Songan Pukul 07:30 - 09:00 WITA\nKegiatan pagi hari dimulai dengan semangat dan keceriaan saat kami mengadakan Senam Healthy Week di SD 1 Songan dan SD 8 Songan. Acara ini dihadiri oleh para siswa dan guru-guru. Dengan latar belakang indahnya pemandangan Gunung Batur, senam menjadi momen berharga yang tidak hanya untuk kesehatan fisik, tetapi juga semangat kebersamaan dan kegembiraan. Melalui kegiatan ini, kami berharap dapat membangkitkan kesadaran akan pentingnya hidup sehat.\n\n2. Sosialisasi Pengurangan Risiko Bencana Pukul 09:00 - 11:00 WITA\nKami melanjutkan kegiatan dengan mengadakan sosialisasi tentang pengurangan risiko bencana di beberapa SD. Kegiatan ini bertujuan untuk meningkatkan kesadaran anak-anak di lingkungan sekolah mengenai potensi bencana alam di daerah mereka dan bagaimana cara mengurangi risiko serta menyiapkan diri menghadapinya. Kami menyampaikan informasi tentang berbagai bencana alam yang dapat terjadi di daerah ini, seperti gempa bumi, longsor, letusan Gunung Batur, dan banjir. Selain itu, kami juga berbagi pengetahuan tentang langkah-langkah yang dapat diambil untuk meningkatkan ketahanan dalam menghadapi bencana. Sosialisasi ini menjadi langkah penting dalam mempersiapkan dan melindungi Desa Songan A dari ancaman bencana.\n\n3. Melaksanakan Gotong Royong Bersama SD 8 Songan Pukul 09:00 - 10:00 WITA\nDi waktu yang sama dengan sosialisasi bencana, kami juga melibatkan diri dalam gotong royong bersama anak-anak sekolah, khususnya di SD 8 Songan. Gotong royong adalah warisan budaya yang penting bagi masyarakat Indonesia, dan kami senang bisa berkontribusi dalam upaya membersihkan dan merawat lingkungan sekolah. Bersama-sama, kami membersihkan halaman sekolah, mengangkat sampah, dan melakukan beberapa perbaikan kecil yang diperlukan. Gotong royong ini mencerminkan semangat kebersamaan dan tanggung jawab untuk merawat lingkungan sekitar.',15,'2023-07-15 12:43:20',NULL,NULL),(7,'Kegiatan Hari Ke-6: Gotong Royong dan Kolaborasi untuk Kemajuan Desa dalam KKNT','ykMcBszq23.jpg','Pada tanggal 16 Juli 2023, kami tim KKN Desa Songan A melaksanakan dua kegiatan penting yang melibatkan gotong royong dan kolaborasi dengan STT Desa Songan A dalam menyusun program kerja. \n\n1. Membersihkan Posko dan Lingkungan Sekitar Pukul 08:00 - 10:00 WITA\nKegiatan pagi dimulai dengan gotong royong membersihkan posko KKN dan lingkungan sekitar. Kami bersama tim bergotong royong membersihkan area posko, merapikan perabotan, dan membersihkan lingkungan agar tampak lebih rapi dan nyaman. Semangat gotong royong sangat terasa, dan kebersamaan dalam membersihkan lingkungan positif turut menyemangati kami untuk melanjutkan kegiatan KKN dengan penuh semangat. Melalui kegiatan ini, kami juga merasakan rasa kebersamaan yang semakin kuat dengan warga desa dalam upaya merawat dan mempercantik lingkungan sekitar.\n\n2. Berdiskusi Bersama STT Desa Songan A Terkait Program Kerja Pukul 14:00 - 16:00 WITA\nSore harinya, kami melakukan diskusi bersama organisasi pemuda-pemudi desa di masyarakat yaitu STT Desa Songan A untuk membahas program kerja yang akan kami jalankan selama sisa masa KKN. Diskusi ini menjadi kesempatan bagi kami untuk menyampaikan ide dan rencana kami dalam berkontribusi untuk pembangunan desa. Tim dari STT Desa juga memberikan masukan berharga dan memberikan pandangan lebih luas tentang kebutuhan dan potensi desa. Kolaborasi ini sangat penting untuk memastikan bahwa program yang kami jalankan relevan dan berdampak positif bagi masyarakat desa.',15,'2023-07-16 10:50:29',NULL,NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `email`, `username`, `password`, `firstname`, `lastname`, `created_at`, `updated_at`, `deleted_at`, `remember_token`) VALUES (1,'admin@gmail.com','Admin','$2y$10$TfnI92gFDbVDPzQq6AOxmObWm0KpjKMi7Og5S3R2XKDPeBv3C2Agq','Admin',NULL,'2023-06-25 03:58:17',NULL,NULL,NULL),(2,'listartha@undiksha.ac.id','I Made Edy Listartha, S.Kom., M.Kom.','$2y$10$oELUI8q3ncjRN6EtNCcVoOU8VKBTZ/SRyNtCxYx6iAdziTWf9ZPxe','I Made Edy Listartha, S.Kom., M.Kom.',NULL,'2023-07-17 03:58:13',NULL,NULL,NULL),(3,'andra.fahreza@undiksha.ac.id','Andra Fahreza','$2b$12$KoV3VPI2X8HhW.zgC4U43O/Jd2hjhW5/2yk5N9G/bB/qk9qZxQ6um','Andra Fahreza',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(4,'ayu.laras@undiksha.ac.id','Komang Ayu Laras Swati','$2b$12$cFG9H6klXJ7ARjA7w8u1/.NDl7ZbzHQ7esmN868OHt4YcrbxnMYCG','Komang Ayu Laras Swati',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(5,'ashya.siva@undiksha.ac.id','Ni Putu Ashya Siva Marshanda','$2b$12$PmOmjSDpvUoLf5e6VOKk/e3948JYWIFIKR0Z/qEYEoYShGHcWDPri','Ni Putu Ashya Siva Marshanda',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(6,'yesi.citrayani@undiksha.ac.id','Kadek Yesi Citrayani','$2b$12$BQB6ltNYq1/Ga8668xPBW..XdwgtXAH1qaryuNzoXw.TycOAMBvIq','Kadek Yesi Citrayani',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(7,'ayodhia@undiksha.ac.id','Putu Ayodhia Darsinita','$2b$12$FWq4UVoR15E/Nn4XDJjLve2Zz5LDjs1bU9lIjZJnvZJGlPaSSTfBO','Putu Ayodhia Darsinita',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(8,'putrayasa.4@undiksha.ac.id','Made Putrayasa','$2b$12$vU61SGcNchzDvhlc7n1cPORsCi.c54jJnbeUbg8OtLvF7P/uMVSzq','Made Putrayasa',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(9,'ayu.krisnayani@undiksha.ac.id','Ida Ayu Putu Krisnayani Putri','$2b$12$4J8jjBSYolYxR56BDDD0VOollVbMaRosv660lHb6h0zfGx0cgB72.','Ida Ayu Putu Krisnayani Putri',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(10,'tia.pratiwi.2@undiksha.ac.id','Ni Kadek Tia Pratiwi','$2b$12$4GCWrpEI3ahYV8QzbXZL7es7QaNxlth7VKsIfRPMvcgQ4noSbLdKG','Ni Kadek Tia Pratiwi',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(11,'st@undiksha.ac.id','St. Nur Septiani Chandra','$2b$12$uRMKGOSLXD2I7eVEdiuxbudzf0.DCD05HYzT0pf68b6ai7hDJQt5.','St. Nur Septiani Chandra',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(12,'andika.andara@undiksha.ac.id','Dewa Gede Andika Andara Putra','$2b$12$v0CeJuGQDORNZUlFwj1UQO8lDPH305qPSIQI/p/95g4/Y8l3ugTw.','Dewa Gede Andika Andara Putra',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(13,'rio.teguh@undiksha.ac.id','Kadek Rio Teguh Adnyana','$2b$12$2PJUcx5UEcak5wx1XF4LIefwiaXSfUse0NmI0f20fkVayXOjsBLr6','Kadek Rio Teguh Adnyana',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(14,'surya.ardi@undiksha.ac.id','Putu Surya Ardi Bhuana','$2b$12$ljZiOjT02LbpDtlZ3kZUcu2xz5mT0uXybq2P8Rnb2EwE0FjNGYchO','Putu Surya Ardi Bhuana',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(15,'gelgel.abdiutama@undiksha.ac.id','I Gede Gelgel Abdiutama','$2b$12$2sOChFPSKNwXTfpegCtDZuX7FZBOwJNjD8I0hW8jrR2.o.G84H4DO','I Gede Gelgel Abdiutama',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(16,'adith@undiksha.ac.id','Made Adith Mahendra','$2b$12$tHCqi6IMWWlSepz9Tckbb.fU8vskVfiSWIgOcgQhBP8Frrm/dAfG2','Made Adith Mahendra',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(17,'ariana.2@undiksha.ac.id','Kadek Ariana','$2b$12$RIpEnsPNKEgkTJZ.EPkaJubHsNLKEhKD2rDapxC.DO015tgLWrW7G','Kadek Ariana',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(18,'yasana@undiksha.ac.id','I Komang Ngurah Yasana','$2b$12$3w/WjlxytCMuy4LClJDFqu/Jz5KI33RNAPyOG5oz3AZn9jgI5/DMu','I Komang Ngurah Yasana',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(19,'dharma.sudana@undiksha.ac.id','Dewa Putu Dharma Sudana','$2b$12$Pqs3.KiVwd3dRSi3xllVaubHzuC.o7aTXviJCdf2B8ggwQVMe57Qe','Dewa Putu Dharma Sudana',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(20,'zivi@undiksha.ac.id','Zivi S Sitanggang','$2b$12$.66sE85Z3n2R3V8YLxZ2C.7aZaY4g9KmWqBSIVkwu6w/JmW1Y6VOS','Zivi S Sitanggang',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(21,'indra.dwisaputra@undiksha.ac.id','Indra Dwisaputra','$2b$12$uLePz.aICTPUnwIwv00kNulWANfOH18i8wWsD5Q/pZjq.5MAySAxa','Indra Dwisaputra',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(22,'varelly@undiksha.ac.id','Varelly Arletta Tyora Putri Herlambang','$2b$12$vONwoIamp0Zz1d1O1sP6LuuX48aLFBQRYY2gpyScDUARZXM881Geu','Varelly Arletta Tyora Putri Herlambang',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(23,'gita.ariani@undiksha.ac.id','Ketut Gita Ariani','$2b$12$4yRe2jTAO799ncdj3D83vORrWbuZZ1BiT/E78wjbm3yoSoUp4FUMm','Ketut Gita Ariani',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(24,'luluk.mukarromah@undiksha.ac.id','Luluk Mukarromah','$2b$12$PCyjBNPRP3Z10fuw4BK1GuAiFTxbFTZW.slTY.mx48TsbSa2OpKkG','Luluk Mukarromah',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(25,'polanda@undiksha.ac.id','Ida Polanda Nenepat','$2b$12$4MzHmKoPmq2mnPflY62lNOq46G8/GY1XEXrAQvpDZ68XHvB149Gka','Ida Polanda Nenepat',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(26,'marini.arianti@undiksha.ac.id','Ni Kadek Marini Arianti','$2b$12$iqsdpBLFuT.wuGShgTRyqO5X45zMZeCpDZEkbSWMkfdWIehuloS.a','Ni Kadek Marini Arianti',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL),(27,'teguh.brahmastra@undiksha.ac.id','I Gede Teguh Brahmastra Wiradharma','$2b$12$VwPj/D0cS449EMenLwAVVewrcKW2YAAwhjxwiA1NJ5xnvFosw2Y8e','I Gede Teguh Brahmastra Wiradharma',NULL,'2023-06-28 10:24:38',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'momentki_db_api-kknsongana'
--

--
-- Dumping routines for database 'momentki_db_api-kknsongana'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-10  9:03:55
