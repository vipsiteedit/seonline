--
-- Дата скрипта: 11.01.2019 0:38:25
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
-- Описание для таблицы app_image_folder
--
DROP TABLE IF EXISTS app_image_folder;
CREATE TABLE app_image_folder (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE INDEX name (name)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 2730
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Папки для картинок';

--
-- Описание для таблицы app_language
--
DROP TABLE IF EXISTS app_language;
CREATE TABLE app_language (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  code VARCHAR(4) NOT NULL,
  title VARCHAR(255) NOT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Таблица с языками'
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы app_pages
--
DROP TABLE IF EXISTS app_pages;
CREATE TABLE app_pages (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  template TEXT NOT NULL,
  priority TINYINT(4) NOT NULL DEFAULT 5,
  id_permission INT(10) UNSIGNED DEFAULT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX created_at (created_at),
  UNIQUE INDEX name (name),
  INDEX updated_at (updated_at),
  CONSTRAINT app_pages_ibfk_1 FOREIGN KEY (id_permission)
    REFERENCES app_permission(id) ON DELETE SET NULL ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 31
AVG_ROW_LENGTH = 3276
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Список страниц сайта'
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы app_pages_translate
--
DROP TABLE IF EXISTS app_pages_translate;
CREATE TABLE app_pages_translate (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_page INT(10) UNSIGNED NOT NULL,
  id_lang INT(10) UNSIGNED DEFAULT NULL,
  title VARCHAR(255) DEFAULT NULL,
  page_title VARCHAR(255) DEFAULT NULL,
  meta_title VARCHAR(255) DEFAULT NULL,
  meta_keywords VARCHAR(255) DEFAULT NULL,
  meta_description VARCHAR(255) DEFAULT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX created_at (created_at),
  INDEX FK_app_pages_id_lang (id_lang),
  INDEX id_page (id_page),
  INDEX updated_at (updated_at)
)
ENGINE = INNODB
AUTO_INCREMENT = 14
AVG_ROW_LENGTH = 1820
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Список страниц сайта'
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы app_section_fieldsgroup
--
DROP TABLE IF EXISTS app_section_fieldsgroup;
CREATE TABLE app_section_fieldsgroup (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_section INT(10) UNSIGNED NOT NULL,
  name VARCHAR(255) NOT NULL,
  is_multi TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Это группа списка',
  sort INT(11) NOT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX id_section (id_section),
  INDEX sort (sort)
)
ENGINE = INNODB
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 3276
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

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
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы apps
--
DROP TABLE IF EXISTS apps;
CREATE TABLE apps (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  app_name VARCHAR(40) NOT NULL COMMENT 'Application name',
  caption VARCHAR(255) NOT NULL,
  lang VARCHAR(6) NOT NULL DEFAULT 'ru',
  id_lang INT(10) UNSIGNED NOT NULL,
  domain VARCHAR(255) DEFAULT NULL,
  domainredirect TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Redirect to domain',
  alias TEXT NOT NULL,
  multidomain TINYINT(1) NOT NULL DEFAULT 0,
  robots TEXT NOT NULL,
  favicon TEXT NOT NULL,
  from_email VARCHAR(255) NOT NULL,
  sms_phone VARCHAR(255) NOT NULL,
  sms_sender VARCHAR(255) NOT NULL,
  is_main TINYINT(1) NOT NULL DEFAULT 0,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX created_at (created_at),
  INDEX domain (domain),
  INDEX id_lang (id_lang),
  INDEX is_main (is_main),
  INDEX lang (lang),
  UNIQUE INDEX name (app_name),
  INDEX updated_at (updated_at)
)
ENGINE = INNODB
AUTO_INCREMENT = 2
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Список приложений'
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы se_notice
--
DROP TABLE IF EXISTS se_notice;
CREATE TABLE se_notice (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  sender VARCHAR(255) DEFAULT NULL,
  recipient VARCHAR(255) DEFAULT NULL,
  name VARCHAR(255) NOT NULL,
  subject VARCHAR(255) NOT NULL,
  content MEDIUMTEXT NOT NULL,
  target ENUM('email','sms') NOT NULL DEFAULT 'email',
  is_active TINYINT(1) NOT NULL DEFAULT 1,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Уведомления';

--
-- Описание для таблицы se_trigger
--
DROP TABLE IF EXISTS se_trigger;
CREATE TABLE se_trigger (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  code VARCHAR(50) NOT NULL,
  name VARCHAR(255) NOT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 5461
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'События для уведомлений';

--
-- Описание для таблицы app_image
--
DROP TABLE IF EXISTS app_image;
CREATE TABLE app_image (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_folder INT(10) UNSIGNED DEFAULT NULL,
  name VARCHAR(255) NOT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE INDEX UK_image (id_folder, name),
  CONSTRAINT FK_image_image_folder_id FOREIGN KEY (id_folder)
    REFERENCES app_image_folder(id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 34
AVG_ROW_LENGTH = 82
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Справочник картинок';

--
-- Описание для таблицы app_nav
--
DROP TABLE IF EXISTS app_nav;
CREATE TABLE app_nav (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_app INT(10) UNSIGNED DEFAULT NULL,
  name VARCHAR(255) NOT NULL,
  code VARCHAR(255) NOT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE INDEX UK_app_nav_code (code),
  CONSTRAINT FK_app_nav_id_app FOREIGN KEY (id_app)
    REFERENCES apps(id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 82
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Справочник картинок';

--
-- Описание для таблицы app_section
--
DROP TABLE IF EXISTS app_section;
CREATE TABLE app_section (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_app INT(10) UNSIGNED DEFAULT NULL,
  id_parent INT(10) UNSIGNED DEFAULT NULL COMMENT 'Категория раздела',
  id_page INT(10) UNSIGNED DEFAULT NULL,
  alias VARCHAR(40) NOT NULL,
  typename VARCHAR(255) NOT NULL DEFAULT 'text',
  name VARCHAR(40) NOT NULL,
  visible TINYINT(1) NOT NULL DEFAULT 1,
  seo_enable TINYINT(1) NOT NULL DEFAULT 1 COMMENT 'Выводить в поисковик',
  sort INT(11) NOT NULL DEFAULT 0,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE INDEX alias (alias, id_app),
  INDEX created_at (created_at),
  INDEX id_page (id_page),
  INDEX id_parent (id_parent),
  INDEX seo_enable (seo_enable),
  INDEX sort (sort),
  INDEX updated_at (updated_at),
  INDEX visible (visible),
  CONSTRAINT app_section_ibfk_2 FOREIGN KEY (id_app)
    REFERENCES apps(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_app_section_id_parent FOREIGN KEY (id_parent)
    REFERENCES app_section(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 11
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Modules or block'
ROW_FORMAT = DYNAMIC;

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
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы se_notice_trigger
--
DROP TABLE IF EXISTS se_notice_trigger;
CREATE TABLE se_notice_trigger (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_notice INT(10) UNSIGNED NOT NULL,
  id_trigger INT(10) UNSIGNED NOT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE INDEX UK_notice_trigger (id_notice, id_trigger),
  CONSTRAINT FK_notice_trigger_notice_id FOREIGN KEY (id_notice)
    REFERENCES se_notice(id) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT FK_notice_trigger_trigger_id FOREIGN KEY (id_trigger)
    REFERENCES se_trigger(id) ON DELETE CASCADE ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 6
AVG_ROW_LENGTH = 5461
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Связи уведомления - события';

--
-- Описание для таблицы app_section_collection
--
DROP TABLE IF EXISTS app_section_collection;
CREATE TABLE app_section_collection (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_parent INT(10) UNSIGNED DEFAULT NULL,
  id_section INT(10) UNSIGNED NOT NULL,
  code VARCHAR(255) DEFAULT NULL,
  url VARCHAR(255) NOT NULL,
  is_date_public TINYINT(1) NOT NULL DEFAULT 0,
  date_public DATETIME NOT NULL,
  visible TINYINT(1) NOT NULL DEFAULT 1,
  sort INT(11) NOT NULL DEFAULT 0,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX created_at (created_at),
  INDEX date_public (date_public),
  INDEX is_date_public (is_date_public),
  INDEX sort (sort),
  INDEX updated_at (updated_at),
  INDEX url (code),
  INDEX visible (visible),
  CONSTRAINT app_section_collection_ibfk_1 FOREIGN KEY (id_section)
    REFERENCES app_section(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT app_section_collection_ibfk_2 FOREIGN KEY (id_parent)
    REFERENCES app_section_collection(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 42
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Коллекция записей раздела'
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы app_section_fields
--
DROP TABLE IF EXISTS app_section_fields;
CREATE TABLE app_section_fields (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_section INT(10) UNSIGNED DEFAULT NULL COMMENT 'ID Секции',
  id_group INT(10) UNSIGNED DEFAULT NULL,
  code VARCHAR(40) NOT NULL,
  name VARCHAR(255) NOT NULL,
  type ENUM('string','text','textedit','number','checkbox','radio','date','link','select') NOT NULL DEFAULT 'string',
  required TINYINT(1) NOT NULL DEFAULT 0,
  placeholder VARCHAR(255) NOT NULL,
  mask VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  `values` TEXT DEFAULT NULL,
  min INT(10) UNSIGNED DEFAULT NULL,
  max INT(10) UNSIGNED DEFAULT NULL,
  size VARCHAR(40) NOT NULL,
  child_level TINYINT(4) NOT NULL DEFAULT 0,
  defvalue VARCHAR(255) DEFAULT NULL,
  enabled TINYINT(1) NOT NULL DEFAULT 1,
  sort INT(11) NOT NULL DEFAULT 0,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX code (code),
  INDEX enabled (enabled),
  UNIQUE INDEX name (name, id_section),
  INDEX sort (sort),
  CONSTRAINT app_section_fields_ibfk_1 FOREIGN KEY (id_section)
    REFERENCES app_section(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT app_section_fields_ibfk_2 FOREIGN KEY (id_group)
    REFERENCES app_section_fieldsgroup(id) ON DELETE SET NULL ON UPDATE NO ACTION
)
ENGINE = INNODB
AUTO_INCREMENT = 29
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Список переменных'
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы app_section_groups
--
DROP TABLE IF EXISTS app_section_groups;
CREATE TABLE app_section_groups (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_section INT(10) UNSIGNED NOT NULL,
  id_parent INT(10) UNSIGNED DEFAULT NULL,
  code VARCHAR(255) NOT NULL,
  sort INT(11) NOT NULL DEFAULT 0,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX sort (sort),
  CONSTRAINT app_section_groups_ibfk_1 FOREIGN KEY (id_section)
    REFERENCES app_section(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT app_section_groups_ibfk_2 FOREIGN KEY (id_parent)
    REFERENCES app_section_groups(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 12
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Группы разделов'
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы app_section_parametrs
--
DROP TABLE IF EXISTS app_section_parametrs;
CREATE TABLE app_section_parametrs (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_section INT(10) UNSIGNED NOT NULL,
  field VARCHAR(40) NOT NULL,
  value TEXT NOT NULL,
  sort INT(11) NOT NULL DEFAULT 0,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX field (field),
  UNIQUE INDEX field_section (id_section, field),
  INDEX id_collection (id_section),
  INDEX id_field (field),
  INDEX sort (sort),
  CONSTRAINT app_section_parametrs_ibfk_1 FOREIGN KEY (id_section)
    REFERENCES app_section(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 15
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Список переменных коллекции'
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы app_section_translate
--
DROP TABLE IF EXISTS app_section_translate;
CREATE TABLE app_section_translate (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_section INT(10) UNSIGNED DEFAULT NULL,
  id_lang INT(10) UNSIGNED DEFAULT NULL,
  title VARCHAR(255) DEFAULT NULL,
  description MEDIUMTEXT DEFAULT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX app_section_ibfk_2 (id_section),
  INDEX created_at (created_at),
  INDEX updated_at (updated_at),
  CONSTRAINT app_section_translate_ibfk_1 FOREIGN KEY (id_section)
    REFERENCES app_section(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT app_section_translate_ibfk_2 FOREIGN KEY (id_lang)
    REFERENCES app_language(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 4096
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Modules or block'
ROW_FORMAT = DYNAMIC;

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
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы app_urls
--
DROP TABLE IF EXISTS app_urls;
CREATE TABLE app_urls (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_app INT(10) UNSIGNED NOT NULL,
  id_page INT(10) UNSIGNED DEFAULT NULL,
  id_section INT(10) UNSIGNED DEFAULT NULL,
  pattern VARCHAR(255) DEFAULT NULL,
  type ENUM('link','page','group','item') NOT NULL DEFAULT 'page',
  alias VARCHAR(40) NOT NULL,
  template VARCHAR(125) DEFAULT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE INDEX alias (alias, id_app),
  UNIQUE INDEX pattern (pattern),
  CONSTRAINT app_urls_ibfk_1 FOREIGN KEY (id_app)
    REFERENCES apps(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT app_urls_ibfk_2 FOREIGN KEY (id_page)
    REFERENCES app_pages(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT app_urls_ibfk_3 FOREIGN KEY (id_section)
    REFERENCES app_section(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 50
AVG_ROW_LENGTH = 1820
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Паттерны ссылок приложений'
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы app_nav_url
--
DROP TABLE IF EXISTS app_nav_url;
CREATE TABLE app_nav_url (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_nav INT(10) UNSIGNED NOT NULL,
  id_url INT(10) UNSIGNED NOT NULL,
  id_parent INT(10) UNSIGNED DEFAULT NULL,
  id_group INT(10) UNSIGNED DEFAULT NULL,
  id_collection INT(10) UNSIGNED DEFAULT NULL,
  sort INT(11) NOT NULL DEFAULT 0,
  is_active TINYINT(1) NOT NULL DEFAULT 1,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT FK_app_nav_url_id_collection FOREIGN KEY (id_collection)
    REFERENCES app_section_collection(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_app_nav_url_id_group FOREIGN KEY (id_group)
    REFERENCES app_section_groups(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_app_nav_url_id_nav FOREIGN KEY (id_nav)
    REFERENCES app_nav(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_app_nav_url_id_parent FOREIGN KEY (id_parent)
    REFERENCES app_nav_url(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_app_nav_url_id_url FOREIGN KEY (id_url)
    REFERENCES app_urls(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 11
AVG_ROW_LENGTH = 82
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Справочник картинок';

--
-- Описание для таблицы app_section_collection_group
--
DROP TABLE IF EXISTS app_section_collection_group;
CREATE TABLE app_section_collection_group (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_collection INT(10) UNSIGNED NOT NULL,
  id_group INT(10) UNSIGNED NOT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX created_at (created_at),
  INDEX id_section (id_collection),
  INDEX updated_at (updated_at),
  CONSTRAINT app_section_collection_group_ibfk_1 FOREIGN KEY (id_collection)
    REFERENCES app_section_collection(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT app_section_collection_group_ibfk_2 FOREIGN KEY (id_group)
    REFERENCES app_section_groups(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 27
AVG_ROW_LENGTH = 1092
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы app_section_collection_image
--
DROP TABLE IF EXISTS app_section_collection_image;
CREATE TABLE app_section_collection_image (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_collection INT(10) UNSIGNED NOT NULL,
  id_image INT(10) UNSIGNED NOT NULL,
  is_main TINYINT(1) NOT NULL DEFAULT 0,
  sort INT(11) NOT NULL DEFAULT 0,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX created_at (created_at),
  INDEX sort (sort),
  UNIQUE INDEX UK_app_section_collection_imag (id_collection, id_image),
  INDEX updated_at (updated_at),
  CONSTRAINT FK_app_section_collection_ima2 FOREIGN KEY (id_image)
    REFERENCES app_image(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_app_section_collection_imag FOREIGN KEY (id_collection)
    REFERENCES app_section_collection(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 38
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Коллекция записей раздела'
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы app_section_collection_translate
--
DROP TABLE IF EXISTS app_section_collection_translate;
CREATE TABLE app_section_collection_translate (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_collection INT(10) UNSIGNED DEFAULT NULL,
  id_lang INT(10) UNSIGNED DEFAULT NULL,
  name VARCHAR(255) DEFAULT NULL,
  note TEXT DEFAULT NULL,
  page_title VARCHAR(255) DEFAULT NULL,
  meta_title VARCHAR(250) DEFAULT NULL,
  meta_keywords VARCHAR(255) DEFAULT NULL,
  meta_description TEXT DEFAULT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX app_section_collection_ibfk_2 (id_collection),
  INDEX created_at (created_at),
  INDEX FK_app_section_collection_id_l (id_lang),
  INDEX updated_at (updated_at),
  CONSTRAINT app_section_collection_translate_ibfk_1 FOREIGN KEY (id_collection)
    REFERENCES app_section_collection(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT app_section_collection_translate_ibfk_2 FOREIGN KEY (id_lang)
    REFERENCES app_language(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 23
AVG_ROW_LENGTH = 744
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Коллекция записей раздела'
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы app_section_collection_values
--
DROP TABLE IF EXISTS app_section_collection_values;
CREATE TABLE app_section_collection_values (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_collection INT(10) UNSIGNED NOT NULL,
  id_field INT(10) UNSIGNED NOT NULL,
  intvalue INT(11) DEFAULT NULL,
  value LONGTEXT DEFAULT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX intvalue (intvalue),
  UNIQUE INDEX uni_values (id_collection, id_field),
  CONSTRAINT app_section_collection_values_ibfk_1 FOREIGN KEY (id_collection)
    REFERENCES app_section_collection(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT app_section_collection_values_ibfk_2 FOREIGN KEY (id_field)
    REFERENCES app_section_fields(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 108
AVG_ROW_LENGTH = 585
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Список переменных коллекции'
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы app_section_groups_image
--
DROP TABLE IF EXISTS app_section_groups_image;
CREATE TABLE app_section_groups_image (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_group INT(10) UNSIGNED NOT NULL,
  id_image INT(10) UNSIGNED NOT NULL,
  sort INT(10) NOT NULL DEFAULT 0,
  is_main TINYINT(1) NOT NULL DEFAULT 0,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE INDEX UK_app_section_groups_image (id_group, id_image),
  CONSTRAINT FK_app_section_groups_image_i2 FOREIGN KEY (id_image)
    REFERENCES app_image(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_app_section_groups_image_id FOREIGN KEY (id_group)
    REFERENCES app_section_groups(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Группы разделов'
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы app_section_groups_translate
--
DROP TABLE IF EXISTS app_section_groups_translate;
CREATE TABLE app_section_groups_translate (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_group INT(10) UNSIGNED NOT NULL,
  id_lang INT(10) UNSIGNED DEFAULT NULL,
  name VARCHAR(255) DEFAULT NULL,
  note TEXT DEFAULT NULL,
  page_title VARCHAR(255) DEFAULT NULL,
  meta_title VARCHAR(255) DEFAULT NULL,
  meta_keywords VARCHAR(255) DEFAULT NULL,
  meta_description TEXT DEFAULT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX app_section_groups_ibfk_1 (id_group),
  INDEX id_parent (id_lang),
  CONSTRAINT app_section_groups_translate_ibfk_1 FOREIGN KEY (id_group)
    REFERENCES app_section_groups(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT app_section_groups_translate_ibfk_2 FOREIGN KEY (id_lang)
    REFERENCES app_language(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 7
AVG_ROW_LENGTH = 1365
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Группы разделов'
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы app_nav_url_translate
--
DROP TABLE IF EXISTS app_nav_url_translate;
CREATE TABLE app_nav_url_translate (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_nav_url INT(10) UNSIGNED NOT NULL,
  id_lang INT(10) UNSIGNED NOT NULL,
  name VARCHAR(255) DEFAULT NULL,
  updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX FK_app_nav_url_id_nav (id_nav_url),
  CONSTRAINT app_nav_url_translate_ibfk_1 FOREIGN KEY (id_nav_url)
    REFERENCES app_nav_url(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT app_nav_url_translate_ibfk_2 FOREIGN KEY (id_lang)
    REFERENCES app_language(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 19
AVG_ROW_LENGTH = 1820
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Справочник картинок';

--
-- Описание для таблицы app_section_collection_image_translate
--
DROP TABLE IF EXISTS app_section_collection_image_translate;
CREATE TABLE app_section_collection_image_translate (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_image INT(10) UNSIGNED NOT NULL,
  id_lang INT(10) UNSIGNED NOT NULL,
  title VARCHAR(255) DEFAULT NULL,
  alt VARCHAR(255) DEFAULT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX created_at (created_at),
  INDEX FK_app_section_collection_ima2 (id_lang),
  UNIQUE INDEX UK_app_section_collection_imag (id_image, id_lang),
  INDEX updated_at (updated_at),
  CONSTRAINT app_section_collection_image_translate_ibfk_1 FOREIGN KEY (id_image)
    REFERENCES app_section_collection_image(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT app_section_collection_image_translate_ibfk_2 FOREIGN KEY (id_lang)
    REFERENCES app_language(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 23
AVG_ROW_LENGTH = 1260
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Коллекция записей раздела'
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы app_section_collection_values_translate
--
DROP TABLE IF EXISTS app_section_collection_values_translate;
CREATE TABLE app_section_collection_values_translate (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_values INT(10) UNSIGNED NOT NULL,
  id_lang INT(10) UNSIGNED DEFAULT NULL,
  value LONGTEXT DEFAULT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT app_section_collection_values_translate_ibfk_1 FOREIGN KEY (id_values)
    REFERENCES app_section_collection_values(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT app_section_collection_values_translate_ibfk_2 FOREIGN KEY (id_lang)
    REFERENCES app_language(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 128
AVG_ROW_LENGTH = 546
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Список переменных коллекции'
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы app_section_groups_image_translate
--
DROP TABLE IF EXISTS app_section_groups_image_translate;
CREATE TABLE app_section_groups_image_translate (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_image INT(10) UNSIGNED NOT NULL,
  id_lang INT(10) UNSIGNED NOT NULL,
  title VARCHAR(255) DEFAULT NULL,
  alt VARCHAR(255) DEFAULT NULL,
  updated_at TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX created_at (created_at),
  INDEX FK_app_section_collection_ima2 (id_lang),
  UNIQUE INDEX UK_app_section_collection_imag (id_image, id_lang),
  INDEX updated_at (updated_at),
  CONSTRAINT app_section_groups_image_translate_ibfk_1 FOREIGN KEY (id_image)
    REFERENCES app_section_groups_image(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT app_section_groups_image_translate_ibfk_2 FOREIGN KEY (id_lang)
    REFERENCES app_language(id) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 16384
CHARACTER SET utf8
COLLATE utf8_general_ci
COMMENT = 'Коллекция записей раздела'
ROW_FORMAT = DYNAMIC;

-- 
-- Вывод данных для таблицы app_image_folder
--

-- 
-- Вывод данных для таблицы app_language
--
INSERT INTO app_language VALUES
(1, 'ru', 'Русский', '0000-00-00 00:00:00', '2018-07-16 14:24:26'),
(2, 'en', 'English', '0000-00-00 00:00:00', '2018-07-16 14:24:26');

-- 
-- Вывод данных для таблицы app_pages
--
INSERT INTO app_pages VALUES
(15, 'index', 'index', 5, NULL, '2019-01-10 16:57:18', '0000-00-00 00:00:00'),
(16, 'about', 'about', 5, NULL, '2019-01-10 16:57:18', '0000-00-00 00:00:00'),
(17, 'specialists', 'specialists', 5, NULL, '2019-01-10 16:57:18', '0000-00-00 00:00:00'),
(18, 'services', 'services', 5, NULL, '2019-01-10 16:57:18', '0000-00-00 00:00:00'),
(20, 'gallery', 'gallery', 5, NULL, '2019-01-10 16:57:18', '0000-00-00 00:00:00'),
(21, 'departments', 'departments', 5, NULL, '2019-01-10 16:57:18', '0000-00-00 00:00:00'),
(22, 'typography', 'typography', 5, NULL, '2019-01-10 16:57:18', '0000-00-00 00:00:00'),
(23, 'contacts', 'contacts', 5, NULL, '2019-01-10 16:57:18', '0000-00-00 00:00:00'),
(25, 'specialist', 'specialists_show', 5, NULL, '2019-01-10 16:57:18', '0000-00-00 00:00:00'),
(26, 'service', 'service_show', 5, NULL, '2019-01-10 16:57:19', '0000-00-00 00:00:00'),
(27, 'appointment', 'appointment', 5, NULL, '2019-01-10 16:57:19', '0000-00-00 00:00:00'),
(29, 'test_page', 'template', 5, NULL, '2019-01-10 16:57:19', '0000-00-00 00:00:00'),
(30, 'pages', 'typography', 5, NULL, '2019-01-10 16:57:19', '0000-00-00 00:00:00');

-- 
-- Вывод данных для таблицы app_pages_translate
--
INSERT INTO app_pages_translate VALUES
(1, 15, 2, 'Главная', 'The best beauty services', 'Beauty services', 'beauty, services, style, hair, make-up', 'Our SPA & skin care salon will be your perfect getaway for any kind of body and mind relaxation and a skin care.', '2019-01-10 17:02:47', '2019-01-10 17:06:36'),
(2, 16, 2, 'О нас', '', '', '', '', '2019-01-10 17:02:47', '2019-01-10 17:06:36'),
(3, 17, 2, 'Специалисты', '1', '2', '3', '4', '2019-01-10 17:02:47', '2019-01-10 17:06:37'),
(4, 18, 2, 'Услуги', 'aaa', 'bbb', 'bbbb', 'cxvxvx', '2019-01-10 17:02:47', '2019-01-10 17:06:37'),
(5, 20, 2, 'Галлерея', '', '', '', '', '2019-01-10 17:02:47', '2019-01-10 17:06:38'),
(6, 21, 2, 'Подразделения', '', '', '', '', '2019-01-10 17:02:47', '2019-01-10 17:06:38'),
(7, 22, 2, 'Типография', '', '', '', '', '2019-01-10 17:02:47', '2019-01-10 17:06:39'),
(8, 23, 2, 'Контакты', '', '', '', '', '2019-01-10 17:02:47', '2019-01-10 17:06:39'),
(9, 25, 2, 'Страница специалиста', '22', '33', '44', '55', '2019-01-10 17:02:47', '2019-01-10 17:06:40'),
(10, 26, 2, 'Страница услуги', '', '', '', '', '2019-01-10 17:02:47', '2019-01-10 17:06:40'),
(11, 27, 2, 'Страница записи', '', '', '', '', '2019-01-10 17:02:47', '2019-01-10 17:06:41'),
(12, 29, 2, 'Тестовая страница', '', '', '', '', '2019-01-10 17:02:47', '2019-01-10 17:06:41'),
(13, 30, 2, 'Страницы', '', '', '', '', '2019-01-10 17:02:47', '2019-01-10 17:06:42');

-- 
-- Вывод данных для таблицы app_section_fieldsgroup
--
INSERT INTO app_section_fieldsgroup VALUES
(1, 5, 'Контакты', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:41:53'),
(2, 5, 'Социальные сети', 0, 0, '0000-00-00 00:00:00', '2019-01-10 17:41:53');

-- 
-- Вывод данных для таблицы app_setting_group
--

-- 
-- Вывод данных для таблицы apps
--
INSERT INTO apps VALUES
(3, 'app', 'Stephania', 'ru', 2, NULL, 0, '', 0, 'User-agent: *\nDisallow: /siteedit\nDisallow: /apps\nDisallow: /www\nDisallow: */?*\nHost: {host}\nSitemap: {host}/sitemap.xml', '', '', '', '', 0, '2019-01-10 22:35:18', '2018-07-30 14:23:18');

-- 
-- Вывод данных для таблицы se_notice
--
INSERT INTO se_notice VALUES
(1, NULL, '[APP.FROM_EMAIL]', 'Страница контактов', 'Сообщение с сайта [SITENAME]', '<p><strong>Данные пользователя</strong></p>\n\n<p><strong>Имя</strong>: [NAME]</p>\n\n<p><strong>E-mail</strong>: [EMAIL]</p>\n\n<p><strong>Адрес сайта</strong>: [WEBSITE]</p>\n\n<p><strong>Сообщение</strong>:</p>\n\n<p>[MESSAGE]&nbsp;</p>\n', 'email', 1, '2019-01-10 22:31:44', '2019-01-10 17:51:51'),
(2, NULL, '[APP.FROM_EMAIL]', 'Заказ консультации', 'Заказ консультации с сайта [SITENAME]', '<p><strong>Данные пользователя</strong></p>\n\n<p><strong>Имя:&nbsp;</strong>[NAME]</p>\n\n<p><strong>E-mail:&nbsp;</strong>[EMAIL]</p>\n', 'email', 1, '2019-01-10 22:31:26', '2019-01-10 17:51:51'),
(3, NULL, '[APP.FROM_EMAIL]', 'Подписка на новости', 'Подписка на новости [SITENAME]', '<p>Пользователь <strong>[EMAIL]</strong> отправил запрос на подписку на новости.</p>\n', 'email', 1, '2019-01-10 22:31:26', '2019-01-10 17:51:51');

-- 
-- Вывод данных для таблицы se_trigger
--
INSERT INTO se_trigger VALUES
(1, 'feedback', 'Обратная связь', NULL, '2019-01-10 17:53:26'),
(2, 'consultation', 'Заказ консультации', NULL, '2019-01-10 17:53:26'),
(3, 'subscribe', 'Подписка', NULL, '2019-01-10 17:53:26');

-- 
-- Вывод данных для таблицы app_image
--
INSERT INTO app_image VALUES
(8, NULL, 'img4.jpg', NULL, '2019-01-10 16:54:36'),
(9, NULL, 'img5.jpg', NULL, '2019-01-10 16:54:36'),
(10, NULL, 'img6.jpg', NULL, '2019-01-10 16:54:36'),
(11, NULL, 'img7.jpg', NULL, '2019-01-10 16:54:36'),
(12, NULL, 'img25.png', NULL, '2019-01-10 16:54:36'),
(13, NULL, 'img26.png', NULL, '2019-01-10 16:54:36'),
(14, NULL, 'Коала.jpeg', NULL, '2019-01-10 16:54:37'),
(15, NULL, 'img16-658x549.jpg', NULL, '2019-01-10 16:54:37'),
(16, NULL, 'img17-658x549.jpg', NULL, '2019-01-10 16:54:37'),
(17, NULL, 'img18-658x549.jpg', NULL, '2019-01-10 16:54:37'),
(18, NULL, 'Treatments-534x404.jpg', NULL, '2019-01-10 16:54:37'),
(19, NULL, 'Massages-534x404.jpg', NULL, '2019-01-10 16:54:37'),
(20, NULL, 'BodyTreatments-534x404.jpg', NULL, '2019-01-10 16:54:37'),
(21, NULL, 'img9-1728x787.jpg', NULL, '2019-01-10 16:54:37'),
(22, NULL, 'img10-1728x787.jpg', NULL, '2019-01-10 16:54:37'),
(23, NULL, 'img11-1728x787.jpg', NULL, '2019-01-10 16:54:37'),
(24, NULL, 'img12-1728x787.jpg', NULL, '2019-01-10 16:54:37'),
(25, NULL, 'img13-1728x787.jpg', NULL, '2019-01-10 16:54:37'),
(26, NULL, 'img14-1728x787.jpg', NULL, '2019-01-10 16:54:37'),
(27, NULL, 'img19.jpg', NULL, '2019-01-10 16:54:37'),
(28, NULL, 'img20.jpg', NULL, '2019-01-10 16:54:37'),
(29, NULL, 'img21.jpg', NULL, '2019-01-10 16:54:38'),
(30, NULL, 'img1.jpg', NULL, '2019-01-10 16:54:38'),
(31, NULL, 'img15.jpg', NULL, '2019-01-10 16:54:38'),
(32, NULL, 'img24.jpg', NULL, '2019-01-10 16:54:38'),
(33, NULL, 'img27.jpg', NULL, '2019-01-10 16:54:38');

-- 
-- Вывод данных для таблицы app_nav
--
INSERT INTO app_nav VALUES
(2, 3, 'Главное меню', 'main_menu', NULL, '2019-01-10 17:14:23');

-- 
-- Вывод данных для таблицы app_section
--
INSERT INTO app_section VALUES
(4, 3, NULL, 0, 'home', 'text', 'Главная', 1, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:13:28'),
(5, 3, NULL, 25, 'specialist', 'text', 'Специалисты', 1, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:13:28'),
(7, 3, NULL, 26, 'services', 'text', 'Услуги', 1, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:13:28'),
(9, 3, NULL, NULL, 'test_section', 'text', 'Тестовый раздел', 1, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:13:28'),
(10, 3, NULL, NULL, 'main_slider', 'text', 'Слайдер на главной', 1, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:13:28');

-- 
-- Вывод данных для таблицы app_setting
--

-- 
-- Вывод данных для таблицы se_notice_trigger
--
INSERT INTO se_notice_trigger VALUES
(3, 2, 2, NULL, '2019-01-10 17:53:40'),
(4, 1, 1, NULL, '2019-01-10 17:53:40'),
(5, 3, 3, NULL, '2019-01-10 17:53:41');

-- 
-- Вывод данных для таблицы app_section_collection
--
INSERT INTO app_section_collection VALUES
(9, NULL, 4, 'variety-of-care-', '/services/', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:22:53'),
(10, NULL, 4, 'handy-staff-', '/services/', 0, '0000-00-00 00:00:00', 1, 1, '0000-00-00 00:00:00', '2019-01-10 17:22:53'),
(11, NULL, 4, 'relaxation-centric-', '/services/', 0, '0000-00-00 00:00:00', 1, 2, '0000-00-00 00:00:00', '2019-01-10 17:22:53'),
(12, NULL, 4, 'reasonable-costs-', '/services/', 0, '0000-00-00 00:00:00', 1, 3, '0000-00-00 00:00:00', '2019-01-10 17:22:53'),
(16, NULL, 4, 'lizzie-major', '', 0, '0000-00-00 00:00:00', 1, 7, '0000-00-00 00:00:00', '2019-01-10 17:22:53'),
(17, NULL, 4, 'theresa-palmer', '', 0, '0000-00-00 00:00:00', 1, 8, '0000-00-00 00:00:00', '2019-01-10 17:22:53'),
(24, NULL, 5, 'mary-fruition', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:22:53'),
(26, NULL, 5, 'stacy-blunt', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:22:53'),
(27, NULL, 5, 'emily-nichols', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:22:53'),
(29, NULL, 7, 'body-treatments', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:22:53'),
(30, NULL, 7, 'medi-spa', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:22:54'),
(31, NULL, 7, 'massages', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:22:54'),
(32, NULL, 7, 'waxing', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:22:54'),
(33, NULL, 7, 'facial-care', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:22:54'),
(34, NULL, 7, 'feet-treatments-pedicure', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:22:54'),
(35, NULL, 5, 'danielle-jones', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:22:54'),
(36, NULL, 5, 'mary-applebaum', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:22:54'),
(37, NULL, 5, 'elisa-hansolo', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:22:54'),
(38, NULL, 10, 'slide_1', '', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:22:54'),
(39, NULL, 4, 'hands-treatments-manicure', '/about', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:22:54'),
(40, NULL, 4, 'thousands-of-happy-patients', '/about', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:22:55'),
(41, NULL, 4, 'love-yourself', '/appointment', 0, '0000-00-00 00:00:00', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:22:55');

-- 
-- Вывод данных для таблицы app_section_fields
--
INSERT INTO app_section_fields VALUES
(2, 5, NULL, 'spec', 'Специализация', 'radio', 0, '', '', '', 'Stylist, Hairdresser, Make-up Artist, Beauty Specialist', NULL, NULL, '', 0, 'Stylist', 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:43:28'),
(15, 7, NULL, 'full_text', 'Подробный текст', 'textedit', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:43:28'),
(16, 5, NULL, 'full_text', 'Полное описание', 'textedit', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:43:28'),
(17, 5, 1, 'address', 'Адрес', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:43:28'),
(18, 5, 1, 'phone', 'Телефон', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:43:29'),
(19, 5, 1, 'fax', 'Факс', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:43:29'),
(20, 5, 1, 'email', 'E-mail', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:43:29'),
(21, 5, 2, 'fb', 'Facebook', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:43:29'),
(22, 5, 2, 'tw', 'Twitter', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:43:29'),
(23, 5, 2, 'ggp', 'Google Plus', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:43:29'),
(24, 5, 2, 'inst', 'Instagram', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:43:29'),
(25, 10, NULL, 'label_1', 'Строка 1', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:43:29'),
(26, 10, NULL, 'label_2', 'Строка 2', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:43:29'),
(27, 10, NULL, 'label_3', 'Строка 3', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:43:29'),
(28, 10, NULL, 'label_4', 'Строка 4', 'string', 0, '', '', '', NULL, NULL, NULL, '', 0, NULL, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:43:29');

-- 
-- Вывод данных для таблицы app_section_groups
--
INSERT INTO app_section_groups VALUES
(3, 4, NULL, 'cat_banners', 0, '0000-00-00 00:00:00', '2019-01-10 17:24:25'),
(5, 4, NULL, 'cat_reviews', 0, '0000-00-00 00:00:00', '2019-01-10 17:24:25'),
(8, 7, NULL, 'our_services', 0, '0000-00-00 00:00:00', '2019-01-10 17:24:25'),
(9, 4, NULL, 'section_home_1', 0, '0000-00-00 00:00:00', '2019-01-10 17:24:25'),
(10, 4, NULL, 'section_home_2', 0, '0000-00-00 00:00:00', '2019-01-10 17:24:25'),
(11, 4, NULL, 'section_home_3', 0, '0000-00-00 00:00:00', '2019-01-10 17:24:25');

-- 
-- Вывод данных для таблицы app_section_parametrs
--
INSERT INTO app_section_parametrs VALUES
(5, 4, 'image-prev-size', '250x250', 0, '0000-00-00 00:00:00', '2019-01-10 17:50:12'),
(6, 4, 'image-size', '800', 0, '0000-00-00 00:00:00', '2019-01-10 17:50:12'),
(7, 5, 'image-prev-size', '250x250', 0, '0000-00-00 00:00:00', '2019-01-10 17:50:12'),
(8, 5, 'image-size', '800', 0, '0000-00-00 00:00:00', '2019-01-10 17:50:12'),
(9, 7, 'image-prev-size', '250x250', 0, '0000-00-00 00:00:00', '2019-01-10 17:50:12'),
(10, 7, 'image-size', '800', 0, '0000-00-00 00:00:00', '2019-01-10 17:50:13'),
(11, 9, 'image-prev-size', '250x250', 0, '0000-00-00 00:00:00', '2019-01-10 17:50:13'),
(12, 9, 'image-size', '800', 0, '0000-00-00 00:00:00', '2019-01-10 17:50:13'),
(13, 10, 'image-prev-size', '250x250', 0, '0000-00-00 00:00:00', '2019-01-10 17:50:13'),
(14, 10, 'image-size', '800', 0, '0000-00-00 00:00:00', '2019-01-10 17:50:13');

-- 
-- Вывод данных для таблицы app_section_translate
--

-- 
-- Вывод данных для таблицы app_setting_value
--

-- 
-- Вывод данных для таблицы app_urls
--
INSERT INTO app_urls VALUES
(15, 3, 15, NULL, '/', 'page', 'aindex', 'index', '2019-01-10 17:59:33', '2019-01-10 17:13:28'),
(16, 3, 16, NULL, '/about', 'page', 'aabout', 'about', '2019-01-10 18:03:58', '2019-01-10 17:13:28'),
(17, 3, 17, NULL, '/specialists', 'page', 'aspecialists', 'specialists', '2019-01-10 18:04:03', '2019-01-10 17:13:28'),
(18, 3, 18, NULL, '/services', 'page', 'aservices', 'services', '2019-01-10 18:04:19', '2019-01-10 17:13:28'),
(20, 3, 20, NULL, '/gallery', 'page', 'agallery', 'gallery', '2019-01-10 18:04:23', '2019-01-10 17:13:28'),
(21, 3, 21, NULL, '/departments', 'page', 'adepartments', 'departments', '2019-01-10 18:04:28', '2019-01-10 17:13:28'),
(22, 3, 22, NULL, '/typography', 'page', 'atypography', 'typography', '2019-01-10 18:04:32', '2019-01-10 17:13:29'),
(23, 3, 23, NULL, '/contacts', 'page', 'acontacts', 'contacts', '2019-01-10 18:04:36', '2019-01-10 17:13:29'),
(33, 3, 25, NULL, '/specialist', 'page', 'aspecialist', 'specialists_show', '2019-01-10 18:04:40', '2019-01-10 17:13:29'),
(39, 3, 25, 5, '/specialist/{code}', 'item', 'sspecialist', 'specialists_show', '2019-01-10 19:05:42', '2019-01-10 17:13:29'),
(40, 3, 25, 5, '/specialist/cat/{code}', 'group', 'gspecialist', 'specialists_show', '2019-01-10 19:05:43', '2019-01-10 17:13:29'),
(41, 3, 26, NULL, '/service', 'page', 'aservice', 'service_show', '2019-01-10 18:04:45', '2019-01-10 17:13:29'),
(44, 3, 26, 7, '/service/{code}', 'item', 'sservices', 'service_show', '2019-01-10 19:06:47', '2019-01-10 17:13:29'),
(45, 3, 26, 7, '/service/cat/{code}', 'group', 'gservices', 'service_show', '2019-01-10 19:06:48', '2019-01-10 17:13:29'),
(46, 3, 27, NULL, '/appointment', 'page', 'aappointment', 'appointment', '2019-01-10 18:04:49', '2019-01-10 17:13:29'),
(48, 3, 29, NULL, '/test_page', 'page', 'atest_page', 'template', '2019-01-10 18:04:53', '2019-01-10 17:13:29'),
(49, 3, 30, NULL, '/#', 'page', 'apages', 'typography', '2019-01-10 18:04:57', '2019-01-10 17:13:29');

-- 
-- Вывод данных для таблицы app_nav_url
--
INSERT INTO app_nav_url VALUES
(1, 2, 15, NULL, NULL, NULL, 0, 1, NULL, '2019-01-10 17:15:12'),
(2, 2, 16, NULL, NULL, NULL, 1, 1, NULL, '2019-01-10 17:15:12'),
(4, 2, 17, NULL, NULL, NULL, 2, 1, NULL, '2019-01-10 17:15:12'),
(5, 2, 18, NULL, NULL, NULL, 3, 1, NULL, '2019-01-10 17:15:12'),
(6, 2, 23, NULL, NULL, NULL, 5, 1, NULL, '2019-01-10 17:15:12'),
(7, 2, 49, NULL, NULL, NULL, 4, 1, NULL, '2019-01-10 17:15:12'),
(8, 2, 20, 7, NULL, NULL, 0, 1, NULL, '2019-01-10 17:15:12'),
(9, 2, 21, 7, NULL, NULL, 1, 1, NULL, '2019-01-10 17:15:12'),
(10, 2, 22, 7, NULL, NULL, 2, 1, NULL, '2019-01-10 17:15:12');

-- 
-- Вывод данных для таблицы app_section_collection_group
--
INSERT INTO app_section_collection_group VALUES
(3, 9, 3, NULL, '2019-01-10 17:31:35'),
(4, 10, 3, NULL, '2019-01-10 17:31:35'),
(5, 11, 3, NULL, '2019-01-10 17:31:35'),
(6, 12, 3, NULL, '2019-01-10 17:31:35'),
(10, 16, 5, NULL, '2019-01-10 17:31:35'),
(11, 17, 5, NULL, '2019-01-10 17:31:35'),
(18, 29, 8, NULL, '2019-01-10 17:31:35'),
(19, 30, 8, NULL, '2019-01-10 17:31:35'),
(20, 31, 8, NULL, '2019-01-10 17:31:35'),
(21, 32, 8, NULL, '2019-01-10 17:31:35'),
(22, 33, 8, NULL, '2019-01-10 17:31:35'),
(23, 34, 8, NULL, '2019-01-10 17:31:35'),
(24, 40, 10, NULL, '2019-01-10 17:31:36'),
(25, 39, 9, NULL, '2019-01-10 17:31:36'),
(26, 41, 11, NULL, '2019-01-10 17:31:36');

-- 
-- Вывод данных для таблицы app_section_collection_image
--
INSERT INTO app_section_collection_image VALUES
(7, 9, 8, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:17'),
(8, 10, 9, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:17'),
(9, 11, 10, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(10, 12, 11, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(11, 16, 12, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(12, 17, 13, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(20, 24, 15, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(22, 26, 16, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(23, 27, 17, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(24, 30, 21, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(25, 29, 22, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(26, 31, 23, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(27, 32, 24, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(28, 33, 25, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(30, 34, 26, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(31, 35, 27, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(32, 36, 28, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(33, 37, 29, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(34, 38, 30, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(35, 39, 31, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(36, 40, 32, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18'),
(37, 41, 33, 1, 0, '0000-00-00 00:00:00', '2019-01-10 17:35:18');

-- 
-- Вывод данных для таблицы app_section_collection_translate
--
INSERT INTO app_section_collection_translate VALUES
(1, 9, 2, 'VARIETY OF CARE', '', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:48'),
(2, 10, 2, 'HANDY STAFF', '', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(3, 11, 2, 'RELAXATION-CENTRIC', '', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(4, 12, 2, 'REASONABLE COSTS', '', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(5, 16, 2, 'Lizzie Major', '<p>Every once in a while, we girls just have to take a break from our routine daily hectic errands and job and just step aside for some relaxation&hellip; Whenever I do it, this is the place where all the relaxation starts at for me&hellip;</p>\n', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(6, 17, 2, 'Theresa Palmer', '<p>Whenever I feel depressed, anxious or just tired, I always need to take some chill pill and relax&hellip; Luckily, I always have had this place for those matters&hellip; Here I can both delve into a meditative rest and also take care of my skin&rsquo;s health&hellip;</p>\n', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(7, 24, 2, 'MARY FRUITION', '<p>Before setting up her own salon, Mary&#39;s been working at a prestigious SPA venue in North Carolina...</p>\n', 's1', 's2', 's3', 's4', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(8, 26, 2, 'STACY BLUNT', '<p>The reason why Stacy is so natural with everything regarding skin&#39;s health and skin care treatments may</p>\n', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(9, 27, 2, 'EMILY NICHOLS', '<p>Emily&#39;s career as a SPA care specialist has spanned to include work at numerous prestigious salons across</p>\n', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(10, 29, 2, 'Body Treatments', '<p>Treating your body with care and love is an essential way to stay looking young, to keep your skin radiantly fresh and healthy&hellip; Our specialists have proved time and again, that they&rsquo;re capable of providing</p>\n', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(11, 30, 2, 'Medi-spa', '<p>Besides providing regular face &amp; body skin care and a range of other SPA services, we have a separate medical SPA range as well&hellip; All of the services below are provided by licensed aestheticians and</p>\n', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(12, 31, 2, 'Massages', '<p>Massages have always been a vital part of any essential SPA range of services&hellip; Besides providing a great stress relief and a profound level of relaxation for anyone, massages are also proven to be good</p>\n', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(13, 32, 2, 'Waxing', '<p>Waxing is a vital way to keep you skin elastic, clean and smooth&hellip; Our SPA &amp; skin care salon has always focused on providing an</p>\n', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(14, 33, 2, 'Facial Care', '<p>While everyone knows, that having a regular facial skin care session is vital for keeping up with your health and keeping your look fresh and</p>\n', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(15, 34, 2, 'Feet Treatments/Pedicure', '<p>Taking a good care about your feet and nails is essential. We provide an ultimate, SPA induced services for refreshing your health and enhancing your</p>\n', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(16, 35, 2, 'DANIELLE JONES', '<p>Danielle has been working in a SPA industry well since she was 17... Her skills and her positive style of work have swiftly made her our leading specialist in the feet and hands treatment fields! Also,</p>\n', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(17, 36, 2, 'MARY APPLEBAUM', '<p>A Juneau, Alaska native, Mrs. Applebaum has come a long way since her high school graduation all the way up to getting a Brown University Master&rsquo;s degree in Economics. Talented with the digits, she&rsquo;s no less</p>\n', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(18, 37, 2, 'ELISA HANSOLO', '<p>Born in New York City, Elisa always felt a strong urge for being an ambitious overachiever. Eventually, by the age of 25 she already had received her first Wall Street executive position, making her one of</p>\n', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(19, 38, 2, 'Слайд 1', '', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(20, 39, 2, 'HANDS TREATMENTS/MANICURE', '<p>While hands and nails care is usually restricted to just a few services, we&rsquo;ve got a wide selection of various pedicure methods, just as well as the overall hands skin care treatments&hellip; Here&rsquo;s a list of those: Regular Manicure; Spa Manicure; Paraffin + Hot Towel Wraps; Gel Pedicure&hellip;</p>\n', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(21, 40, 2, 'THOUSANDS OF HAPPY PATIENTS', '<p>We are so proud of the salon that we&rsquo;ve built over those few years!</p>\n\n<p>See this video review to get a better sense of just how diverse our range of skincare, beauty and cosmetology services really is!</p>\n', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:49'),
(22, 41, 2, 'LOVE YOURSELF', '<p>IT IS IMPORTANT TO STAY POSITIVE BECAUSE BEAUTY<br />\nCOMES FROM THE INSIDE OUT.</p>\n', '', '', '', '', '0000-00-00 00:00:00', '2019-01-10 17:30:50');

-- 
-- Вывод данных для таблицы app_section_collection_values
--
INSERT INTO app_section_collection_values VALUES
(31, 24, 2, NULL, 'Stylist', '0000-00-00 00:00:00', '2019-01-10 17:45:33'),
(32, 26, 2, NULL, ' Hairdresser', '0000-00-00 00:00:00', '2019-01-10 17:45:33'),
(33, 27, 2, NULL, ' Make-up Artist', '0000-00-00 00:00:00', '2019-01-10 17:45:33'),
(40, 30, 15, NULL, '<p>Besides providing regular face &amp; body skin care and a range of other SPA services, we have a separate medical SPA range as well&hellip; All of the services below are provided by licensed aestheticians and cosmetologists:</p>\n\n<p>1) Dermal Fillers Those are meant for getting rid of facial wrinkles and lines;</p>\n\n<p>2) Botox Injections..</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:45:33'),
(41, 29, 15, NULL, 'Treating your body with care and love is an essential way to stay looking young, to keep your skin radiantly fresh and healthy… Our specialists have proved time and again, that they’re capable of providing an excellent range of body treatment…', '0000-00-00 00:00:00', '2019-01-10 17:45:33'),
(42, 31, 15, NULL, 'Massages have always been a vital part of any essential SPA range of services… Besides providing a great stress relief and a profound level of relaxation for anyone, massages are also proven to be good for your health! Basically, any good skin care session must include a massage, fit specifically for the treatment type a…', '0000-00-00 00:00:00', '2019-01-10 17:45:33'),
(43, 32, 15, NULL, '<p>Waxing is a vital way to keep you skin elastic, clean and smooth&hellip; Our SPA &amp; skin care salon has always focused on providing an excellent experience for anyone who wants to wax their facial or body skin&hellip;<br />\nWhile everyone knows, that having a regular facial skin care session is vital for keeping up with your health and keeping your look fresh and young, we know it better, than anybody else!</p>\n\n<p>That&rsquo;s all due to our long experience in providing thousands of women with a top notch level of facial skin care, with its quality and price kept intact.</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:45:33'),
(44, 33, 15, NULL, '<p>While everyone knows, that having a regular facial skin care session is vital for keeping up with your health and keeping your look fresh and young, we know it better, than anybody else!</p>\n\n<p>That&rsquo;s all due to our long experience in providing thousands of women with a top notch level of facial skin care, with its quality and price kept intact.</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:45:33'),
(46, 34, 15, NULL, '<p>Taking a good care about your feet and nails is essential. We provide an ultimate, SPA induced services for refreshing your health and enhancing your aesthetics&hellip; We currently provide following services: Regular Pedicure; Spa Pedicure; Callus Removal&hellip;<br />\nWhile everyone knows, that having a regular facial skin care session is vital for keeping up with your health and keeping your look fresh and young, we know it better, than anybody else!</p>\n\n<p>That&rsquo;s all due to our long experience in providing thousands of women with a top notch level of facial skin care, with its quality and price kept intact.</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:45:33'),
(47, 35, 2, NULL, ' Beauty Specialist', '0000-00-00 00:00:00', '2019-01-10 17:45:33'),
(48, 35, 16, NULL, '<p>Danielle has been working in a SPA industry well since she was 17&hellip; Her skills and her positive style of work have swiftly made her our leading specialist in the feet and hands treatment fields!<br />\nAlso, Danielle is the head of our SPA salon&rsquo;s Gentlemen&rsquo;s services department.</p>\n\n<h3>Biography</h3>\n\n<p>From those summer days of 1998 on, Danielle&rsquo;s been instrumental in expanding absolutely every single aspect of the salon&rsquo;s features to its best:</p>\n\n<ul>\n\t<li>The number of skin care &amp; SPA relaxation services has been drastically expanded</li>\n\t<li>The team extended to include 12 more skin care professionals, all sincerely passionate about providing the ultimate SPA experience</li>\n</ul>\n\n<h3>Professional Life</h3>\n\n<p>..and so much more!</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:45:33'),
(49, 36, 2, NULL, ' Beauty Specialist', '0000-00-00 00:00:00', '2019-01-10 17:45:34'),
(50, 36, 16, NULL, '<p>A Juneau, Alaska native, Mrs. Applebaum has come a long way since her high school graduation all the way up to getting a Brown University Master&rsquo;s degree in Economics. Talented with the digits, she&rsquo;s no less successful when it comes to managing the human resources of the company.</p>\n\n<h3>Biography</h3>\n\n<p>From those summer days of 1998 on, Mary&rsquo;s been instrumental in expanding absolutely every single aspect of the salon&rsquo;s features to its best:</p>\n\n<ul>\n\t<li>The number of skin care &amp; SPA relaxation services has been drastically expanded</li>\n\t<li>The team extended to include 12 more skin care professionals, all sincerely passionate about providing the ultimate SPA experience</li>\n</ul>\n\n<h3>Professional Life</h3>\n\n<p>..and so much more!</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:45:34'),
(51, 37, 2, NULL, ' Beauty Specialist', '0000-00-00 00:00:00', '2019-01-10 17:45:34'),
(52, 37, 16, NULL, '<p>Born in New York City, Elisa always felt a strong urge for being an ambitious overachiever. Eventually, by the age of 25 she already had received her first Wall Street executive position, making her one of the youngest managers in the company. With her overall work experience spanning&hellip;</p>\n\n<h3>Biography</h3>\n\n<p>From those summer days of 1998 on, Elisa&rsquo;s been instrumental in expanding absolutely every single aspect of the salon&rsquo;s features to its best:</p>\n\n<ul>\n\t<li>The number of skin care &amp; SPA relaxation services has been drastically expanded</li>\n\t<li>The team extended to include 12 more skin care professionals, all sincerely passionate about providing the ultimate SPA experience</li>\n</ul>\n\n<h3>Professional Life</h3>\n\n<p>..and so much more!</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:45:34'),
(53, 24, 16, NULL, '<p>Before setting up her own salon, Mary&rsquo;s been working at a prestigious SPA venue in North Carolina&hellip;<br />\nThere she was able to save a sufficient amount of a principal capital in order to set up her very own SPA &amp; skin care salon.</p>\n\n<h3>Biography</h3>\n\n<p>From those summer days of 1998 on, Mary&rsquo;s been instrumental in expanding absolutely every single aspect of the salon&rsquo;s features to its best:</p>\n\n<ul>\n\t<li>The number of skin care &amp; SPA relaxation services has been drastically expanded</li>\n\t<li>The team extended to include 12 more skin care professionals, all sincerely passionate about providing the ultimate SPA experience</li>\n</ul>\n\n<h3>Professional Life</h3>\n\n<p>..and so much more!</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:45:34'),
(54, 24, 17, NULL, 'Postal address:400 Madison str., Alexandria, VA, United States', '0000-00-00 00:00:00', '2019-01-10 17:45:34'),
(55, 24, 18, NULL, '1-555-325-4632', '0000-00-00 00:00:00', '2019-01-10 17:45:34'),
(56, 24, 19, NULL, '1-555-329-9632', '0000-00-00 00:00:00', '2019-01-10 17:45:34'),
(57, 24, 20, NULL, 'maryfruition@demolink.org', '0000-00-00 00:00:00', '2019-01-10 17:45:34'),
(58, 26, 16, NULL, '<p>The reason why Stacy is so natural with everything regarding skin&rsquo;s health and skin care treatments may have to do with her prior medical degree&hellip;<br />\nFor a few years following her med school graduation she&rsquo;s been soul searching for a perfect job field, and thankfully she found one!</p>\n\n<h3>Biography</h3>\n\n<p>From those summer days of 1998 on, Stacy&rsquo;s been instrumental in expanding absolutely every single aspect of the salon&rsquo;s features to its best:</p>\n\n<ul>\n\t<li>The number of skin care &amp; SPA relaxation services has been drastically expanded</li>\n\t<li>The team extended to include 12 more skin care professionals, all sincerely passionate about providing the ultimate SPA experience</li>\n</ul>\n\n<h3>Professional Life</h3>\n\n<p>..and so much more!</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:45:34'),
(59, 26, 17, NULL, 'Postal address:400 Madison str., Alexandria, VA, United States', '0000-00-00 00:00:00', '2019-01-10 17:45:34'),
(60, 26, 18, NULL, '1-555-325-4632', '0000-00-00 00:00:00', '2019-01-10 17:45:34'),
(61, 26, 19, NULL, '1-555-329-9632', '0000-00-00 00:00:00', '2019-01-10 17:45:34'),
(62, 26, 20, NULL, 'stacyblunt@demolink.org', '0000-00-00 00:00:00', '2019-01-10 17:45:34'),
(63, 24, 21, NULL, 'https://www.facebook.com', '0000-00-00 00:00:00', '2019-01-10 17:45:34'),
(64, 24, 22, NULL, 'https://twitter.com', '0000-00-00 00:00:00', '2019-01-10 17:45:34'),
(65, 24, 23, NULL, 'https://plus.google.com', '0000-00-00 00:00:00', '2019-01-10 17:45:35'),
(66, 24, 24, NULL, 'https://www.instagram.com', '0000-00-00 00:00:00', '2019-01-10 17:45:35'),
(67, 26, 21, NULL, 'https://www.facebook.com', '0000-00-00 00:00:00', '2019-01-10 17:45:35'),
(68, 26, 22, NULL, 'https://twitter.com/', '0000-00-00 00:00:00', '2019-01-10 17:45:35'),
(69, 26, 23, NULL, 'https://plus.google.com/', '0000-00-00 00:00:00', '2019-01-10 17:45:35'),
(70, 26, 24, NULL, 'https://www.instagram.com/', '0000-00-00 00:00:00', '2019-01-10 17:45:35'),
(71, 27, 16, NULL, '<p>Emily&rsquo;s career as a SPA care specialist has spanned to include work at numerous prestigious salons across the US&hellip;But after moving with her family from the state of New York to Orlando, Florida, Emily have made a fortunate decision to become a part of our salon&rsquo;s team!</p>\n\n<h3>Biography</h3>\n\n<p>From those summer days of 1998 on, Emily&rsquo;s been instrumental in expanding absolutely every single aspect of the salon&rsquo;s features to its best:</p>\n\n<ul>\n\t<li>The number of skin care &amp; SPA relaxation services has been drastically expanded</li>\n\t<li>The team extended to include 12 more skin care professionals, all sincerely passionate about providing the ultimate SPA experience</li>\n</ul>\n\n<h3>Professional Life</h3>\n\n<p>..and so much more!</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:45:35'),
(72, 27, 17, NULL, 'Postal address:400 Madison str., Alexandria, VA, United States', '0000-00-00 00:00:00', '2019-01-10 17:45:35'),
(73, 27, 18, NULL, '1-555-325-4632', '0000-00-00 00:00:00', '2019-01-10 17:45:35'),
(74, 27, 19, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:45:35'),
(75, 27, 20, NULL, 'emilynichols@demolink.org', '0000-00-00 00:00:00', '2019-01-10 17:45:35'),
(76, 27, 21, NULL, 'https://www.facebook.com', '0000-00-00 00:00:00', '2019-01-10 17:45:35'),
(77, 27, 22, NULL, 'https://twitter.com/', '0000-00-00 00:00:00', '2019-01-10 17:45:35'),
(78, 27, 23, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:45:35'),
(79, 27, 24, NULL, 'https://www.instagram.com/', '0000-00-00 00:00:00', '2019-01-10 17:45:35'),
(80, 35, 17, NULL, 'Postal address:400 Madison str., Alexandria, VA, United States', '0000-00-00 00:00:00', '2019-01-10 17:45:35'),
(81, 35, 18, NULL, '1-555-325-4632', '0000-00-00 00:00:00', '2019-01-10 17:45:35'),
(82, 35, 19, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:45:35'),
(83, 35, 20, NULL, 'daniellejones@demolink.org', '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(84, 35, 21, NULL, 'https://www.facebook.com', '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(85, 35, 22, NULL, 'https://twitter.com/', '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(86, 35, 23, NULL, 'https://plus.google.com/', '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(87, 35, 24, NULL, 'https://www.instagram.com/', '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(88, 36, 17, NULL, 'Postal address:400 Madison str., Alexandria, VA, United States', '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(89, 36, 18, NULL, '1-555-325-4632', '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(90, 36, 19, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(91, 36, 20, NULL, 'maryapplebaum@demolink.org', '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(92, 36, 21, NULL, 'https://www.facebook.com', '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(93, 36, 22, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(94, 36, 23, NULL, 'https://plus.google.com/', '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(95, 36, 24, NULL, 'https://www.instagram.com/', '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(96, 37, 17, NULL, 'Postal address:400 Madison str., Alexandria, VA, United States', '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(97, 37, 18, NULL, '1-555-325-4632', '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(98, 37, 19, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(99, 37, 20, NULL, 'elisahansolo@demolink.orge', '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(100, 37, 21, NULL, 'https://www.facebook.com', '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(101, 37, 22, NULL, 'https://twitter.com/', '0000-00-00 00:00:00', '2019-01-10 17:45:36'),
(102, 37, 23, NULL, 'https://plus.google.com/', '0000-00-00 00:00:00', '2019-01-10 17:45:37'),
(103, 37, 24, NULL, 'https://www.instagram.com/', '0000-00-00 00:00:00', '2019-01-10 17:45:37'),
(104, 38, 25, NULL, 'LET US OFFER YOU', '0000-00-00 00:00:00', '2019-01-10 17:45:37'),
(105, 38, 26, NULL, 'THE BEST', '0000-00-00 00:00:00', '2019-01-10 17:45:37'),
(106, 38, 27, NULL, 'BEAUTY SERVICES', '0000-00-00 00:00:00', '2019-01-10 17:45:37'),
(107, 38, 28, NULL, '24/7, we’ll be working to make your facial and body skin healthy and you satisfied and all relaxed!', '0000-00-00 00:00:00', '2019-01-10 17:45:37');

-- 
-- Вывод данных для таблицы app_section_groups_image
--

-- 
-- Вывод данных для таблицы app_section_groups_translate
--
INSERT INTO app_section_groups_translate VALUES
(1, 3, 2, 'WELCOME TO OUR SALON', '<p>If you&rsquo;re looking for that perfect relaxation getaway&hellip; or want to take care of your skin&rsquo;s health and looks, then we&rsquo;re the place to go&hellip; We provide an ultimate, universal set of SPA &amp; skin care procedures for both women and men!</p>\n', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:26:56'),
(2, 5, 2, 'Отзывы', '', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:26:56'),
(3, 8, 2, 'SEE OUR SERVICES', '<p>We&#39;ve got a whole range of skincare and beauty related services for our lady and gentlemen customers!</p>\n', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:26:57'),
(4, 9, 2, 'HANDS TREATMENTS/MANICURE', '', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:26:57'),
(5, 10, 2, 'THOUSANDS OF HAPPY PATIENTS', '', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:26:57'),
(6, 11, 2, 'LOVE YOURSELF', '', NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:26:57');

-- 
-- Вывод данных для таблицы app_nav_url_translate
--
INSERT INTO app_nav_url_translate VALUES
(10, 1, 2, 'Home', NULL, '2019-01-10 17:17:59'),
(11, 2, 2, 'About us', NULL, '2019-01-10 17:17:59'),
(12, 4, 2, 'Specialists', NULL, '2019-01-10 17:18:00'),
(13, 5, 2, 'Services', NULL, '2019-01-10 17:18:00'),
(14, 6, 2, 'Contacts', NULL, '2019-01-10 17:18:00'),
(15, 7, 2, 'Pages', NULL, '2019-01-10 17:18:00'),
(16, 8, 2, 'Gallery', NULL, '2019-01-10 17:18:00'),
(17, 9, 2, 'Departments', NULL, '2019-01-10 17:18:00'),
(18, 10, 2, 'Typography', NULL, '2019-01-10 17:18:00');

-- 
-- Вывод данных для таблицы app_section_collection_image_translate
--
INSERT INTO app_section_collection_image_translate VALUES
(1, 7, 2, 'VARIETY OF CARE', 'VARIETY OF CARE', '0000-00-00 00:00:00', '2019-01-10 17:39:50'),
(2, 8, 2, 'HANDY STAFF', 'HANDY STAFF', '0000-00-00 00:00:00', '2019-01-10 17:39:50'),
(3, 9, 2, 'RELAXATION-CENTRIC', 'RELAXATION-CENTRIC', '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(4, 10, 2, 'REASONABLE COSTS', 'REASONABLE COSTS', '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(5, 11, 2, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(6, 12, 2, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(7, 20, 2, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(8, 22, 2, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(9, 23, 2, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(10, 24, 2, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(11, 25, 2, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(12, 26, 2, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(13, 27, 2, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(14, 28, 2, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(15, 30, 2, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(16, 31, 2, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(17, 32, 2, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(18, 33, 2, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(19, 34, 2, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(20, 35, 2, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(21, 36, 2, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:39:51'),
(22, 37, 2, NULL, NULL, '0000-00-00 00:00:00', '2019-01-10 17:39:51');

-- 
-- Вывод данных для таблицы app_section_collection_values_translate
--
INSERT INTO app_section_collection_values_translate VALUES
(1, 31, 2, 'Stylist', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(2, 32, 2, ' Hairdresser', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(3, 33, 2, ' Make-up Artist', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(4, 40, 2, '<p>Besides providing regular face &amp; body skin care and a range of other SPA services, we have a separate medical SPA range as well&hellip; All of the services below are provided by licensed aestheticians and cosmetologists:</p>\n\n<p>1) Dermal Fillers Those are meant for getting rid of facial wrinkles and lines;</p>\n\n<p>2) Botox Injections..</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(5, 41, 2, 'Treating your body with care and love is an essential way to stay looking young, to keep your skin radiantly fresh and healthy… Our specialists have proved time and again, that they’re capable of providing an excellent range of body treatment…', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(6, 42, 2, 'Massages have always been a vital part of any essential SPA range of services… Besides providing a great stress relief and a profound level of relaxation for anyone, massages are also proven to be good for your health! Basically, any good skin care session must include a massage, fit specifically for the treatment type a…', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(7, 43, 2, '<p>Waxing is a vital way to keep you skin elastic, clean and smooth&hellip; Our SPA &amp; skin care salon has always focused on providing an excellent experience for anyone who wants to wax their facial or body skin&hellip;<br />\nWhile everyone knows, that having a regular facial skin care session is vital for keeping up with your health and keeping your look fresh and young, we know it better, than anybody else!</p>\n\n<p>That&rsquo;s all due to our long experience in providing thousands of women with a top notch level of facial skin care, with its quality and price kept intact.</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(8, 44, 2, '<p>While everyone knows, that having a regular facial skin care session is vital for keeping up with your health and keeping your look fresh and young, we know it better, than anybody else!</p>\n\n<p>That&rsquo;s all due to our long experience in providing thousands of women with a top notch level of facial skin care, with its quality and price kept intact.</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(9, 46, 2, '<p>Taking a good care about your feet and nails is essential. We provide an ultimate, SPA induced services for refreshing your health and enhancing your aesthetics&hellip; We currently provide following services: Regular Pedicure; Spa Pedicure; Callus Removal&hellip;<br />\nWhile everyone knows, that having a regular facial skin care session is vital for keeping up with your health and keeping your look fresh and young, we know it better, than anybody else!</p>\n\n<p>That&rsquo;s all due to our long experience in providing thousands of women with a top notch level of facial skin care, with its quality and price kept intact.</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(10, 47, 2, ' Beauty Specialist', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(11, 48, 2, '<p>Danielle has been working in a SPA industry well since she was 17&hellip; Her skills and her positive style of work have swiftly made her our leading specialist in the feet and hands treatment fields!<br />\nAlso, Danielle is the head of our SPA salon&rsquo;s Gentlemen&rsquo;s services department.</p>\n\n<h3>Biography</h3>\n\n<p>From those summer days of 1998 on, Danielle&rsquo;s been instrumental in expanding absolutely every single aspect of the salon&rsquo;s features to its best:</p>\n\n<ul>\n\t<li>The number of skin care &amp; SPA relaxation services has been drastically expanded</li>\n\t<li>The team extended to include 12 more skin care professionals, all sincerely passionate about providing the ultimate SPA experience</li>\n</ul>\n\n<h3>Professional Life</h3>\n\n<p>..and so much more!</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(12, 49, 2, ' Beauty Specialist', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(13, 50, 2, '<p>A Juneau, Alaska native, Mrs. Applebaum has come a long way since her high school graduation all the way up to getting a Brown University Master&rsquo;s degree in Economics. Talented with the digits, she&rsquo;s no less successful when it comes to managing the human resources of the company.</p>\n\n<h3>Biography</h3>\n\n<p>From those summer days of 1998 on, Mary&rsquo;s been instrumental in expanding absolutely every single aspect of the salon&rsquo;s features to its best:</p>\n\n<ul>\n\t<li>The number of skin care &amp; SPA relaxation services has been drastically expanded</li>\n\t<li>The team extended to include 12 more skin care professionals, all sincerely passionate about providing the ultimate SPA experience</li>\n</ul>\n\n<h3>Professional Life</h3>\n\n<p>..and so much more!</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(14, 51, 2, ' Beauty Specialist', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(15, 52, 2, '<p>Born in New York City, Elisa always felt a strong urge for being an ambitious overachiever. Eventually, by the age of 25 she already had received her first Wall Street executive position, making her one of the youngest managers in the company. With her overall work experience spanning&hellip;</p>\n\n<h3>Biography</h3>\n\n<p>From those summer days of 1998 on, Elisa&rsquo;s been instrumental in expanding absolutely every single aspect of the salon&rsquo;s features to its best:</p>\n\n<ul>\n\t<li>The number of skin care &amp; SPA relaxation services has been drastically expanded</li>\n\t<li>The team extended to include 12 more skin care professionals, all sincerely passionate about providing the ultimate SPA experience</li>\n</ul>\n\n<h3>Professional Life</h3>\n\n<p>..and so much more!</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(16, 53, 2, '<p>Before setting up her own salon, Mary&rsquo;s been working at a prestigious SPA venue in North Carolina&hellip;<br />\nThere she was able to save a sufficient amount of a principal capital in order to set up her very own SPA &amp; skin care salon.</p>\n\n<h3>Biography</h3>\n\n<p>From those summer days of 1998 on, Mary&rsquo;s been instrumental in expanding absolutely every single aspect of the salon&rsquo;s features to its best:</p>\n\n<ul>\n\t<li>The number of skin care &amp; SPA relaxation services has been drastically expanded</li>\n\t<li>The team extended to include 12 more skin care professionals, all sincerely passionate about providing the ultimate SPA experience</li>\n</ul>\n\n<h3>Professional Life</h3>\n\n<p>..and so much more!</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(17, 54, 2, 'Postal address:400 Madison str., Alexandria, VA, United States', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(18, 55, 2, '1-555-325-4632', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(19, 56, 2, '1-555-329-9632', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(20, 57, 2, 'maryfruition@demolink.org', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(21, 58, 2, '<p>The reason why Stacy is so natural with everything regarding skin&rsquo;s health and skin care treatments may have to do with her prior medical degree&hellip;<br />\nFor a few years following her med school graduation she&rsquo;s been soul searching for a perfect job field, and thankfully she found one!</p>\n\n<h3>Biography</h3>\n\n<p>From those summer days of 1998 on, Stacy&rsquo;s been instrumental in expanding absolutely every single aspect of the salon&rsquo;s features to its best:</p>\n\n<ul>\n\t<li>The number of skin care &amp; SPA relaxation services has been drastically expanded</li>\n\t<li>The team extended to include 12 more skin care professionals, all sincerely passionate about providing the ultimate SPA experience</li>\n</ul>\n\n<h3>Professional Life</h3>\n\n<p>..and so much more!</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(22, 59, 2, 'Postal address:400 Madison str., Alexandria, VA, United States', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(23, 60, 2, '1-555-325-4632', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(24, 61, 2, '1-555-329-9632', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(25, 62, 2, 'stacyblunt@demolink.org', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(26, 63, 2, 'https://www.facebook.com', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(27, 64, 2, 'https://twitter.com', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(28, 65, 2, 'https://plus.google.com', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(29, 66, 2, 'https://www.instagram.com', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(30, 67, 2, 'https://www.facebook.com', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(31, 68, 2, 'https://twitter.com/', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(32, 69, 2, 'https://plus.google.com/', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(33, 70, 2, 'https://www.instagram.com/', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(34, 71, 2, '<p>Emily&rsquo;s career as a SPA care specialist has spanned to include work at numerous prestigious salons across the US&hellip;But after moving with her family from the state of New York to Orlando, Florida, Emily have made a fortunate decision to become a part of our salon&rsquo;s team!</p>\n\n<h3>Biography</h3>\n\n<p>From those summer days of 1998 on, Emily&rsquo;s been instrumental in expanding absolutely every single aspect of the salon&rsquo;s features to its best:</p>\n\n<ul>\n\t<li>The number of skin care &amp; SPA relaxation services has been drastically expanded</li>\n\t<li>The team extended to include 12 more skin care professionals, all sincerely passionate about providing the ultimate SPA experience</li>\n</ul>\n\n<h3>Professional Life</h3>\n\n<p>..and so much more!</p>\n', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(35, 72, 2, 'Postal address:400 Madison str., Alexandria, VA, United States', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(36, 73, 2, '1-555-325-4632', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(37, 74, 2, NULL, '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(38, 75, 2, 'emilynichols@demolink.org', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(39, 76, 2, 'https://www.facebook.com', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(40, 77, 2, 'https://twitter.com/', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(41, 78, 2, NULL, '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(42, 79, 2, 'https://www.instagram.com/', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(43, 80, 2, 'Postal address:400 Madison str., Alexandria, VA, United States', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(44, 81, 2, '1-555-325-4632', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(45, 82, 2, NULL, '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(46, 83, 2, 'daniellejones@demolink.org', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(47, 84, 2, 'https://www.facebook.com', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(48, 85, 2, 'https://twitter.com/', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(49, 86, 2, 'https://plus.google.com/', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(50, 87, 2, 'https://www.instagram.com/', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(51, 88, 2, 'Postal address:400 Madison str., Alexandria, VA, United States', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(52, 89, 2, '1-555-325-4632', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(53, 90, 2, NULL, '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(54, 91, 2, 'maryapplebaum@demolink.org', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(55, 92, 2, 'https://www.facebook.com', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(56, 93, 2, NULL, '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(57, 94, 2, 'https://plus.google.com/', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(58, 95, 2, 'https://www.instagram.com/', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(59, 96, 2, 'Postal address:400 Madison str., Alexandria, VA, United States', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(60, 97, 2, '1-555-325-4632', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(61, 98, 2, NULL, '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(62, 99, 2, 'elisahansolo@demolink.orge', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(63, 100, 2, 'https://www.facebook.com', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(64, 101, 2, 'https://twitter.com/', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(65, 102, 2, 'https://plus.google.com/', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(66, 103, 2, 'https://www.instagram.com/', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(67, 104, 2, 'LET US OFFER YOU', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(68, 105, 2, 'THE BEST', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(69, 106, 2, 'BEAUTY SERVICES', '0000-00-00 00:00:00', '2019-01-10 17:47:37'),
(70, 107, 2, '24/7, we’ll be working to make your facial and body skin healthy and you satisfied and all relaxed!', '0000-00-00 00:00:00', '2019-01-10 17:47:37');

-- 
-- Вывод данных для таблицы app_section_groups_image_translate
--

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;