<?php 
include_once '../session.php';

include_once '../config/Database.php';
include_once '../models/Questionnaire.php';
include_once '../models/Question.php';
include_once '../models/QuestionType.php';
if(isset($_POST['edit-quest'])){
    $database = new Database();
    $db = $database->connect();

    $question = new Question($db);
    $question->id = $_POST['qid'];
    $question->name = $_POST['name'];
    $question->question = $_POST['questionx'];
    $question->required = true;
    $question->min = $_POST['min'];
    $question->max = $_POST['max'];
    $question->update();

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
      $('.ui.radio.checkbox').checkbox();
      $('.ui.modal').modal();
    });


  </script>

</head>
<body style="background-color: #FFFFFF; padding-top: 80px; padding-bottom:90px;">
    <?php include_once 'nav.php';?>
    
    <div class="ui container white">
    <?php 
    
    if(isset($_GET['id'])){
        $database = new Database();
        $db = $database->connect();

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
        <h4 class="ui block header">
            Add Questions
            <div class="sub header">Create question for questionnaire</div>
        </h4>

        <div class="ui segments">
            <div class="ui segment">
                <div class="ui form">
                    <div class="three fields">
                        <div class="field">
                            <label>Question Type</label>
                        <div class="ui selection dropdown">
                            <input type="hidden" name="type_" id="qtype">
                            <i class="dropdown icon"></i>
                            <div class="default text">Type</div>
                            <div class="menu">
                                <?php
                                    $database = new Database();
                                    $db = $database->connect();
                            
                                    $q_type = new QuestionType($db);
                                    $rows = $q_type->all();
                                    if($rows){
                                        foreach($rows as $row){
                                            echo '<div class="item" data-value="'.$row['type_id'].'">'.$row['type_'].'</div>';
                                        }
                                    }
                                ?>  
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
            <div class="ui secondary segment blue">
                <form class="ui form" method="POST" id="form1">
                    <input type="hidden" name="quest_id" value="<?php echo $quest_id;?>">
                    <input type="hidden" name="type_id" id="type_id">
                    <!-- Question Handle -->
                    <div id="questdiv"></div>
                </form>
            </div>
        </div>
        
        <div class="ui middle aligned divided list">


        <table class="ui  basic celled table">
			<thead>
                <tr>
                    <th class="thirteen wide sorted ascending">Questions</th>
                    <th>Actions</th>
                </tr>
            </thead>
            
			<tbody>
                <?php require_once 'components/question_list.php'; ?>
                
               
            </tbody>
		</table>

        
        <?php echo $message; ?>
        
        </div>
    </div>
        
    </div>
    <!-- Modal -->
    <div class="ui test modal" id="modalx">
        
    </div>
    <!-- Modal end -->
    <script>
        $(document).on('change','#qtype', function() {
            let qtype = parseInt(this.value);
            $('#type_id').val(qtype);
            switch(qtype){
                case 1:
                    var url = 'components/yesno.php';
                    break;
                case 2:
                    var url = 'components/textbox.php';
                    break;
                case 3:
                    var url = 'components/radio.php';
                    break;
                case 4:
                    var url = 'components/checkbox.php';
                    break;
                case 5:
                    var url = 'components/dropdown.php';
                    break;
                case 6:
                    var url = 'components/rate.php';
                    break;
                case 7:
                    var url = 'components/numeric.php';
                    break;
                case 8:
                    var url = 'components/section.php';
                    break;
                default:
                    var url = '';
            }
            $.ajax({
                url: url,
                success: function(html) {
                    $("#questdiv").html(html);
                    $('.ui.radio.checkbox').checkbox();

                }
            });
        });

        $(document).on('submit', '#form1', function(e) {
            e.preventDefault();
            var frm = $('#form1');
            
            console.log(frm);

            $.ajax({
                url: 'actions/save_question.php',
                type: 'post',
                data: frm.serialize(),
                success: function(data) {
                    $.ajax({
                        url: 'components/append_question.php',
                        type: 'post',
                        data: 'quest_id='+data.trim(),
                        success: function(html) {
                            $('tbody').append(html);
                            $('input[type="text"]').val('');
                            $('textarea').val('');
                        }
                    });
            }
            });
        });

        $(document).on('click', '.question', function(e){
            e.preventDefault();
            var idx = $(this).data("id");
            $.ajax({
                url: 'components/modal.php',
                type: 'post',
                data: 'id='+idx,
                success: function(html) {
                    $('#modalx').html(html);
                    $('.test.modal').modal('setting', 'transition', 'fade up').modal('show');
            }
            });
            
        });

        if ( window.history.replaceState ) {
            window.history.replaceState( null, null, window.location.href );
        }
    </script>
</body>