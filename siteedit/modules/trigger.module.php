<?php

class Trigger
{
    private static $instance = null;

    public function __construct()
    {

    }

    public function run($event, $args = array())
    {
        $notices = $this->getNotices($event);
		$err = false;

        foreach ($notices as $notice) {
            if(!$this->notify($notice, $args)) {
				$err = true;
			}
		}	
		return !$err;
    }

    public static function getInstance()
    {
        if (is_null(self::$instance)) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function getNotices($event)
    {
        $t = new DB("se_notice", "n");
        $t->select("n.id, n.sender, n.recipient, n.subject, n.content, n.target");
        $t->innerjoin("se_notice_trigger ntr", "ntr.id_notice = n.id");
        $t->innerjoin("se_trigger t", "t.id = ntr.id_trigger");
        $t->where("t.code = '?'", $event);
        $t->andWhere("n.is_active");
        $t->groupby("n.id");

        return $t->getList();
    }

    public function notify($notice, $args = array())
    {
        $macros = new Macros($args);

        foreach ($notice as $key => &$value) {
            $value = $macros->exec($value);
        }

        $result = false;
        $t = new DB("se_notice_log");
		$data = array('sender'=>$notice['sender'], 'id_notice' => $notice['id'], 'recipient'=> $notice['recipient'], 'content'=>$notice['content']);
		
		$t->setValuesFields($data);
		
        $idNotice = $t->save();

        if ($idNotice) {
            switch ($notice['target']) {
                case 'email':
					$sender = (!empty($notice['sender']))? $notice['sender']:'noreply@'.$_SERVER['HTTP_HOST'];
                    $mail = new plugin_email($notice['subject'], $notice['recipient'], $notice['sender']);
                    $mail->addtext($notice['content'], 'text/html');
                    $result = $mail->send();
                    break;
                case 'sms':
                    $result = (new plugin_sms())->sms_send($notice['recipient'], strip_tags($notice['content']), $notice['sender']);
                    break;
                case 'telegram':
                    //$result = (new plugin_telegram($notice['recipient'], $notice['sender']))->send(strip_tags($notice['content']));
                    break;
            }
            $t->where('id=?', $idNotice);
            $t->status = (int)$result;
            $t->save();
        }


        return $result;
    }

}