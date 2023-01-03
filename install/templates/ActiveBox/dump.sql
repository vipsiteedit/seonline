--
-- Дата скрипта: 11.01.2019 16:41:15
-- Версия сервера: 5.7.21-20-beget-5.7.21-20-1-log
-- Версия клиента: 4.1
--

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
-- Удалить таблицу `se_settings`
--
DROP TABLE IF EXISTS se_settings;

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
-- Удалить таблицу `app_nav`
--
DROP TABLE IF EXISTS app_nav;

--
-- Удалить таблицу `app_section_collection_files`
--
DROP TABLE IF EXISTS app_section_collection_files;

--
-- Удалить таблицу `app_section_collection_group`
--
DROP TABLE IF EXISTS app_section_collection_group;

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
AUTO_INCREMENT = 7,
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
AUTO_INCREMENT = 46,
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
AUTO_INCREMENT = 32,
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
AUTO_INCREMENT = 72,
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
AUTO_INCREMENT = 320,
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
AUTO_INCREMENT = 157,
AVG_ROW_LENGTH = 5461,
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
AUTO_INCREMENT = 14,
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
AUTO_INCREMENT = 18,
AVG_ROW_LENGTH = 82,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = 'Справочник картинок',
ROW_FORMAT = COMPACT;

--
-- Создать индекс `UK_image` для объекта типа таблица `app_nav`
--
ALTER TABLE app_nav
ADD UNIQUE INDEX UK_image (name);

--
-- Создать внешний ключ
--
ALTER TABLE app_nav
ADD CONSTRAINT FK_app_nav_id_app FOREIGN KEY (id_app)
REFERENCES apps (id);

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
AUTO_INCREMENT = 6,
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
AUTO_INCREMENT = 33,
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
AUTO_INCREMENT = 207,
AVG_ROW_LENGTH = 4096,
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
AUTO_INCREMENT = 9,
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
AUTO_INCREMENT = 58,
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
AUTO_INCREMENT = 26,
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
AUTO_INCREMENT = 119,
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
AUTO_INCREMENT = 43,
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
AUTO_INCREMENT = 63,
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
AUTO_INCREMENT = 16,
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
AUTO_INCREMENT = 4,
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
AUTO_INCREMENT = 2,
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
AUTO_INCREMENT = 6,
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
AUTO_INCREMENT = 5,
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
AUTO_INCREMENT = 13,
AVG_ROW_LENGTH = 1365,
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
AUTO_INCREMENT = 33,
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
AUTO_INCREMENT = 26,
AVG_ROW_LENGTH = 712,
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
AUTO_INCREMENT = 8,
AVG_ROW_LENGTH = 2730,
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
-- Вывод данных для таблицы apps
--
INSERT INTO apps VALUES
(6, 'app', 'ActiveBox', 'ru', 3, NULL, 0, '', 0, '', '', '', '', '', 0, '2019-01-11 14:37:02', '2018-10-09 09:52:58');

-- 
-- Вывод данных для таблицы app_section_fieldsgroup
--

-- 
-- Вывод данных для таблицы app_image_folder
--

