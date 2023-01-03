-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

--
-- Удалить таблицу `app_pages_translate`
--
DROP TABLE IF EXISTS app_pages_translate;

--
-- Удалить таблицу `session`
--
DROP TABLE IF EXISTS session;

--
-- Удалить таблицу `se_group`
--
DROP TABLE IF EXISTS se_group;

--
-- Удалить таблицу `se_notice_log`
--
DROP TABLE IF EXISTS se_notice_log;

--
-- Удалить таблицу `se_settings`
--
DROP TABLE IF EXISTS se_settings;

--
-- Удалить таблицу `se_user_collection`
--
DROP TABLE IF EXISTS se_user_collection;

--
-- Удалить таблицу `app_nav_url_translate`
--
DROP TABLE IF EXISTS app_nav_url_translate;

--
-- Удалить таблицу `app_section_collection_image_translate`
--
DROP TABLE IF EXISTS app_section_collection_image_translate;

--
-- Удалить таблицу `app_section_collection_translate`
--
DROP TABLE IF EXISTS app_section_collection_translate;

--
-- Удалить таблицу `app_section_collection_values_translate`
--
DROP TABLE IF EXISTS app_section_collection_values_translate;

--
-- Удалить таблицу `app_section_groups_image_translate`
--
DROP TABLE IF EXISTS app_section_groups_image_translate;

--
-- Удалить таблицу `app_section_groups_translate`
--
DROP TABLE IF EXISTS app_section_groups_translate;

--
-- Удалить таблицу `app_section_translate`
--
DROP TABLE IF EXISTS app_section_translate;

--
-- Удалить таблицу `app_language`
--
DROP TABLE IF EXISTS app_language;

--
-- Удалить таблицу `app_section_collection_region`
--
DROP TABLE IF EXISTS app_section_collection_region;

--
-- Удалить таблицу `se_user_region`
--
DROP TABLE IF EXISTS se_user_region;

--
-- Удалить таблицу `app_regions`
--
DROP TABLE IF EXISTS app_regions;

--
-- Удалить таблицу `se_notice_trigger`
--
DROP TABLE IF EXISTS se_notice_trigger;

--
-- Удалить таблицу `se_notice`
--
DROP TABLE IF EXISTS se_notice;

--
-- Удалить таблицу `se_trigger`
--
DROP TABLE IF EXISTS se_trigger;

--
-- Удалить таблицу `se_permission_object_role`
--
DROP TABLE IF EXISTS se_permission_object_role;

--
-- Удалить таблицу `se_permission_object`
--
DROP TABLE IF EXISTS se_permission_object;

--
-- Удалить таблицу `se_permission_role_user`
--
DROP TABLE IF EXISTS se_permission_role_user;

--
-- Удалить таблицу `se_permission_role`
--
DROP TABLE IF EXISTS se_permission_role;

--
-- Удалить таблицу `se_user_file`
--
DROP TABLE IF EXISTS se_user_file;

--
-- Удалить таблицу `app_section_collection_files`
--
DROP TABLE IF EXISTS app_section_collection_files;

--
-- Удалить таблицу `app_section_collection_reviews_votes`
--
DROP TABLE IF EXISTS app_section_collection_reviews_votes;

--
-- Удалить таблицу `app_section_collection_reviews`
--
DROP TABLE IF EXISTS app_section_collection_reviews;

--
-- Удалить таблицу `se_user_permission`
--
DROP TABLE IF EXISTS se_user_permission;

--
-- Удалить таблицу `se_user_values`
--
DROP TABLE IF EXISTS se_user_values;

--
-- Удалить таблицу `se_user`
--
DROP TABLE IF EXISTS se_user;

--
-- Удалить таблицу `se_userfields`
--
DROP TABLE IF EXISTS se_userfields;

--
-- Удалить таблицу `se_userfields_group`
--
DROP TABLE IF EXISTS se_userfields_group;

--
-- Удалить таблицу `app_request_order_values`
--
DROP TABLE IF EXISTS app_request_order_values;

--
-- Удалить таблицу `app_request_fields`
--
DROP TABLE IF EXISTS app_request_fields;

--
-- Удалить таблицу `app_request_fieldsgroup`
--
DROP TABLE IF EXISTS app_request_fieldsgroup;

--
-- Удалить таблицу `app_request_order`
--
DROP TABLE IF EXISTS app_request_order;

--
-- Удалить таблицу `app_requests`
--
DROP TABLE IF EXISTS app_requests;

--
-- Удалить таблицу `app_section_collection_image`
--
DROP TABLE IF EXISTS app_section_collection_image;

--
-- Удалить таблицу `app_section_groups_image`
--
DROP TABLE IF EXISTS app_section_groups_image;

--
-- Удалить таблицу `app_image`
--
DROP TABLE IF EXISTS app_image;

--
-- Удалить таблицу `app_image_folder`
--
DROP TABLE IF EXISTS app_image_folder;

--
-- Удалить таблицу `app_section_collection_values`
--
DROP TABLE IF EXISTS app_section_collection_values;

--
-- Удалить таблицу `app_section_fields`
--
DROP TABLE IF EXISTS app_section_fields;

--
-- Удалить таблицу `app_section_fieldsgroup`
--
DROP TABLE IF EXISTS app_section_fieldsgroup;

--
-- Удалить таблицу `app_page_permission`
--
DROP TABLE IF EXISTS app_page_permission;

--
-- Удалить таблицу `app_nav_url`
--
DROP TABLE IF EXISTS app_nav_url;

--
-- Удалить таблицу `app_urls`
--
DROP TABLE IF EXISTS app_urls;

--
-- Удалить таблицу `app_pages`
--
DROP TABLE IF EXISTS app_pages;

--
-- Удалить таблицу `app_section_collection_permission`
--
DROP TABLE IF EXISTS app_section_collection_permission;

--
-- Удалить таблицу `app_section_permission`
--
DROP TABLE IF EXISTS app_section_permission;

--
-- Удалить таблицу `app_permission`
--
DROP TABLE IF EXISTS app_permission;

--
-- Удалить таблицу `app_nav`
--
DROP TABLE IF EXISTS app_nav;

--
-- Удалить таблицу `app_section_collection_comments`
--
DROP TABLE IF EXISTS app_section_collection_comments;

--
-- Удалить таблицу `app_section_collection_group`
--
DROP TABLE IF EXISTS app_section_collection_group;

--
-- Удалить таблицу `app_section_collection_similar`
--
DROP TABLE IF EXISTS app_section_collection_similar;

--
-- Удалить таблицу `app_section_collection`
--
DROP TABLE IF EXISTS app_section_collection;

--
-- Удалить таблицу `app_section_groups`
--
DROP TABLE IF EXISTS app_section_groups;

--
-- Удалить таблицу `app_section_parametrs`
--
DROP TABLE IF EXISTS app_section_parametrs;

--
-- Удалить таблицу `app_section`
--
DROP TABLE IF EXISTS app_section;

--
-- Удалить таблицу `apps`
--
DROP TABLE IF EXISTS apps;


