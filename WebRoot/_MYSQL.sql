SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_aboutus`
--

CREATE TABLE IF NOT EXISTS `jtbc_aboutus` (
  `ab_id` int(11) NOT NULL auto_increment,
  `ab_topic` varchar(50) default NULL,
  `ab_content` text,
  `ab_content_images` text,
  `ab_commendatory` int(11) default '0',
  `ab_hidden` int(11) default '0',
  `ab_count` int(11) default '0',
  `ab_time` datetime default NULL,
  `ab_update` int(11) default '0',
  `ab_lng` int(11) default '0',
  PRIMARY KEY  (`ab_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_admin`
--

CREATE TABLE IF NOT EXISTS `jtbc_admin` (
  `a_id` int(11) NOT NULL auto_increment,
  `a_username` varchar(50) default NULL,
  `a_password` varchar(50) default NULL,
  `a_utype` int(11) default '0',
  `a_popedom` text,
  `a_lock` int(11) default '0',
  `a_lastip` varchar(50) default NULL,
  `a_lasttime` datetime default NULL,
  `a_time` datetime default NULL,
  PRIMARY KEY  (`a_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_admin_userlnk`
--

CREATE TABLE IF NOT EXISTS `jtbc_admin_userlnk` (
  `al_id` int(11) NOT NULL auto_increment,
  `al_topic` varchar(50) default NULL,
  `al_icon` varchar(255) default NULL,
  `al_title` varchar(255) default NULL,
  `al_url` varchar(255) default NULL,
  `al_width` int(11) default '0',
  `al_height` int(11) default '0',
  `al_uid` int(11) default '0',
  `al_time` datetime default NULL,
  PRIMARY KEY  (`al_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_admin_userlog`
--

CREATE TABLE IF NOT EXISTS `jtbc_admin_userlog` (
  `al_id` int(11) NOT NULL auto_increment,
  `al_username` varchar(50) default NULL,
  `al_error` int(11) default '0',
  `al_ip` varchar(50) default NULL,
  `al_time` datetime default NULL,
  PRIMARY KEY  (`al_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_articles`
--

CREATE TABLE IF NOT EXISTS `jtbc_articles` (
  `a_id` int(11) NOT NULL auto_increment,
  `a_topic` varchar(50) default NULL,
  `a_class` int(11) default '0',
  `a_content` text,
  `a_content_images` text,
  `a_commendatory` int(11) default '0',
  `a_hidden` int(11) default '0',
  `a_count` int(11) default '0',
  `a_time` datetime default NULL,
  `a_update` int(11) default '0',
  `a_lng` int(11) default '0',
  PRIMARY KEY  (`a_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_downloads`
--

CREATE TABLE IF NOT EXISTS `jtbc_downloads` (
  `d_id` int(11) NOT NULL auto_increment,
  `d_topic` varchar(50) default NULL,
  `d_class` int(11) default '0',
  `d_intro` varchar(255) default NULL,
  `d_image` varchar(255) default NULL,
  `d_content` text,
  `d_content_images` text,
  `d_size` int(11) default '0',
  `d_runco` varchar(255) default NULL,
  `d_star` int(11) default '0',
  `d_accredit` int(11) default '0',
  `d_lang` int(11) default '0',
  `d_link` varchar(255) default NULL,
  `d_author` varchar(50) default NULL,
  `d_urls` text,
  `d_commendatory` int(11) default '0',
  `d_hidden` int(11) default '0',
  `d_count` int(11) default '0',
  `d_time` datetime default NULL,
  `d_update` int(11) default '0',
  `d_lng` int(11) default '0',
  PRIMARY KEY  (`d_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_forum_blacklist`
--

CREATE TABLE IF NOT EXISTS `jtbc_forum_blacklist` (
  `fb_id` int(11) NOT NULL auto_increment,
  `fb_username` varchar(50) default NULL,
  `fb_uid` int(11) default '0',
  `fb_fid` int(11) default '0',
  `fb_manager` varchar(50) default NULL,
  `fb_time` datetime default NULL,
  `fb_remark` varchar(255) default NULL,
  PRIMARY KEY  (`fb_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_forum_category`
--

CREATE TABLE IF NOT EXISTS `jtbc_forum_category` (
  `fc_id` int(11) NOT NULL auto_increment,
  `fc_topic` varchar(50) default NULL,
  `fc_fid` int(11) default '0',
  `fc_itype` int(11) default '0',
  `fc_popedom` varchar(255) default NULL,
  `fc_image` varchar(255) default NULL,
  `fc_manager` varchar(255) default NULL,
  `fc_rule` text,
  `fc_explain` varchar(255) default NULL,
  `fc_hidden` int(11) default '0',
  `fc_order` int(11) default '0',
  `fc_num_topic` int(11) default '0',
  `fc_num_note` int(11) default '0',
  `fc_num_note_new` int(11) default '0',
  `fc_last_topic` varchar(255) default NULL,
  `fc_last_topic_id` int(11) default '0',
  `fc_last_topic_time` datetime default NULL,
  `fc_last_time` datetime default NULL,
  `fc_time` datetime default NULL,
  `fc_lng` int(11) default '0',
  PRIMARY KEY  (`fc_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_forum_topic`
--

CREATE TABLE IF NOT EXISTS `jtbc_forum_topic` (
  `ft_id` int(11) NOT NULL auto_increment,
  `ft_topic` varchar(50) default NULL,
  `ft_class` int(11) default '0',
  `ft_fid` int(11) default '0',
  `ft_icon` int(11) default '0',
  `ft_color` varchar(50) default NULL,
  `ft_strong` int(11) default '0',
  `ft_author` varchar(50) default NULL,
  `ft_auid` int(11) default '0',
  `ft_authorip` varchar(50) default NULL,
  `ft_content` text,
  `ft_content_files` text,
  `ft_voteid` int(11) default '0',
  `ft_reply` int(11) default '0',
  `ft_count` int(11) default '0',
  `ft_time` datetime default NULL,
  `ft_timestamp` bigint(20) default '0',
  `ft_htop` int(11) default '0',
  `ft_top` int(11) default '0',
  `ft_lock` int(11) default '0',
  `ft_elite` int(11) default '0',
  `ft_hidden` int(11) default '0',
  `ft_last_username` varchar(50) default NULL,
  `ft_last_time` datetime default NULL,
  `ft_edit_username` varchar(50) default NULL,
  `ft_edit_time` datetime default NULL,
  `ft_lng` int(11) default '0',
  PRIMARY KEY  (`ft_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_forum_vote`
--

CREATE TABLE IF NOT EXISTS `jtbc_forum_vote` (
  `fv_id` int(11) NOT NULL auto_increment,
  `fv_topic` varchar(50) default NULL,
  `fv_type` int(11) default '0',
  `fv_time` datetime default NULL,
  `fv_day` int(11) default '0',
  PRIMARY KEY  (`fv_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_forum_vote_data`
--

CREATE TABLE IF NOT EXISTS `jtbc_forum_vote_data` (
  `fvd_id` int(11) NOT NULL auto_increment,
  `fvd_topic` varchar(50) default NULL,
  `fvd_fid` int(11) default '0',
  `fvd_vid` int(11) default '0',
  `fvd_count` int(11) default '0',
  PRIMARY KEY  (`fvd_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_forum_vote_voter`
--

CREATE TABLE IF NOT EXISTS `jtbc_forum_vote_voter` (
  `fvv_id` int(11) NOT NULL auto_increment,
  `fvv_fid` int(11) default '0',
  `fvv_ip` varchar(50) default NULL,
  `fvv_username` varchar(50) default NULL,
  `fvv_data` varchar(255) default NULL,
  `fvv_time` datetime default NULL,
  PRIMARY KEY  (`fvv_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_mall_order`
--

CREATE TABLE IF NOT EXISTS `jtbc_mall_order` (
  `mo_id` int(11) NOT NULL auto_increment,
  `mo_uid` int(11) default '0',
  `mo_olist` text,
  `mo_totalprice` float default '0',
  `mo_name` varchar(50) default NULL,
  `mo_address` varchar(255) default NULL,
  `mo_zipcode` varchar(50) default NULL,
  `mo_phone` varchar(50) default NULL,
  `mo_email` varchar(50) default NULL,
  `mo_remark` text,
  `mo_orderid` varchar(50) default NULL,
  `mo_state` int(11) default '0',
  `mo_time` datetime default NULL,
  PRIMARY KEY  (`mo_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_mall_products`
--

CREATE TABLE IF NOT EXISTS `jtbc_mall_products` (
  `mp_id` int(11) NOT NULL auto_increment,
  `mp_snum` varchar(50) default NULL,
  `mp_topic` varchar(50) default NULL,
  `mp_class` int(11) default '0',
  `mp_image` varchar(255) default NULL,
  `mp_yprice` float default '0',
  `mp_xprice` float default '0',
  `mp_amount` int(11) default '0',
  `mp_content` text,
  `mp_content_images` text,
  `mp_commendatory` int(11) default '0',
  `mp_hidden` int(11) default '0',
  `mp_count` int(11) default '0',
  `mp_time` datetime default NULL,
  `mp_update` int(11) default '0',
  `mp_lng` int(11) default '0',
  PRIMARY KEY  (`mp_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_passport_account`
--

CREATE TABLE IF NOT EXISTS `jtbc_passport_account` (
  `pa_id` int(11) NOT NULL auto_increment,
  `pa_username` varchar(50) default NULL,
  `pa_password` varchar(50) default NULL,
  `pa_email` varchar(50) default NULL,
  `pa_city` int(11) default '0',
  `pa_gender` int(11) default '0',
  `pa_name` varchar(50) default NULL,
  `pa_phone` varchar(50) default NULL,
  `pa_address` varchar(255) default NULL,
  `pa_zipcode` varchar(50) default NULL,
  `pa_emoney` int(11) default '0',
  `pa_integral` int(11) default '0',
  `pa_face` int(11) default '0',
  `pa_face_u` int(11) default '0',
  `pa_face_url` varchar(255) default NULL,
  `pa_sign` varchar(255) default NULL,
  `pa_group` int(11) default '0',
  `pa_lock` int(11) default '0',
  `pa_time` datetime default NULL,
  `pa_lasttime` datetime default NULL,
  `pa_prelasttime` datetime default NULL,
  PRIMARY KEY  (`pa_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_passport_friend`
--

CREATE TABLE IF NOT EXISTS `jtbc_passport_friend` (
  `pf_id` int(11) NOT NULL auto_increment,
  `pf_muid` int(11) default '0',
  `pf_muusername` varchar(50) default NULL,
  `pf_fuid` int(11) default '0',
  `pf_fuusername` varchar(50) default NULL,
  `pf_time` datetime default NULL,
  PRIMARY KEY  (`pf_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_passport_message`
--

CREATE TABLE IF NOT EXISTS `jtbc_passport_message` (
  `pm_id` int(11) NOT NULL auto_increment,
  `pm_topic` varchar(50) default NULL,
  `pm_content` text,
  `pm_read` int(11) default '0',
  `pm_auid` int(11) default '0',
  `pm_auusername` varchar(50) default NULL,
  `pm_ruid` int(11) default '0',
  `pm_ruusername` varchar(50) default NULL,
  `pm_hidden` int(11) default '0',
  `pm_time` datetime default NULL,
  PRIMARY KEY  (`pm_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_products`
--

CREATE TABLE IF NOT EXISTS `jtbc_products` (
  `p_id` int(11) NOT NULL auto_increment,
  `p_topic` varchar(50) default NULL,
  `p_class` int(11) default '0',
  `p_image` varchar(255) default NULL,
  `p_content` text,
  `p_content_images` text,
  `p_commendatory` int(11) default '0',
  `p_hidden` int(11) default '0',
  `p_count` int(11) default '0',
  `p_time` datetime default NULL,
  `p_update` int(11) default '0',
  `p_lng` int(11) default '0',
  PRIMARY KEY  (`p_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_public_comment`
--

CREATE TABLE IF NOT EXISTS `jtbc_public_comment` (
  `pc_id` int(11) NOT NULL auto_increment,
  `pc_muusername` varchar(50) default NULL,
  `pc_muid` int(11) default '0',
  `pc_ip` varchar(50) default NULL,
  `pc_content` text,
  `pc_keyword` varchar(50) default NULL,
  `pc_fid` int(11) default '0',
  `pc_hidden` int(11) default '0',
  `pc_time` datetime default NULL,
  PRIMARY KEY  (`pc_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_public_guestbook`
--

CREATE TABLE IF NOT EXISTS `jtbc_public_guestbook` (
  `pg_id` int(11) NOT NULL auto_increment,
  `pg_topic` varchar(50) default NULL,
  `pg_name` varchar(50) default NULL,
  `pg_face` int(11) default '0',
  `pg_email` varchar(50) default NULL,
  `pg_content` text,
  `pg_reply` text,
  `pg_rname` varchar(50) default NULL,
  `pg_rtime` datetime default NULL,
  `pg_hidden` int(11) default '0',
  `pg_ip` varchar(50) default NULL,
  `pg_time` datetime default NULL,
  `pg_lng` int(11) default '0',
  PRIMARY KEY  (`pg_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_public_linkimages`
--

CREATE TABLE IF NOT EXISTS `jtbc_public_linkimages` (
  `pl_id` int(11) NOT NULL auto_increment,
  `pl_topic` varchar(50) default NULL,
  `pl_keyword` varchar(255) default NULL,
  `pl_image` varchar(255) default NULL,
  `pl_url` varchar(255) default NULL,
  `pl_intro` varchar(255) default NULL,
  `pl_time` datetime default NULL,
  PRIMARY KEY  (`pl_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_public_linktexts`
--

CREATE TABLE IF NOT EXISTS `jtbc_public_linktexts` (
  `pl_id` int(11) NOT NULL auto_increment,
  `pl_topic` varchar(50) default NULL,
  `pl_keyword` varchar(255) default NULL,
  `pl_url` varchar(255) default NULL,
  `pl_intro` varchar(255) default NULL,
  `pl_time` datetime default NULL,
  PRIMARY KEY  (`pl_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_public_scripts`
--

CREATE TABLE IF NOT EXISTS `jtbc_public_scripts` (
  `ps_id` int(11) NOT NULL auto_increment,
  `ps_topic` varchar(50) default NULL,
  `ps_content` text,
  `ps_timeout` int(11) default '0',
  `ps_hidden` int(11) default '0',
  `ps_lasttime` datetime default NULL,
  `ps_time` datetime default NULL,
  PRIMARY KEY  (`ps_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_sys_category`
--

CREATE TABLE IF NOT EXISTS `jtbc_sys_category` (
  `ca_id` int(11) NOT NULL auto_increment,
  `ca_topic` varchar(50) default NULL,
  `ca_fid` int(11) default '0',
  `ca_genre` varchar(50) default NULL,
  `ca_hidden` int(11) default '0',
  `ca_order` int(11) default '0',
  `ca_lng` int(11) default '0',
  PRIMARY KEY  (`ca_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jtbc_sys_upload`
--

CREATE TABLE IF NOT EXISTS `jtbc_sys_upload` (
  `up_id` int(11) NOT NULL auto_increment,
  `up_genre` varchar(50) default NULL,
  `up_filename` varchar(255) default NULL,
  `up_field` varchar(50) default NULL,
  `up_fid` int(11) default '0',
  `up_time` datetime default NULL,
  `up_foreback` int(11) default '0',
  `up_username` varchar(50) default NULL,
  `up_valid` int(11) default '0',
  `up_vlreason` int(11) default '0',
  PRIMARY KEY  (`up_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;


INSERT INTO `jtbc_admin` (`a_id`, `a_username`, `a_password`, `a_utype`, `a_popedom`, `a_lock`, `a_lastip`, `a_lasttime`, `a_time`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', -1, '-1', 0, '127.0.0.1', '2010-01-10 12:00:00', '2010-01-10 12:00:00');