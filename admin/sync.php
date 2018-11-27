<?php
include_once '../config/Main.php';

$database = new Main();
$db = $database->connect();
if($db){
    echo 'Yay';
}else{
    echo 'Aws';
}
?>