--
-- Создать таблицу `apps`
--
CREATE TABLE apps (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  app_name varchar(40) NOT NULL COMMENT 'Application name',
  caption varchar(255) NOT NULL,
  lang varchar(6) NOT NULL DEFAULT 'ru',
  id_lang int(10) UNSIGNED NOT NULL,
  domain varchar(255) DEFAULT NULL,
  domainredirect tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Redirect to domain',
  alias text NOT NULL,
  multidomain tinyint(1) NOT NULL DEFAULT 0,
  robots text NOT NULL,
  favicon text NOT NULL,
  from_email varchar(255) NOT NULL,
  sms_phone varchar(255) NOT NULL,
  sms_sender varchar(255) NOT NULL,
  is_main tinyint(1) NOT NULL DEFAULT 0,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Список приложений';

--
-- Создать индекс `created_at` для объекта типа таблица `apps`
--
ALTER TABLE apps
ADD INDEX created_at (created_at);

--
-- Создать индекс `domain` для объекта типа таблица `apps`
--
ALTER TABLE apps
ADD INDEX domain (domain);

--
-- Создать индекс `id_lang` для объекта типа таблица `apps`
--
ALTER TABLE apps
ADD INDEX id_lang (id_lang);

--
-- Создать индекс `is_main` для объекта типа таблица `apps`
--
ALTER TABLE apps
ADD INDEX is_main (is_main);

--
-- Создать индекс `lang` для объекта типа таблица `apps`
--
ALTER TABLE apps
ADD INDEX lang (lang);

--
-- Создать индекс `name` для объекта типа таблица `apps`
--
ALTER TABLE apps
ADD UNIQUE INDEX name (app_name);

--
-- Создать индекс `updated_at` для объекта типа таблица `apps`
--
ALTER TABLE apps
ADD INDEX updated_at (updated_at);

--
-- Создать таблицу `app_section`
--
CREATE TABLE app_section (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_app int(10) UNSIGNED DEFAULT NULL,
  id_parent int(10) UNSIGNED DEFAULT NULL COMMENT 'Категория раздела',
  id_page int(10) UNSIGNED DEFAULT NULL,
  alias varchar(40) NOT NULL,
  typename varchar(255) NOT NULL DEFAULT 'text',
  name varchar(40) NOT NULL,
  visible tinyint(1) NOT NULL DEFAULT 1,
  seo_enable tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Выводить в поисковик',
  sort int(11) NOT NULL DEFAULT 0,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Modules or block';

--
-- Создать индекс `alias` для объекта типа таблица `app_section`
--
ALTER TABLE app_section
ADD UNIQUE INDEX alias (alias, id_app);

--
-- Создать индекс `created_at` для объекта типа таблица `app_section`
--
ALTER TABLE app_section
ADD INDEX created_at (created_at);

--
-- Создать индекс `id_page` для объекта типа таблица `app_section`
--
ALTER TABLE app_section
ADD INDEX id_page (id_page);

--
-- Создать индекс `id_parent` для объекта типа таблица `app_section`
--
ALTER TABLE app_section
ADD INDEX id_parent (id_parent);

--
-- Создать индекс `seo_enable` для объекта типа таблица `app_section`
--
ALTER TABLE app_section
ADD INDEX seo_enable (seo_enable);

--
-- Создать индекс `sort` для объекта типа таблица `app_section`
--
ALTER TABLE app_section
ADD INDEX sort (sort);

--
-- Создать индекс `updated_at` для объекта типа таблица `app_section`
--
ALTER TABLE app_section
ADD INDEX updated_at (updated_at);

--
-- Создать индекс `visible` для объекта типа таблица `app_section`
--
ALTER TABLE app_section
ADD INDEX visible (visible);

--
-- Создать внешний ключ
--
ALTER TABLE app_section
ADD CONSTRAINT app_section_ibfk_2 FOREIGN KEY (id_app)
REFERENCES apps (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE app_section 
  ADD CONSTRAINT FK_app_section_id_parent FOREIGN KEY (id_parent)
    REFERENCES app_section(id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_section_parametrs`
--
CREATE TABLE app_section_parametrs (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_section int(10) UNSIGNED NOT NULL,
  field varchar(40) NOT NULL,
  value text NOT NULL,
  sort int(11) NOT NULL DEFAULT 0,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Список переменных коллекции';

--
-- Создать индекс `field` для объекта типа таблица `app_section_parametrs`
--
ALTER TABLE app_section_parametrs
ADD INDEX field (field);

--
-- Создать индекс `field_section` для объекта типа таблица `app_section_parametrs`
--
ALTER TABLE app_section_parametrs
ADD UNIQUE INDEX field_section (id_section, field);

--
-- Создать индекс `id_collection` для объекта типа таблица `app_section_parametrs`
--
ALTER TABLE app_section_parametrs
ADD INDEX id_collection (id_section);

--
-- Создать индекс `id_field` для объекта типа таблица `app_section_parametrs`
--
ALTER TABLE app_section_parametrs
ADD INDEX id_field (field);

--
-- Создать индекс `sort` для объекта типа таблица `app_section_parametrs`
--
ALTER TABLE app_section_parametrs
ADD INDEX sort (sort);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_parametrs
ADD CONSTRAINT app_section_parametrs_ibfk_1 FOREIGN KEY (id_section)
REFERENCES app_section (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_section_groups`
--
CREATE TABLE app_section_groups (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_section int(10) UNSIGNED NOT NULL,
  id_parent int(10) UNSIGNED DEFAULT NULL,
  code varchar(255) NOT NULL,
  sort int(11) NOT NULL DEFAULT 0,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Группы разделов';

--
-- Создать индекс `sort` для объекта типа таблица `app_section_groups`
--
ALTER TABLE app_section_groups
ADD INDEX sort (sort);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_groups
ADD CONSTRAINT app_section_groups_ibfk_1 FOREIGN KEY (id_section)
REFERENCES app_section (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_section_groups
ADD CONSTRAINT app_section_groups_ibfk_2 FOREIGN KEY (id_parent)
REFERENCES app_section_groups (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_section_collection`
--
CREATE TABLE app_section_collection (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_parent int(10) UNSIGNED DEFAULT NULL,
  id_section int(10) UNSIGNED NOT NULL,
  code varchar(255) DEFAULT NULL,
  url varchar(255) NOT NULL,
  is_date_public tinyint(1) NOT NULL DEFAULT 0,
  date_public datetime NOT NULL,
  visible tinyint(1) NOT NULL DEFAULT 1,
  sort int(11) NOT NULL DEFAULT 0,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Коллекция записей раздела';

--
-- Создать индекс `created_at` для объекта типа таблица `app_section_collection`
--
ALTER TABLE app_section_collection
ADD INDEX created_at (created_at);

--
-- Создать индекс `date_public` для объекта типа таблица `app_section_collection`
--
ALTER TABLE app_section_collection
ADD INDEX date_public (date_public);

--
-- Создать индекс `is_date_public` для объекта типа таблица `app_section_collection`
--
ALTER TABLE app_section_collection
ADD INDEX is_date_public (is_date_public);

--
-- Создать индекс `sort` для объекта типа таблица `app_section_collection`
--
ALTER TABLE app_section_collection
ADD INDEX sort (sort);

--
-- Создать индекс `updated_at` для объекта типа таблица `app_section_collection`
--
ALTER TABLE app_section_collection
ADD INDEX updated_at (updated_at);

--
-- Создать индекс `url` для объекта типа таблица `app_section_collection`
--
ALTER TABLE app_section_collection
ADD INDEX url (code);

--
-- Создать индекс `visible` для объекта типа таблица `app_section_collection`
--
ALTER TABLE app_section_collection
ADD INDEX visible (visible);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection
ADD CONSTRAINT app_section_collection_ibfk_1 FOREIGN KEY (id_section)
REFERENCES app_section (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection
ADD CONSTRAINT app_section_collection_ibfk_2 FOREIGN KEY (id_parent)
REFERENCES app_section_collection (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_section_collection_similar`
--
CREATE TABLE app_section_collection_similar (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_collection int(10) UNSIGNED NOT NULL,
  id_item int(10) UNSIGNED NOT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Related records link';

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_similar
ADD CONSTRAINT app_section_collection_similar_ibfk_1 FOREIGN KEY (id_collection)
REFERENCES app_section_collection (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_similar
ADD CONSTRAINT app_section_collection_similar_ibfk_2 FOREIGN KEY (id_item)
REFERENCES app_section_collection (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_section_collection_group`
--
CREATE TABLE app_section_collection_group (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_collection int(10) UNSIGNED NOT NULL,
  id_group int(10) UNSIGNED NOT NULL,
  updated_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `created_at` для объекта типа таблица `app_section_collection_group`
--
ALTER TABLE app_section_collection_group
ADD INDEX created_at (created_at);

--
-- Создать индекс `id_section` для объекта типа таблица `app_section_collection_group`
--
ALTER TABLE app_section_collection_group
ADD INDEX id_section (id_collection);

--
-- Создать индекс `updated_at` для объекта типа таблица `app_section_collection_group`
--
ALTER TABLE app_section_collection_group
ADD INDEX updated_at (updated_at);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_group
ADD CONSTRAINT app_section_collection_group_ibfk_1 FOREIGN KEY (id_collection)
REFERENCES app_section_collection (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_group
ADD CONSTRAINT app_section_collection_group_ibfk_2 FOREIGN KEY (id_group)
REFERENCES app_section_groups (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_section_collection_comments`
--
CREATE TABLE app_section_collection_comments (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_collection int(10) UNSIGNED NOT NULL,
  name varchar(125) NOT NULL,
  email varchar(125) DEFAULT NULL,
  commentary text NOT NULL,
  response text DEFAULT NULL,
  date date NOT NULL,
  mark int(11) NOT NULL,
  showing enum ('Y', 'N') DEFAULT 'N',
  is_active enum ('Y', 'N') DEFAULT 'N',
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_comments
ADD CONSTRAINT app_section_collection_comments_ibfk_1 FOREIGN KEY (id_collection)
REFERENCES app_section_collection (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_nav`
--
CREATE TABLE app_nav (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_app int(10) UNSIGNED DEFAULT NULL,
  name varchar(255) NOT NULL,
  code varchar(255) NOT NULL,
  updated_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 82,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Справочник картинок',
ROW_FORMAT = COMPACT;

--
-- Создать индекс `UK_app_nav_code` для объекта типа таблица `app_nav`
--
ALTER TABLE app_nav
ADD UNIQUE INDEX UK_app_nav_code (code);

--
-- Создать внешний ключ
--
ALTER TABLE app_nav
ADD CONSTRAINT FK_app_nav_id_app FOREIGN KEY (id_app)
REFERENCES apps (id);

--
-- Создать таблицу `app_permission`
--
CREATE TABLE app_permission (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  level tinyint(4) NOT NULL DEFAULT 0,
  description varchar(255) NOT NULL,
  sort int(11) NOT NULL DEFAULT 0,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Права доступа проекта';

--
-- Создать индекс `sort` для объекта типа таблица `app_permission`
--
ALTER TABLE app_permission
ADD INDEX sort (sort);

--
-- Создать таблицу `app_section_permission`
--
CREATE TABLE app_section_permission (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_section int(10) UNSIGNED NOT NULL,
  id_permission int(10) UNSIGNED NOT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Page permission';

--
-- Создать внешний ключ
--
ALTER TABLE app_section_permission
ADD CONSTRAINT app_section_permission_ibfk_1 FOREIGN KEY (id_section)
REFERENCES app_section (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_section_permission
ADD CONSTRAINT app_section_permission_ibfk_2 FOREIGN KEY (id_permission)
REFERENCES app_permission (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_section_collection_permission`
--
CREATE TABLE app_section_collection_permission (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_collection int(10) UNSIGNED NOT NULL,
  id_permission int(10) UNSIGNED NOT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Page permission';

--
-- Создать индекс `id_section` для объекта типа таблица `app_section_collection_permission`
--
ALTER TABLE app_section_collection_permission
ADD INDEX id_section (id_collection);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_permission
ADD CONSTRAINT app_section_collection_permission_ibfk_1 FOREIGN KEY (id_collection)
REFERENCES app_section_collection (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_permission
ADD CONSTRAINT app_section_collection_permission_ibfk_2 FOREIGN KEY (id_permission)
REFERENCES app_permission (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_pages`
--
CREATE TABLE app_pages (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  template text NOT NULL,
  priority tinyint(4) NOT NULL DEFAULT 5,
  id_permission int(10) UNSIGNED DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Список страниц сайта';

--
-- Создать индекс `created_at` для объекта типа таблица `app_pages`
--
ALTER TABLE app_pages
ADD INDEX created_at (created_at);

--
-- Создать индекс `name` для объекта типа таблица `app_pages`
--
ALTER TABLE app_pages
ADD UNIQUE INDEX name (name);

--
-- Создать индекс `updated_at` для объекта типа таблица `app_pages`
--
ALTER TABLE app_pages
ADD INDEX updated_at (updated_at);

--
-- Создать внешний ключ
--
ALTER TABLE app_pages
ADD CONSTRAINT app_pages_ibfk_1 FOREIGN KEY (id_permission)
REFERENCES app_permission (id) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Создать таблицу `app_urls`
--
CREATE TABLE app_urls (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_app int(10) UNSIGNED NOT NULL,
  id_page int(10) UNSIGNED DEFAULT NULL,
  id_section int(10) UNSIGNED DEFAULT NULL,
  pattern varchar(255) DEFAULT NULL,
  type enum ('link', 'page', 'group', 'item') NOT NULL DEFAULT 'page',
  alias varchar(40) NOT NULL,
  template varchar(125) DEFAULT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 1820,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Паттерны ссылок приложений';

--
-- Создать индекс `alias` для объекта типа таблица `app_urls`
--
ALTER TABLE app_urls
ADD UNIQUE INDEX alias (alias, id_app);

--
-- Создать индекс `pattern` для объекта типа таблица `app_urls`
--
ALTER TABLE app_urls
ADD UNIQUE INDEX pattern (pattern);

--
-- Создать внешний ключ
--
ALTER TABLE app_urls
ADD CONSTRAINT app_urls_ibfk_1 FOREIGN KEY (id_app)
REFERENCES apps (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_urls
ADD CONSTRAINT app_urls_ibfk_2 FOREIGN KEY (id_page)
REFERENCES app_pages (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_urls
ADD CONSTRAINT app_urls_ibfk_3 FOREIGN KEY (id_section)
REFERENCES app_section (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_nav_url`
--
CREATE TABLE app_nav_url (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_nav int(10) UNSIGNED NOT NULL,
  id_url int(10) UNSIGNED NOT NULL,
  id_parent int(10) UNSIGNED DEFAULT NULL,
  id_group int(10) UNSIGNED DEFAULT NULL,
  id_collection int(10) UNSIGNED DEFAULT NULL,
  sort int(11) NOT NULL DEFAULT 0,
  is_active tinyint(1) NOT NULL DEFAULT 1,
  updated_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 82,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Справочник картинок',
ROW_FORMAT = COMPACT;

--
-- Создать внешний ключ
--
ALTER TABLE app_nav_url
ADD CONSTRAINT FK_app_nav_url_id_collection FOREIGN KEY (id_collection)
REFERENCES app_section_collection (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_nav_url
ADD CONSTRAINT FK_app_nav_url_id_group FOREIGN KEY (id_group)
REFERENCES app_section_groups (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_nav_url
ADD CONSTRAINT FK_app_nav_url_id_nav FOREIGN KEY (id_nav)
REFERENCES app_nav (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_nav_url
ADD CONSTRAINT FK_app_nav_url_id_parent FOREIGN KEY (id_parent)
REFERENCES app_nav_url (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_nav_url
ADD CONSTRAINT FK_app_nav_url_id_url FOREIGN KEY (id_url)
REFERENCES app_urls (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_page_permission`
--
CREATE TABLE app_page_permission (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_page int(10) UNSIGNED NOT NULL,
  id_permission int(10) UNSIGNED NOT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Page permission';

--
-- Создать внешний ключ
--
ALTER TABLE app_page_permission
ADD CONSTRAINT app_page_permission_ibfk_1 FOREIGN KEY (id_page)
REFERENCES app_pages (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_page_permission
ADD CONSTRAINT app_page_permission_ibfk_2 FOREIGN KEY (id_permission)
REFERENCES app_permission (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_section_fieldsgroup`
--
CREATE TABLE app_section_fieldsgroup (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_section int(10) UNSIGNED NOT NULL,
  name varchar(255) NOT NULL,
  is_multi tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Это группа списка',
  sort int(11) NOT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `id_section` для объекта типа таблица `app_section_fieldsgroup`
--
ALTER TABLE app_section_fieldsgroup
ADD INDEX id_section (id_section);

--
-- Создать индекс `sort` для объекта типа таблица `app_section_fieldsgroup`
--
ALTER TABLE app_section_fieldsgroup
ADD INDEX sort (sort);

--
-- Создать таблицу `app_section_fields`
--
CREATE TABLE app_section_fields (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_section int(10) UNSIGNED DEFAULT NULL COMMENT 'ID Секции',
  id_group int(10) UNSIGNED DEFAULT NULL,
  code varchar(40) NOT NULL,
  name varchar(255) NOT NULL,
  type enum ('string', 'text', 'textedit', 'number', 'checkbox', 'radio', 'date', 'link', 'select') NOT NULL DEFAULT 'string',
  required tinyint(1) NOT NULL DEFAULT 0,
  placeholder varchar(255) NOT NULL,
  mask varchar(255) NOT NULL,
  description text NOT NULL,
  `values` text DEFAULT NULL,
  min int(10) UNSIGNED DEFAULT NULL,
  max int(10) UNSIGNED DEFAULT NULL,
  size varchar(40) NOT NULL,
  child_level tinyint(4) NOT NULL DEFAULT 0,
  defvalue varchar(255) DEFAULT NULL,
  enabled tinyint(1) NOT NULL DEFAULT 1,
  sort int(11) NOT NULL DEFAULT 0,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Список переменных';

--
-- Создать индекс `code` для объекта типа таблица `app_section_fields`
--
ALTER TABLE app_section_fields
ADD INDEX code (code);

--
-- Создать индекс `enabled` для объекта типа таблица `app_section_fields`
--
ALTER TABLE app_section_fields
ADD INDEX enabled (enabled);

--
-- Создать индекс `name` для объекта типа таблица `app_section_fields`
--
ALTER TABLE app_section_fields
ADD UNIQUE INDEX name (name, id_section);

--
-- Создать индекс `sort` для объекта типа таблица `app_section_fields`
--
ALTER TABLE app_section_fields
ADD INDEX sort (sort);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_fields
ADD CONSTRAINT app_section_fields_ibfk_1 FOREIGN KEY (id_section)
REFERENCES app_section (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_section_fields
ADD CONSTRAINT app_section_fields_ibfk_2 FOREIGN KEY (id_group)
REFERENCES app_section_fieldsgroup (id) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Создать таблицу `app_section_collection_values`
--
CREATE TABLE app_section_collection_values (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_collection int(10) UNSIGNED NOT NULL,
  id_field int(10) UNSIGNED NOT NULL,
  intvalue int(11) DEFAULT NULL,
  value longtext DEFAULT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 585,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Список переменных коллекции';

--
-- Создать индекс `intvalue` для объекта типа таблица `app_section_collection_values`
--
ALTER TABLE app_section_collection_values
ADD INDEX intvalue (intvalue);

--
-- Создать индекс `uni_values` для объекта типа таблица `app_section_collection_values`
--
ALTER TABLE app_section_collection_values
ADD UNIQUE INDEX uni_values (id_collection, id_field);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_values
ADD CONSTRAINT app_section_collection_values_ibfk_1 FOREIGN KEY (id_collection)
REFERENCES app_section_collection (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_values
ADD CONSTRAINT app_section_collection_values_ibfk_2 FOREIGN KEY (id_field)
REFERENCES app_section_fields (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_image_folder`
--
CREATE TABLE app_image_folder (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  updated_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 2730,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Папки для картинок',
ROW_FORMAT = COMPACT;

--
-- Создать индекс `name` для объекта типа таблица `app_image_folder`
--
ALTER TABLE app_image_folder
ADD UNIQUE INDEX name (name);

--
-- Создать таблицу `app_image`
--
CREATE TABLE app_image (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_folder int(10) UNSIGNED DEFAULT NULL,
  name varchar(255) NOT NULL,
  updated_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 82,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Справочник картинок',
ROW_FORMAT = COMPACT;

--
-- Создать индекс `UK_image` для объекта типа таблица `app_image`
--
ALTER TABLE app_image
ADD UNIQUE INDEX UK_image (id_folder, name);

--
-- Создать внешний ключ
--
ALTER TABLE app_image
ADD CONSTRAINT FK_image_image_folder_id FOREIGN KEY (id_folder)
REFERENCES app_image_folder (id);

--
-- Создать таблицу `app_section_groups_image`
--
CREATE TABLE app_section_groups_image (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_group int(10) UNSIGNED NOT NULL,
  id_image int(10) UNSIGNED NOT NULL,
  sort int(10) NOT NULL DEFAULT 0,
  is_main tinyint(1) NOT NULL DEFAULT 0,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Группы разделов';

--
-- Создать индекс `UK_app_section_groups_image` для объекта типа таблица `app_section_groups_image`
--
ALTER TABLE app_section_groups_image
ADD UNIQUE INDEX UK_app_section_groups_image (id_group, id_image);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_groups_image
ADD CONSTRAINT FK_app_section_groups_image_i2 FOREIGN KEY (id_image)
REFERENCES app_image (id);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_groups_image
ADD CONSTRAINT FK_app_section_groups_image_id FOREIGN KEY (id_group)
REFERENCES app_section_groups (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_section_collection_image`
--
CREATE TABLE app_section_collection_image (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_collection int(10) UNSIGNED NOT NULL,
  id_image int(10) UNSIGNED NOT NULL,
  is_main tinyint(1) NOT NULL DEFAULT 0,
  sort int(11) NOT NULL DEFAULT 0,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Коллекция записей раздела';

--
-- Создать индекс `created_at` для объекта типа таблица `app_section_collection_image`
--
ALTER TABLE app_section_collection_image
ADD INDEX created_at (created_at);

--
-- Создать индекс `sort` для объекта типа таблица `app_section_collection_image`
--
ALTER TABLE app_section_collection_image
ADD INDEX sort (sort);

--
-- Создать индекс `UK_app_section_collection_imag` для объекта типа таблица `app_section_collection_image`
--
ALTER TABLE app_section_collection_image
ADD UNIQUE INDEX UK_app_section_collection_imag (id_collection, id_image);

--
-- Создать индекс `updated_at` для объекта типа таблица `app_section_collection_image`
--
ALTER TABLE app_section_collection_image
ADD INDEX updated_at (updated_at);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_image
ADD CONSTRAINT FK_app_section_collection_ima2 FOREIGN KEY (id_image)
REFERENCES app_image (id);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_image
ADD CONSTRAINT FK_app_section_collection_imag FOREIGN KEY (id_collection)
REFERENCES app_section_collection (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_requests`
--
CREATE TABLE app_requests (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(125) NOT NULL,
  sort int(11) DEFAULT 0,
  updated_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Table for request or messages';

--
-- Создать таблицу `app_request_order`
--
CREATE TABLE app_request_order (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_request int(10) UNSIGNED NOT NULL,
  name varchar(255) DEFAULT NULL,
  email varchar(125) DEFAULT NULL,
  phone varchar(20) DEFAULT NULL,
  commentary text DEFAULT NULL,
  utm text DEFAULT NULL,
  id_object int(10) UNSIGNED DEFAULT NULL COMMENT 'Join other object',
  is_showing tinyint(1) NOT NULL DEFAULT 0,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `is_showing` для объекта типа таблица `app_request_order`
--
ALTER TABLE app_request_order
ADD INDEX is_showing (is_showing);

--
-- Создать внешний ключ
--
ALTER TABLE app_request_order
ADD CONSTRAINT app_request_order_ibfk_1 FOREIGN KEY (id_request)
REFERENCES app_requests (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_request_fieldsgroup`
--
CREATE TABLE app_request_fieldsgroup (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_request int(10) UNSIGNED NOT NULL,
  name varchar(255) NOT NULL,
  is_multi tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Это группа списка',
  sort int(11) NOT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `id_section` для объекта типа таблица `app_request_fieldsgroup`
--
ALTER TABLE app_request_fieldsgroup
ADD INDEX id_section (id_request);

--
-- Создать индекс `sort` для объекта типа таблица `app_request_fieldsgroup`
--
ALTER TABLE app_request_fieldsgroup
ADD INDEX sort (sort);

--
-- Создать внешний ключ
--
ALTER TABLE app_request_fieldsgroup
ADD CONSTRAINT app_request_fieldsgroup_ibfk_1 FOREIGN KEY (id_request)
REFERENCES app_requests (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_request_fields`
--
CREATE TABLE app_request_fields (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_request int(10) UNSIGNED DEFAULT NULL COMMENT 'ID Секции',
  id_group int(10) UNSIGNED DEFAULT NULL,
  code varchar(40) NOT NULL,
  name varchar(255) NOT NULL,
  type enum ('string', 'text', 'textedit', 'number', 'checkbox', 'radio', 'date', 'link', 'select') DEFAULT 'string',
  required tinyint(1) NOT NULL DEFAULT 0,
  placeholder varchar(255) NOT NULL,
  mask varchar(255) NOT NULL,
  description text NOT NULL,
  `values` text DEFAULT NULL,
  min int(10) UNSIGNED DEFAULT NULL,
  max int(10) UNSIGNED DEFAULT NULL,
  size varchar(40) NOT NULL,
  child_level tinyint(4) NOT NULL DEFAULT 0,
  defvalue varchar(255) DEFAULT NULL,
  enabled tinyint(1) NOT NULL DEFAULT 1,
  sort int(11) NOT NULL DEFAULT 0,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Список переменных';

--
-- Создать индекс `app_section_fields_ibfk_1` для объекта типа таблица `app_request_fields`
--
ALTER TABLE app_request_fields
ADD INDEX app_section_fields_ibfk_1 (id_request);

--
-- Создать индекс `app_section_fields_ibfk_2` для объекта типа таблица `app_request_fields`
--
ALTER TABLE app_request_fields
ADD INDEX app_section_fields_ibfk_2 (id_group);

--
-- Создать индекс `code` для объекта типа таблица `app_request_fields`
--
ALTER TABLE app_request_fields
ADD INDEX code (code);

--
-- Создать индекс `enabled` для объекта типа таблица `app_request_fields`
--
ALTER TABLE app_request_fields
ADD INDEX enabled (enabled);

--
-- Создать индекс `name` для объекта типа таблица `app_request_fields`
--
ALTER TABLE app_request_fields
ADD UNIQUE INDEX name (name, id_request);

--
-- Создать индекс `sort` для объекта типа таблица `app_request_fields`
--
ALTER TABLE app_request_fields
ADD INDEX sort (sort);

--
-- Создать внешний ключ
--
ALTER TABLE app_request_fields
ADD CONSTRAINT app_request_fields_ibfk_1 FOREIGN KEY (id_request)
REFERENCES app_requests (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_request_fields
ADD CONSTRAINT app_request_fields_ibfk_2 FOREIGN KEY (id_group)
REFERENCES app_request_fieldsgroup (id) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Создать таблицу `app_request_order_values`
--
CREATE TABLE app_request_order_values (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_order int(10) UNSIGNED NOT NULL,
  id_field int(10) UNSIGNED NOT NULL,
  intvalue int(11) DEFAULT NULL,
  value longtext DEFAULT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Список переменных коллекции';

--
-- Создать индекс `app_section_collection_values_ibfk_2` для объекта типа таблица `app_request_order_values`
--
ALTER TABLE app_request_order_values
ADD INDEX app_section_collection_values_ibfk_2 (id_field);

--
-- Создать индекс `intvalue` для объекта типа таблица `app_request_order_values`
--
ALTER TABLE app_request_order_values
ADD INDEX intvalue (intvalue);

--
-- Создать индекс `uni_values` для объекта типа таблица `app_request_order_values`
--
ALTER TABLE app_request_order_values
ADD UNIQUE INDEX uni_values (id_order, id_field);

--
-- Создать внешний ключ
--
ALTER TABLE app_request_order_values
ADD CONSTRAINT app_request_order_values_ibfk_1 FOREIGN KEY (id_order)
REFERENCES app_request_order (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_request_order_values
ADD CONSTRAINT app_request_order_values_ibfk_2 FOREIGN KEY (id_field)
REFERENCES app_request_fields (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `se_userfields_group`
--
CREATE TABLE se_userfields_group (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  sect enum ('person', 'company') NOT NULL DEFAULT 'person',
  name varchar(255) NOT NULL,
  is_multi tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Это группа списка',
  sort int(11) NOT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `sort` для объекта типа таблица `se_userfields_group`
--
ALTER TABLE se_userfields_group
ADD INDEX sort (sort);

--
-- Создать индекс `type` для объекта типа таблица `se_userfields_group`
--
ALTER TABLE se_userfields_group
ADD INDEX type (sect);

--
-- Создать таблицу `se_userfields`
--
CREATE TABLE se_userfields (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  sect enum ('person', 'company') NOT NULL DEFAULT 'person',
  id_group int(10) UNSIGNED DEFAULT NULL,
  code varchar(40) NOT NULL,
  name varchar(255) NOT NULL,
  type enum ('image', 'list', 'string', 'text', 'textedit', 'file', 'url', 'group') NOT NULL DEFAULT 'string',
  required tinyint(1) NOT NULL DEFAULT 0,
  placeholder varchar(255) NOT NULL,
  mask varchar(255) NOT NULL,
  description text NOT NULL,
  `values` text DEFAULT NULL,
  min int(10) UNSIGNED DEFAULT NULL,
  max int(10) UNSIGNED DEFAULT NULL,
  size varchar(40) NOT NULL,
  child_level tinyint(4) NOT NULL DEFAULT 0,
  defvalue varchar(255) DEFAULT NULL,
  enabled tinyint(1) NOT NULL DEFAULT 1,
  sort int(11) NOT NULL DEFAULT 0,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Список переменных';

--
-- Создать индекс `code` для объекта типа таблица `se_userfields`
--
ALTER TABLE se_userfields
ADD INDEX code (code);

--
-- Создать индекс `enabled` для объекта типа таблица `se_userfields`
--
ALTER TABLE se_userfields
ADD INDEX enabled (enabled);

--
-- Создать индекс `name` для объекта типа таблица `se_userfields`
--
ALTER TABLE se_userfields
ADD UNIQUE INDEX name (name);

--
-- Создать индекс `sect` для объекта типа таблица `se_userfields`
--
ALTER TABLE se_userfields
ADD INDEX sect (sect);

--
-- Создать индекс `sort` для объекта типа таблица `se_userfields`
--
ALTER TABLE se_userfields
ADD INDEX sort (sort);

--
-- Создать внешний ключ
--
ALTER TABLE se_userfields
ADD CONSTRAINT se_userfields_ibfk_1 FOREIGN KEY (id_group)
REFERENCES se_userfields_group (id) ON UPDATE NO ACTION;

--
-- Создать таблицу `se_user`
--
CREATE TABLE se_user (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_affiliate int(10) DEFAULT NULL,
  username varchar(125) DEFAULT NULL,
  password varchar(40) DEFAULT NULL,
  tmppassw varchar(40) DEFAULT NULL,
  is_active tinyint(1) NOT NULL DEFAULT 1,
  is_super_admin tinyint(1) NOT NULL DEFAULT 0,
  is_manager tinyint(1) NOT NULL DEFAULT 0,
  last_login datetime DEFAULT NULL,
  person_name varchar(255) NOT NULL,
  sex char(1) DEFAULT 'N',
  birth_date date DEFAULT NULL,
  email varchar(255) NOT NULL,
  email_confirm tinyint(1) NOT NULL DEFAULT 0,
  phone varchar(20) NOT NULL,
  phone_confirm tinyint(1) NOT NULL DEFAULT 0,
  country varchar(128) NOT NULL,
  time_last_send int(15) NOT NULL DEFAULT 0,
  send_try int(11) NOT NULL DEFAULT 0,
  ip varchar(15) NOT NULL,
  dbl_auth tinyint(1) NOT NULL DEFAULT 0,
  ga_secret varchar(255) NOT NULL,
  id_lang int(10) UNSIGNED DEFAULT NULL,
  photo varchar(255) DEFAULT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 1820,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `email_confirm` для объекта типа таблица `se_user`
--
ALTER TABLE se_user
ADD INDEX email_confirm (email_confirm);

--
-- Создать индекс `id_affiliate` для объекта типа таблица `se_user`
--
ALTER TABLE se_user
ADD INDEX id_affiliate (id_affiliate);

--
-- Создать индекс `is_active` для объекта типа таблица `se_user`
--
ALTER TABLE se_user
ADD INDEX is_active (is_active);

--
-- Создать индекс `is_super_admin` для объекта типа таблица `se_user`
--
ALTER TABLE se_user
ADD INDEX is_super_admin (is_super_admin);

--
-- Создать индекс `password` для объекта типа таблица `se_user`
--
ALTER TABLE se_user
ADD INDEX password (password);

--
-- Создать индекс `phone_confirm` для объекта типа таблица `se_user`
--
ALTER TABLE se_user
ADD INDEX phone_confirm (phone_confirm);

--
-- Создать индекс `tmppassw` для объекта типа таблица `se_user`
--
ALTER TABLE se_user
ADD INDEX tmppassw (tmppassw);

--
-- Создать индекс `username` для объекта типа таблица `se_user`
--
ALTER TABLE se_user
ADD UNIQUE INDEX username (username);

--
-- Создать таблицу `se_user_values`
--
CREATE TABLE se_user_values (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_userfield int(10) UNSIGNED NOT NULL,
  id_user int(10) UNSIGNED NOT NULL,
  intvalue int(11) NOT NULL,
  value text NOT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Таблица дополнительных полей пользователя';

--
-- Создать индекс `id_user_field` для объекта типа таблица `se_user_values`
--
ALTER TABLE se_user_values
ADD INDEX id_user_field (id_userfield);

--
-- Создать индекс `intvalue` для объекта типа таблица `se_user_values`
--
ALTER TABLE se_user_values
ADD INDEX intvalue (intvalue);

--
-- Создать внешний ключ
--
ALTER TABLE se_user_values
ADD CONSTRAINT se_user_values_ibfk_1 FOREIGN KEY (id_userfield)
REFERENCES se_userfields (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE se_user_values
ADD CONSTRAINT se_user_values_ibfk_2 FOREIGN KEY (id_user)
REFERENCES se_user (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `se_user_permission`
--
CREATE TABLE se_user_permission (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_user int(10) UNSIGNED NOT NULL,
  id_permission int(10) UNSIGNED NOT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 1820,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE se_user_permission
ADD CONSTRAINT se_user_permission_ibfk_1 FOREIGN KEY (id_user)
REFERENCES se_user (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE se_user_permission
ADD CONSTRAINT se_user_permission_ibfk_2 FOREIGN KEY (id_permission)
REFERENCES app_permission (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_section_collection_reviews`
--
CREATE TABLE app_section_collection_reviews (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_collection int(10) UNSIGNED NOT NULL,
  id_user int(10) UNSIGNED NOT NULL,
  mark smallint(1) UNSIGNED NOT NULL,
  merits text DEFAULT NULL,
  demerits text DEFAULT NULL,
  comment text NOT NULL,
  use_time smallint(1) UNSIGNED NOT NULL DEFAULT 1,
  date datetime NOT NULL,
  likes int(10) UNSIGNED NOT NULL DEFAULT 0,
  dislikes int(10) UNSIGNED NOT NULL DEFAULT 0,
  active tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `active` для объекта типа таблица `app_section_collection_reviews`
--
ALTER TABLE app_section_collection_reviews
ADD INDEX active (active);

--
-- Создать индекс `id_collection` для объекта типа таблица `app_section_collection_reviews`
--
ALTER TABLE app_section_collection_reviews
ADD INDEX id_collection (id_collection);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_reviews
ADD CONSTRAINT app_section_collection_reviews_ibfk_1 FOREIGN KEY (id_user)
REFERENCES se_user (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_section_collection_reviews_votes`
--
CREATE TABLE app_section_collection_reviews_votes (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_review int(10) UNSIGNED NOT NULL,
  id_user int(10) UNSIGNED NOT NULL,
  vote smallint(1) NOT NULL DEFAULT 1,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `FK_shop_reviews_votes_se_user_id` для объекта типа таблица `app_section_collection_reviews_votes`
--
ALTER TABLE app_section_collection_reviews_votes
ADD INDEX FK_shop_reviews_votes_se_user_id (id_user);

--
-- Создать индекс `UK_shop_reviews_votes` для объекта типа таблица `app_section_collection_reviews_votes`
--
ALTER TABLE app_section_collection_reviews_votes
ADD UNIQUE INDEX UK_shop_reviews_votes (id_review, id_user);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_reviews_votes
ADD CONSTRAINT app_section_collection_reviews_votes_ibfk_1 FOREIGN KEY (id_review)
REFERENCES app_section_collection_reviews (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_reviews_votes
ADD CONSTRAINT app_section_collection_reviews_votes_ibfk_2 FOREIGN KEY (id_user)
REFERENCES se_user (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_section_collection_files`
--
CREATE TABLE app_section_collection_files (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_collection int(10) UNSIGNED DEFAULT NULL,
  id_owner int(10) UNSIGNED DEFAULT NULL COMMENT 'Owner',
  file varchar(255) DEFAULT NULL COMMENT 'Имя файла в папке files',
  name varchar(255) DEFAULT NULL COMMENT 'Текст отображаемой ссылки на файл',
  description text NOT NULL,
  icon varchar(255) NOT NULL,
  sort int(11) DEFAULT 0,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `FK_app_files_collection_id` для объекта типа таблица `app_section_collection_files`
--
ALTER TABLE app_section_collection_files
ADD INDEX FK_app_files_collection_id (id_collection);

--
-- Создать индекс `sort` для объекта типа таблица `app_section_collection_files`
--
ALTER TABLE app_section_collection_files
ADD INDEX sort (sort);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_files
ADD CONSTRAINT app_section_collection_files_ibfk_1 FOREIGN KEY (id_collection)
REFERENCES app_section_collection (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_files
ADD CONSTRAINT app_section_collection_files_ibfk_2 FOREIGN KEY (id_owner)
REFERENCES se_user (id) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Создать таблицу `se_user_file`
--
CREATE TABLE se_user_file (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_user int(10) UNSIGNED NOT NULL,
  id_file int(10) UNSIGNED NOT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE se_user_file
ADD CONSTRAINT se_user_file_ibfk_1 FOREIGN KEY (id_file)
REFERENCES app_section_collection_files (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE se_user_file
ADD CONSTRAINT se_user_file_ibfk_2 FOREIGN KEY (id_user)
REFERENCES se_user (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `se_permission_role`
--
CREATE TABLE se_permission_role (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  description varchar(255) DEFAULT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Роли пользователей';

--
-- Создать таблицу `se_permission_role_user`
--
CREATE TABLE se_permission_role_user (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_role int(10) UNSIGNED NOT NULL,
  id_user int(10) UNSIGNED DEFAULT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_permission_role_user` для объекта типа таблица `se_permission_role_user`
--
ALTER TABLE se_permission_role_user
ADD UNIQUE INDEX UK_permission_role_user (id_role, id_user);

--
-- Создать внешний ключ
--
ALTER TABLE se_permission_role_user
ADD CONSTRAINT FK_permission_role_user_permission_role_id FOREIGN KEY (id_role)
REFERENCES se_permission_role (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE se_permission_role_user
ADD CONSTRAINT FK_permission_role_user_se_user_id FOREIGN KEY (id_user)
REFERENCES se_user (id) ON DELETE CASCADE;

--
-- Создать таблицу `se_permission_object`
--
CREATE TABLE se_permission_object (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  code varchar(100) NOT NULL,
  name varchar(255) NOT NULL,
  sort int(11) NOT NULL DEFAULT 0,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `sort` для объекта типа таблица `se_permission_object`
--
ALTER TABLE se_permission_object
ADD INDEX sort (sort);

--
-- Создать таблицу `se_permission_object_role`
--
CREATE TABLE se_permission_object_role (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_object int(10) UNSIGNED NOT NULL,
  id_role int(10) UNSIGNED NOT NULL,
  mask smallint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Маска прав (4 бита)',
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `UK_permission_object_role` для объекта типа таблица `se_permission_object_role`
--
ALTER TABLE se_permission_object_role
ADD UNIQUE INDEX UK_permission_object_role (id_object, id_role);

--
-- Создать внешний ключ
--
ALTER TABLE se_permission_object_role
ADD CONSTRAINT FK_permission_object_role_permission_object_id FOREIGN KEY (id_object)
REFERENCES se_permission_object (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE se_permission_object_role
ADD CONSTRAINT FK_permission_object_role_permission_role_id FOREIGN KEY (id_role)
REFERENCES se_permission_role (id) ON DELETE CASCADE;

--
-- Создать таблицу `se_trigger`
--
CREATE TABLE se_trigger (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  code varchar(50) NOT NULL,
  name varchar(255) NOT NULL,
  updated_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'События для уведомлений',
ROW_FORMAT = COMPACT;

--
-- Создать таблицу `se_notice`
--
CREATE TABLE se_notice (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  sender varchar(255) DEFAULT NULL,
  recipient varchar(255) DEFAULT NULL,
  name varchar(255) NOT NULL,
  subject varchar(255) NOT NULL,
  content mediumtext NOT NULL,
  target enum ('email', 'sms') NOT NULL DEFAULT 'email',
  is_active tinyint(1) NOT NULL DEFAULT 1,
  updated_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Уведомления',
ROW_FORMAT = COMPACT;

--
-- Создать таблицу `se_notice_trigger`
--
CREATE TABLE se_notice_trigger (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_notice int(10) UNSIGNED NOT NULL,
  id_trigger int(10) UNSIGNED NOT NULL,
  updated_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Связи уведомления - события',
ROW_FORMAT = COMPACT;

--
-- Создать индекс `UK_notice_trigger` для объекта типа таблица `se_notice_trigger`
--
ALTER TABLE se_notice_trigger
ADD UNIQUE INDEX UK_notice_trigger (id_notice, id_trigger);

--
-- Создать внешний ключ
--
ALTER TABLE se_notice_trigger
ADD CONSTRAINT FK_notice_trigger_notice_id FOREIGN KEY (id_notice)
REFERENCES se_notice (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE se_notice_trigger
ADD CONSTRAINT FK_notice_trigger_trigger_id FOREIGN KEY (id_trigger)
REFERENCES se_trigger (id) ON DELETE CASCADE;

--
-- Создать таблицу `app_regions`
--
CREATE TABLE app_regions (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  id_country int(10) UNSIGNED DEFAULT NULL,
  id_region int(10) UNSIGNED DEFAULT NULL,
  id_city int(10) UNSIGNED DEFAULT NULL,
  url varchar(255) NOT NULL,
  updated_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Региональная привязка';

--
-- Создать индекс `created_at` для объекта типа таблица `app_regions`
--
ALTER TABLE app_regions
ADD INDEX created_at (created_at);

--
-- Создать индекс `updated_at` для объекта типа таблица `app_regions`
--
ALTER TABLE app_regions
ADD INDEX updated_at (updated_at);

--
-- Создать таблицу `se_user_region`
--
CREATE TABLE se_user_region (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_user int(10) UNSIGNED NOT NULL,
  id_region int(10) UNSIGNED NOT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Таблица связей с гео-контактами';

--
-- Создать индекс `app_section_collection_gcontacts_ibfk_1` для объекта типа таблица `se_user_region`
--
ALTER TABLE se_user_region
ADD INDEX app_section_collection_gcontacts_ibfk_1 (id_user);

--
-- Создать индекс `app_section_collection_gcontacts_ibfk_2` для объекта типа таблица `se_user_region`
--
ALTER TABLE se_user_region
ADD INDEX app_section_collection_gcontacts_ibfk_2 (id_region);

--
-- Создать внешний ключ
--
ALTER TABLE se_user_region
ADD CONSTRAINT se_user_region_ibfk_1 FOREIGN KEY (id_user)
REFERENCES se_user (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE se_user_region
ADD CONSTRAINT se_user_region_ibfk_2 FOREIGN KEY (id_region)
REFERENCES app_regions (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_section_collection_region`
--
CREATE TABLE app_section_collection_region (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_collection int(10) UNSIGNED NOT NULL,
  id_region int(10) UNSIGNED NOT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Таблица связей с гео-контактами';

--
-- Создать индекс `app_section_collection_gcontacts_ibfk_1` для объекта типа таблица `app_section_collection_region`
--
ALTER TABLE app_section_collection_region
ADD INDEX app_section_collection_gcontacts_ibfk_1 (id_collection);

--
-- Создать индекс `app_section_collection_gcontacts_ibfk_2` для объекта типа таблица `app_section_collection_region`
--
ALTER TABLE app_section_collection_region
ADD INDEX app_section_collection_gcontacts_ibfk_2 (id_region);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_region
ADD CONSTRAINT app_section_collection_region_ibfk_1 FOREIGN KEY (id_collection)
REFERENCES app_section_collection (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_region
ADD CONSTRAINT app_section_collection_region_ibfk_2 FOREIGN KEY (id_region)
REFERENCES app_regions (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_language`
--
CREATE TABLE app_language (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  code varchar(4) NOT NULL,
  title varchar(255) NOT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Таблица с языками';

--
-- Создать таблицу `app_section_translate`
--
CREATE TABLE app_section_translate (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_section int(10) UNSIGNED DEFAULT NULL,
  id_lang int(10) UNSIGNED DEFAULT NULL,
  title varchar(255) DEFAULT NULL,
  description mediumtext DEFAULT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Modules or block';

--
-- Создать индекс `app_section_ibfk_2` для объекта типа таблица `app_section_translate`
--
ALTER TABLE app_section_translate
ADD INDEX app_section_ibfk_2 (id_section);

--
-- Создать индекс `created_at` для объекта типа таблица `app_section_translate`
--
ALTER TABLE app_section_translate
ADD INDEX created_at (created_at);

--
-- Создать индекс `updated_at` для объекта типа таблица `app_section_translate`
--
ALTER TABLE app_section_translate
ADD INDEX updated_at (updated_at);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_translate
ADD CONSTRAINT app_section_translate_ibfk_1 FOREIGN KEY (id_section)
REFERENCES app_section (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_section_translate
ADD CONSTRAINT app_section_translate_ibfk_2 FOREIGN KEY (id_lang)
REFERENCES app_language (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_section_groups_translate`
--
CREATE TABLE app_section_groups_translate (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_group int(10) UNSIGNED NOT NULL,
  id_lang int(10) UNSIGNED DEFAULT NULL,
  name varchar(255) DEFAULT NULL,
  note text DEFAULT NULL,
  page_title varchar(255) DEFAULT NULL,
  meta_title varchar(255) DEFAULT NULL,
  meta_keywords varchar(255) DEFAULT NULL,
  meta_description text DEFAULT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 1365,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Группы разделов';

--
-- Создать индекс `app_section_groups_ibfk_1` для объекта типа таблица `app_section_groups_translate`
--
ALTER TABLE app_section_groups_translate
ADD INDEX app_section_groups_ibfk_1 (id_group);

--
-- Создать индекс `id_parent` для объекта типа таблица `app_section_groups_translate`
--
ALTER TABLE app_section_groups_translate
ADD INDEX id_parent (id_lang);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_groups_translate
ADD CONSTRAINT app_section_groups_translate_ibfk_1 FOREIGN KEY (id_group)
REFERENCES app_section_groups (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_section_groups_translate
ADD CONSTRAINT app_section_groups_translate_ibfk_2 FOREIGN KEY (id_lang)
REFERENCES app_language (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_section_groups_image_translate`
--
CREATE TABLE app_section_groups_image_translate (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_image int(10) UNSIGNED NOT NULL,
  id_lang int(10) UNSIGNED NOT NULL,
  title varchar(255) DEFAULT NULL,
  alt varchar(255) DEFAULT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Коллекция записей раздела';

--
-- Создать индекс `created_at` для объекта типа таблица `app_section_groups_image_translate`
--
ALTER TABLE app_section_groups_image_translate
ADD INDEX created_at (created_at);

--
-- Создать индекс `FK_app_section_collection_ima2` для объекта типа таблица `app_section_groups_image_translate`
--
ALTER TABLE app_section_groups_image_translate
ADD INDEX FK_app_section_collection_ima2 (id_lang);

--
-- Создать индекс `UK_app_section_collection_imag` для объекта типа таблица `app_section_groups_image_translate`
--
ALTER TABLE app_section_groups_image_translate
ADD UNIQUE INDEX UK_app_section_collection_imag (id_image, id_lang);

--
-- Создать индекс `updated_at` для объекта типа таблица `app_section_groups_image_translate`
--
ALTER TABLE app_section_groups_image_translate
ADD INDEX updated_at (updated_at);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_groups_image_translate
ADD CONSTRAINT app_section_groups_image_translate_ibfk_1 FOREIGN KEY (id_image)
REFERENCES app_section_groups_image (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_section_groups_image_translate
ADD CONSTRAINT app_section_groups_image_translate_ibfk_2 FOREIGN KEY (id_lang)
REFERENCES app_language (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_section_collection_values_translate`
--
CREATE TABLE app_section_collection_values_translate (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_values int(10) UNSIGNED NOT NULL,
  id_lang int(10) UNSIGNED DEFAULT NULL,
  value longtext DEFAULT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 546,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Список переменных коллекции';

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_values_translate
ADD CONSTRAINT app_section_collection_values_translate_ibfk_1 FOREIGN KEY (id_values)
REFERENCES app_section_collection_values (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_values_translate
ADD CONSTRAINT app_section_collection_values_translate_ibfk_2 FOREIGN KEY (id_lang)
REFERENCES app_language (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_section_collection_translate`
--
CREATE TABLE app_section_collection_translate (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_collection int(10) UNSIGNED DEFAULT NULL,
  id_lang int(10) UNSIGNED DEFAULT NULL,
  name varchar(255) DEFAULT NULL,
  note text DEFAULT NULL,
  page_title varchar(255) DEFAULT NULL,
  meta_title varchar(250) DEFAULT NULL,
  meta_keywords varchar(255) DEFAULT NULL,
  meta_description text DEFAULT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 744,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Коллекция записей раздела';

--
-- Создать индекс `app_section_collection_ibfk_2` для объекта типа таблица `app_section_collection_translate`
--
ALTER TABLE app_section_collection_translate
ADD INDEX app_section_collection_ibfk_2 (id_collection);

--
-- Создать индекс `created_at` для объекта типа таблица `app_section_collection_translate`
--
ALTER TABLE app_section_collection_translate
ADD INDEX created_at (created_at);

--
-- Создать индекс `FK_app_section_collection_id_l` для объекта типа таблица `app_section_collection_translate`
--
ALTER TABLE app_section_collection_translate
ADD INDEX FK_app_section_collection_id_l (id_lang);

--
-- Создать индекс `updated_at` для объекта типа таблица `app_section_collection_translate`
--
ALTER TABLE app_section_collection_translate
ADD INDEX updated_at (updated_at);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_translate
ADD CONSTRAINT app_section_collection_translate_ibfk_1 FOREIGN KEY (id_collection)
REFERENCES app_section_collection (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_translate
ADD CONSTRAINT app_section_collection_translate_ibfk_2 FOREIGN KEY (id_lang)
REFERENCES app_language (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_section_collection_image_translate`
--
CREATE TABLE app_section_collection_image_translate (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_image int(10) UNSIGNED NOT NULL,
  id_lang int(10) UNSIGNED NOT NULL,
  title varchar(255) DEFAULT NULL,
  alt varchar(255) DEFAULT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 1260,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Коллекция записей раздела';

--
-- Создать индекс `created_at` для объекта типа таблица `app_section_collection_image_translate`
--
ALTER TABLE app_section_collection_image_translate
ADD INDEX created_at (created_at);

--
-- Создать индекс `FK_app_section_collection_ima2` для объекта типа таблица `app_section_collection_image_translate`
--
ALTER TABLE app_section_collection_image_translate
ADD INDEX FK_app_section_collection_ima2 (id_lang);

--
-- Создать индекс `UK_app_section_collection_imag` для объекта типа таблица `app_section_collection_image_translate`
--
ALTER TABLE app_section_collection_image_translate
ADD UNIQUE INDEX UK_app_section_collection_imag (id_image, id_lang);

--
-- Создать индекс `updated_at` для объекта типа таблица `app_section_collection_image_translate`
--
ALTER TABLE app_section_collection_image_translate
ADD INDEX updated_at (updated_at);

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_image_translate
ADD CONSTRAINT app_section_collection_image_translate_ibfk_1 FOREIGN KEY (id_image)
REFERENCES app_section_collection_image (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_section_collection_image_translate
ADD CONSTRAINT app_section_collection_image_translate_ibfk_2 FOREIGN KEY (id_lang)
REFERENCES app_language (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `app_nav_url_translate`
--
CREATE TABLE app_nav_url_translate (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_nav_url int(10) UNSIGNED NOT NULL,
  id_lang int(10) UNSIGNED NOT NULL,
  name varchar(255) DEFAULT NULL,
  updated_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Справочник картинок',
ROW_FORMAT = COMPACT;

--
-- Создать индекс `FK_app_nav_url_id_nav` для объекта типа таблица `app_nav_url_translate`
--
ALTER TABLE app_nav_url_translate
ADD INDEX FK_app_nav_url_id_nav (id_nav_url);

--
-- Создать внешний ключ
--
ALTER TABLE app_nav_url_translate
ADD CONSTRAINT app_nav_url_translate_ibfk_1 FOREIGN KEY (id_nav_url)
REFERENCES app_nav_url (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE app_nav_url_translate
ADD CONSTRAINT app_nav_url_translate_ibfk_2 FOREIGN KEY (id_lang)
REFERENCES app_language (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `se_user_collection`
--
CREATE TABLE se_user_collection (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_user int(10) UNSIGNED NOT NULL,
  id_collection int(10) UNSIGNED NOT NULL,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `id_collection` для объекта типа таблица `se_user_collection`
--
ALTER TABLE se_user_collection
ADD INDEX id_collection (id_collection);

--
-- Создать индекс `id_user` для объекта типа таблица `se_user_collection`
--
ALTER TABLE se_user_collection
ADD INDEX id_user (id_user);

--
-- Создать таблицу `se_settings`
--
CREATE TABLE se_settings (
  version varchar(10) NOT NULL DEFAULT '1',
  db_version mediumint(9) NOT NULL DEFAULT 1
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать таблицу `se_notice_log`
--
CREATE TABLE se_notice_log (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_notice INT(10) UNSIGNED DEFAULT NULL,
  sender varchar(255) DEFAULT NULL,
  recipient varchar(255) DEFAULT NULL,
  content mediumtext DEFAULT NULL,
  status tinyint(4) NOT NULL COMMENT '0-отправлено, 1-доставлено, 2- не доставлено',
  service_info varchar(255) DEFAULT NULL COMMENT 'Информация от сервиса',
  updated_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 1820,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Лог уведомлений',
ROW_FORMAT = COMPACT;

--
-- Создать внешний ключ
--
ALTER TABLE se_notice_log
ADD CONSTRAINT FK_se_notice_log_id_notice FOREIGN KEY (id_notice)
REFERENCES se_notice (id) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Создать таблицу `se_group`
--
CREATE TABLE se_group (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  level tinyint(4) DEFAULT 1,
  name varchar(40) DEFAULT NULL,
  title varchar(255) DEFAULT NULL,
  id_parent int(10) UNSIGNED DEFAULT NULL,
  email_settings varchar(255) DEFAULT NULL COMMENT 'Настройки для email рассылок',
  updated_at timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать индекс `id_parent` для объекта типа таблица `se_group`
--
ALTER TABLE se_group
ADD INDEX id_parent (id_parent);

--
-- Создать таблицу `session`
--
CREATE TABLE session (
  SID varchar(32) NOT NULL DEFAULT '',
  TIMES int(11) DEFAULT NULL,
  IDUSER bigint(20) NOT NULL DEFAULT 0,
  GROUPUSER int(11) NOT NULL DEFAULT 0,
  ADMINUSER varchar(10) DEFAULT '',
  USER varchar(40) DEFAULT '',
  LOGIN varchar(30) DEFAULT '',
  PASSW varchar(32) DEFAULT '',
  PAGES varchar(30) DEFAULT '',
  BLOCK char(1) DEFAULT 'Y',
  IP varchar(15) DEFAULT '',
  PRIMARY KEY (SID)
)
ENGINE = MYISAM,
CHARACTER SET utf8,
CHECKSUM = 0,
COLLATE utf8_general_ci;

--
-- Создать индекс `GROUPUSER` для объекта типа таблица `session`
--
ALTER TABLE session
ADD INDEX GROUPUSER (GROUPUSER);

--
-- Создать индекс `IDUSER` для объекта типа таблица `session`
--
ALTER TABLE session
ADD INDEX IDUSER (IDUSER);

--
-- Создать индекс `IP` для объекта типа таблица `session`
--
ALTER TABLE session
ADD INDEX IP (IP);

--
-- Создать индекс `TIMES` для объекта типа таблица `session`
--
ALTER TABLE session
ADD INDEX TIMES (TIMES);

--
-- Создать таблицу `app_pages_translate`
--
CREATE TABLE app_pages_translate (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_page int(10) UNSIGNED NOT NULL,
  id_lang int(10) UNSIGNED DEFAULT NULL,
  title varchar(255) DEFAULT NULL,
  page_title varchar(255) DEFAULT NULL,
  meta_title varchar(255) DEFAULT NULL,
  meta_keywords varchar(255) DEFAULT NULL,
  meta_description varchar(255) DEFAULT NULL,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 1,
AVG_ROW_LENGTH = 1820,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Список страниц сайта';

--
-- Создать индекс `created_at` для объекта типа таблица `app_pages_translate`
--
ALTER TABLE app_pages_translate
ADD INDEX created_at (created_at);

--
-- Создать индекс `FK_app_pages_id_lang` для объекта типа таблица `app_pages_translate`
--
ALTER TABLE app_pages_translate
ADD INDEX FK_app_pages_id_lang (id_lang);

--
-- Создать индекс `id_page` для объекта типа таблица `app_pages_translate`
--
ALTER TABLE app_pages_translate
ADD INDEX id_page (id_page);

--
-- Создать индекс `updated_at` для объекта типа таблица `app_pages_translate`
--
ALTER TABLE app_pages_translate
ADD INDEX updated_at (updated_at);

--
-- Описание для таблицы app_setting_group
--
DROP TABLE IF EXISTS app_setting_group;
CREATE TABLE app_setting_group (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  code VARCHAR(255) NOT NULL,
  description VARCHAR(255) DEFAULT NULL,
  sort INT(10) NOT NULL DEFAULT 0,
  updated_at TIMESTAMP NULL DEFAULT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE INDEX UK_app_setting_group_code (code)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci;


--
-- Описание для таблицы app_setting
--
DROP TABLE IF EXISTS app_setting;
CREATE TABLE app_setting (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_group INT(10) UNSIGNED NOT NULL,
  name VARCHAR(255) NOT NULL COMMENT 'название параметра',
  code VARCHAR(255) NOT NULL COMMENT 'уникальной код параметра',
  type ENUM('string','bool','select','text','password','text') NOT NULL DEFAULT 'string' COMMENT 'string - текстовое поле, bool - чекбокс, select - выбор из списка из поля list_values',
  `default` VARCHAR(100) NOT NULL COMMENT 'значение по умолчанию',
  list_values TEXT DEFAULT NULL COMMENT 'список значений в формате value1|name1,value2|name2,value3|name3 ',
  description TEXT DEFAULT NULL COMMENT 'описание параметра',
  sort INT(10) NOT NULL DEFAULT 0,
  is_active TINYINT(1) NOT NULL DEFAULT 1 COMMENT '0 - неактивный параметр',
  updated_at TIMESTAMP NULL DEFAULT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE INDEX UK_app_setting_code (code),
  CONSTRAINT FK_app_setting_app_setting_group_id FOREIGN KEY (id_group)
    REFERENCES app_setting_group(id) ON DELETE CASCADE ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci;

--
-- Описание для таблицы app_setting_value
--
DROP TABLE IF EXISTS app_setting_value;
CREATE TABLE app_setting_value (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_app INT(10) UNSIGNED NOT NULL,
  id_setting INT(10) UNSIGNED NOT NULL,
  value TEXT NOT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE INDEX UK_app_setting_value (id_app, id_setting),
  CONSTRAINT FK_app_setting_value_app_settings_id FOREIGN KEY (id_setting)
    REFERENCES app_setting(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_app_setting_value_id_app FOREIGN KEY (id_app)
    REFERENCES apps(id) ON DELETE NO ACTION ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci;

-- 
-- Вывод данных для таблицы apps
--
INSERT INTO apps VALUES
(1, 'app', 'app', 'ru', 1, NULL, 0, '', 0, 'User-agent: *\nDisallow: /siteedit\nDisallow: /apps\nDisallow: /www\nDisallow: */?*\nHost: {host}\nSitemap: {host}/sitemap.xml', '', '', '', '', 0, '2018-09-17 15:16:05', '2018-07-30 14:23:18');

-- 
-- Вывод данных для таблицы app_language
--
INSERT INTO app_language VALUES
(1, 'ru', 'Русский', '0000-00-00 00:00:00', '2018-07-16 14:24:26'),
(2, 'en', 'English', '0000-00-00 00:00:00', '2018-07-16 14:24:26');

-- 
-- Вывод данных для таблицы se_user
--
-- INSERT INTO se_user VALUES
-- (1, NULL, 'admin', 'f6fdffe48c908deb0f4c3bd36c032e72', NULL, 1, 1, 1, NULL, 'Administrator', 'N', NULL, '', 0, '', 0, '', 0, 0, '', 0, '', '2018-07-19 10:44:21', '2018-07-18 16:35:42');

-- 
-- Вывод данных для таблицы se_permission_role
--
INSERT INTO se_permission_role VALUES
(1, 'Admin', NULL, '0000-00-00 00:00:00', '2018-07-19 13:23:15'),
(2, 'Менеджер', NULL, '0000-00-00 00:00:00', '2018-07-30 15:06:28');

-- 
-- Вывод данных для таблицы se_permission_object
--
INSERT INTO se_permission_object VALUES
(1, 'structures', 'Structures', 0, '0000-00-00 00:00:00', '2018-10-08 16:30:11'),
(2, 'resources', 'Resources', 0, '0000-00-00 00:00:00', '2018-10-08 16:30:11'),
(3, 'pages', 'Pages', 0, '0000-00-00 00:00:00', '2018-10-08 16:30:11'),
(4, 'sections', 'Sections', 0, '0000-00-00 00:00:00', '2018-10-08 16:30:11'),
(5, 'images', 'Images', 0, '0000-00-00 00:00:00', '2018-10-08 16:30:11'),
(6, 'requests', 'Requests', 0, '0000-00-00 00:00:00', '2018-10-08 16:30:11'),
(7, 'contacts', 'Contacts', 0, '0000-00-00 00:00:00', '2018-10-08 16:30:11'),
(8, 'editor', 'Editor', 0, '0000-00-00 00:00:00', '2018-10-08 16:30:11'),
(9, 'analytics', 'Analytics', 0, '0000-00-00 00:00:00', '2018-10-08 16:30:11'),
(10, 'settings', 'Settings', 0, '0000-00-00 00:00:00', '2018-10-08 16:30:11');

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;