/**
* 创建时间 2017-4-10 10:53
* 创建者：ztt
 */
-- 创建数据库
CREATE DATABASE choice ;

-- 使用数据库
USE choice;

-- 创建数据库表

-- 1. 用户表
CREATE TABLE user(
 user_id BIGINT UNIQUE NOT NULL AUTO_INCREMENT COMMENT '用户ID',
 user_name VARCHAR(120) NOT NULL COMMENT '登录用户名,不得出现特殊字符',
 name VARCHAR(120) COMMENT '昵称',
 user_password VARCHAR(21) NOT NULL COMMENT '用户密码，md5加密',
 user_type SMALLINT NOT NULL DEFAULT 0 COMMENT '用户类型，0：普通会员，1：高级会员，2：版主，3：模块管理员，4：系统管理员',
  PRIMARY KEY (user_id)
)ENGINE=INNODB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='用户表';

--  2. 用户类型表
CREATE TABLE user_type(
  user_type_id SMALLINT NOT NULL AUTO_INCREMENT COMMENT '用户类型ID',
  user_type_name VARCHAR(20) NOT NULL  COMMENT '用户类型 0：普通会员，1：高级会员，2：版主，3：模块管理员，4：系统管理员',
  user_type_authority_list  varchar(50) NOT NULL COMMENT '用户权限列表，用数字代替',
  PRIMARY KEY (user_type_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='用户类型表';

--  3. 用户权限表
CREATE TABLE  user_authority(
  authority_id SMALLINT NOT NULL AUTO_INCREMENT COMMENT '用户权限类型ID',
  authority_name VARCHAR(20) NOT NULL COMMENT '用户权限名称',
  PRIMARY KEY (authority_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='用户类型表';

-- 4. 用户信息表
CREATE  TABLE user_info(
 user_info_id BIGINT UNIQUE NOT NULL AUTO_INCREMENT COMMENT '外键，用户ID',
 user_gender  TINYINT NOT NULL DEFAULT 0 COMMENT '用户性别，0代表男，1代表女',
 user_phoneNumber CHAR(11) NOT NULL COMMENT '用户手机号',
 user_email VARCHAR(30) NOT NULL COMMENT '用户邮箱',
 undergraduateSchoolID TINYINT UNIQUE NOT NULL COMMENT '本科学校ID',
 wantSchoolID TINYINT UNIQUE NOT NULL COMMENT '报考学校ID',
 registerTime TIMESTAMP NOT NULL DEFAULT current_timestamp COMMENT '注册时间',
 userImg VARCHAR(50) NOT NULL COMMENT '用户头像',
 homeTown_province VARCHAR(20) NOT NULL COMMENT '家乡—省',
 homeTown_city VARCHAR(20) NOT NULL COMMENT '家乡—市',
 ExamYear INT NOT NULL DEFAULT 2018 COMMENT '考研年份',
  PRIMARY KEY (user_info_id),
  /*创建外键，级联删除和修改*/
  CONSTRAINT fk_user_user_info_id FOREIGN KEY (user_info_id) REFERENCES user(user_id) ON UPDATE CASCADE ON DELETE CASCADE ,
  CONSTRAINT fk_school_bk FOREIGN KEY (undergraduateSchoolID) REFERENCES school(school_id),
  CONSTRAINT fk_school_want FOREIGN KEY (wantSchoolID) REFERENCES school(school_id),
  KEY idx_registerTime (registerTime),
  KEY idx_bk_school (undergraduateSchoolID),
  key idx_want_school(wantSchoolID)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- 5. 学校表
CREATE TABLE school(
  school_id TINYINT UNIQUE NOT NULL AUTO_INCREMENT COMMENT '学校ID',
  school_name VARCHAR(100) NOT NULL  COMMENT '学校名称',
  school_type TINYINT NOT NULL DEFAULT 0 COMMENT '学校类型,0: 双非， 1：211，3：985，4：985+211'
    CHECK (school_type IN (0,1,2,3,4)),
  hot_scores INT NOT NULL DEFAULT 0 COMMENT '热门指数(0-10)'
    CHECK (hot_scores IN (0,1,2,3,4,5,6,7,8,9,10)),
  PRIMARY KEY (school_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='学校表';

-- 6. 学校信息表
CREATE TABLE school_info(
  school_info_id TINYINT NOT NULL AUTO_INCREMENT COMMENT '学校ID',
  school_url VARCHAR(55) COMMENT '学校官网',
  school_zsjz VARCHAR(55) COMMENT '招生简章URL',
  info_year INT NOT NULL COMMENT '年份',
  pass_score INT NOT NULL COMMENT '当年录取分数线（校级线）',
  pass_score_min INT NOT NULL COMMENT '录取最低分',
  pass_score_max INT NOT NULL COMMENT '录取最高分',
  pass_score_average INT NOT NULL COMMENT '录取平均分',
  pass_score_country_A INT NOT NULL COMMENT 'A区国家线',
  pass_score_country_B INT NOT NULL COMMENT 'B区国家线',
  peoplesCount_bk INT NOT NULL COMMENT '报考人数',
  peoplesCount_lq INT NOT NULL COMMENT '录取人数',
  peoplesCount_tm INT NOT NULL COMMENT '推免人数',
  peoplesCount_lq_per INT NOT NULL  COMMENT '录取比例',
  teacher_url VARCHAR(55) COMMENT '导师信息查询URL',
  exam_id TINYINT UNIQUE NOT NULL COMMENT '考试科目代码',
  school_province VARCHAR(20) NOT NULL COMMENT '学校—省',
  school_city VARCHAR(20) NOT NULL COMMENT '学校—市',
  /*联合主键*/
  PRIMARY KEY (school_info_id, info_year),
  /*外键*/
  CONSTRAINT fk_exam FOREIGN KEY (exam_id) REFERENCES exam_info(exam_id),
  /*索引*/
  key idx_year(info_year),
  KEY idx_school_province(school_province),
  KEY idx_school_city(school_city)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='学校信息表';

-- 7. 考试科目信息表
CREATE TABLE exam_info(
  exam_id INT NOT NULL AUTO_INCREMENT COMMENT '考试科目代码',
  book_id INT NULL COMMENT '参考书目ID',
  book_count TINYINT NOT NULL COMMENT '考试科目门数',
  exam_star TINYINT NOT NULL COMMENT '考试难度级别',
  PRIMARY KEY (exam_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='考试科目信息表';

-- 8. 参考书目信息表
CREATE TABLE book(
  book_id INT NOT NULL AUTO_INCREMENT COMMENT '参考书目ID',
  book_name VARCHAR(100) NOT NULL  COMMENT '参考书目名称',
  book_author VARCHAR(100) NOT NULL COMMENT '作者',
  book_publisher VARCHAR(100) NOT NULL COMMENT '出版社',
  book_pub_year INT NOT NULL COMMENT '出版年份',
  book_version VARCHAR(20) NOT NULL COMMENT '书籍版本',
  book_buy_url VARCHAR(55) COMMENT '书籍购买URL',
  /*主键*/
  PRIMARY KEY (book_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='参考书目信息表';


-- 9. 主题（发表的帖子，和发表的回复不同）信息表
CREATE TABLE article(
 article_id BIGINT NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
 article_title VARCHAR(255) NOT NULL  COMMENT '帖子标题',
 article_authorID BIGINT UNIQUE NOT NULL COMMENT '帖子作者用户ID',
 article_content LONGTEXT COMMENT '帖子内容',
 article_create_time DATETIME NOT NULL DEFAULT current_time COMMENT '帖子创建时间',
 article_module_id INT UNIQUE NOT NULL COMMENT '帖子所属模块ID',
 article_comment_number INT NOT NULL  COMMENT '帖子评论数量',
 article_read_number BIGINT NOT NULL COMMENT '帖子浏览次数',
 article_forum_id INT UNIQUE NOT NULL COMMENT '帖子所属板块ID',
 article_is_good TINYINT NOT NULL COMMENT '是否是加精帖子',
 article_is_hot TINYINT NOT NULL COMMENT '是否是热帖子',
 article_is_top TINYINT NOT NULL COMMENT '是否是置顶帖子',
 article_last_reply_userID BIGINT NOT NULL  COMMENT '最后回复用户ID',
 article_last_reply_time DATETIME NOT NULL  COMMENT '最后回复时间',
 article_type_id INT UNIQUE NOT NULL COMMENT '帖子类型',
  /*主键*/
  PRIMARY KEY (article_id),
  /*外键*/
  CONSTRAINT fk_article_author FOREIGN KEY f(article_id) REFERENCES user_info(user_info_id),
  CONSTRAINT fk_article_module FOREIGN KEY (article_module_id) REFERENCES module(module_id),
  CONSTRAINT fk_article_forum FOREIGN KEY (article_forum_id) REFERENCES forum(forum_id),
  CONSTRAINT fk_article_last_reply_author FOREIGN KEY (article_last_reply_userID) REFERENCES  user_info(user_info_id),
  CONSTRAINT fk_article_type FOREIGN KEY (article_type_id) REFERENCES article_type(article_type_id),

  /*索引*/
  KEY idx_article_title(article_title),
  KEY idx_article_hot(article_is_hot),
  KEY idx_article_top(article_is_top),
  KEY idx_article_good(article_is_good),
  KEY idx_article_time(article_create_time)
)ENGINE=INNODB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='帖子信息表';

-- 10. 主题类型
CREATE TABLE article_type(
  article_type_id TINYINT NOT NULL AUTO_INCREMENT COMMENT '主题类型ID',
  article_type_name VARCHAR(50) NOT NULL  COMMENT '主题名称',
  PRIMARY KEY (article_type_id)
);

-- 11. 论坛模块表
CREATE TABLE module(
 module_id INT NOT NULL AUTO_INCREMENT COMMENT '模块ID',
 module_name VARCHAR(30) NOT NULL COMMENT '模块名称',
 module_controller_id BIGINT UNIQUE NOT NULL COMMENT '模块管理员用户ID',
 module_belong_forum_id INT UNIQUE NOT NULL  COMMENT  '模块所属板块ID',
 module_article_count BIGINT NOT NULL COMMENT '模块帖子数量',
 module_read_count BIGINT NOT NULL COMMENT '模块总浏览量',
 module_article_count_closedDay   BIGINT NOT NULL COMMENT '最近一天模块帖子数量',
 module_article_count_closedWeek  BIGINT NOT NULL COMMENT '最近一周模块帖子数量',
 module_article_count_closedMonth BIGINT NOT NULL COMMENT '最近一月模块帖子数量',
 module_article_count_closedYear  BIGINT NOT NULL COMMENT '最近一年模块帖子数量',
 module_reply_count_closedDay   BIGINT NOT NULL COMMENT '最近一天模块回复数量',
 module_reply_count_closedWeek  BIGINT NOT NULL COMMENT '最近一周模块回复数量',
 module_reply_count_closedMonth BIGINT NOT NULL COMMENT '最近一月模块回复数量',
 module_reply_count_closedYear  BIGINT NOT NULL COMMENT '最近一年模块回复数量',
 module_read_count_closedDay    BIGINT NOT NULL COMMENT '最近一天模块浏览量',
 module_read_count_closedWeek   BIGINT NOT NULL COMMENT '最近一周模块浏览量',
 module_read_count_closedMonth  BIGINT NOT NULL COMMENT '最近一月模块浏览量',
 module_read_count_closedYear   BIGINT NOT NULL COMMENT '最近一年模块浏览量',
  PRIMARY KEY (module_id),
  CONSTRAINT fk_module_author FOREIGN KEY (module_controller_id) REFERENCES user_info(user_info_id),
  CONSTRAINT fk_module_forum FOREIGN KEY (module_belong_forum_id) REFERENCES forum(forum_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='模块信息表';
-- 论坛版块表
CREATE TABLE forum(
  forum_id INT NOT NULL AUTO_INCREMENT COMMENT '版块ID',
  forum_name VARCHAR(30) NOT NULL COMMENT '版块名称',
  forum_controller_id BIGINT UNIQUE NOT NULL COMMENT '版块管理员用户ID',
  PRIMARY KEY (forum_id),
  CONSTRAINT fk_forum_author FOREIGN KEY (forum_controller_id) REFERENCES user_info(user_info_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='版块信息表';

-- 12. 论坛帖子回复表
CREATE TABLE reply(
 reply_id BIGINT NOT NULL AUTO_INCREMENT COMMENT '回复ID',
 reply_content LONGTEXT COMMENT '回复内容',
 reply_time DATETIME NOT NULL COMMENT '回复时间',
 reply_author_id BIGINT UNIQUE NOT NULL COMMENT '外键：回复作者用户ID',
 reply_article_id BIGINT UNIQUE NOT NULL COMMENT '外键：所属帖子ID',
  PRIMARY KEY (reply_id),
  /*外键*/
  CONSTRAINT fk_reply_author FOREIGN KEY (reply_author_id) REFERENCES user_info (user_info_id),
  CONSTRAINT fk_reply_article FOREIGN KEY (reply_article_id) REFERENCES article(article_id)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='帖子回复表';

-- 13. 论坛帖子评分表
CREATE TABLE article_scores(
  article_scores_id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主题ID',
  article_scores int NOT NULL DEFAULT 0
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='帖子评分表';


-- 触发器

-- 发表一篇文章的同时更新文章得分表
DELIMITER $$

CREATE
  /*[DEFINER = { user | CURRENT_USER }]*/
TRIGGER `choice`.`article_score`
AFTER INSERT
  ON `choice`.`article`
FOR EACH ROW
  BEGIN
    INSERT INTO article_scores
    SET article_scores_id = new.article_id, article_scores = 0;
    UPDATE module
    SET module_article_count = module_article_count + 1
    WHERE module_id = new.article_module_id;
  END$$
DELIMITER ;


-- 点赞、转发、踩、分享记录同时更新到主题表
DELIMITER $$

CREATE
  /*[DEFINER = { user | CURRENT_USER }]*/
TRIGGER `choice`.`collcetUpdateToArticle` AFTER INSERT
  ON `choice`.`article_collect`
FOR EACH ROW BEGIN
  UPDATE article SET article_collect_counts = article_collect_counts + 1 WHERE article_id = new.aid;
  UPDATE article SET article_good_counts = article_good_counts + 1 WHERE article_id = new.aid;
  UPDATE article SET article_notgood_counts = article_notgood_counts + 1 WHERE article_id = new.aid;
  UPDATE article SET article_share_counts = article_share_counts + 1 WHERE article_id = new.aid;

END$$

DELIMITER ;
DELIMITER $$

-- 统计模块下文章数量
