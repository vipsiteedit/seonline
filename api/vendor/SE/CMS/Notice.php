<?php

namespace SE\CMS;

use SE\DB as DB;
use SE\Exception as Exception;

class Notice extends Base
{
    protected $tableName = "se_notice";

    public function getAddInfo()
    {
        return array ("triggers" => $this->getTriggers());
    }

    protected function correctValuesBeforeSave()
    {
        if (isset($this->input["idTrigger"]) && empty($this->input["idTrigger"]))
            $this->input["idTrigger"] = null;
    }

    protected function saveAddInfo()
    {
        return $this->saveTriggers();
    }

    private function getTriggers()
    {
        $result = [];
        $triggers = (new Trigger())->fetch();
        $u = new DB("se_notice_trigger");
        $u->select("id_trigger");
        $u->where("id_notice = ?", $this->input["id"]);
        $items = $u->getList();
        foreach ($triggers as $trigger) {
            $isChecked = false;
            foreach ($items as $item)
                if ($isChecked = ($trigger["id"] == $item["idTrigger"]))
                    break;
            $trigger["isChecked"] = $isChecked;
            $result[] = $trigger;
        }
        return $result;
    }

    private function saveTriggers()
    {
        $triggers = $this->input["triggers"];
        $triggersNew = [];
        foreach ($triggers as $trigger)
            if ($trigger["isChecked"])
                $triggersNew[] = $trigger;
        try {
            foreach ($this->input["ids"] as $id)
                DB::saveManyToMany($id, $triggersNew,
                    array("table" => "se_notice_trigger", "key" => "id_notice", "link" => "id_trigger"));
            return true;
        } catch (Exception $e) {
            $this->error = "Не удаётся сохранить триггеры уведомления!";
            throw new Exception($this->error);
        }
    }
}