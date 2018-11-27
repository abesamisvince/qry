<?php 
if(isset($_POST['qid'])){
    include_once '../../config/Database.php';
    include_once '../../models/Questionnaire.php';

    $database = new Database();
    $db = $database->connect();

    $questionnaire = new Questionnaire($db);

    $questionnaire->id = $_POST['qid'];
    $questionnaire->activate();
}else{
    header("HTTP/1.0 400 Bad Request");
}

?>