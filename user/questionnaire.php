<?php 
include_once '../session.php';

include_once '../config/Database.php';
include_once '../models/Questionnaire.php';
include_once '../models/Question.php';
include_once '../models/QuestionType.php';
include_once '../models/Answer.php';
include_once '../models/Choice.php';
include_once '../models/Response.php';
include_once '../models/Dependent.php';

$database = new Database();
$db = $database->connect();

$errormsg = '';
if(isset($_POST['submitq'])){


    $answer = new Answer($db);
    $response = new Response($db);
    
    
    $type = $_POST['type'];
    $answer->type = $type;
    
    switch($type) {
        case 1:
            //Yes No
            if (isset($_POST['yesno']) && $_POST['yesno'] != '') {
                $answer->response_id = $_SESSION['response_id'];
                $answer->question_id = $_POST['qid'];
                $answer->choice_id = $_POST['yesno'];
                $answer->table = 'quest_response_bool';
                if ($answer->create()) {
                    $_SESSION['position'] = $_SESSION['position'] + 1;
                }
            }else{
                $errormsg = 'Answer is required';
            }
            break;
        case 2:
            // Textbox
            if(isset($_POST['textbox']) && trim($_POST['textbox']) != '') {
                $answer->response_id = $_SESSION['response_id'];
                $answer->question_id = $_POST['qid'];
                $answer->response = $_POST['textbox'];
                $answer->table = 'quest_response_text';
                if ($answer->create()) {
                    $_SESSION['position'] = $_SESSION['position'] + 1;
                }
            }else{
                $errormsg = 'Answer is required';
            }
            break;
        case 3:
            // Radio buttons
            if(isset($_POST['radio']) && $_POST['radio'] != '') {
                $answer->response_id = $_SESSION['response_id'];
                $answer->question_id = $_POST['qid'];
                $answer->choice_id = $_POST['radio'];
                $answer->table = 'quest_response_single';
                if ($answer->create()) {
                    $_SESSION['position'] = $_SESSION['position'] + 1;
                }
            }else{
                $errormsg = 'Answer is required';
            }
            
            break;
        case 4:
            //Check boxes
            if (isset($_POST['checkbox']) && $_POST['checkbox'] != '') {
                if(sizeof($_POST['checkbox']) >= $_POST['min'] && sizeof($_POST['checkbox']) <= $_POST['max']){
                    $answer->response_id = $_SESSION['response_id'];
                    $answer->question_id = $_POST['qid'];
                    $answer->table = 'quest_response_multiple';
                // Add loop
                    $checkboxes = $_POST['checkbox'];
                    foreach ($checkboxes as $checkebox => $value) {
                        $answer->choice_id = $value;
                        $answer->create();
                    }

                    $_SESSION['position'] = $_SESSION['position'] + 1;
                }else{
                    if($_POST['min'] == $_POST['max']){
                        $errormsg = 'Please select '.$_POST['min'].' choice/s';
                    }else{
                        $errormsg = 'Please select '.$_POST['min'].' to '.$_POST['max'].' choices';
                    }
                }
                
            }else{
                $errormsg = 'Answer is required';
            }
            break;
        case 5:
            //Dropdown
            if (isset($_POST['radio']) && $_POST['radio'] != '') {
                $answer->response_id = $_SESSION['response_id'];
                $answer->question_id = $_POST['qid'];
                $answer->choice_id = $_POST['checkbox'];
                $answer->table = 'quest_response_single';
                if ($answer->create()) {
                    $_SESSION['position'] = $_SESSION['position'] + 1;
                }
            }else{
                $errormsg = 'Answer is required';
            }
            break;
        case 6:
            // Rate
            $answer->response_id = $_SESSION['response_id'];
            $answer->question_id = $_POST['qid'];
            $answer->table = 'quest_response_rank';
            // Add loop
            $x = 0;
            foreach($_POST as $stuff => $val){

                if ($x >= 2) {
                    $rowxs = explode('-', $val);
                
                    $xx = 0;
                    foreach($rowxs as $rowx){
                        if($xx == 0){
                            $answer->choice_id = $rowx;
                        }else{
                            $answer->rank = $rowx;
                        }
                        $xx++;
                    }

                    if($answer->choice_id != 0){
                        $answer->create();
                    }
                }    
                $x++;      
            }
            $_SESSION['position'] = $_SESSION['position'] + 1;
            break;
        case 7:
            // Textbox
            if (isset($_POST['textbox']) && trim($_POST['textbox']) != '') {
                $answer->response_id = $_SESSION['response_id'];
                $answer->question_id = $_POST['qid'];
                $answer->response = $_POST['textbox'];
                $answer->table = 'quest_response_text';
                if ($answer->create()) {
                    $_SESSION['position'] = $_SESSION['position'] + 1;
                }
            } else {
                $errormsg = 'Answer is required';
            }
            break;
           
    }
    $response->complete = $_SESSION['position'];
    $response->response_id = $_SESSION['response_id'];
    $response->updatePosition();

    
}



