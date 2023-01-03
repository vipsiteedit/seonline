<?php
error_reporting(E_PARSE | E_ERROR);
ini_set('display_errors', 1);
session_start();
define('BASE_DIR', $_SERVER['DOCUMENT_ROOT']);
define ('FRAME_WORK_DIR', BASE_DIR . '/siteedit');
require FRAME_WORK_DIR . '/loader.php';
strpos('', '');
