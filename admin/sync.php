<?php
include_once '../config/Main.php';
include_once '../config/Database.php';


include_once '../models/Response.php';
include_once '../models/Sync.php';
include_once '../models/Table.php';


$database = new Database();
$db = $database->connect();


$response = new Response($db);
$tables = new Table($db);


$responseRows = $response->all();

foreach($responseRows AS $responseRow){
    $database1 = new Main();
    $db1 = $database1->connect();
    
    $sync = new Sync($db1);
    $sync->response_id = $responseRow['response_id'];
    $sync->quest_id = $responseRow['quest_id'];
    $sync->submitted = $responseRow['submitted'];
    $sync->complete = $responseRow['complete'];
    $sync->username = $responseRow['username'];
    $sync->school_id = $responseRow['school'];
    if(!$sync->syncResponseDups()){
        $sync->syncResponse();
    }
}
$xtables = array('quest_response_bool', 'quest_response_multiple', 'quest_response_rank', 'quest_response_single', 'quest_response_text');
foreach($xtables AS $table => $tab){
    if($tab == 'quest_response_bool'){
        // $tables->table = $tab;
        // $tablexs = $tables->all();
        // foreach($tablexs AS $tablex){
        //     $database1 = new Main();
        //     $db1 = $database1->connect();
        //     $sync = new Sync($db1);
        //     $sync->response_id = $tablex['response_id'];
        //     $sync->question_id = $tablex['question_id'];
        //     $sync->choice_id = $tablex['choice_id'];

        //     if(!$sync->syncResponseBoolDups()){
        //         $sync->syncResponseBool();
        //     }
        // }   
    }elseif($tab == 'quest_response_multiple'){
        $tables->table = $tab;
        $tablexs = $tables->all();
        foreach ($tablexs as $tablex) {
            $database1 = new Main();
            $db1 = $database1->connect();
            $sync = new Sync($db1);
            $sync->response_id = $tablex['response_id'];
            $sync->question_id = $tablex['question_id'];
            $sync->choice_id = $tablex['choice_id'];

            if (!$sync->syncResponseMultDups()) {
                $sync->syncResponseMult();
            }
        } 
    }elseif($tab == 'quest_response_rank'){
        $tables->table = $tab;
        $tablexs = $tables->all();
        foreach ($tablexs as $tablex) {
            $database1 = new Main();
            $db1 = $database1->connect();
            $sync = new Sync($db1);
            $sync->response_id = $tablex['response_id'];
            $sync->question_id = $tablex['question_id'];
            $sync->choice_id = $tablex['choice_id'];
            $sync->rank = $tablex['rank'];

            if (!$sync->syncResponseRankDups()) {
                $sync->syncResponseRank();
            }
        }
    }elseif($tab == 'quest_response_single'){
        $tables->table = $tab;
        $tablexs = $tables->all();
        foreach ($tablexs as $tablex) {
            $database1 = new Main();
            $db1 = $database1->connect();
            $sync = new Sync($db1);
            $sync->response_id = $tablex['response_id'];
            $sync->question_id = $tablex['question_id'];
            $sync->choice_id = $tablex['choice_id'];

            if (!$sync->syncResponseSingleDups()) {
                $sync->syncResponseSingle();
            }
        } 
    }elseif($tab == 'quest_response_text'){
        $tables->table = $tab;
        $tablexs = $tables->all();
        foreach ($tablexs as $tablex) {
            $database1 = new Main();
            $db1 = $database1->connect();
            $sync = new Sync($db1);
            $sync->response_id = $tablex['response_id'];
            $sync->question_id = $tablex['question_id'];
            $sync->response = $tablex['response'];

            if (!$sync->syncResponseTextDups()) {
                $sync->syncResponseText();
            }
        } 
    }else{
        echo 'Done!';
    }
}



?>