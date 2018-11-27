<?php
    // print_r($_POST);
    if(isset($_POST['type_id'])){

        include_once '../../config/Database.php';
        include_once '../../models/Questionnaire.php';
        include_once '../../models/Question.php';
        include_once '../../models/Choice.php';

        $database = new Database();
        $db = $database->connect();

        $question = new Question($db);

        $question->quest_id = $_POST['quest_id'];
        $question->name = $_POST['name'];
        $question->type_id = $_POST['type_id'];
        $question->question = $_POST['questionx'];
        $question->required = $_POST['required'];
        $question->position = $question->getPosition();
        $question->min = 0;
        $question->max = 0;

        $question->create();
        $q_id =  $db->lastInsertId();
        echo $q_id;

        switch ($_POST['type_id']) {
            case 3:
                // echo 'Radio Buttons';
                $choice = new Choice($db);
                $contents = explode("\n", $_POST['contents']);
                $x = 1;
                foreach($contents as $content => $value)
                {
                    $choice->question_id = $q_id;
                    $choice->content = $value;
                    $choice->value = $x;
                    $x++;

                    $choice->create();
                }
                
                break;
            case 4:
                // echo 'Check Boxes';

                $choice = new Choice($db);
                $contents = explode("\n", $_POST['contents']);
                $x = 1;
                foreach($contents as $content => $value)
                {
                    $choice->question_id = $q_id;
                    $choice->content = $value;
                    $choice->value = $x;
                    $x++;

                    $choice->create();
                }
                break;
            case 5:
                // echo 'Dropdown Box';

                $choice = new Choice($db);
                $contents = explode("\n", $_POST['contents']);
                $x = 1;
                foreach($contents as $content => $value)
                {
                    $choice->question_id = $q_id;
                    $choice->content = $value;
                    $choice->value = $x;
                    $x++;

                    $choice->create();
                }
                break;
            case 6:
                echo 'Rate (scale 1..5)';

                $choice = new Choice($db);

                $yaxiss = explode("\n", $_POST['yaxis']);
                foreach($yaxiss as $yaxis => $valuex)
                {
                    $choice->question_id = $q_id;
                    $choice->content = $valuex;
                    $choice->value = 0;
                    $choice->create();
                }

                $contents = explode("\n", $_POST['contents']);
                
                $x = 1;
                foreach($contents as $content => $value)
                {
                    $choice->question_id = $q_id;
                    $choice->content = $value;
                    $choice->value = $x;
                    $x++;

                    $choice->create();
                }

                break;
            default:
                
    }
    }else{
        header("Location: http://".$_SERVER['HTTP_HOST']."/qry/admin");
    }
?>