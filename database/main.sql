-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生時間： 2015 �?05 ??26 ??17:34
-- 伺服器版本: 5.6.24
-- PHP 版本： 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 資料庫： `question_list`
--

-- --------------------------------------------------------

--
-- 資料表結構 `main`
--

CREATE TABLE IF NOT EXISTS `main` (
  `questionID` int(4) unsigned zerofill NOT NULL,
  `questionDescription` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `trackID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice0` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice3` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `correctChoice` enum('0','1','2','3') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `main`
--
ALTER TABLE `main`
  ADD PRIMARY KEY (`questionID`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `main`
--
ALTER TABLE `main`
  MODIFY `questionID` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
