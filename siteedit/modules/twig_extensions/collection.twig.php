<?php

namespace Twig_Extensions;

class Collection_Twig_Extension extends \Twig_Extension
{

    public function getFunctions()
    {

        return array(
            new \Twig_SimpleFunction('collection', array($this, 'getCollection'), array('deprecated'=>false)),
            new \Twig_SimpleFunction('getPagination', array($this, 'getPagination'), array('deprecated'=>false)),
            new \Twig_SimpleFunction('renderPagination', array($this, 'renderPagination'), array('deprecated'=>false)),
            new \Twig_SimpleFunction('getBreadcrumbs', array($this, 'getBreadcrumbs'), array('deprecated'=>false)),
            new \Twig_SimpleFunction('collectionImages', array($this, 'getCollectionImages'), array('deprecated'=>false)),
            new \Twig_SimpleFunction('collectionFields', array($this, 'getCollectionFields'), array('deprecated'=>false)),
        );
    }

    public function getName()
    {
        return 'SEdit_Collection';
    }

    public function getCollection($ids = array(), $isValues = true)
    {
        $sect = new \Section('');
        return $sect->getCollectionItems($ids, $isValues);
    }

    public function getPagination($args = array())
    {
        $app = \App::get();

        return $app['pagination'];
    }

    public function renderPagination($template = null, $args = array())
    {
        if (!$template || !file_exists(TEMPLATES_DIR . '/' . ACTIVE_APP . '/' . $template . '.html')) {
            return '';
        }

        $loader = new \Twig_Loader_Filesystem(TEMPLATES_DIR);

        // Extend path
        $loader->addPath(TEMPLATES_DIR . '/' . ACTIVE_APP);

        $twig = new \Twig_Environment($loader, array(
            //'cache' => TWIG_CACHE_DIR,
            'autoescape' => false,
            'debug' => true
        ));

        // Connect Twig Extensions
        $extensions = glob(TWIG_EXTENSIONS_DIR . '/*.twig.php');
        foreach ($extensions as $extension) {
            require_once $extension;
            $ext_class_name = '\\Twig_Extensions\\' . ucfirst(strtolower(str_replace('.twig.php', '', basename($extension)))) . '_Twig_Extension';
            $twig->addExtension(new $ext_class_name());
        }
        render_extend_vars($vars);

        $template = $twig->loadTemplate($template . '.html');

        $render = $template->render(\App::get());

        return $render;
    }

    public function getBreadcrumbs($args = array())
    {
        $pagination = array();

        $sub = array(
            array('name' => 'Главная', 'link' => '/'),
            array('name' => 'Новости', 'link' => '/news/', 'active' => true),
        );

        $pagination = array(
            array('name' => 'Главная', 'link' => '/', 'active' => false),
            array('name' => 'Страница 1', 'link' => '/', 'active' => false),
            array('name' => 'Новости', 'link' => true, 'active' => true, 'list' => $sub),
        );

        return $pagination;
    }
    
    public function getCollectionImages($idCollection, $param = array())
    {
        $sect = new \Section('');
        $images = $sect->getCollectionImages($idCollection, $param);
        return $images['items'];
    }
    
    public function getCollectionFields($idCollection, $param = array())
    {
        $sect = new \Section('');
        $fields = $sect->GetCollectionValues($idCollection, $param);
        return $fields['items'];
    }
}