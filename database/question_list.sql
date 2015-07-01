-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生時間： 2015 �?07 ??01 ??23:32
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
-- 資料表結構 `chineese_fashion`
--

CREATE TABLE IF NOT EXISTS `chineese_fashion` (
  `questionID` int(4) unsigned zerofill NOT NULL,
  `questionDescription` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `preview_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice0` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice3` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `correctChoice` enum('0','1','2','3') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `chineese_fashion`
--

INSERT INTO `chineese_fashion` (`questionID`, `questionDescription`, `preview_url`, `choice0`, `choice1`, `choice2`, `choice3`, `correctChoice`) VALUES
(0001, '1', 'https://p.scdn.co/mp3-preview/a8bb715df398ce2868f23801ba7b2e6084b95ba7', '突然好想你', '為什麼', '紀念品', '步步', '0'),
(0002, '1', 'https://p.scdn.co/mp3-preview/ee359182cd495d9f910f9dc9d21cb4a559c827d8', 'Superwoman', '天使忌妒的生活', '背叛', '世界唯一的你', '2'),
(0003, '1', 'https://p.scdn.co/mp3-preview/2d78c09535bb79ed8776a09ef02bcecc652366a7', '少年', '童話', '那些年', '天使', '3'),
(0004, '1', 'https://p.scdn.co/mp3-preview/b6d4e1dc4bdafc935a0619ec475e7c6f6bdde217', '會痛的石頭', '王妃', '我不會愛', '善男信女', '1'),
(0005, '1', 'https://p.scdn.co/mp3-preview/380a3335c378da69bba895d73167307d54f4c5cd', '情歌', '那些年', '燃點', '小情歌', '1'),
(0006, '1', 'https://p.scdn.co/mp3-preview/8b7ab46bb518ffc2b3c27e863a57040664de5421', '燃點', '那些年', '傷心童話', '勉強', '0'),
(0007, '1', 'https://p.scdn.co/mp3-preview/5d9b6b6fd3f95a83174a071f707983817f8fc7b9', '人生海海', '倔強', '天使', '知足', '3'),
(0008, '1', 'https://p.scdn.co/mp3-preview/bcb2abe01e130461db74d910a0edbf74b6530e85', '初戀', '人生海海', '戀愛ing', '知足', '2'),
(0009, '1', 'https://p.scdn.co/mp3-preview/56f1f92e7bd0daedb41d234a7668926fc3c28a1d', '七里亭', '七里香', '退後', '擱淺', '1'),
(0010, '1', 'https://p.scdn.co/mp3-preview/d2cec0189c8c2f2f0aa54110f02ce50bec20cd1d', '用心良苦', '原來你什麼都不想要', '情歌王', '祝福', '2'),
(0011, '2', 'https://p.scdn.co/mp3-preview/152059cd46fcf272e10b3c4b1ec7547e04574afb', '方大同', '陳奕迅', '光良', '曹格', '1'),
(0012, '1', 'https://p.scdn.co/mp3-preview/7906ea2fe7c3001d80cce875800de0926acac01f', '十年', 'K歌之王', '勇氣', '愛情轉移', '3');

-- --------------------------------------------------------

--
-- 資料表結構 `chineese_oldies`
--

CREATE TABLE IF NOT EXISTS `chineese_oldies` (
  `questionID` int(4) unsigned zerofill NOT NULL,
  `questionDescription` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `preview_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice0` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice3` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `correctChoice` enum('0','1','2','3') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `chineese_oldies`
--

INSERT INTO `chineese_oldies` (`questionID`, `questionDescription`, `preview_url`, `choice0`, `choice1`, `choice2`, `choice3`, `correctChoice`) VALUES
(0001, '1', 'https://p.scdn.co/mp3-preview/9747a9d3ebe8de83cbc1136ffdfb0d47b43b494b', '新不了情', '不了情', '火鳥', '你把我灌醉', '0'),
(0002, '1', 'https://p.scdn.co/mp3-preview/520d028d4fd50b791eef2ef2965a03e1ed848e23', '屋頂', '你把我灌醉', '愛', '新不了情', '1'),
(0003, '1', 'https://p.scdn.co/mp3-preview/f6a80e5d101f973fe5d1ce5b2867cc6aed20b7d3', '火鳥功', '明日之歌', '火鳥', '天堂', '2'),
(0004, '1', 'https://p.scdn.co/mp3-preview/ba97b137e1a40cb0d0b23062a14da5723924cee6', '心情盒子', '愛情釀的酒', '花天囍事', '雙人枕頭', '3'),
(0005, '1', 'https://p.scdn.co/mp3-preview/2b1cb877be955796babb2352521497ca6c41f186', '野花', '遠方', '橄欖樹', '不要問我從那裏來', '2'),
(0006, '1', 'https://p.scdn.co/mp3-preview/e907a511a864a3cd1e939cd0a7e7c8257f10ac10', '當愛已成往事', '征服', '飄洋過海來看你', '大雨', '0'),
(0007, '1', 'https://p.scdn.co/mp3-preview/dfa74c9db465bea4dc2e0e991977d6dcd965a7f4', '蘭花草', '龍的傳人', '神話', '流浪者的獨白', '1'),
(0008, '1', 'https://p.scdn.co/mp3-preview/bf7100633d7b0d9e7b77f10b8e4ae31c4b98ab37', '愛像一首歌', '偶然', '變數', '微風往事', '3'),
(0009, '2', 'https://p.scdn.co/mp3-preview/b9304a125e5774c24991722aa485156f82277ce8', '潘越雲', '鄧麗君', '江蕙', '蔡琴', '1'),
(0010, '2', 'https://p.scdn.co/mp3-preview/e0a863c06679c61c4c909b203fd4bf1103100d91', '鄭怡', '王夢麟', '金智娟', '陳明韶', '3'),
(0011, '2', 'https://p.scdn.co/mp3-preview/3f253e8365b2fce7dcefcdb0886cf75066640ee4', '黃韻玲', '蔡琴', '鄧麗君', '潘越雲', '1'),
(0012, '2', 'https://p.scdn.co/mp3-preview/df570cc92f65a723f39400841e9e06cf2c0124c5', '袁惟仁', '施效榮', '羅大佑', '胡德夫', '2');

-- --------------------------------------------------------

--
-- 資料表結構 `classical`
--

CREATE TABLE IF NOT EXISTS `classical` (
  `questionID` int(4) unsigned zerofill NOT NULL,
  `questionDescription` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `preview_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice0` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice3` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `correctChoice` enum('0','1','2','3') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `classical`
--

INSERT INTO `classical` (`questionID`, `questionDescription`, `preview_url`, `choice0`, `choice1`, `choice2`, `choice3`, `correctChoice`) VALUES
(0001, '1', 'https://p.scdn.co/mp3-preview/358bf57820965a6ba2121c4e30e4f731e6b192ad', '命運交響曲', '卡農', '給艾莉絲', '綠鋼琴', '1'),
(0002, '1', 'https://p.scdn.co/mp3-preview/102487af3520a267270331032817b84820cc5598', '小夜曲', '天鵝湖', '胡桃鉗', '納布科', '2'),
(0003, '1', 'https://p.scdn.co/mp3-preview/6500075650ffacac51bbc43aa9ccdd61f2a18b84', '皇帝鋼琴協奏曲', '給愛麗絲', '悲愴奏鳴曲', '卡農', '1'),
(0004, '1', 'https://p.scdn.co/mp3-preview/2e47de1857b4fb155d7156b1b4be2a0b71fdbb5a', '蝴蝶夫人', '波麗路', '田園交響曲', '莫爾道河', '3'),
(0005, '1', 'https://p.scdn.co/mp3-preview/b8727a9c228251cfb2046c2f6ad4fd6f6f08676a', '月光', '黑娃娃的步態舞', '新世界', '波西米亞人', '0'),
(0006, '2', 'https://p.scdn.co/mp3-preview/99e2bb7ac17704056b390473e71c841b703dbd64', '貝多芬', '李斯特', '蕭邦', '孟德爾頌', '1'),
(0007, '2', 'https://p.scdn.co/mp3-preview/4d6d0c10e0afa1226d2c5767d35853c26680f1bd', '巴哈', '韓德爾', '拉威爾', '貝多芬', '3'),
(0008, '1', 'https://p.scdn.co/mp3-preview/8e24835be79005fa75f059efc05b3ad66cd2a502', '恙羊將安然牧放', '威風凜凜進行曲', '天堂與地獄-序曲', '善變的女人', '1'),
(0009, '1', 'https://p.scdn.co/mp3-preview/2cbed05e1a189a9b7199b200037dbca18b0fcc0d', '弄臣', '聖城', '彌賽亞', '綠袖子幻想曲', '0'),
(0010, '2', 'https://p.scdn.co/mp3-preview/f26ef15e676fa24794e777be4a154a60a3f89f4d', '德弗札克', '孟德爾頌', '拉赫曼尼諾夫', '比才', '2'),
(0011, '1', 'https://p.scdn.co/mp3-preview/4fd74bd83dd00c0250445f12781e676737af52cd', '小號志願軍', '耶路撒冷', '鄉間騎士-間奏曲', '拉赫曼尼諾夫第二號鋼琴協奏曲', '2'),
(0012, '1', 'https://p.scdn.co/mp3-preview/14162668f9a77d073601402b214528bf1e990e4c', '波麗露', '新世界', '聖母頌', '貝加摩組曲', '0');

-- --------------------------------------------------------

--
-- 資料表結構 `english_fashion`
--

CREATE TABLE IF NOT EXISTS `english_fashion` (
  `questionID` int(4) unsigned zerofill NOT NULL,
  `questionDescription` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `preview_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice0` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice3` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `correctChoice` enum('0','1','2','3') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `english_fashion`
--

INSERT INTO `english_fashion` (`questionID`, `questionDescription`, `preview_url`, `choice0`, `choice1`, `choice2`, `choice3`, `correctChoice`) VALUES
(0003, '1', 'https://p.scdn.co/mp3-preview/b5d84fa741a3b61b7ed990b32d7b1780055f70cb', 'I Still Love You', 'Love You', 'Love Me Like You Do', 'Love!Love!Love!', '0'),
(0002, '1', 'https://p.scdn.co/mp3-preview/cad3fbcd3641c8f38ddd3deea84ebf41f2fadb33', 'Call My Name', 'Sunshine', 'Once In a Lifetime', 'Forever Love', '2'),
(0001, '1', 'https://p.scdn.co/mp3-preview/6d0687d0d81607f508f87a88a74b60da166e7f6b', 'Somewhere', 'It''s My Life', 'Bad Day', 'Over the Rainbow', '3'),
(0004, '1', 'https://p.scdn.co/mp3-preview/95311c6a9b802313f14f27f5ebbd9302a5d66d45', 'Photograph', 'Resource', 'Mama Song', 'Gravity', '2'),
(0005, '1', 'https://p.scdn.co/mp3-preview/4ac304a89add409df0e2accb32c85e39290668c6', 'The Miracle', 'That''s Why Jesus Is The Greatest Name Of All', 'My Name Is Love', 'Miracle Savior', '1'),
(0006, '1', 'https://p.scdn.co/mp3-preview/77a396d4c674cb136d42de82b9e2b8476bd3a0b3', 'Water', 'Firework', 'Fire', 'Name That Tune', '1'),
(0007, '1', 'https://p.scdn.co/mp3-preview/8bd835a7e6ada78dce36ef9a7c0a3c08e6603e35', 'Let It Be', 'Let It Go', 'World', 'Earth', '1'),
(0008, '1', 'https://p.scdn.co/mp3-preview/74d5ba6b59f2daf0e29aa88b2500cee2c07254ce', 'Lemon Tree', 'Orange Tree', 'Yellow Ribbon', 'Blue Ribbon', '0'),
(0009, '1', 'https://p.scdn.co/mp3-preview/dc1c2d35bcf911e7769c0aa99c062666ac3643b1', 'Waiting For', 'Love! Love! Love!', 'Love Me Like You Do', 'Like Me', '2'),
(0010, '1', 'https://p.scdn.co/mp3-preview/7c7c47fbb3aafeead95cdd056de8dc814b600a24', 'This Year', 'My Heart', 'Heart', 'Last Christmas', '3'),
(0011, '2', 'https://p.scdn.co/mp3-preview/c02ae8aaefda8e81f30faf798da1fed2288824bc', '泰勒·絲薇芙特', '愛黛兒', 'Lady Gaga', '艾薇兒', '3'),
(0012, '2', 'https://p.scdn.co/mp3-preview/855d50bbbb57a6451020a4f6cedd1a2fa32ecfad', '魔力紅', '邦喬飛', '西城男孩', '聯合公園', '1');

-- --------------------------------------------------------

--
-- 資料表結構 `english_oldies`
--

CREATE TABLE IF NOT EXISTS `english_oldies` (
  `questionID` int(4) unsigned zerofill NOT NULL,
  `questionDescription` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `preview_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice0` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice1` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice2` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `choice3` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `correctChoice` enum('0','1','2','3') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 資料表的匯出資料 `english_oldies`
--

INSERT INTO `english_oldies` (`questionID`, `questionDescription`, `preview_url`, `choice0`, `choice1`, `choice2`, `choice3`, `correctChoice`) VALUES
(0004, '1', 'https://p.scdn.co/mp3-preview/51c054beddf80deb5fc2e4d2387787464f4e2b25', 'Angel Queen', 'On Top of The World', 'Top of The World', 'All I Have To Do Is Dream', '3'),
(0003, '1', 'https://p.scdn.co/mp3-preview/ba09a57a80c864f98f0e1cefcb0ee2014e116a6b', 'Puppy Love', 'Only Love', 'Endless Love', 'Un-Break My Heart', '0'),
(0002, '1', 'https://p.scdn.co/mp3-preview/641ca9aa1a20cff09eb0d70efd988049c3a4b4b1', 'When Will I See You Again', 'Reality', 'Without You', 'All Out Of Love', '2'),
(0001, '1', 'https://p.scdn.co/mp3-preview/230a088ce14560fc941d2a548fd15feb086a127e', 'It''s Only Make Believe', 'Knock Three Times', 'Legends', 'Up Where We Belong', '1'),
(0005, '1', 'https://p.scdn.co/mp3-preview/b3011c682f42a5572993b8862ff8fa91f15659b9', 'Let There Be Rock', 'Let It Be Me', 'Let It Go', 'Let It Be', '3'),
(0006, '1', 'https://p.scdn.co/mp3-preview/053639a208bc9f0b767f3ef622746526c9549b0a', 'A Song For You', 'Top of The World', 'On Top of The World', 'All I Have To Do Is Dream', '1'),
(0007, '1', 'https://p.scdn.co/mp3-preview/e7771d22d97b062800f7e3316f3ed913c9b1a8d6', 'Blue Blue Tree', 'One Summer', 'Take A Shower', 'Lemon Tree', '3'),
(0008, '1', 'https://p.scdn.co/mp3-preview/3b972bba57d54f2eebdfcce9bd85d8b6054ec0c3', 'Hotel California', 'Switch Lanes', 'Molly', 'Dear Heart', '0'),
(0009, '1', 'https://p.scdn.co/mp3-preview/35a61a7b745fc8bc68c6162d17fe78a7a55b99aa', 'Penny Lane', 'Yesterday', 'She Loves You', 'My Sweet Lord', '0'),
(0010, '1', 'https://p.scdn.co/mp3-preview/9e3a5d1a7c1c015cd18dde6e2eb0c37e39aaac75', 'My Heart Will Go On', 'We Are The World', 'Take Me to Your Heart', 'Making Love Out of Nothing at All', '0'),
(0011, '2', 'https://p.scdn.co/mp3-preview/885021ec9b6ac110238a9463bdcc0dc6d4778cec', 'Air Supply', 'George Michael', 'San Francisco', 'Andy Williams', '1'),
(0012, '2', 'https://p.scdn.co/mp3-preview/4022572b341986547d1de2a597779aba431c4d87', 'Carpenters', 'Ray Charles', 'Michael Bolton', 'Air Supply', '3');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `chineese_fashion`
--
ALTER TABLE `chineese_fashion`
  ADD PRIMARY KEY (`questionID`);

--
-- 資料表索引 `chineese_oldies`
--
ALTER TABLE `chineese_oldies`
  ADD PRIMARY KEY (`questionID`);

--
-- 資料表索引 `classical`
--
ALTER TABLE `classical`
  ADD PRIMARY KEY (`questionID`);

--
-- 資料表索引 `english_fashion`
--
ALTER TABLE `english_fashion`
  ADD PRIMARY KEY (`questionID`);

--
-- 資料表索引 `english_oldies`
--
ALTER TABLE `english_oldies`
  ADD PRIMARY KEY (`questionID`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `chineese_fashion`
--
ALTER TABLE `chineese_fashion`
  MODIFY `questionID` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- 使用資料表 AUTO_INCREMENT `chineese_oldies`
--
ALTER TABLE `chineese_oldies`
  MODIFY `questionID` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- 使用資料表 AUTO_INCREMENT `classical`
--
ALTER TABLE `classical`
  MODIFY `questionID` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- 使用資料表 AUTO_INCREMENT `english_fashion`
--
ALTER TABLE `english_fashion`
  MODIFY `questionID` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- 使用資料表 AUTO_INCREMENT `english_oldies`
--
ALTER TABLE `english_oldies`
  MODIFY `questionID` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
