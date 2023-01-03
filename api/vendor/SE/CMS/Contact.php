<?php

namespace SE\CMS;

use SE\DB as DB;
use SE\Exception;

class Contact extends Base
{
    protected $tableName = "se_user";

    protected function getSettingsFetch()
    {
        return array(
            "select" => 'su.*, su.created_at regDate, su.person_name display_name, 
                GROUP_CONCAT(ap.name) permissions',
            "joins" => array(
                array(
                    "type" => "left",
                    "table" => "se_user_permission sug",
                    "condition" => "su.id = sug.id_user"
                ),
                array(
                    "type" => "left",
                    "table" => "app_permission ap",
                    "condition" => "ap.id = sug.id_permission"
                ),
            ),
            "patterns" => array("displayName" => "su.person_name")
        );
    }

    private function getCustomFields($idContact)
    {
        $u = new DB('se_userfields', 'su');
        $u->select("cu.id, cu.id_user, cu.value, su.id id_userfield, 
                    su.name, su.required, su.enabled, su.type, su.placeholder, su.description, su.values, sug.id id_group, sug.name name_group");
        $u->leftJoin('se_user_values cu', "cu.id_userfield = su.id AND cu.id_user = {$idContact}");
        $u->leftJoin('se_userfields_group sug', 'su.id_group = sug.id');
        $u->groupBy('su.id');
        $u->orderBy('sug.sort');
        $u->addOrderBy('su.sort');
        $result = $u->getList();

        $groups = array();
        foreach ($result as $item) {
            $key = (int)$item["idGroup"];
            $group = key_exists($key, $groups) ? $groups[$key] : array();
            $group["id"] = $item["idGroup"];
            $group["name"] = empty($item["nameGroup"]) ? "Без категории" : $item["nameGroup"];
            if ($item['type'] == "date")
                $item['value'] = date('Y-m-d', strtotime($item['value']));
            if (!key_exists($key, $groups))
                $groups[$key] = $group;
            $groups[$key]["items"][] = $item;
        }
        return array_values($groups);
    }

    private function getCompany($comanyIds)
    {

    }

    public function info($id = false)
    {
        $id = empty($id) ? $this->input["id"] : $id;
        try {
            //$contact = parent::info($id);
            $u = new DB('se_user', 'su');
            $u->select('su.*');
            //$u->leftJoin('user_urid uu', 'uu.id=su.id');
            $contact = $u->getInfo($id);
            $contact['permissions'] = $this->getPermission($contact['id']);
            $contact['imageFile'] = $contact['photo'];
            //$contact['groups'] = $this->getGroups($contact['id']);
            //$contact['companyRequisites'] = $this->getCompanyRequisites($contact['id']);
            //$contact['personalAccount'] = $this->getPersonalAccount($contact['id']);
            //$contact['accountOperations'] = (new BankAccountTypeOperation())->fetch();
            $contact["customFields"] = $this->getCustomFields($contact["id"]);
            //if ($count = count($contact['personalAccount']))
            //    $contact['balance'] = $contact['personalAccount'][$count - 1]['balance'];
            $this->result = $contact;
        } catch (Exception $e) {
            $this->error = "Не удаётся получить информацию о контакте!";
        }

        return $this->result;
    }

    public function delete()
    {
        $emails = array();
        $u = new DB('se_user', 'su');
        $u->select('su.id, su.email, su.is_super_admin');
        $u->where('su.id IN (?)', implode(",", $this->input["ids"]));
        $ido = $u->getList();
        $delIds = array();
        foreach($ido as $del) {
            if ($del["email"])
                $emails[] = $del["email"];
        }
        foreach($this->input["ids"] as $i=>$id){
            foreach($ido as $del) {
                if ($id ==  $del['id'] && $del['cnt'] > 0){
                        unset($this->input["ids"][$i]);
                        $delIds[] = $del['id'];
                }
                
                if ($id ==  $del['id'] && $del['isSuperAdmin']) {
                    unset($this->input["ids"][$i]);
                }

            }
        }

        if (!empty($delIds)) {
            $delIds = implode(',', $delIds);
            $this->error = "Нельзя удалить контакты c ID ({$delIds}), которые содержат заказы!";
            return new Exception($this->error);
        }
        DB::beginTransaction();
        if (parent::delete()) {
            /*
            if (!empty($emails))
                foreach($emails as $email) {
                    try {
                        (new EmailProvider())->removeEmailFromAllBooks($email);
                    } catch (Exception $e) {

                    }
                }
            */
            DB::commit();
            return true;
        }
        DB::rollBack();
        return false;
    }

    private function getPersonalAccount($id)
    {
        $u = new DB('se_user_account');
        $u->where('user_id = ?', $id);
        $u->orderBy("date_payee");
        $result = $u->getList();
        $account = array();
        $balance = 0;
        foreach ($result as $item) {
            $balance += ($item['inPayee'] - $item['outPayee']);
            $item['balance'] = $balance;
            $account[] = $item;
        }
        return $account;
    }

    private function getCompanyRequisites($id)
    {
        $u = new DB('user_rekv_type', 'urt');
        $u->select('ur.id, ur.value, urt.code rekv_code, urt.size, urt.title');
        $u->leftJoin('user_rekv ur', "ur.rekv_code = urt.code AND ur.id_author = {$id}");
        $u->groupBy('urt.code');
        $u->orderBy('urt.id');
        return $u->getList();
    }

    private function getPermission($id)
    {
        $u = new DB('se_user_permission', 'sup');
        $u->select('ap.id, ap.name');
        $u->innerJoin('app_permission ap', 'sup.id_permission=ap.id');
        $u->where('sup.id_user = ?', $id);
        return $u->getList();

    }

    private function getGroups($id)
    {
        $u = new DB('se_group', 'sg');
        $u->select('sg.id, sg.name');
        $u->innerjoin('se_user_group sug', 'sg.id = sug.id_group');
        $u->where('sug.id_user = ?', $id);
        return $u->getList();
    }


    private function getUserName($lastName, $userName, $id = 0)
    {
        if (empty($userName))
            $userName = strtolower(rus2translit($lastName));
        $username_n = $userName;

        $u = new DB('se_user', 'su');
        $i = 2;
        while ($i < 1000) {
            if ($id)
                $result = $u->findList("su.username='$username_n' AND id <> $id")->fetchOne();
            else $result = $u->findList("su.username='$username_n'")->fetchOne();
            if ($result["id"])
                $username_n = $userName . $i;
            else return $username_n;
            $i++;
        }
        return uniqid();
    }

    private function saveGroups($groups, $idsContact, $addGroup = false)
    {
        try {
            $newIdsGroups = array();
            foreach ($groups as $group)
                $newIdsGroups[] = $group["id"];
            $idsGroupsS = implode(",", $newIdsGroups);
            $idsContactsS = implode(",", $idsContact);

            if (!$addGroup) {
                $u = new DB('se_user_group', 'sug');
                $u->select("id, group_id, user_id");
                if ($newIdsGroups)
                    $u->where("NOT group_id IN ($idsGroupsS) AND user_id IN ($idsContactsS)");
                else
                    $u->where("user_id IN ($idsContactsS)");
                $groupsDel = $u->getList();

                $idsGroupsDelEmail = array();
                foreach ($groupsDel as $group)
                    $idsGroupsDelEmail[$group["userId"]][] = $group["groupId"];
                $u->deleteList();

                //writeLog($idsGroupsDelEmail);
                foreach($idsGroupsDelEmail as $userId =>$gr) {
                    if (!empty($gr) && $userId) {
                       // $this->addInAddressBookEmail(array($userId), false, $gr);
                    }
                }
            }

            $u = new DB('se_user_group', 'sug');
            $u->select("group_id, user_id");
            $u->where("user_id IN ($idsContactsS)");
            $objects = $u->getList();

            $idsExists = array();
            //$idsGroupsNewEmail = array();
            foreach ($objects as $object) {
                $idsExists[$object["userId"]][] = $object["groupId"];
            }
            //writeLog($idsExists);
            //$idsExists[] = $object["groupId"];
            if (!empty($newIdsGroups)) {
                $data = array();
                foreach ($newIdsGroups as $id) {
                    $idsContactsNewEmail = array();
                    if (!empty($id)) {
                        foreach ($idsContact as $idContact) {
                            if (!in_array($id, $idsExists[$idContact])) {
                                $data[] = array('user_id' => $idContact, 'group_id' => $id);
                                $idsContactsNewEmail[] = $idContact;
                            }
                        }
                    }
                   // if (!empty($idsContactsNewEmail))
                   //     $this->addInAddressBookEmail($idsContactsNewEmail, array($id), array());
                }
                //writeLog($data);
                if (!empty($data)) {
                    DB::insertList('se_user_group', $data);
                }

            }

        } catch (Exception $e) {
            $this->error = "Не удаётся сохранить группы контакта!";
            throw new Exception($this->error);
        }
    }

    private function saveCompanyRequisites($id, $input)
    {
        try {
            foreach ($input["companyRequisites"] as $requisite) {
                $u = new DB("user_rekv");
                $requisite["idAuthor"] = $id;
                $u->setValuesFields($requisite);
                $u->save();
            }
        } catch (Exception $e) {
            $this->error = "Не удаётся сохранить реквизиты компании!";
            throw new Exception($this->error);
        }
    }

    private function savePersonalAccounts($id, $accounts)
    {
        try {
            $idsUpdate = null;
            foreach ($accounts as $account)
                if ($account["id"]) {
                    if (!empty($idsUpdate))
                        $idsUpdate .= ',';
                    $idsUpdate .= $account["id"];
                }

            $u = new DB('se_user_account', 'sua');
            if (!empty($idsUpdate))
                $u->where("NOT id IN ($idsUpdate) AND user_id = ?", $id)->deleteList();
            else $u->where("user_id = ?", $id)->deleteList();

            foreach ($accounts as $account) {
                $u = new DB('se_user_account');
                $account["userId"] = $id;
                $u->setValuesFields($account);
                $u->save();
            }
        } catch (Exception $e) {
            $this->error = "Не удаётся сохранить лицевой счёт контакта!";
            throw new Exception($this->error);
        }
    }

    private function setUserGroup($idUser)
    {
        try {
            $u = new DB('se_group', 'sg');
            $u->select("id");
            $u->where("title = 'User'");
            $result = $u->fetchOne();
            $idGroup = $result["id"];
            if (!$idGroup) {
                $u = new DB('se_group', 'sg');
                $data["title"] = "User";
                $data["level"] = 1;
                $u->setValuesFields($data);
                $idGroup = $u->save();
            }

            $u = new DB('se_user_group', 'sug');
            $u->select("id");
            $u->where("sug.group_id = {$idGroup} AND sug.user_id = {$idUser}");
            $result = $u->fetchOne();
            $id = $result["id"];
            if (!$id) {
                $u = new DB('se_user_group', 'sug');
                $data["groupId"] = $idGroup;
                $data["userId"] = $idUser;
                $u->setValuesFields($data);
                $u->save();
            }
        } catch (Exception $e) {
            $this->error = "Не удаётся сохранить группу контакта!";
            throw new Exception($this->error);
        }
    }

    private function saveCustomFields()
    {
        if (!isset($this->input["customFields"]))
            return true;

        try {
            $idContact = $this->input["id"];
            $groups = $this->input["customFields"];
            $customFields = array();
            foreach ($groups as $group){
                foreach ($group["items"] as $item) {
                    $customFields[] = $item;
                }
            }
            foreach ($customFields as $field) {
                $field["idUser"] = $idContact;
                $field["value"] = (string)$field["value"];
                $u = new DB('se_user_values');
                //writeLog($field);
                $u->setValuesFields($field);
                $u->save();
            }
            return true;
        } catch (Exception $e) {
            $this->error = "Не удаётся сохранить доп. информацию о контакте!";
            throw new Exception($this->error);
        }
    }

    private function savePermission()
    {
        try {
            $ids = $this->input["ids"];
            $permissions = $this->input['permissions'];
            if (!isset($permissions)) return true;
            $idsExists = array();
            foreach ($permissions as $p)
                if ($p["id"])
                    $idsExists[] = $p["id"];

            //$idsExists = array_diff($idsExists, $ids);
            $idsExistsStr = implode(",", $idsExists);
            $idsStr = implode(",", $ids);
            $u = new DB('se_user_permission', 'app');
            if ($idsExistsStr)
                $u->where("((NOT id_permission IN ({$idsExistsStr})) AND id_user IN (?))", $idsStr)->deleteList();
            else $u->where('id_user IN (?)', $idsStr)->deleteList();

            $idsExists = array();
            if ($idsExistsStr) {
                $u->select("id_user, id_permission");
                $u->where("((id_permission IN ({$idsExistsStr})) AND id_user IN (?))", $idsStr);
                $objects = $u->getList();
                foreach ($objects as $item) {
                    $idsExists[] = $item["idPermission"];
                }
            };
            $data = array();
            foreach ($permissions as $p)
                if (empty($idsExists) || !in_array($p["id"], $idsExists))
                    foreach ($ids as $idPage)
                        $data[] = array('id_user' => $idPage, 'id_permission' => $p["id"]);
            if (!empty($data))
                DB::insertList('se_user_permission', $data);
            return true;
        } catch (Exception $e) {
            $this->error = "Не удаётся сохранить права доступа!";
            throw new Exception($this->error);
        }
    }


    protected function saveAddInfo()
    {
        return $this->savePermission() && $this->saveCustomFields();
    }

    public function save()
    {
        $this->input['photo'] = $this->input['imageFile'];
        return parent::save();
    }


    public function post()
    {
        if ($items = parent::post())
            $this->import($items[0]["name"]);
    }

    public function import($fileName)
    {
        $dir = DOCUMENT_ROOT . "/files";
        $filePath = $dir . "/{$fileName}";
        $contacts = $this->getArrayFromCsv($filePath);
        foreach ($contacts as $contact)
            $this->save();
    }

}
