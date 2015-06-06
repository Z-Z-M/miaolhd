-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2015-06-06 19:04:26
-- 服务器版本： 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cainiao`
--

-- --------------------------------------------------------

--
-- 表的结构 `cn_article`
--

CREATE TABLE IF NOT EXISTS `cn_article` (
  `id` int(10) NOT NULL COMMENT 'id',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `categoryid` int(10) NOT NULL COMMENT '类别id',
  `addtime` varchar(11) DEFAULT NULL COMMENT '添加时间',
  `addip` varchar(15) DEFAULT NULL COMMENT '添加ip',
  `updatetime` varchar(11) DEFAULT NULL COMMENT '最后修改时间',
  `updateip` varchar(15) DEFAULT NULL COMMENT '最后修改ip',
  `writer` varchar(50) DEFAULT NULL COMMENT '作者',
  `status` smallint(6) DEFAULT '1' COMMENT '状态1是正常2是禁用-1是删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';

-- --------------------------------------------------------

--
-- 表的结构 `cn_category`
--

CREATE TABLE IF NOT EXISTS `cn_category` (
  `id` int(10) NOT NULL COMMENT 'id',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `pid` smallint(6) NOT NULL DEFAULT '1' COMMENT '父级导航id,0代表是父级导航',
  `type` smallint(6) NOT NULL DEFAULT '0' COMMENT '导航类型，1代表是列表页面,2代表是单页面',
  `rank` smallint(6) NOT NULL COMMENT '显示顺序',
  `status` smallint(6) NOT NULL DEFAULT '1' COMMENT '状态,1是正常显示，2是禁用',
  `image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类别';

-- --------------------------------------------------------

--
-- 表的结构 `cn_check_log`
--