include_once 'header.php';
?>
<style>

</style>
<script>
  $(document)
    .ready(function() {
      $('.ui.form').form();
      $('.ui.accordion').accordion();
      $('.ui.dropdown').dropdown();
      $('.menu .item').tab();
      $('.ui.checkbox').checkbox();

    });


  </script>

</head>
<body style="background-color: #FFFFFF; padding-top: 80px;">
    <?php include_once 'nav.php';?>
    
    <div class="ui container white">
    <?php 
    
    if(isset($_GET['id'])){
        

        $quest = new Questionnaire($db);

        $quest_id = $_GET['id'];
        $quest->id = $quest_id;
        $quest->find();

        echo '<h3 class="ui top attached header">'.$quest->questionnaire.'</h3>';
    }else{
        echo  '<h1 class="ui block center aligned header">Error, page not found. <br> Go <a href="index.php">home</a>.</h1>';
        die();
    }
    
    
    ?>
    <div class="ui attached segment">
    <?php 
            $question = new Question($db);
            $dependent = new Dependent($db);


            $question->quest_id = $quest_id;
            $question->offset = $_SESSION['position'];
            $qcount = $question->nextCountr();
            $qrows = $question->nextQuestion();
            // echo sizeof($qrows);
            // print_r($qrows);
            // TODO
            if($qrows){
                foreach($qrows as $qrow){
                    $dependent->questionid = $qrow['id'];
                    $dependent->surveyid = $quest_id;
                    $drows = $dependent->check();
                    if($drows){
                        foreach($drows as $drow){
                            
                            $answer = new Answer($db);
                            
                            $question->id = $drow['dependquestionid'];
                            $question->find();
                            $qtype = $question->type_id;
                            $answer->type = $qtype;
                            if($qtype == 1 || $qtype == 3 || $qtype == 5){
                                $answer->table = 'quest_response_single';
                                $answer->question_id = $drow['dependquestionid'];
                                $answer->choice_id = $drow['dependchoiceid'];
                                $answer->response_id = $_SESSION['response_id'];

                            }
                            
                            if($qcount == 1){
                                if ($answer->findAnswer() == 1) {
                                    $question->id = $drow['questionid'];
                                    break 2;
                                }else{
                                    $_SESSION['position'] = $_SESSION['position'] + 1;
                                    $question->offset = $_SESSION['position'];
                                    $question->quest_id = $quest_id;

                                    header('Refresh: 0;');
                                    die();
                                    // $question->id = $question->next();

                                    
                                    
                                    
                                    break;
                            
                                }
                            }
                            
                            if ($answer->findAnswer() == 1) {
                                $question->id = $drow['questionid'];
                                break 2;
                            }
                        
                        }
                        
                    }else{
                        $question->id = $qrow['id'];
                    }
                }

            //$question->id = $question->next();
            $question->find();
            include_once 'components/question.php';
  
            }
            // elseif(count($qrows) == 1){

            //     foreach($qrows as $qrow){

            //         $dependent->questionid = $qrow['id'];
            //         $dependent->surveyid = $quest_id;
            //         $drows = $dependent->check();
            //         if($drows){
            //             foreach($drows as $drow){
                            
            //                 $answer = new Answer($db);
                            
            //                 $question->id = $drow['dependquestionid'];
            //                 $question->find();
            //                 $qtype = $question->type_id;
            //                 $answer->type = $qtype;
            //                 if($qtype == 1 || $qtype == 3 || $qtype == 5){
            //                     $answer->table = 'quest_response_single';
            //                     $answer->question_id = $drow['dependquestionid'];
            //                     $answer->choice_id = $drow['dependchoiceid'];
            //                     $answer->response_id = $_SESSION['response_id'];

            //                 }
                            
            //                 if ($answer->findAnswer() == 1) {
            //                     $question->id = $drow['questionid'];
            //                     break 2;
            //                 }else{
            //                     $_SESSION['position'] = $_SESSION['position'] + 1;
            //                     $question->offset = $_SESSION['position'];
            //                     $question->quest_id = $quest_id;
            //                     $question->id = $question->next(); 
            //                     break;

            //                 }
                        
            //             } 
            //         }else{
            //             $question->id = $qrow['id'];
            //         }
            //     }
            //     $question->find();
            //     include_once 'components/question.php';
            // }
            else{
                ?>
                <div class="ui massive blue message">
                    <div class="header">
                        Thank you for answering the questionnaire.
                    </div>
                    <p>You may now go back to the homepage. <a href="index.php" class="ui">Click here</a>.</p>
                </div>
                <?php
            }
        ?>
    </div>
        
    </div>
    <script>
        if ( window.history.replaceState ) {
            window.history.replaceState( null, null, window.location.href );
        }
    </script>
</body>
</html>