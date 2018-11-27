<?php
session_start();

if(!isset($_SESSION['user']) && !isset($_SESSION['user_type'])){
    header("Location: http://".$_SERVER['HTTP_HOST']."/qry/index.php");
    if ($_SESSION['user_type'] != 1) {
        header("Location: http://" . $_SERVER['HTTP_HOST'] . "/qry/index.php");
    }
}
?>