<?php

class App
{
    static $appname;
    static $engine;
    static $vars = array();

    public function __construct()
    {
        App::$appname = null;
    }

    public static function set($new_appname = null)
    {
        App::$appname = $new_appname;
    }
	
	public static function update($name, $value)
    {
        if (isset(App::$appname[$name])) {
			App::$appname[$name] = $value;
		}
    }

    public static function get()
    {
        return App::$appname;
    }

    public static function setEngine(SEditEngine $engine)
    {
        App::$engine = $engine;
    }

    public static function getEngine()
    {
        return App::$engine;
    }
}
