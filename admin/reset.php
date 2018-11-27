<?php 
include_once '../config/Database.php';
include_once '../models/Response.php';

$database = new Database();
$db = $database->connect();
$response = new Response($db);

if($_GET['id']){
    if($response->truncate()){
        header('Location: index.php');
    }
}else{

}
?>