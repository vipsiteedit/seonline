<?php

function dump($what, $exit = false, $color = '')
{
    echo "<pre style='color:{$color}'>";
    print_r($what);
    echo '</pre>';

    if ($exit) {
        exit;
    }
}

function d($data, $exit = false)
{
    var_dump($data);
    if ($exit) {
        exit;
    }
}

function consoleLog($arg)
{
    $vars = array();

    $numargs = func_num_args();
    $arg_list = func_get_args();

    for ($i = 0; $i < $numargs; $i++) {
        $var = $arg_list[$i];

        if (is_array($var)) {
            $var = json_encode($var);
        }
        elseif (is_bool($var)) {
            $var = $var ? 'true' : 'false';
        }
        elseif (is_numeric($var)) {

        }
        else {
            $var = '"' . $var . '"';
        }
        $vars[] = $var;
    }

    echo '<script>console.log(' . join(',', $vars) . ')</script>';
}