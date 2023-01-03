<?php

namespace Twig_Extensions;

class Debug_Twig_Extension extends \Twig_Extension
{
    protected $placefolders;

    public function getFunctions()
    {
        return array(
            new \Twig_SimpleFunction('dump', 'dump'),
            new \Twig_SimpleFunction('log', 'consoleLog'),
        );
    }

    public function getName()
    {
        return 'SEdit_Debug';
    }
}