<?php

namespace SE\CMS;

use SE\DB as DB;
use SE\Exception;

class Design extends Base
{

    public function Info()
    {
        $this->initPath();
        if (empty($this->input['name'])) 
		{
			$tpages = new Pages($this->input);
			$pages = $tpages->fetch();
			foreach($pages as $pg) {
				$this->input['name'] = $pg['name'];
				if ($pg['pattern'] == '/') {	
					break;
				}	
			}	
		}
        if ($name = $this->getPatternName($this->input['name'])) {
            $file = $this->pathTemplates . $name . '.html';
            $this->result['url'] = "http://" . HOSTNAME . $name;
            $this->result['status'] = 'success';
            $this->result['pages'] = $this->getPages();
			$this->result['base'] = 'http://' . HOSTNAME . '/www/' . $this->apps . '/';
        } else {
            $this->result['status'] = 'error';
        }
    }

    public function Save()
    {
        try {
			$this->initPath();

        } catch (Exception $e) {
            $this->result['status'] = 'error';
            $this->error = "Не удаётся сохранить шаблон!";
            throw new Exception($this->error);
        }
    }

    private function getPatternName($pageName)
    {
        $u = new DB('app_pages', 'ap');
        $u->select('au.pattern');
        $u->innerJoin('app_urls au', 'ap.id=au.id_page');
        $u->where("name='?'", $pageName);
        $result = $u->fetchOne();
        return $result['pattern'];
    }

    private function getPages()
    {
        $u = new DB('app_pages', 'ap');
        $u->select('distinct ap.name, ap.title');
        $u->innerJoin('app_urls au', 'au.id_page=ap.id');
        $u->where('au.id_app=?', $this->appsId);
        return $u->getList();
    }
}