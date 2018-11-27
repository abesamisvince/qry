<?php 
    include_once '../../config/Database.php';
    include_once '../../models/Questionnaire.php';
    include_once '../../models/Question.php';
    include_once '../../models/Response.php';
    include_once '../../models/School.php';
    $datebase = new Database();
    $db = $datebase->connect();

    
    $res = new Response($db);
    echo $res->createId();
?>