<?php

class ConsultationForm_Controller extends Controller
{
	public function Main($args = false)
	{
		parent::Main($args); // TODO: Change the autogenerated stub
	}
	
	private function validateName($name)
	{
	    return !empty($name);
	}
	
	private function validateEmail($email)
	{
	    return filter_var($email, FILTER_VALIDATE_EMAIL);
	}
	
	private function fetchMacros()
    {
        $result = array();
        
        foreach ($_POST as $key => $val) {
            if (!is_array($val))
                $result['POST.' . (string)$key] = (string)$val;
        }
        
        foreach ($_GET as $key => $val) {
            if (!is_array($val))
                $result['GET.' . (string)$key] = (string)$val;
        }
        
        return $result;
    }
    
    public function Handler()
	{
	    $response = array();
	    
	    $email = trim($_REQUEST['email']);
	    $name = trim($_REQUEST['name']);
	    
	    $data = array();
	    
	    if (!$this->validateName($name)) {
	        $response['error'] = 'Необходимо указать имя!';
	    }
	    elseif (!$this->validateEmail($email)) {
	        $response['error'] = 'Необходимо указать корректный email!';
	    }
	    else {
	        $data['email'] = $email;
	        $data['name'] = $name;
	        $data['sitename'] = $_SERVER['HTTP_HOST'];
	        
	        $trigger = new Trigger();

	        if(!$result = $trigger->run('consultation', $data)) {
	            $response['error'] = 'Во время отправки произошла ошибка! Попробуйте позднее.';
	        } else {
	            $response['success'] = 'Ваша заявка успешно отправлена!';
	        } 
	    }
	    
	    echo json_encode($response);
	}
}
