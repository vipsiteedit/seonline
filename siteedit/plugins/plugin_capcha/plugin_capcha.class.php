<?php

require_once __DIR__ . '/../curlAbstract.class.php';

class plugin_capcha extends CurlAbstract
{
    private $key;
    private $keySite;
    private $error;

    public function __construct($keySite = false, $key = false)
    {
        $setting = Setting::getInstance();
        $this->keySite = ($keySite) ? $keySite : $setting->recaptcha_google_key;
        $this->key = ($key) ? $key : $setting->recaptcha_google_secret;

        if ($this->keySite && $this->key) {
            echo '<script src="//www.google.com/recaptcha/api.js"></script>';
        }

        $this->error = '';
    }

    public function getCapcha($title = '', $error = '')
    {
        if (!$this->keySite) return;
        if (!$title)
            $title = 'Введите цифры с картинки';

        if (!$error)
            $error = 'Не верно введено число с картинки';

        return '<div class="g-recaptcha" data-sitekey="' . $this->keySite . '"></div>';
    }

    private function detect_ip()
    {
        $ip = false;
        if (isset($_SERVER["HTTP_X_FORWARDED_FOR"]) and preg_match("#^[0-9.]+$#", $_SERVER["HTTP_X_FORWARDED_FOR"]))
            $ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
        elseif (isset($_SERVER["HTTP_X_REAL_IP"]) and preg_match("#^[0-9.]+$#", $_SERVER["HTTP_X_REAL_IP"]))
            $ip = $_SERVER["HTTP_X_REAL_IP"];
        elseif (preg_match("#^[0-9.]+$#", $_SERVER["REMOTE_ADDR"]))
            $ip = $_SERVER["REMOTE_ADDR"];
        return $ip;
    }

    public function getError()
    {
        return $this->error;
    }

    public function check()
    {
        if (!isset($_REQUEST['g-recaptcha-response'])) {
            return false;
        } else {
            $data = array(
                'secret' => $this->key,
                'response' => $_REQUEST['g-recaptcha-response'],
                'remoteip' => $this->detect_ip(),
            );

            $result = $this->queryJSON('https://www.google.com/recaptcha/api/siteverify', $data, 'POST');
            return $result["success"];
        }
    }
}