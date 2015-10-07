/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- Create database
CREATE DATABASE IF NOT EXISTS mini_blog CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Use database
USE mini_blog;

--
-- Character encoding setting
--
SET NAMES utf8;

--
-- 'user' table structure
--

CREATE TABLE IF NOT EXISTS `user` (
        `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
        `username` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
        `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
        `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
        `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
        `api_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
        `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
        `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
        `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
        PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci

--
-- 'post' table structure
--
CREATE TABLE `post` (
        `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
        `user_id` int(10) unsigned NOT NULL,
        `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
        `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
        `content` text COLLATE utf8_unicode_ci NOT NULL,
        `status` tinyint(4) NOT NULL,
        `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
        `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
        `published_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
        PRIMARY KEY (`id`),
        UNIQUE KEY `post_slug_unique` (`slug`),
        KEY `post_user_id_foreign` (`user_id`),
        CONSTRAINT `post_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
    ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci

--
-- 'comment' table structure
--
CREATE TABLE `comment` (
        `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
        `user_id` int(10) unsigned NOT NULL,
        `post_id` int(10) unsigned NOT NULL,
        `content` text COLLATE utf8_unicode_ci NOT NULL,
        `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
        `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
        `published_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
        PRIMARY KEY (`id`),
        UNIQUE KEY `post_slug_unique` (`slug`),
        KEY `post_user_id_foreign` (`user_id`),
        KEY `post_user_id_foreign` (`post_id`),
        CONSTRAINT `post_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
        CONSTRAINT `post_user_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE
    ) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci
