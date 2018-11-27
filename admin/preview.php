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
    <?php include_once 'nav.php'; ?>
    
    <div class="ui container white">
    <?php 

    if (isset($_GET['id'])) {


        $quest = new Questionnaire($db);

        $quest_id = $_GET['id'];
        $quest->id = $quest_id;
        $quest->find();

        echo '<h3 class="ui top attached header">' . $quest->questionnaire . '</h3>';
    } else {
        echo '<h1 class="ui block center aligned header">Error, page not found. <br> Go <a href="index.php">home</a>.</h1>';
        die();
    }


    ?>
    <div class="ui attached segment">
    <?php 
    $question = new Question($db);
    


    $question->quest_id = $quest_id;
    $qrows = $question->all();
    foreach($qrows as $qrow){
        ?>
        <div class="ui middle aligned divided list">
                <h3 class="ui top attached header">
                <?php echo $qrow['question'];?>
                </h3>
             <div class="ui attached segment" id="question-handle">
                 <form class="ui form" id="formx" method="POST" action=""> 
                <?php 
                    $choice = new Choice($db);
                    $choice->question_id = $qrow['id'];
                    switch ($qrow['type_id']) {
                        case 1:
                            echo '<div class="inline two fields">
                                <div class="field">
                                    <div class="ui radio checkbox">
                                        <input type="radio" name="yesno" value="y" tabindex="0" class="hidden">
                                        <label>Yes</label>
                                    </div>
                                </div>
                                <div class="field">
                                    <div class="ui radio checkbox">
                                        <input type="radio" name="yesno" value="n" tabindex="0" class="hidden">
                                        <label>No</label>
                                    </div>
                                </div>
                            </div>';
                            
                            break;
                        case 2:
                            echo '<div class="inline field">
                                        <div class="field">
                                            <input type="text" name="textbox" placeholder="Answer...">
                                        </div>
                                    </div>';
                            break;
                        case 3:
                            $rows = $choice->all();
                            foreach ($rows as $row) {
                                echo '<div class="inline field">' .
                                    '<div class="field">' .
                                    '<div class="ui radio checkbox">' .
                                    '<input type="radio" name="radio" value="' . $row['value'] . '" tabindex="0" class="hidden">' .
                                    '<label>' . $row['content'] . '</label>' .
                                    '</div>' .
                                    '</div>' .
                                    '</div>';
                            }
                            break;
                        case 4:
                            $rows = $choice->all();
                            foreach ($rows as $row) {
                                echo '<div class="required inline field">' .
                                    '<div class="field">' .
                                    '<div class="ui checkbox">' .
                                    '<input class="checkbox" type="checkbox" name="checkbox[]" value="' . $row['value'] . '" tabindex="0" class="hidden">' .
                                    '<label>' . $row['content'] . '</label>' .
                                    '</div>' .
                                    '</div>' .
                                    '</div>';
                            }

                            break;
                        case 5:
                            ?>
                            <div class="field">
                                <label>Choice</label>
                                <div class="ui selection dropdown">
                                    <input type="hidden" name="checkbox">
                                    <i class="dropdown icon"></i>
                                    <div class="default text">Choice</div>
                                    <div class="menu">
                                        <?php 
                                        $rows = $choice->all();
                                        foreach ($rows as $row) {
                                            echo '<div class="item" data-value="' . $row['value'] . '">' . $row['content'] . '</div>';
                                        }
                                        ?>
                                    </div>
                                </div>
                            </div>
                            <?php
                            break;
                        case 6:
                            ?>
                            <table class="ui definition table">
                                <thead>
                                    <tr>
                                        <th class="four wide"></th>
                                        <?php 
                                        $rows = $choice->all();
                                        $columnx = 0;
                                        foreach ($rows as $row) {
                                            if ($row['value'] != 0) {
                                                echo '<th class="two wide">' . $row['content'] . '</th>';
                                                $columnx++;
                                            }
                                        }
                                        ?>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php 
                                    foreach ($rows as $row) {
                                        if ($row['value'] == 0) {
                                            echo '<tr>';
                                            echo '<td>' . $row['content'] . '</td>';
                                            for ($x = 1; $x <= $columnx; $x++) {
                                                echo '<td><input type="radio" name="q-' . $row['id'] . '" tabindex="0" class="hidden" value="' . $row['id'] . '-' . $x . '" checked></td>';
                                            }
                                            echo '</tr>';
                                        }
                                    }
                                    ?>
                                </tbody>
                            </table>
                            <?php          
                            break;
                        case 7:
                            echo '<div class="inline field">
                                    <div class="field">
                                        <input type="number" name="textbox" placeholder="Enter number" min="" max="">
                                    </div>
                                </div>';

                            break;
                    }
                    
                    $dependent = new Dependent($db);
                    $dependent->questionid = $qrow['id'];
                    $dependent->surveyid = $qrow['quest_id'];
                    $drows = $dependent->all();
                    // print_r($drows);
                    
                    if($drows){
                        echo '<div class="ui grey inverted segment">';
                        echo '<h4>Dependencies:</h4>';
                        foreach ($drows as $drow) {
                            
                            $dependent->dependquestionid = $drow['dependquestionid'];
                            $dcrows = $dependent->getChoice();
                            foreach($dcrows as $dcrow){
                                echo $drow['question'];
                                echo '->';
                                echo $dcrow['content'];
                                echo '<br>';
                            }
                        }
                        echo '</div>';
                    }
                    
                ?>
                
                </form>   
        
        </div>
        
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