-- 
-- Вывод данных для таблицы app_section
--
INSERT INTO app_section VALUES
(40, 6, NULL, NULL, 'features', 'text', 'Функции', 1, 1, 0, '0000-00-00 00:00:00', '2018-10-09 10:22:33'),
(41, 6, NULL, NULL, 'banner', 'text', 'Баннер', 1, 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:42:05'),
(42, 6, NULL, NULL, 'works', 'text', 'Работы', 1, 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:51:24'),
(43, 6, NULL, NULL, 'teams', 'text', 'Команда', 1, 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:59:51'),
(44, 6, NULL, NULL, 'testimonials', 'text', 'Отзывы', 1, 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:04:51'),
(45, 6, NULL, NULL, 'download', 'text', 'Загрузка', 1, 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:06:12');

-- 
-- Вывод данных для таблицы app_pages
--
INSERT INTO app_pages VALUES
(42, 'index', 'index', 5, NULL, '2018-10-09 09:58:33', '2018-10-09 11:31:04');

-- 
-- Вывод данных для таблицы app_section_groups
--

-- 
-- Вывод данных для таблицы app_section_fields
--
INSERT INTO app_section_fields VALUES
(26, 40, NULL, 'icon', 'Код иконки', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:43:40'),
(27, 43, NULL, 'fb', 'Facebook', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:00:12'),
(28, 43, NULL, 'tw', 'Twitter', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:00:24'),
(29, 43, NULL, 'link', 'Linkedin', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:00:34'),
(30, 43, NULL, 'ggp', 'Google Plus', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:00:46'),
(31, 43, NULL, 'drb', 'Dribbble', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:01:01'),
(32, 43, NULL, 'role', 'Должность', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:01:41');

-- 
-- Вывод данных для таблицы app_section_collection
--
INSERT INTO app_section_collection VALUES
(296, NULL, 40, 'easily-customised', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2018-10-09 10:25:01'),
(299, NULL, 41, 'your-favorite-one-page-multi-purpose-template', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:42:20'),
(300, NULL, 40, 'responsive-ready', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:45:25'),
(301, NULL, 40, 'modern-design', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:46:02'),
(302, NULL, 40, 'clean-code', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:46:51'),
(303, NULL, 40, 'ready-to-ship', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:47:31'),
(304, NULL, 40, 'download-for-free', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:47:59'),
(305, NULL, 42, 'project-name', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:51:38'),
(306, NULL, 42, 'project-name1', '', 0, '0000-00-00 00:00:00', 1, 0, '2018-10-10 08:56:06', '2018-10-10 08:52:34'),
(307, NULL, 42, 'project-name2', '', 0, '0000-00-00 00:00:00', 1, 0, '2018-10-10 08:56:11', '2018-10-10 08:53:18'),
(308, NULL, 42, 'project-name3', '', 0, '0000-00-00 00:00:00', 1, 0, '2018-10-10 08:56:18', '2018-10-10 08:53:49'),
(309, NULL, 42, 'project-name4', '', 0, '0000-00-00 00:00:00', 1, 0, '2018-10-10 08:56:24', '2018-10-10 08:54:14'),
(310, NULL, 42, 'project-name5', '', 0, '0000-00-00 00:00:00', 1, 0, '2018-10-10 08:56:32', '2018-10-10 08:54:47'),
(311, NULL, 42, 'project-name6', '', 0, '0000-00-00 00:00:00', 1, 0, '2018-10-10 08:56:39', '2018-10-10 08:55:10'),
(312, NULL, 42, 'project-name7', '', 0, '0000-00-00 00:00:00', 1, 0, '2018-10-10 08:56:46', '2018-10-10 08:55:37'),
(313, NULL, 43, 'ruth-wood', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:01:21'),
(314, NULL, 43, 'timothy-reed', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:02:43'),
(315, NULL, 43, 'victoria-valdez', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:03:20'),
(316, NULL, 43, 'beverly-little', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:04:04'),
(317, NULL, 44, 'susan-sims-interaction-designer-at-xyz', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:05:05'),
(318, NULL, 44, 'susan-sims-interaction-designer-at-xyz-', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:05:32'),
(319, NULL, 45, 'are-you-ready-to-start-download-now-for-free', 'https://github.com/kamalcha/ActiveBox/archive/master.zip', 0, '0000-00-00 00:00:00', 1, 0, '2018-10-10 09:07:14', '2018-10-10 09:06:20');

-- 
-- Вывод данных для таблицы app_image
--
INSERT INTO app_image VALUES
(43, NULL, 'bottom_holder1.jpg', NULL, '2018-10-09 19:40:09'),
(44, NULL, 'work-1.jpg', NULL, '2018-10-10 08:52:09'),
(45, NULL, 'work-2.jpg', NULL, '2018-10-10 08:53:07'),
(46, NULL, 'work-3.jpg', NULL, '2018-10-10 08:53:38'),
(47, NULL, 'work-4.jpg', NULL, '2018-10-10 08:54:04'),
(48, NULL, 'work-5.jpg', NULL, '2018-10-10 08:54:39'),
(49, NULL, 'work-6.jpg', NULL, '2018-10-10 08:55:01'),
(50, NULL, 'work-7.jpg', NULL, '2018-10-10 08:55:24'),
(51, NULL, 'work-8.jpg', NULL, '2018-10-10 08:55:58'),
(52, NULL, 'team-1.jpg', NULL, '2018-10-10 09:02:32'),
(53, NULL, 'team-2.jpg', NULL, '2018-10-10 09:03:10'),
(54, NULL, 'team-3.jpg', NULL, '2018-10-10 09:03:52'),
(55, NULL, 'team-4.jpg', NULL, '2018-10-10 09:04:32'),
(56, NULL, 'testimonial-1.jpg', NULL, '2018-10-10 09:05:21'),
(57, NULL, 'testimonial-2.jpg', NULL, '2018-10-10 09:05:46');

-- 
-- Вывод данных для таблицы app_urls
--
INSERT INTO app_urls VALUES
(62, 6, 42, NULL, '/', 'page', 'aindex', 'index', '2018-10-09 11:31:04', '2018-10-09 09:58:33');

-- 
-- Вывод данных для таблицы app_nav
--

-- 
-- Вывод данных для таблицы se_trigger
--

-- 
-- Вывод данных для таблицы se_notice
--

-- 
-- Вывод данных для таблицы app_section_groups_image
--

-- 
-- Вывод данных для таблицы app_section_collection_values
--
INSERT INTO app_section_collection_values VALUES
(177, 296, 26, NULL, 'icon-tools', '0000-00-00 00:00:00', '2018-10-10 08:45:04'),
(178, 300, 26, NULL, 'icon-desktop', '0000-00-00 00:00:00', '2018-10-10 08:45:53'),
(179, 301, 26, NULL, 'icon-lightbulb', '0000-00-00 00:00:00', '2018-10-10 08:46:34'),
(180, 302, 26, NULL, 'icon-genius', '0000-00-00 00:00:00', '2018-10-10 08:47:21'),
(181, 303, 26, NULL, 'icon-briefcase', '0000-00-00 00:00:00', '2018-10-10 08:47:50'),
(182, 304, 26, NULL, 'icon-download', '0000-00-00 00:00:00', '2018-10-10 08:48:18'),
(183, 313, 27, NULL, '#', '2018-10-10 09:02:32', '2018-10-10 09:01:28'),
(184, 313, 28, NULL, '#', '2018-10-10 09:02:32', '2018-10-10 09:01:28'),
(185, 313, 29, NULL, '#', '2018-10-10 09:02:32', '2018-10-10 09:01:28'),
(186, 313, 30, NULL, '#', '2018-10-10 09:02:32', '2018-10-10 09:01:28'),
(187, 313, 31, NULL, '#', '2018-10-10 09:02:32', '2018-10-10 09:01:28'),
(188, 313, 32, NULL, 'Founder, CEO', '0000-00-00 00:00:00', '2018-10-10 09:02:32'),
(189, 314, 27, NULL, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:10'),
(190, 314, 28, NULL, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:10'),
(191, 314, 29, NULL, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:10'),
(192, 314, 30, NULL, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:10'),
(193, 314, 31, NULL, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:10'),
(194, 314, 32, NULL, 'Co-Founder, Developer', '0000-00-00 00:00:00', '2018-10-10 09:03:10'),
(195, 315, 27, NULL, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:52'),
(196, 315, 28, NULL, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:52'),
(197, 315, 29, NULL, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:52'),
(198, 315, 30, NULL, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:52'),
(199, 315, 31, NULL, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:52'),
(200, 315, 32, NULL, 'UI Designer', '0000-00-00 00:00:00', '2018-10-10 09:03:52'),
(201, 316, 27, NULL, '#', '0000-00-00 00:00:00', '2018-10-10 09:04:32'),
(202, 316, 28, NULL, '#', '0000-00-00 00:00:00', '2018-10-10 09:04:32'),
(203, 316, 29, NULL, '#', '0000-00-00 00:00:00', '2018-10-10 09:04:32'),
(204, 316, 30, NULL, '#', '0000-00-00 00:00:00', '2018-10-10 09:04:32'),
(205, 316, 31, NULL, '#', '0000-00-00 00:00:00', '2018-10-10 09:04:32'),
(206, 316, 32, NULL, 'Data Scientist', '0000-00-00 00:00:00', '2018-10-10 09:04:32');

-- 
-- Вывод данных для таблицы app_section_collection_image
--
INSERT INTO app_section_collection_image VALUES
(105, 305, 44, 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:52:09'),
(106, 306, 45, 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:53:07'),
(107, 307, 46, 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:53:38'),
(108, 308, 47, 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:54:04'),
(109, 309, 48, 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:54:39'),
(110, 310, 49, 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:55:01'),
(111, 311, 50, 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:55:24'),
(112, 312, 51, 1, 0, '0000-00-00 00:00:00', '2018-10-10 08:55:58'),
(113, 313, 52, 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:02:32'),
(114, 314, 53, 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:03:10'),
(115, 315, 54, 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:03:52'),
(116, 316, 55, 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:04:32'),
(117, 317, 56, 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:05:21'),
(118, 318, 57, 1, 0, '0000-00-00 00:00:00', '2018-10-10 09:05:46');

-- 
-- Вывод данных для таблицы app_nav_url
--

-- 
-- Вывод данных для таблицы app_language
--
INSERT INTO app_language VALUES
(3, 'ru', 'Русский', '0000-00-00 00:00:00', '2018-10-09 21:44:17'),
(4, 'en', 'English', '0000-00-00 00:00:00', '2018-10-09 21:49:50');

-- 
-- Вывод данных для таблицы se_settings
--
INSERT INTO se_settings VALUES
('1', 2);

-- 
-- Вывод данных для таблицы se_notice_trigger
--

-- 
-- Вывод данных для таблицы app_section_translate
--
INSERT INTO app_section_translate VALUES
(1, 41, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 08:42:05'),
(2, 41, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 08:42:05'),
(3, 40, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 08:44:15'),
(4, 40, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 08:44:15'),
(5, 42, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 08:51:24'),
(6, 42, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 08:51:24'),
(7, 43, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 08:59:51'),
(8, 43, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 08:59:51'),
(9, 44, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 09:04:51'),
(10, 44, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 09:04:51'),
(11, 45, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 09:06:12'),
(12, 45, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 09:06:12');

-- 
-- Вывод данных для таблицы app_section_parametrs
--
INSERT INTO app_section_parametrs VALUES
(28, 40, 'image-prev-size', '250x250', 0, '0000-00-00 00:00:00', '2018-10-10 08:44:15'),
(29, 40, 'image-size', '800', 0, '0000-00-00 00:00:00', '2018-10-10 08:44:15'),
(30, 43, 'image-prev-size', '250x250', 0, '0000-00-00 00:00:00', '2018-10-10 09:01:06'),
(31, 43, 'image-size', '800', 0, '0000-00-00 00:00:00', '2018-10-10 09:01:06');

-- 
-- Вывод данных для таблицы app_section_groups_translate
--

-- 
-- Вывод данных для таблицы app_section_groups_image_translate
--

-- 
-- Вывод данных для таблицы app_section_collection_values_translate
--
INSERT INTO app_section_collection_values_translate VALUES
(3, 177, 3, 'icon-tools', '0000-00-00 00:00:00', '2018-10-10 08:45:04'),
(4, 178, 3, 'icon-desktop', '0000-00-00 00:00:00', '2018-10-10 08:45:53'),
(5, 179, 3, 'icon-lightbulb', '0000-00-00 00:00:00', '2018-10-10 08:46:34'),
(6, 180, 3, 'icon-genius', '0000-00-00 00:00:00', '2018-10-10 08:47:21'),
(7, 181, 3, 'icon-briefcase', '0000-00-00 00:00:00', '2018-10-10 08:47:50'),
(8, 182, 3, 'icon-download', '0000-00-00 00:00:00', '2018-10-10 08:48:18'),
(9, 183, 3, '#', '2018-10-10 09:02:32', '2018-10-10 09:01:28'),
(10, 184, 3, '#', '2018-10-10 09:02:32', '2018-10-10 09:01:28'),
(11, 185, 3, '#', '2018-10-10 09:02:32', '2018-10-10 09:01:28'),
(12, 186, 3, '#', '2018-10-10 09:02:32', '2018-10-10 09:01:28'),
(13, 187, 3, '#', '2018-10-10 09:02:32', '2018-10-10 09:01:28'),
(14, 188, 3, 'Founder, CEO', '0000-00-00 00:00:00', '2018-10-10 09:02:32'),
(15, 189, 3, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:10'),
(16, 190, 3, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:10'),
(17, 191, 3, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:10'),
(18, 192, 3, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:10'),
(19, 193, 3, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:10'),
(20, 194, 3, 'Co-Founder, Developer', '0000-00-00 00:00:00', '2018-10-10 09:03:10'),
(21, 195, 3, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:52'),
(22, 196, 3, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:52'),
(23, 197, 3, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:52'),
(24, 198, 3, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:52'),
(25, 199, 3, '#', '0000-00-00 00:00:00', '2018-10-10 09:03:52'),
(26, 200, 3, 'UI Designer', '0000-00-00 00:00:00', '2018-10-10 09:03:52'),
(27, 201, 3, '#', '0000-00-00 00:00:00', '2018-10-10 09:04:32'),
(28, 202, 3, '#', '0000-00-00 00:00:00', '2018-10-10 09:04:32'),
(29, 203, 3, '#', '0000-00-00 00:00:00', '2018-10-10 09:04:32'),
(30, 204, 3, '#', '0000-00-00 00:00:00', '2018-10-10 09:04:32'),
(31, 205, 3, '#', '0000-00-00 00:00:00', '2018-10-10 09:04:32'),
(32, 206, 3, 'Data Scientist', '0000-00-00 00:00:00', '2018-10-10 09:04:32');

-- 
-- Вывод данных для таблицы app_section_collection_translate
--
INSERT INTO app_section_collection_translate VALUES
(1, 296, 4, 'eeeeee', 'ewrwrwe erterte', NULL, NULL, NULL, NULL, '2018-10-09 22:23:49', '2018-10-09 21:50:15'),
(2, 296, 3, 'EASILY CUSTOMISED', 'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Nullam quis risus eget urna mollis ornare vel eu leo. Donec ullamcorper nulla non metus auctor fringilla.', NULL, NULL, NULL, NULL, '2018-10-10 08:45:04', '2018-10-09 21:50:42'),
(5, 299, 3, 'YOUR FAVORITE ONE PAGE MULTI PURPOSE TEMPLATE', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent commodo cursus magna vel scelerisque nisl consectetur et.', NULL, NULL, NULL, NULL, '2018-10-10 08:42:40', '2018-10-10 08:42:20'),
(6, 300, 3, 'RESPONSIVE READY', 'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Nullam quis risus eget urna mollis ornare vel eu leo. Donec ullamcorper nulla non metus auctor fringilla.', NULL, NULL, NULL, NULL, '2018-10-10 08:45:53', '2018-10-10 08:45:25'),
(7, 301, 3, 'MODERN DESIGN', 'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Nullam quis risus eget urna mollis ornare vel eu leo. Donec ullamcorper nulla non metus auctor fringilla.', NULL, NULL, NULL, NULL, '2018-10-10 08:46:34', '2018-10-10 08:46:02'),
(8, 302, 3, 'CLEAN CODE', 'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Nullam quis risus eget urna mollis ornare vel eu leo. Donec ullamcorper nulla non metus auctor fringilla.', NULL, NULL, NULL, NULL, '2018-10-10 08:47:21', '2018-10-10 08:46:51'),
(9, 303, 3, 'READY TO SHIP', 'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Nullam quis risus eget urna mollis ornare vel eu leo. Donec ullamcorper nulla non metus auctor fringilla.', NULL, NULL, NULL, NULL, '2018-10-10 08:47:50', '2018-10-10 08:47:31'),
(10, 304, 3, 'DOWNLOAD FOR FREE', 'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Nullam quis risus eget urna mollis ornare vel eu leo. Donec ullamcorper nulla non metus auctor fringilla.', NULL, NULL, NULL, NULL, '2018-10-10 08:48:18', '2018-10-10 08:47:59'),
(11, 305, 3, 'Project Name', 'Website Design', NULL, NULL, NULL, NULL, '2018-10-10 08:52:09', '2018-10-10 08:51:38'),
(12, 306, 3, 'Project Name', 'Website Design', NULL, NULL, NULL, NULL, '2018-10-10 08:53:07', '2018-10-10 08:52:34'),
(13, 307, 3, 'Project Name', 'Website Design', NULL, NULL, NULL, NULL, '2018-10-10 08:53:38', '2018-10-10 08:53:18'),
(14, 308, 3, 'Project Name', 'Website Design', NULL, NULL, NULL, NULL, '2018-10-10 08:53:58', '2018-10-10 08:53:49'),
(15, 309, 3, 'Project Name', 'Website Design', NULL, NULL, NULL, NULL, '2018-10-10 08:54:39', '2018-10-10 08:54:14'),
(16, 310, 3, 'Project Name', 'Website Design', NULL, NULL, NULL, NULL, '2018-10-10 08:55:01', '2018-10-10 08:54:47'),
(17, 311, 3, 'Project Name', 'Website Design', NULL, NULL, NULL, NULL, '2018-10-10 08:55:24', '2018-10-10 08:55:10'),
(18, 312, 3, 'Project Name', 'Website Design', NULL, NULL, NULL, NULL, '2018-10-10 08:55:58', '2018-10-10 08:55:37'),
(19, 313, 3, 'Ruth Wood', 'Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Maecenas sed diam eget risus varius blandit sit amet non magna. Nullam quis risus eget urna mollis ornare vel eu leo.', NULL, NULL, NULL, NULL, '2018-10-10 09:02:32', '2018-10-10 09:01:21'),
(20, 314, 3, 'Timothy Reed', 'Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Maecenas sed diam eget risus varius blandit sit amet non magna. Nullam quis risus eget urna mollis ornare vel eu leo.', NULL, NULL, NULL, NULL, '2018-10-10 09:03:10', '2018-10-10 09:02:43'),
(21, 315, 3, 'Victoria Valdez', 'Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Maecenas sed diam eget risus varius blandit sit amet non magna. Nullam quis risus eget urna mollis ornare vel eu leo.', NULL, NULL, NULL, NULL, '2018-10-10 09:03:52', '2018-10-10 09:03:20'),
(22, 316, 3, 'Beverly Little', 'Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Maecenas sed diam eget risus varius blandit sit amet non magna. Nullam quis risus eget urna mollis ornare vel eu leo.', NULL, NULL, NULL, NULL, '2018-10-10 09:04:32', '2018-10-10 09:04:04'),
(23, 317, 3, 'Susan Sims, Interaction Designer at XYZ', 'Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Donec sed odio dui. Aenean eu leo quam...', NULL, NULL, NULL, NULL, '2018-10-10 09:05:21', '2018-10-10 09:05:05'),
(24, 318, 3, 'Susan Sims, Interaction Designer at XYZ', 'Cras mattis consectetur purus sit amet fermentum. Donec sed odio dui. Aenean lacinia bibendum nulla sed consectetur....', NULL, NULL, NULL, NULL, '2018-10-10 09:05:46', '2018-10-10 09:05:32'),
(25, 319, 3, 'Are You Ready to Start? Download Now For Free!', 'Fusce dapibus, tellus ac cursus commodo', NULL, NULL, NULL, NULL, '2018-10-10 09:06:37', '2018-10-10 09:06:20');

-- 
-- Вывод данных для таблицы app_section_collection_image_translate
--
INSERT INTO app_section_collection_image_translate VALUES
(1, 106, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 08:56:06'),
(2, 107, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 08:56:11'),
(3, 108, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 08:56:18'),
(4, 109, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 08:56:24'),
(5, 110, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 08:56:32'),
(6, 111, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 08:56:39'),
(7, 112, 3, NULL, NULL, '0000-00-00 00:00:00', '2018-10-10 08:56:46');

-- 
-- Вывод данных для таблицы app_section_collection_group
--

-- 
-- Вывод данных для таблицы app_section_collection_files
--

-- 
-- Вывод данных для таблицы app_pages_translate
--

-- 
-- Вывод данных для таблицы app_nav_url_translate
--

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;