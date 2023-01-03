<?php

namespace SE\CMS;

use SE\DB as DB;

class Units extends Base
{
    private $root = DOCUMENT_ROOT;
    /**
     * Скпировать шаблоны страниц из основной папки в песочницы
     *
     * Осн. папка $this->projectFolder
     * Песочница $this->pathEdit
     */
    function __construct($input)
    {
        parent::__construct($input);
        $this->updateEdit();
    }

    public function fetch()
    {
        $units = $this->getFiles($this->pathUnits);
        $u = new DB('app_units');
        $u->select('id, typename, name, description');
        $items = $u->getList();
        $this->addUnits($items);
        $this->result['items'] = $items;
    }

    private function addUnits(&$items)
    {
        $units = $this->getFiles($this->pathUnits);
        $newUnits = array();
        foreach($units as $unit) {
            $isFind = false;
            foreach($items as $item) {
                if ($unit['id'] == $item['typename']) {
                    $isFind = true;
                    break;
                }
            }
            if (!$isFind) {
                $data = array('typename'=>$unit['id'], 'name'=>$unit['name'], 'description'=>$unit['description']);
                $u = new DB('app_units');
                $u->setValuesFields($data);
                $data['id'] = $u->save();
                if ($data['id'] ) {
                    $values = array();
                    foreach ($unit['values'] as $val){
                        $values[] = array('id_unit'=>$data['id'], 'name'=>$val['name'], 'type'=>$val['type'], 'defvalue'=>$val['default']);
                    }
                    if (count($values)) {
                        DB::insertList('app_values', $values);
                    }

                    $items[] = $data;
                }
            }
        }
    }

    public function save()
    {
        $filename = $this->input['name'] . '.html';
        $filesource = $this->input['source'];
        $fileFullPath = $this->pathTemplates . $filename;

        $time = filemtime($fileFullPath);
        $f = fopen($fileFullPath, 'w');
        fwrite($f, $filesource);
        fclose($f);
        if (filemtime($fileFullPath) >= $time) {
            $this->result['status'] = 'OK';
        } else {
            $this->error = 'Ошибка при сохранении файла';
        }
    }

    public function delete()
    {
        //$filename = $this->input['name'];
        if (!empty($this->input['id'])) {
            $File = $this->input['id'];
            if (file_exists($this->pathTemplates . $File. '.html'))
                rename($this->pathTemplates . $File. '.html', $this->pathTemplates . $File . '.del');
            $this->result['status'] = 'ok';
            return true;
        }
        $this->error = 'Не удается удалить файл';
    }

    public function info()
    {
        $filename = $this->input['name'];
        $this->result['source'] = file_get_contents($this->pathTemplates . $filename . '.html');
    }

    /**
     * getFiles - получение файлов '.TWIG' из заданной директории со вспомогательными данными
     *
     * @param string $dir Директория
     */
    private function getFiles($dir)
    {
        $files = glob($dir . '*.unit');
        $result = array();
        foreach ($files as $file) {
            if (file_exists($file . '/message.txt')) {
                $ini_array = parse_ini_file($file . '/message.txt');
            }
            if (file_exists($file . '/values.ini')) {
                $values_array = parse_ini_file($file . '/values.ini', true);
            }
            $result[] = array(
                'id' => basename($file, '.unit'),
                'name' => (!empty($ini_array['name'])) ? $ini_array['name'] : basename($file, '.unit'),
                'description' => $ini_array['description'],
                'values'=> $values_array
            );
        }
        return $result;
    }

    private function updateEdit()
    {
        $originalFiles = $this->getFiles($this->pathTemplates);
        foreach ($originalFiles as $originalFile) {
            if (
                !file_exists($this->pathTemplates . $originalFile['fullname'])
                or
                ($originalFile['timestamp'] >= filemtime($this->pathTemplates . $originalFile['fullname']))
            ) {
                if (!file_exists($this->pathTemplates . $originalFile['fullname'] . '.del')) {
                    !copy($originalFile['path'], $this->pathTemplates . $originalFile['fullname']);
                }
            }
        }
    }
}