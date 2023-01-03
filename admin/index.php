<?php
error_reporting(0);
$config = require $_SERVER['DOCUMENT_ROOT'] .'/apps/config/config.php';


if (empty($config['host'])) {
    $config['host'] = $_SERVER['REQUEST_SCHEME'] . '://' . $_SERVER['HTTP_HOST'];
}

if (empty($config['lang'])) {
    $config['lang'] = 'ru';
}
$dev = '';
if (isset($_GET['dev'])) {
    $dev = '/dev';
}
?>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>CMS SiteEdit 6.0 - <?php echo $_SERVER['HTTP_HOST'] ?></title>
        <link rel="shortcut icon" href="/admin/favicon.ico" type="image/x-icon">
    </head>
    <body style="margin:0;">
        <iframe src="http://cms.siteedit.ru<?php echo $dev ?>/?host=<?php echo $config['host'] ?>&serial=<?php echo $config['serial'] ?>&lang=<?php echo $config['lang'] ?>" frameborder="0" style="width:100%; height:100%; position:absolute;"></iframe>
    </body>
</html>