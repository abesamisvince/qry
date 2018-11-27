<?php 
include_once '../session.php';

include_once '../config/Database.php';
include_once '../models/Questionnaire.php';
include_once '../models/Question.php';
include_once '../models/QuestionType.php';
include_once '../models/Answer.php';
include_once '../models/Choice.php';
include_once '../models/Response.php';
include_once '../models/Result.php';
include_once '../models/School.php';
$database = new Database();
$db = $database->connect();
$quest = new Questionnaire($db);
$response = new Response($db);
if (isset($_POST['activate-school'])) {
    $quest->curr_school = $_POST['school'];
    $quest->id = $_POST['idx'];
    $quest->activeSchool();
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
    <?php include_once 'nav.php'; ?>
    
    <div class="ui container white">
    
    <?php 
    include_once 'components/resultheader.php';
    if (isset($_GET['id'])) {


        

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
        foreach($qrows as $qrow) {
            ?>
            <h3 class="ui top attached header">
                <?php echo $qrow['question']; ?>
                </h3>
             <div class="ui attached segment" id="question-handle">
             
                <?php
                if ($qrow['type_id'] == 2 || $qrow['type_id'] == 7) {
                    ?>
                    <script>
                        $(document).ready(function(){
                                var table = $('#x-<?php echo $qrow['id']; ?>').DataTable( {
                            lengthChange: false,
                            buttons: [ 'copy', 'excel' ]
                            });
                    
                        table.buttons().container()
                            .appendTo( $('div.eight.column:eq(0)', table.table().container()) );
                        });
                    </script>
                    <table class="ui striped table myTable" id="x-<?php echo $qrow['id'];?>">
                        <thead>
                            <tr>
                            <th>Response</th>
                            </tr>
                        </thead>
                        <tbody>
                    <?php
                    $result = new Result($db);
                    $result->school_id = $quest->curr_school;
                    $result->survery_id = $quest_id;
                    $rqows = $result->getReponses();
                    if($rqows){
                        foreach ($rqows as $qows) {
                            $result->response_id = $qows['response_id'];
                            $result->question_id = $qrow['id'];
                            $trows = $result->text();
                            echo '<tr>';
                            echo '<td>';
                            echo $trows['response'];
                            echo '</td>';
                            echo '</tr>';

                        }
                    }
                    echo '</tbody> </table>';
                }elseif($qrow['type_id'] == 4){
                    $result = new Result($db);
                    $result->survery_id = $quest_id;
                    $result->school_id = $quest->curr_school;
                    $result->question_id = $qrow['id'];
                    print_r($result->getCheckArray());
                    ?>
                    <!-- <div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div> -->
                    <!-- <script>
                    $(document).ready(function() {
                        
                    })
                    </script> -->
                    <?php
                }elseif ($qrow['type_id'] == 3 || $qrow['type_id'] == 5) {
                    $result = new Result($db);
                    $result->survery_id = $quest_id;
                    $result->school_id = $quest->curr_school;
                    $result->question_id = $qrow['id'];
                    print_r($result->getRadioArray());
                    ?>
                    <!-- <div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div> -->
                    <!-- <script>
                    $(document).ready(function() {
                        
                    })
                    </script> -->
                    <?php
                }
                ?>
                    
             </div>
            <?php
        }
    
    ?>
        
    </div>
    <script>
        if ( window.history.replaceState ) {
            window.history.replaceState( null, null, window.location.href );
        }
    </script>
</body>
</html>