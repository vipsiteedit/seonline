<?php

namespace SE\CMS;

use SE\DB as DB;
use SE\Exception;

class Editor extends Base
{
    public function Info($id = NULL)
    {
        $this->initPath();
        if (empty($this->input['name'])) {
            $tpages = new Pages($this->input);
            $pages = $tpages->fetch();
            foreach ($pages as $pg) {
                $this->input['name'] = $pg['name'];
                if ($pg['pattern'] == '/') {
                    break;
                }
            }
        }

        if ($name = $this->getTplName($this->input['name'])) {
            $file = $this->pathTemplates . $name . '.html';
            if (file_exists($file)) {
                $this->result['content'] = $this->parser(file_get_contents($file));
                $this->result['status'] = 'success';
                $this->result['pages'] = $this->getPages();
                $this->result['base'] = $this->getBaseUrl();
            } else {
                $this->result['status'] = 'error';
            }
        } else {
            $this->result['status'] = 'error';
        }

    }

    public function Save()
    {
        try {
            $this->initPath();
            if (!isset($this->input['content']) || empty($this->input['name'])) return;
            if ($name = $this->getTplName($this->input['name'])) {
                $content = str_replace('</_cript', '</script', trim(base64_decode(str_replace('_', 'a', $this->input['content']))));
                $content = str_replace('<_cript', '<script', $content);
                $content = str_replace('<!--~~?', '<?', $content);
                $content = str_replace('?~~-->', '?>', $content);
                $this->saveTpl($name . '.html', $this->decoder($content));
                $this->result['status'] = 'success';
            } else {
                $this->result['status'] = 'error';
            }
        } catch (Exception $e) {
            $this->result['status'] = 'error';
            $this->error = "Не удаётся сохранить шаблон!";
            throw new Exception($this->error);
        }
    }

    private function decoder($content)
    {
        $content = preg_replace("/<base [^>]+>/", '<base href="{{ base }}">', $content);
        $content = preg_replace_callback('/<!--%%M:([^%]+)%%-->(.*)<!--%%\/M:\\1%%-->/si', function ($m) {
            if ($m[1] && $m[2]) {
                $text = $this->decoder($m[2]);
                $this->saveModule($m[1], $this->decoder($m[2]));
            }
            return '{{ module(\'' . $m[1] . '\') }}';
        }, $content);
        return preg_replace_callback('/<!--%%I:([^%]+)%%-->(.*)<!--%%\/I:\\1%%-->/si', function ($m) {
            if ($m[1] && $m[2]) {
                $text = $this->decoder($m[2]);
                $this->saveTpl($m[1], $this->decoder($m[2]));
            }
            return '{% include \'' . $m[1] . '\' %}';
        }, $content);
    }

    private function saveTpl($file, $content)
    {
        if (!is_dir($this->pathTemplates . 'backup')) mkdir($this->pathTemplates . 'backup');
        if (hash('md5', $content) !== hash_file('md5', $this->pathTemplates . $file)) {
            if (file_exists($this->pathTemplates . $file)) {
                rename($this->pathTemplates . $file, $this->pathTemplates . 'backup/' . $file . '~' . date('YmdHis'));
            }
            file_put_contents($this->pathTemplates . $file, $content);
        }
    }

    private function saveModule($file, $content)
    {
    }

    private function getBaseUrl()
    {
        return 'http://' . HOSTNAME . '/www/' . $this->apps . '/';
    }

    public function parser($content)
    {
        $base = $this->getBaseUrl();
        $content = preg_replace_callback('/<head>(.*)<\/head>/si', function ($m) {
            if (strpos($m[1], '<base ') === false) {
                return "<head>\r\n" . '<base href="{{ base }}">' . "\r\n" . trim($m[1]) . "\r\n" . '</head>';
            } else {
                return $m[0];
            }
        }, $content);

        //{% include 'nav.html' ignore missing with {'menu': nav('top', {'isTree':true})} only %}


        $content = str_replace(array('<script', '</script', '{{ base }}', '<?', '?>'), array('<_cript', '</_cript', $base, '<!--~~?', '?~~-->'),

            $this->getModule(preg_replace_callback('#\{% include [\']([^\']+)[\']([^\%]+)?%\}#', function ($m) {
                if (!trim($m[2])) {
                    $file = $this->pathTemplates . $m[1];
                    //return '<!--%%I:' . $m[1] . '%%-->' . file_get_contents($file) . '<!--%%/I:' . $m[1] . '%%-->';
                    return '<!--%%I:' . $m[1] . '%%-->' . self::parser(file_get_contents($file)) . '<!--%%/I:' . $m[1] . '%%-->';
                } else
                    return $m[0];
            }, $content)));
        return $content;

    }


    private function getModule($content)
    {
        if (preg_match('#\{\{ module\([\']([^\']+)[\'](.*?)\)[\s]?\}\}#', $content)) {
            return preg_replace_callback('#\{\{ module\([\']([^\']+)[\'](.*?)\)[\s]?\}\}#', function ($m) {
                $sectionAlias = false;
                $arguments = array();
                //' . render_module($m[1], $sectionAlias, $arguments) . '
                return '<!--%%M:' . $m[1] . '%%-->' . render_module($m[1], $sectionAlias, $arguments) . '<!--%%/M:' . $m[1] . '%%-->';
            }, $content);
        } else {
            return $content;
        }
    }

    private function getTplName($pageName)
    {
        $u = new DB('app_pages');
        $u->select('template');
        $u->where("name='?'", $pageName);
        $result = $u->fetchOne();
        return $result['template'];
    }

    private function getPages()
    {
        $u = new DB('app_pages', 'ap');
        $u->select('distinct ap.name, ap.title');
        $u->innerJoin('app_urls au', 'au.id_page=ap.id');
        $u->where('au.id_app=?', $this->input['seIdApp']);
        return $u->getList();
    }
}