CREATE TABLE IF NOT EXISTS `cn_check_log` (
  `id` int(10) NOT NULL,
  `ip_address` varchar(15) NOT NULL COMMENT 'ip地址',
  `error_content` varchar(50) NOT NULL COMMENT '错误内容',
  `add_time` int(11) unsigned DEFAULT NULL COMMENT '添加时间'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='检查登录表';

--
-- 转存表中的数据 `cn_check_log`
--

INSERT INTO `cn_check_log` (`id`, `ip_address`, `error_content`, `add_time`) VALUES
(1, '127.0.0.1', '用户名或密码错误', 1402030958),
(2, '127.0.0.1', '用户名或密码错误', 1426039496),
(3, '127.0.0.1', '用户名或密码错误', 1426039615),
(4, '127.0.0.1', '用户名或密码错误', 1426040233),
(5, '127.0.53.53', '用户名或密码错误', 1433510692),
(6, '127.0.53.53', '用户名或密码错误', 1433510702);

-- --------------------------------------------------------

--
-- 表的结构 `cn_config_admin`
--

CREATE TABLE IF NOT EXISTS `cn_config_admin` (
  `name` varchar(50) NOT NULL COMMENT '后台名称',
  `logo` varchar(50) DEFAULT NULL COMMENT '后台logo，位于assets/web/logo目录下',
  `resources` varchar(50) NOT NULL COMMENT '资源存放文件夹，位于根目录下',
  `css` varchar(50) NOT NULL COMMENT 'CSS存放文件夹，位于assets/admin目录下',
  `js` varchar(50) NOT NULL COMMENT 'JS存放文件夹，位于assets/admin目录下',
  `img` varchar(50) NOT NULL COMMENT 'img存放文件夹，位于assets/admin目录下',
  `editor` varchar(50) NOT NULL COMMENT '在线编辑器存放文件夹，位于assets/admin目录下',
  `art` varchar(50) NOT NULL COMMENT '弹窗存放文件夹，位于assets/admin目录下',
  `uploads` varchar(50) NOT NULL COMMENT '上传存放文件夹，位于assets/admin目录下',
  `valicode` varchar(50) NOT NULL COMMENT '验证码文件夹，位于assets/admin目录下',
  `upload_image_size` int(10) unsigned DEFAULT '1048576' COMMENT '上传图片大小，默认 1048576 byte',
  `upload_flash_size` int(10) unsigned DEFAULT '1048576' COMMENT '上传动画大小，默认 1048576 byte',
  `upload_media_size` int(10) unsigned DEFAULT '1048576' COMMENT '上传视频大小，默认 1048576 byte',
  `upload_file_size` int(10) unsigned DEFAULT '1048576' COMMENT '上传文件大小，默认 1048576 byte',
  `encryption_key_begin` varchar(20) NOT NULL COMMENT '开始密钥',
  `encryption_key_end` varchar(20) NOT NULL COMMENT '结束密钥',
  `theme` varchar(50) DEFAULT 'default' COMMENT '后台主题，位于 application/views 下',
  `email_status` tinyint(1) unsigned DEFAULT '2' COMMENT '开启邮件，2是关闭，1是开启，默认是2',
  `email_smtp` varchar(20) DEFAULT NULL COMMENT 'SMTP服务器地址',
  `email_port` tinyint(2) unsigned DEFAULT '25' COMMENT 'SMTP服务器端口，默认25',
  `email_title` varchar(50) DEFAULT '测试邮箱' COMMENT '邮件标题',
  `email_username` varchar(50) DEFAULT NULL COMMENT '邮件署名',
  `email_user` varchar(50) DEFAULT NULL COMMENT '发件人电子邮箱',
  `email_password` varchar(50) DEFAULT NULL COMMENT '发件人电子邮箱密码',
  `email_content` varchar(50) DEFAULT '这是一个测试邮件' COMMENT '邮件测试内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台配置表';

--
-- 转存表中的数据 `cn_config_admin`
--

INSERT INTO `cn_config_admin` (`name`, `logo`, `resources`, `css`, `js`, `img`, `editor`, `art`, `uploads`, `valicode`, `upload_image_size`, `upload_flash_size`, `upload_media_size`, `upload_file_size`, `encryption_key_begin`, `encryption_key_end`, `theme`, `email_status`, `email_smtp`, `email_port`, `email_title`, `email_username`, `email_user`, `email_password`, `email_content`) VALUES
('后台管理', 'logo20.png', 'assets', 'css', 'js', 'img', 'kindeditor', 'artDialog', 'uploads', 'valicode', 1048576, 1048576, 1048576, 1048576, 'ushiba', '7788', 'default', 1, '', 25, '测试', '有事吧', '', 'anhui99', '这是一个测试邮件');

-- --------------------------------------------------------

--
-- 表的结构 `cn_config_web`
--

CREATE TABLE IF NOT EXISTS `cn_config_web` (
  `name` varchar(50) NOT NULL COMMENT '站点名称',
  `logo` varchar(50) DEFAULT NULL COMMENT '站点logo，位于assets/web/logo目录下',
  `icp` varchar(50) DEFAULT NULL COMMENT '站点备案号',
  `statistical_code` text COMMENT '站点统计代码',
  `share_code` text COMMENT '站点分享代码',
  `keywords` varchar(200) NOT NULL COMMENT '站点关键字',
  `description` varchar(200) NOT NULL COMMENT '站点描述',
  `resources` varchar(50) NOT NULL COMMENT '资源存放文件夹，位于根目录下',
  `css` varchar(50) NOT NULL COMMENT 'CSS存放文件夹，位于assets/web目录下',
  `js` varchar(50) NOT NULL COMMENT 'JS存放文件夹，位于assets/web目录下',
  `img` varchar(50) NOT NULL COMMENT 'img存放文件夹，位于assets/web目录下',
  `editor` varchar(50) NOT NULL COMMENT '在线编辑器存放文件夹，位于assets/web目录下',
  `art` varchar(50) NOT NULL COMMENT '弹窗存放文件夹，位于assets/admin目录下',
  `uploads` varchar(50) NOT NULL COMMENT '上传存放文件夹，位于assets/web目录下',
  `valicode` varchar(50) NOT NULL COMMENT '验证码文件夹，位于assets/web目录下',
  `upload_image_size` int(10) unsigned DEFAULT '1048576' COMMENT '上传图片大小',
  `upload_flash_size` int(10) unsigned DEFAULT '1048576' COMMENT '上传动画大小',
  `upload_media_size` int(10) unsigned DEFAULT '1048576' COMMENT '上传视频大小',
  `upload_file_size` int(10) unsigned DEFAULT '1048576' COMMENT '上传文件大小',
  `encryption_key_begin` varchar(20) DEFAULT NULL COMMENT '开始密钥',
  `encryption_key_end` varchar(20) DEFAULT NULL COMMENT '结束密钥',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '站点状态，1 = 正常，2 = 关闭',
  `close_reason` varchar(200) DEFAULT NULL COMMENT '站点关闭原因',
  `reg_agreement` text COMMENT '站点注册协议',
  `theme` varchar(50) DEFAULT 'default' COMMENT '站点主题，位于 application/views 下',
  `email_status` tinyint(1) unsigned DEFAULT '2' COMMENT '开启邮件，2是关闭，1是开启，默认是2',
  `email_smtp` varchar(20) DEFAULT NULL COMMENT 'SMTP服务器地址',
  `email_port` tinyint(2) unsigned DEFAULT '25' COMMENT 'SMTP服务器端口，默认25',
  `email_title` varchar(50) DEFAULT '测试邮箱' COMMENT '测试邮箱',
  `email_username` varchar(50) DEFAULT NULL COMMENT '邮件署名',
  `email_user` varchar(50) DEFAULT NULL COMMENT '发件人电子邮箱',
  `email_password` varchar(50) DEFAULT NULL COMMENT '发件人电子邮箱密码',
  `email_content` varchar(50) DEFAULT '这是一个测试邮件' COMMENT '邮件测试内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='站点配置表';

--
-- 转存表中的数据 `cn_config_web`
--

INSERT INTO `cn_config_web` (`name`, `logo`, `icp`, `statistical_code`, `share_code`, `keywords`, `description`, `resources`, `css`, `js`, `img`, `editor`, `art`, `uploads`, `valicode`, `upload_image_size`, `upload_flash_size`, `upload_media_size`, `upload_file_size`, `encryption_key_begin`, `encryption_key_end`, `status`, `close_reason`, `reg_agreement`, `theme`, `email_status`, `email_smtp`, `email_port`, `email_title`, `email_username`, `email_user`, `email_password`, `email_content`) VALUES
('大数据系统', 'logo.png', '', '', '', '有事吧，有事没事都来吧。', '有事吧，有事没事都来吧。', 'assets', 'css', 'js', 'images', 'kindeditor', 'artDialog', 'uploads', 'valicode', 1048576, 1048576, 1048576, 1048576, 'ushiba', '7788', 2, '网站维护升级中...', '测试', 'default', 2, '', 25, '测试邮箱', NULL, '', 'anhui99', '这是一个测试邮件');

-- --------------------------------------------------------

--
-- 表的结构 `cn_email_log`
--

CREATE TABLE IF NOT EXISTS `cn_email_log` (
  `id` int(11) NOT NULL COMMENT 'id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型1是忘记密码邮件2是注册邮件',
  `title` varchar(50) NOT NULL COMMENT '邮件标题',
  `content` text NOT NULL COMMENT '邮件内容',
  `email` varchar(50) NOT NULL COMMENT '接收电子邮箱地址',
  `status` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '0未发送，1发送成功，2发送失败',
  `addtime` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `sendtime` int(10) unsigned DEFAULT NULL COMMENT '发送时间',
  `addip` varchar(50) NOT NULL COMMENT '添加ip',
  `active_time` int(10) unsigned DEFAULT '0' COMMENT '激活时间',
  `code` varchar(10) NOT NULL COMMENT '激活码',
  `url` varchar(100) NOT NULL COMMENT '激活地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件记录表';

-- --------------------------------------------------------

--
-- 表的结构 `cn_groups`
--

CREATE TABLE IF NOT EXISTS `cn_groups` (
  `id` mediumint(8) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cn_groups`
--

INSERT INTO `cn_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- 表的结构 `cn_link`
--

CREATE TABLE IF NOT EXISTS `cn_link` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `url` varchar(200) NOT NULL COMMENT '网址',
  `rank` smallint(6) DEFAULT NULL COMMENT '排序',
  `thumb` varchar(100) DEFAULT NULL COMMENT '图片',
  `addtime` varchar(10) NOT NULL COMMENT '添加时间',
  `updatetime` varchar(10) NOT NULL COMMENT '更新时间',
  `addip` varchar(15) NOT NULL COMMENT '添加ip',
  `updateip` varchar(15) NOT NULL COMMENT '更新ip',
  `addip_address` varchar(50) DEFAULT NULL COMMENT '添加ip地址',
  `updateip_address` varchar(50) DEFAULT NULL COMMENT '更新ip地址',
  `status` smallint(6) NOT NULL COMMENT '状态1是正常'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接';

--
-- 转存表中的数据 `cn_link`
--

INSERT INTO `cn_link` (`id`, `name`, `url`, `rank`, `thumb`, `addtime`, `updatetime`, `addip`, `updateip`, `addip_address`, `updateip_address`, `status`) VALUES
(1, '百度', 'http://www.baidu.com', 0, '/admin/../assets/admin/default/uploads/image/20140611/886649a7bbd8aee9b10d34c724088391.jpg', '1402461952', '', '127.0.0.1', '', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cn_login_attempts`
--

CREATE TABLE IF NOT EXISTS `cn_login_attempts` (
  `id` int(11) unsigned NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cn_manager`
--

CREATE TABLE IF NOT EXISTS `cn_manager` (
  `id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT '3a0f0fee92a4fd13fb3f1c2bfcb3eac5' COMMENT '密码',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机',
  `phone_status` tinyint(1) DEFAULT '2' COMMENT '手机认证状态：1是认证2是未认证',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `email_status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '邮箱激活状态：1是激活2是未激活',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1是正常，2是禁用',
  `skin` varchar(20) DEFAULT 'cerulean' COMMENT '主题',
  `last_log_time` int(10) unsigned DEFAULT NULL COMMENT '上次登录时间',
  `now_log_time` int(10) unsigned DEFAULT NULL COMMENT '现在登录时间'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='后台管理员表';

--
-- 转存表中的数据 `cn_manager`
--

INSERT INTO `cn_manager` (`id`, `username`, `password`, `nickname`, `phone`, `phone_status`, `email`, `email_status`, `role_id`, `status`, `skin`, `last_log_time`, `now_log_time`) VALUES
(1, 'admin', '3a0f0fee92a4fd13fb3f1c2bfcb3eac5', '超级管理员', '13989373135', 1, 'shangshanxiaoyao@163.com', 1, 1, 1, 'cerulean', 1433598241, 1433605669),
(2, '123456', '3a0f0fee92a4fd13fb3f1c2bfcb3eac5', '', '', 2, '707069100@qq.com', 2, 2, 1, 'cerulean', 1433513365, 1433513392);

-- --------------------------------------------------------

--
-- 表的结构 `cn_manager_logging`
--

CREATE TABLE IF NOT EXISTS `cn_manager_logging` (
  `id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `activity` varchar(500) DEFAULT NULL COMMENT '活动',
  `url` varchar(50) DEFAULT NULL COMMENT 'url',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色id',
  `time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `ip` varchar(50) NOT NULL COMMENT 'ip',
  `ip_address` varchar(50) DEFAULT NULL COMMENT 'ip地址'
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COMMENT='登录、活动、日志表';

--
-- 转存表中的数据 `cn_manager_logging`
--

INSERT INTO `cn_manager_logging` (`id`, `username`, `activity`, `url`, `role_id`, `time`, `ip`, `ip_address`) VALUES
(1, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1397629922, '127.0.0.1', NULL),
(2, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][首页][1][1]', 'category/form', 1, 1397630003, '127.0.0.1', NULL),
(3, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][会员概况][1][1]', 'category/form', 1, 1397630353, '127.0.0.1', NULL),
(4, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[2][会员数据统计][1][1]', 'category/form', 1, 1397630399, '127.0.0.1', NULL),
(5, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[2][执常委名录][2][1]', 'category/form', 1, 1397630478, '127.0.0.1', NULL),
(6, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[2][团体会员][3][1]', 'category/form', 1, 1397630489, '127.0.0.1', NULL),
(7, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][全国工商联章程][2][1]', 'category/form', 1, 1397630497, '127.0.0.1', NULL),
(8, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(category),更改后的数据为：[1][入会申请][1]', 'category/form/6', 1, 1397630513, '127.0.0.1', NULL),
(9, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[6][全国工商联章程][1][1]', 'category/form', 1, 1397630528, '127.0.0.1', NULL),
(10, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[6][宁波市商会章程][2][1]', 'category/form', 1, 1397630536, '127.0.0.1', NULL),
(11, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[6][入会须知][3][1]', 'category/form', 1, 1397630546, '127.0.0.1', NULL),
(12, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[6][入会申请][4][1]', 'category/form', 1, 1397630558, '127.0.0.1', NULL),
(13, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][基层组织][3][1]', 'category/form', 1, 1397630573, '127.0.0.1', NULL),
(14, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[11][基层组织动态][1][1]', 'category/form', 1, 1397630620, '127.0.0.1', NULL),
(15, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[11][基层组织概况][2][1]', 'category/form', 1, 1397630629, '127.0.0.1', NULL),
(16, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[11][直属商会][3][1]', 'category/form', 1, 1397630637, '127.0.0.1', NULL),
(17, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[11][经验交流][4][1]', 'category/form', 1, 1397630646, '127.0.0.1', NULL),
(18, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][参政议政][4][1]', 'category/form', 1, 1397630658, '127.0.0.1', NULL),
(19, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[16][委员名录][1][1]', 'category/form', 1, 1397630668, '127.0.0.1', NULL),
(20, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[16][团体提案][2][1]', 'category/form', 1, 1397630677, '127.0.0.1', NULL),
(21, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[16][委员之声][3][1]', 'category/form', 1, 1397630685, '127.0.0.1', NULL),
(22, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[16][调研报告][4][1]', 'category/form', 1, 1397630694, '127.0.0.1', NULL),
(23, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][经济服务][5][1]', 'category/form', 1, 1397630703, '127.0.0.1', NULL),
(24, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[21][融资服务][1][1]', 'category/form', 1, 1397630711, '127.0.0.1', NULL),
(25, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[21][财经广角][2][1]', 'category/form', 1, 1397630723, '127.0.0.1', NULL),
(26, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[21][会展资讯][3][1]', 'category/form', 1, 1397630732, '127.0.0.1', NULL),
(27, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[21][教育培训][4][1]', 'category/form', 1, 1397630740, '127.0.0.1', NULL),
(28, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[21][土地厂房供求信息][5][1]', 'category/form', 1, 1397630749, '127.0.0.1', NULL),
(29, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][企业文化][6][1]', 'category/form', 1, 1397630757, '127.0.0.1', NULL),
(30, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[27][企业文化论坛][1][1]', 'category/form', 1, 1397630764, '127.0.0.1', NULL),
(31, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[27][企业文化动态][2][1]', 'category/form', 1, 1397630809, '127.0.0.1', NULL),
(32, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[27][经验交流][3][1]', 'category/form', 1, 1397630817, '127.0.0.1', NULL),
(33, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][光彩事件][7][1]', 'category/form', 1, 1397630831, '127.0.0.1', NULL),
(34, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[31][光彩事业简介][1][1]', 'category/form', 1, 1397630840, '127.0.0.1', NULL),
(35, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[31][光彩事业倡议书][2][1]', 'category/form', 1, 1397630855, '127.0.0.1', NULL),
(36, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[31][光彩事业章程][3][1]', 'category/form', 1, 1397630866, '127.0.0.1', NULL),
(37, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[31][光彩事业动态][4][1]', 'category/form', 1, 1397630874, '127.0.0.1', NULL),
(38, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][培机构][8][1]', 'category/form', 1, 1397630893, '127.0.0.1', NULL),
(39, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[1][公告通知][9][1]', 'category/form', 1, 1397630900, '127.0.0.1', NULL),
(40, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(category),更改后的数据为：[1][培训机构][1]', 'category/form/36', 1, 1397630917, '127.0.0.1', NULL),
(41, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1397694795, '127.0.0.1', NULL),
(42, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1399430555, '127.0.0.1', NULL),
(43, 'admin', '角色：[超级管理员]，用户名：[admin]退出系统', 'login/logout', 1, 1399431885, '127.0.0.1', NULL),
(44, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1400222529, '127.0.0.1', NULL),
(45, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1400809676, '127.0.0.1', NULL),
(46, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1400810874, '127.0.0.1', NULL),
(47, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1400827824, '127.0.0.1', NULL),
(48, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1401848108, '127.0.0.1', NULL),
(49, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1401865492, '127.0.0.1', NULL),
(50, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[0][fdgdsg][10][1]', 'category/form', 1, 1401865704, '127.0.0.1', NULL),
(51, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(category),更改后的数据为：[0][fdgdsg][1]', 'category/form/38', 1, 1401865728, '127.0.0.1', NULL),
(52, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(category),更改后的数据为：[2][fdgdsg][1]', 'category/form/38', 1, 1401865795, '127.0.0.1', NULL),
(53, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1401931703, '127.0.0.1', NULL),
(54, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1401931703, '127.0.0.1', NULL),
(55, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1401947746, '127.0.0.1', NULL),
(56, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(slide),添加的数据为：[1][测试][][][/admin/../assets/admin/default/uploads/image/20140605/b836f1e4948456739da1cdc38035cf58.jpg][1][1401947774][127.0.0.1]', 'slide/form', 1, 1401947774, '127.0.0.1', NULL),
(57, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(slide),添加的数据为：[1][测试2][][][/admin/../assets/admin/default/uploads/image/20140605/a5e4064e2b6004614d42252bc5f4c05e.gif][1][1401947807][127.0.0.1]', 'slide/form', 1, 1401947807, '127.0.0.1', NULL),
(58, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(slide),更改后的数据为：[1][测试][1][http://www.baidu.com][][/admin/../assets/admin/default/uploads/image/20140605/b836f1e4948456739da1cdc38035cf58.jpg][1][1401952619][127.0.0.1]', 'slide/form/1', 1, 1401952619, '127.0.0.1', NULL),
(59, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(slide),更改后的数据为：[1][测试2][2][http://www.so.com][][/admin/../assets/admin/default/uploads/image/20140605/a5e4064e2b6004614d42252bc5f4c05e.gif][1][1401952628][127.0.0.1]', 'slide/form/2', 1, 1401952628, '127.0.0.1', NULL),
(60, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1401958140, '127.0.0.1', NULL),
(61, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][fdsf][fdsfadsfsdfasdf][admin][1][1401959251][127.0.0.1]', 'article/form', 1, 1401959251, '127.0.0.1', NULL),
(62, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402016201, '127.0.0.1', NULL),
(63, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402016219, '127.0.0.1', NULL),
(64, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(config_web),更改后的数据为：[fdsfsdffsdf][][][anhui99]', 'setting/web', 1, 1402019201, '127.0.0.1', NULL),
(65, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][fasdfadsfasdfasdf][dfgdsgsdfg][admin][1][1402019531][127.0.0.1]', 'article/form', 1, 1402019531, '127.0.0.1', NULL),
(66, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fasdfadsfasdfasdf][dfgdsgsdfg][admin][1][1402019561][127.0.0.1]', 'article/form/2', 1, 1402019561, '127.0.0.1', NULL),
(67, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(config_web),更改后的数据为：[fdsfsdffsdffsdfsadffsdfsdfsfsdfsdfsdffsdfsdfsadfsdfasdfasdfsadfsdfsdfsadffsdfasdfasdfasdfasdfsdf][][][anhui99]', 'setting/web', 1, 1402020623, '127.0.0.1', NULL),
(68, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[5][fsdfdsf][sdfsadfasdf][admin][1][1402020920][127.0.0.1]', 'article/form', 1, 1402020920, '127.0.0.1', NULL),
(69, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][fdsdsa][fsdafasdfasdfasdf][admin][1][1402020964][127.0.0.1]', 'article/form', 1, 1402020964, '127.0.0.1', NULL),
(70, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(config_web),更改后的数据为：[fdsfsdffsdffsdfsadffsdfsdfsfsdfsdfsdffsdfsdfsadfsdfasdfasdfsadfsdfsdfsadffsdfasdfasdfasdfasdfsdffsdafasdf][][][anhui99]', 'setting/web', 1, 1402020994, '127.0.0.1', NULL),
(71, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(config_web),更改后的数据为：[fdsfsdffsdffsdfsadffsdfsdfsfsdfsdfsdffsdfsdfsadfsdfasdfasdfsadfsdfsdfsadffsdfasdfasdfasdfasdfsdffsdafasdffsdfsadfasdf][][][anhui99]', 'setting/web', 1, 1402021002, '127.0.0.1', NULL),
(72, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[18][fddf][sadfasdfadsfasdf][admin][1][1402021152][127.0.0.1]', 'article/form', 1, 1402021152, '127.0.0.1', NULL),
(73, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[29][ddfss][fsdafasdfasdfasdf][admin][1][1402021180][127.0.0.1]', 'article/form', 1, 1402021180, '127.0.0.1', NULL),
(74, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(config_web),更改后的数据为：[fdsfsdffsdffsdfsadffsdfsdfsfsdfsdfsdffsdfsdfsadfsdfasdfasdfsadfsdfsdfsadffsdfasdfasdfasdfasdfsdffsdafas发撒旦法士大夫dffsdfsadfasdf][][][anhui99]', 'setting/web', 1, 1402021435, '127.0.0.1', NULL),
(75, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(config_web),更改后的数据为：[测试测试二会儿][][][anhui99]', 'setting/web', 1, 1402021469, '127.0.0.1', NULL),
(76, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402021698, '127.0.0.1', NULL),
(77, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][fsdaf][测试测试fsdaffdsfads][admin][1][1402022200][127.0.0.1]', 'article/form', 1, 1402022200, '127.0.0.1', NULL),
(78, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[17][fdsafa][dsfadsfadsfadsfadsfdasfdsafasd][admin][1][1402022213][127.0.0.1]', 'article/form', 1, 1402022213, '127.0.0.1', NULL),
(79, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[7][fasdfasdfasdfasdf][asdfadsffffffffffff][admin][1][1402022222][127.0.0.1]', 'article/form', 1, 1402022222, '127.0.0.1', NULL),
(80, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[28][fadsfadsfadsfads][fadsfadsfaaaaaaaaaaa][admin][1][1402022233][127.0.0.1]', 'article/form', 1, 1402022233, '127.0.0.1', NULL),
(81, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402030510, '127.0.0.1', NULL),
(82, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402030966, '127.0.0.1', NULL),
(83, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[12][fsdafa][fasdfasdfasdf][admin][1][1402031105][127.0.0.1]', 'article/form', 1, 1402031105, '127.0.0.1', NULL),
(84, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[32][fasafasdf][adsfadsffsdafasdf][admin][1][1402031118][127.0.0.1]', 'article/form', 1, 1402031118, '127.0.0.1', NULL),
(85, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[28][fsdaf23rf][sdfadsfasdf][admin][1][1402031164][127.0.0.1]', 'article/form', 1, 1402031164, '127.0.0.1', NULL),
(86, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fsdaf23rf][sdfadsfasdf][admin][1][1402031537][127.0.0.1]', 'article/form/13', 1, 1402031537, '127.0.0.1', NULL),
(87, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fasafasdf][adsfadsffsdafasdf][admin][1][1402031574][127.0.0.1]', 'article/form/12', 1, 1402031574, '127.0.0.1', NULL),
(88, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fsdafa][fasdfasdfasdf][admin][1][1402031586][127.0.0.1]', 'article/form/11', 1, 1402031586, '127.0.0.1', NULL),
(89, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fadsfadsfadsfads][fadsfadsfaaaaaaaaaaa][admin][1][1402031594][127.0.0.1]', 'article/form/10', 1, 1402031594, '127.0.0.1', NULL),
(90, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fasdfasdfasdfasdf][asdfadsffffffffffff][admin][1][1402031612][127.0.0.1]', 'article/form/9', 1, 1402031612, '127.0.0.1', NULL),
(91, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fdsafa][dsfadsfadsfadsfadsfdasfdsafasd][admin][1][1402031624][127.0.0.1]', 'article/form/8', 1, 1402031624, '127.0.0.1', NULL),
(92, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fsdaf][测试测试fsdaffdsfads][admin][1][1402031648][127.0.0.1]', 'article/form/7', 1, 1402031648, '127.0.0.1', NULL),
(93, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][ddfss][fsdafasdfasdfasdf][admin][1][1402031659][127.0.0.1]', 'article/form/6', 1, 1402031659, '127.0.0.1', NULL),
(94, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fddf][sadfasdfadsfasdf][admin][1][1402031670][127.0.0.1]', 'article/form/5', 1, 1402031670, '127.0.0.1', NULL),
(95, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fsdfdsf][sdfsadfasdf][admin][1][1402031714][127.0.0.1]', 'article/form/3', 1, 1402031714, '127.0.0.1', NULL),
(96, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[24][fsdaf23rf最新][sdfadsfasdf][admin][1][1402032952][127.0.0.1]', 'article/form/13', 1, 1402032952, '127.0.0.1', NULL),
(97, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[37][公告][1][1]', 'category/form', 1, 1402034550, '127.0.0.1', NULL),
(98, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[39][fdsfsdaf][fsadfsadfasdf][admin][1][1402034563][127.0.0.1]', 'article/form', 1, 1402034563, '127.0.0.1', NULL),
(99, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[39][fsdaasdffsadfasdf][dsafasdfasdffsadf][admin][1][1402034578][127.0.0.1]', 'article/form', 1, 1402034578, '127.0.0.1', NULL),
(100, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[39][fsdfsadfasd][fdsafdsafasdf][admin][1][1402034590][127.0.0.1]', 'article/form', 1, 1402034590, '127.0.0.1', NULL),
(101, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(article),更改后的数据为：[39][fsdfsadfasdfsdfasdfasdf][fdsafdsafasdf][admin][1][1402034698][127.0.0.1]', 'article/form/16', 1, 1402034698, '127.0.0.1', NULL),
(102, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', '', 1, 1402035341, '127.0.0.1', NULL),
(103, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', '', 1, 1402038008, '127.0.0.1', NULL),
(104, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', '', 1, 1402039374, '127.0.0.1', NULL),
(105, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', '', 1, 1402039376, '127.0.0.1', NULL),
(106, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402276515, '127.0.0.1', NULL),
(107, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][fsdfsdafasd][fsadfasdffsdfadsfasdf][admin][1][1402280105][127.0.0.1]', 'article/form', 1, 1402280105, '127.0.0.1', NULL),
(108, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][dsfsdafsdadsfsdafsdadsfsdafsdadsfsdafsda][dsfsdafsdadsfsdafsdadsfsdafsda][admin][1][1402280129][127.0.0.1]', 'article/form', 1, 1402280129, '127.0.0.1', NULL),
(109, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][dsfsdafsdasdf][dsfsdafsdadsfsdafsdafsdf][admin][1][1402280160][127.0.0.1]', 'article/form', 1, 1402280160, '127.0.0.1', NULL),
(110, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][dsfsdafsda5116][dsfsdafsdadsfsdafsdadsfsdafsda][admin][1][1402280177][127.0.0.1]', 'article/form', 1, 1402280177, '127.0.0.1', NULL),
(111, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][dsfsdafsda6489849][dsfsdafsdadsfsdafsdaf5ds6f6asd5f][admin][1][1402280189][127.0.0.1]', 'article/form', 1, 1402280189, '127.0.0.1', NULL),
(112, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][dsfsdafsdadsfsdafsda165106][dsfsdafsdadsfsdafsdadsfsdafsdadsfsdafsda][admin][1][1402280209][127.0.0.1]', 'article/form', 1, 1402280209, '127.0.0.1', NULL),
(113, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][dsfdsafsdagfasd2165dsfdsafsdagfasd][dsfdsafsdagfasddsfdsafsdagfasddsfds][admin][1][1402282086][127.0.0.1]', 'article/form', 1, 1402282086, '127.0.0.1', NULL),
(114, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][dsfdsafsdagfasd56165][dsfdsafsdagfasddsfdsafsdagfasddsfdsafsdagfasddsfdsafsdagfasd][admin][1][1402282096][127.0.0.1]', 'article/form', 1, 1402282096, '127.0.0.1', NULL),
(115, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][dsfdsafsdagfasddsfdsafsdagfasd51651][dsfdsafsdagfasddsfdsafsdagfasddsfdsafsdagfasd56116156][admin][1][1402282124][127.0.0.1]', 'article/form', 1, 1402282124, '127.0.0.1', NULL),
(116, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[24][fadsfadsfasd415612132][fffsdfasdf516132165][admin][1][1402282153][127.0.0.1]', 'article/form', 1, 1402282153, '127.0.0.1', NULL),
(117, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402386363, '127.0.0.1', NULL),
(118, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[0][0][fdsfsd][10][1]', 'category/form', 1, 1402388461, '127.0.0.1', NULL),
(119, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(category),更改后的数据为：[11][2][直属商会][1]', 'category/form/14', 1, 1402388481, '127.0.0.1', NULL),
(120, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[11][][fdsfsad][5][1]', 'category/form', 1, 1402388527, '127.0.0.1', NULL),
(121, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(category),添加的数据为：[6][1][fsdafasdf][5][1]', 'category/form', 1, 1402389294, '127.0.0.1', NULL),
(122, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402407898, '127.0.0.1', NULL),
(123, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402447515, '127.0.0.1', NULL),
(124, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', '', 1, 1402448617, '127.0.0.1', NULL),
(125, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1402461373, '127.0.0.1', NULL),
(126, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(link),添加的数据为：[百度][][http://www.baidu.com][/admin/../assets/admin/default/uploads/image/20140611/886649a7bbd8aee9b10d34c724088391.jpg][1][1402461952][127.0.0.1]', 'link/form', 1, 1402461952, '127.0.0.1', NULL),
(127, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1418022438, '127.0.0.1', NULL),
(128, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1418784830, '127.0.0.1', NULL),
(129, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(article),添加的数据为：[14][fdsaadsfas][fasdfasdfasdfasdfasdfasdfasdf][admin][1][1418784886][127.0.0.1]', 'article/form', 1, 1418784886, '127.0.0.1', NULL),
(130, 'admin', '角色：[超级管理员]，用户名：[admin]退出系统', 'login/logout', 1, 1418786576, '127.0.0.1', NULL),
(131, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1426035825, '127.0.0.1', NULL),
(132, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1426037115, '127.0.0.1', NULL),
(133, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', '', 1, 1426037244, '127.0.0.1', NULL),
(134, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1426040276, '127.0.0.1', NULL),
(135, 'admin', '角色：[超级管理员]，用户名：[admin]更换皮肤,更改后的数据为：[classic]', 'login/show_skin', 1, 1426040282, '127.0.0.1', NULL),
(136, 'admin', '角色：[超级管理员]，用户名：[admin]退出系统', 'login/logout', 1, 1426040328, '127.0.0.1', NULL),
(137, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1426040730, '127.0.0.1', NULL),
(138, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(config_web),更改后的数据为：[2][网站维护升级中...][][][anhui99]', 'setting/web', 1, 1426040781, '127.0.0.1', NULL),
(139, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(config_web),更改后的数据为：[测试][][][anhui99]', 'setting/web', 1, 1426040787, '127.0.0.1', NULL),
(140, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1426042244, '127.0.0.1', NULL),
(141, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(role),添加的数据为：[测试][测试组][1,2,3,6,7,9,12,13,16,17,19,20,22,23,24,26,30,28,29][1]', 'role/form', 1, 1426042286, '127.0.0.1', NULL),
(142, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(manager),添加的数据为：[2][123456][][][707069100@qq.com][2][2][3a0f0fee92a4fd13fb3f1c2bfcb3eac5][1]', 'manager/form', 1, 1426042300, '127.0.0.1', NULL),
(143, 'admin', '角色：[超级管理员]，用户名：[admin]退出系统', 'login/logout', 1, 1426042305, '127.0.0.1', NULL),
(144, '123456', '角色：[测试]，用户名：[123456]登录系统', 'login', 2, 1426042310, '127.0.0.1', NULL),
(145, '123456', '角色：[测试]，用户名：[123456]退出系统', 'login/logout', 2, 1426042320, '127.0.0.1', NULL),
(146, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1426042325, '127.0.0.1', NULL),
(147, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(role),更改后的数据为：[测试][测试组][1,2,3,6,7,9,10,12,13,16,17,19,20,22,23,24,26,30,28,29][1]', 'role/form/2', 1, 1426042335, '127.0.0.1', NULL),
(148, 'admin', '角色：[超级管理员]，用户名：[admin]更改密码,更改后的数据为：[eece2c655c2aa34fb935686464b993ca]', 'manager/change_pwd', 1, 1426042345, '127.0.0.1', NULL),
(149, 'admin', '角色：[超级管理员]，用户名：[admin]退出系统', 'manager/change_pwd_logout', 1, 1426042346, '127.0.0.1', NULL),
(150, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1426042352, '127.0.0.1', NULL),
(151, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1433502062, '127.0.53.53', NULL),
(152, 'admin', '角色：[超级管理员]，用户名：[admin]更换皮肤,更改后的数据为：[cyborg]', 'login/show_skin', 1, 1433502465, '127.0.53.53', NULL),
(153, 'admin', '角色：[超级管理员]，用户名：[admin]更换皮肤,更改后的数据为：[simplex]', 'login/show_skin', 1, 1433502468, '127.0.53.53', NULL),
(154, 'admin', '角色：[超级管理员]，用户名：[admin]更换皮肤,更改后的数据为：[slate]', 'login/show_skin', 1, 1433502470, '127.0.53.53', NULL),
(155, 'admin', '角色：[超级管理员]，用户名：[admin]更换皮肤,更改后的数据为：[united]', 'login/show_skin', 1, 1433502473, '127.0.53.53', NULL),
(156, 'admin', '角色：[超级管理员]，用户名：[admin]更换皮肤,更改后的数据为：[cerulean]', 'login/show_skin', 1, 1433502476, '127.0.53.53', NULL),
(157, 'admin', '角色：[超级管理员]，用户名：[admin]退出系统', 'login/logout', 1, 1433502657, '127.0.53.53', NULL),
(158, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1433502892, '127.0.53.53', NULL),
(159, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1433511580, '127.0.53.53', NULL),
(160, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(config_web),更改后的数据为：[大数据系统][logo.png][][][][有事吧，有事没事都来吧。][有事吧，有事没事都来吧。][][][anhui99]', 'setting/web', 1, 1433512755, '127.0.53.53', NULL),
(161, 'admin', '角色：[超级管理员]，用户名：[admin]退出系统', 'login/logout', 1, 1433513087, '127.0.53.53', NULL),
(162, '123456', '角色：[测试]，用户名：[123456]登录系统', 'login', 2, 1433513094, '127.0.53.53', NULL),
(163, '123456', '角色：[测试]，用户名：[123456]登录系统', 'login', 2, 1433513135, '127.0.53.53', NULL),
(164, '123456', '角色：[测试]，用户名：[123456]登录系统', 'login', 2, 1433513186, '127.0.53.53', NULL),
(165, '123456', '角色：[测试]，用户名：[123456]登录系统', 'login', 2, 1433513307, '127.0.53.53', NULL),
(166, '123456', '角色：[测试]，用户名：[123456]登录系统', 'login', 2, 1433513365, '127.0.53.53', NULL),
(167, '123456', '角色：[测试]，用户名：[123456]登录系统', 'login', 2, 1433513392, '127.0.53.53', NULL),
(168, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1433513446, '127.0.53.53', NULL),
(169, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(mode),添加的数据为：[用户中心][记录用户基本信息][2][1]', 'mode/form', 1, 1433513938, '127.0.53.53', NULL),
(170, 'admin', '角色：[超级管理员]，用户名：[admin]添加表(mode),添加的数据为：[会议中心][会议信息展示与管理][3][1]', 'mode/form', 1, 1433514133, '127.0.53.53', NULL),
(171, 'admin', '角色：[超级管理员]，用户名：[admin]更新表(config_web),更改后的数据为：[assets][css][js][images][kindeditor][artDialog][valicode][uploads][][][anhui99]', 'setting/web', 1, 1433515567, '127.0.53.53', NULL),
(172, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', '', 1, 1433517663, '127.0.53.53', NULL),
(173, 'admin', '角色：[超级管理员]，用户名：[admin]退出系统', 'login/logout', 1, 1433517668, '127.0.53.53', NULL),
(174, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1433557656, '127.0.53.53', NULL),
(175, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', '', 1, 1433559436, '127.0.53.53', NULL),
(176, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', '', 1, 1433559437, '127.0.53.53', NULL),
(177, 'admin', '角色：[超级管理员]，用户名：[admin]退出系统', 'login/logout', 1, 1433559457, '127.0.53.53', NULL),
(178, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1433559714, '127.0.53.53', NULL),
(179, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', '', 1, 1433560775, '127.0.53.53', NULL),
(180, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', '', 1, 1433562214, '127.0.53.53', NULL),
(181, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', '', 1, 1433562221, '127.0.53.53', NULL),
(182, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1433586856, '127.0.53.53', NULL),
(183, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1433598241, '127.0.53.53', NULL),
(184, 'admin', '角色：[超级管理员]，用户名：[admin]登录系统', 'login', 1, 1433605669, '127.0.53.53', NULL),
(185, 'admin', '角色：[超级管理员]，用户名：[admin]退出系统', 'login/logout', 1, 1433605690, '127.0.53.53', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cn_mode`
--

CREATE TABLE IF NOT EXISTS `cn_mode` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `rank` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序，数字越小越靠前',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态0是未激活，1是正常，2是禁用'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='模块';

--
-- 转存表中的数据 `cn_mode`
--

INSERT INTO `cn_mode` (`id`, `name`, `remark`, `rank`, `status`) VALUES
(1, '首页幻灯片', '首页幻灯片', 1, 1),
(2, '用户中心', '记录用户基本信息', 2, 1),
(3, '会议中心', '会议信息展示与管理', 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cn_power`
--

CREATE TABLE IF NOT EXISTS `cn_power` (
  `id` int(10) NOT NULL,
  `pid` int(10) unsigned DEFAULT '1' COMMENT '1是顶级权限',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '权限名称',
  `icon` varchar(50) DEFAULT 'icon-home' COMMENT '图标',
  `url` varchar(150) DEFAULT 'default_view' COMMENT '权限访问路径 default_view',
  `rank` int(11) unsigned DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1是正常，2是禁用'
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COMMENT='权限表';

--
-- 转存表中的数据 `cn_power`
--

INSERT INTO `cn_power` (`id`, `pid`, `name`, `icon`, `url`, `rank`, `status`) VALUES
(1, 0, '系统管理', 'icon-home', 'default_view', 0, 1),
(2, 1, '系统设置', 'icon-home', 'default_view', 0, 1),
(3, 2, '系统信息', 'icon-home', 'main', 0, 1),
(4, 2, '后台设置', 'icon-home', 'setting/admin', 0, 1),
(5, 2, '站点设置', 'icon-home', 'setting/web', 0, 1),
(6, 1, '权限管理', 'icon-home', 'default_view', 0, 1),
(7, 6, '权限列表', 'icon-home', 'power', 0, 1),
(8, 6, '添加权限', 'icon-home', 'power/form', 0, 1),
(9, 1, '角色管理', 'icon-home', 'default_view', 0, 1),
(10, 9, '角色列表', 'icon-home', 'role', 0, 1),
(11, 9, '添加角色', 'icon-home', 'role/form', 0, 1),
(12, 1, '管理员管理', 'icon-home', 'default_view', 0, 1),
(13, 12, '管理员列表', 'icon-home', 'manager', 0, 1),
(14, 12, '添加管理员', 'icon-home', 'manager/form', 0, 1),
(15, 12, '更改密码', 'icon-home', 'manager/pwd', 0, 1),
(16, 1, '类别管理', 'icon-home', 'default_view', 0, 1),
(17, 16, '类别列表', 'icon-home', 'category', 0, 1),
(18, 16, '添加类别', 'icon-home', 'category/form', 0, 1),
(19, 1, '内容管理', 'icon-home', 'default_view', 0, 1),
(20, 19, '文章列表', 'icon-home', 'article', 0, 1),
(21, 19, '添加文章', 'icon-home', 'article/form', 0, 1),
(22, 19, '回收站', 'icon-home', 'article/recycle_bin', 0, 1),
(23, 1, '模块管理', 'icon-home', 'default_view', 0, 1),
(24, 23, '模块列表', 'icon-home', 'mode', 0, 1),
(25, 23, '添加模块', 'icon-home', 'mode/form', 0, 1),
(26, 23, '首页幻灯片列表', 'icon-home', 'slide', 0, 1),
(27, 23, '添加首页幻灯片', 'icon-home', 'slide/form', 0, 1),
(28, 1, '系统日志', 'icon-home', 'default_view', 0, 1),
(29, 28, '系统日志列表', 'icon-home', 'manager_log', 0, 1),
(30, 23, '友情链接列表', 'icon-home', 'link', 0, 1),
(31, 23, '添加友情链接', 'icon-home', 'link/form', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cn_role`
--

CREATE TABLE IF NOT EXISTS `cn_role` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `powers` varchar(100) NOT NULL COMMENT '所有权限',
  `introduce` varchar(50) NOT NULL DEFAULT '' COMMENT '简介',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '1是正常，2是禁用'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

--
-- 转存表中的数据 `cn_role`
--

INSERT INTO `cn_role` (`id`, `name`, `powers`, `introduce`, `status`) VALUES
(1, '超级管理员', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31', '系统最高级管理人，拥有站点所有权限', 1),
(2, '测试', '1,2,3,6,7,9,10,12,13,16,17,19,20,22,23,24,26,30,28,29', '测试组', 1);

-- --------------------------------------------------------

--
-- 表的结构 `cn_sessions`
--

CREATE TABLE IF NOT EXISTS `cn_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0' COMMENT 'session_id',
  `ip_address` varchar(45) NOT NULL DEFAULT '0' COMMENT 'ip地址',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='session表';

--
-- 转存表中的数据 `cn_sessions`
--

INSERT INTO `cn_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('028f2542e52801ca10e2b85d96bf8436', '127.0.53.53', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345', 1433519049, ''),
('150625127688026c77b56105af1a54e9', '127.0.53.53', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345', 1433562079, ''),
('20dcaba59dfb7c4ca1f9008ebaf867fb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', 1426040227, ''),
('2ed8407f449e6ff7e94132da011604e9', '127.0.53.53', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345', 1433559933, ''),
('4151b9d60a9dde448e41ccd7334af556', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 1426042164, 'a:1:{s:9:"user_data";s:0:"";}'),
('49a128aeeabfd484ab1434f2bdc5f8f6', '127.0.53.53', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345', 1433596358, ''),
('4d1931f799ab2e5fa7db3b962aa4edba', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', 1426040227, 'a:4:{s:9:"user_data";s:0:"";s:10:"check_flag";s:1:"0";s:15:"flash:old:error";s:24:"用户名或密码错误";s:8:"valicode";s:4:"7fqR";}'),
('5b8913b32b4b66b010d8de2e581c42d4', '127.0.53.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1433518446, ''),
('60a32a4fa5f5b01b7f4b3c93dbe5582d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', 1426040729, 'a:1:{s:9:"user_data";s:0:"";}'),
('67e15b3bf9be3f0de4bfc6bebd60b21c', '127.0.53.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1433610227, 'a:2:{s:9:"user_data";s:0:"";s:17:"flash:old:message";s:25:"<p>您已成功退出</p>";}'),
('72571299314b80f525bdce8d168e56f0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36', 1426040223, 'a:3:{s:9:"user_data";s:0:"";s:10:"check_flag";s:1:"0";s:8:"valicode";s:4:"nc4f";}'),
('7448b3b92197a703b46f34ebaee6903c', '127.0.53.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1433559848, ''),
('7c0a2aa96c84b16ad345bc1e3884c742', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', 1426040729, 'a:2:{s:9:"user_data";s:0:"";s:7:"manager";a:5:{s:2:"id";s:1:"1";s:8:"username";s:5:"admin";s:7:"role_id";s:1:"1";s:6:"status";s:1:"1";s:6:"expire";i:1426044437;}}'),
('b46b869e23e9908e1a9c1526668cd1c9', '127.0.53.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1433560778, ''),
('c45501096731d97c5275d58d47e82088', '127.0.53.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1433605638, 'a:3:{s:9:"user_data";s:0:"";s:14:"manager_result";s:6:"123456";s:17:"flash:old:message";s:12:"退出成功";}'),
('c777015aaa1499b7fb3f127a50d04eaa', '127.0.53.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1433605690, ''),
('d55c074a5ee5199466772881b67aab55', '127.0.53.53', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1433596198, ''),
('e9b9973a1b4d8e19afd9ca9f33446099', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 1426042347, 'a:2:{s:9:"user_data";s:0:"";s:7:"manager";a:5:{s:2:"id";s:1:"1";s:8:"username";s:5:"admin";s:7:"role_id";s:1:"1";s:6:"status";s:1:"1";s:6:"expire";i:1426045952;}}'),
('fe289146223cdd2010d2e7dbae6bb0c9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36', 1426040223, '');

-- --------------------------------------------------------

--
-- 表的结构 `cn_slide`
--

CREATE TABLE IF NOT EXISTS `cn_slide` (
  `id` int(11) NOT NULL,
  `mode_id` int(11) NOT NULL COMMENT '模块id',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `url` varchar(50) DEFAULT NULL COMMENT '链接',
  `thumb` varchar(100) DEFAULT NULL COMMENT '图片',
  `rank` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序，数字越小越靠前',
  `remark` varchar(200) NOT NULL COMMENT '备注',
  `addtime` varchar(10) NOT NULL COMMENT '添加时间',
  `updatetime` varchar(10) NOT NULL COMMENT '最后更新时间',
  `addip` varchar(15) NOT NULL COMMENT '添加ip',
  `addip_address` varchar(50) DEFAULT NULL COMMENT '添加ip地址',
  `updateip` varchar(15) NOT NULL COMMENT '更新ip',
  `updateip_address` varchar(50) DEFAULT NULL COMMENT '更新pi地址',
  `status` tinyint(2) NOT NULL COMMENT '状态0是未激活，1是正常，2是禁用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页幻灯片';

-- --------------------------------------------------------

--
-- 表的结构 `cn_ucenter`
--

CREATE TABLE IF NOT EXISTS `cn_ucenter` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` char(32) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` int(11) unsigned NOT NULL,
  `salt` char(5) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cn_ucenter`
--

INSERT INTO `cn_ucenter` (`id`, `username`, `password`, `email`, `phone`, `salt`, `status`, `addtime`) VALUES
(1, 'zzskyfish', '08c68ece2296c810f0e5bb71c0cfa286', '525132800@qq.com', 4294967295, '', 1, '2015-06-06 14:47:55');

-- --------------------------------------------------------

--
-- 表的结构 `cn_users`
--

CREATE TABLE IF NOT EXISTS `cn_users` (
  `id` int(11) unsigned NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cn_users`
--

INSERT INTO `cn_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1433605580, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(2, '127.0.53.53', 'skyfish zz', '$2y$08$lJAS7yQwKmRUvZ1Tn29QFejco7A47ZlysvojUw9pozoFkLjWtDrZS', NULL, '525132800@qq.com', NULL, NULL, NULL, NULL, 1433605784, 1433609265, 1, 'skyfish', 'zz', 'xxxx', '13718693172');

-- --------------------------------------------------------

--
-- 表的结构 `cn_users_groups`
--

CREATE TABLE IF NOT EXISTS `cn_users_groups` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cn_users_groups`
--

INSERT INTO `cn_users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cn_article`
--
ALTER TABLE `cn_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cn_category`
--
ALTER TABLE `cn_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cn_check_log`
--
ALTER TABLE `cn_check_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cn_email_log`
--
ALTER TABLE `cn_email_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cn_groups`
--
ALTER TABLE `cn_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cn_link`
--
ALTER TABLE `cn_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cn_login_attempts`
--
ALTER TABLE `cn_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cn_manager`
--
ALTER TABLE `cn_manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cn_manager_logging`
--
ALTER TABLE `cn_manager_logging`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cn_mode`
--
ALTER TABLE `cn_mode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cn_power`
--
ALTER TABLE `cn_power`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cn_role`
--
ALTER TABLE `cn_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cn_sessions`
--
ALTER TABLE `cn_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `cn_slide`
--
ALTER TABLE `cn_slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cn_ucenter`
--
ALTER TABLE `cn_ucenter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cn_users`
--
ALTER TABLE `cn_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cn_users_groups`
--
ALTER TABLE `cn_users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cn_article`
--
ALTER TABLE `cn_article`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- AUTO_INCREMENT for table `cn_category`
--
ALTER TABLE `cn_category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- AUTO_INCREMENT for table `cn_check_log`
--
ALTER TABLE `cn_check_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `cn_email_log`
--
ALTER TABLE `cn_email_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id';
--
-- AUTO_INCREMENT for table `cn_groups`
--
ALTER TABLE `cn_groups`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cn_link`
--
ALTER TABLE `cn_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cn_login_attempts`
--
ALTER TABLE `cn_login_attempts`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cn_manager`
--
ALTER TABLE `cn_manager`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cn_manager_logging`
--
ALTER TABLE `cn_manager_logging`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=186;
--
-- AUTO_INCREMENT for table `cn_mode`
--
ALTER TABLE `cn_mode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cn_power`
--
ALTER TABLE `cn_power`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `cn_role`
--
ALTER TABLE `cn_role`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cn_slide`
--
ALTER TABLE `cn_slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cn_ucenter`
--
ALTER TABLE `cn_ucenter`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cn_users`
--
ALTER TABLE `cn_users`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cn_users_groups`
--
ALTER TABLE `cn_users_groups`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- 限制导出的表
--

--
-- 限制表 `cn_users_groups`
--
ALTER TABLE `cn_users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `cn_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `cn_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
