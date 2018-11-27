<?php 
include_once '../../session.php';

include_once '../../config/Database.php';
include_once '../../models/Questionnaire.php';
include_once '../../models/Question.php';
include_once '../../models/Response.php';
include_once '../../models/School.php';
include_once '../../models/Answer.php';

if(isset($_GET['quest_id'])){
    $username = $_SESSION['user'];
    $quest_id = $_GET['quest_id'];
    //SET ACTIVE SCHOOL
    $database = new Database();
    $db = $database->connect();
    $school = new School($db);

    if($school->active()){
        $_SESSION['schoolid'] = $school->schoolid;
        // Check response
        $response = new Response($db);
        $response->quest_id = $quest_id;

         $response->username = $username;
 
         $response->school_id = $school->schoolid;

        if(!$response->check()){
            $response->response_id = $response->createId();
            

            if($response->create()){
                $_SESSION['response_id'] = $response->response_id;
                $_SESSION['position'] = 1;
                header("Location: http://".$_SERVER['HTTP_HOST']."/qry/user/questionnaire.php?id=".$quest_id);
            }

        }else{
            if($response->response_id) {
                
                
 
                $_SESSION['position'] = $response->complete;

                $_SESSION['response_id'] = $response->response_id;

                header("Location: http://".$_SERVER['HTTP_HOST']."/qry/user/questionnaire.php?id=".$quest_id);
            }
        }
    }else{
        echo 'No active school';
    }
}else{
    echo 'Go back home';
}

?>