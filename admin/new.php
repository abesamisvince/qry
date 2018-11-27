<?php 
include_once '../session.php';

include_once '../config/Database.php';
include_once '../models/School.php';
include_once '../models/Questionnaire.php';
include_once '../models/User.php';

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
    });


  </script>

</head>
<body style="background-color: #FFFFFF; padding-top: 80px;">
    <div class="ui fixed big orange inverted menu">
        <div class="ui container">
        <a href="#" class="header item">
            <img class="logo" src="../assets/aralinksfront.png">
        </a>
        <a href="#" class="item">Aralinks QRY</a>
        <div class="right menu">

            <a class="ui item">
            Logout
            </a>
        </div>
        </div>
    </div>
    
    <div class="ui container white">


    <h2 class="ui top attached header">
        New Questionnaire
    </h2>
    <div class="ui attached segment">
        <p></p>
        <div class="ui middle aligned divided list">
        <table class="ui  basic celled table">
			<thead>
                <tr>
                    <th class="thirteen wide sorted ascending">Surveys</th>
                    <th>Attempts/ Submissions</th>
                    <th>Actions</th>
                </tr>
            </thead>
            
			<tbody>
            <?php 
                $message = '';
                $database = new Database();
                $db = $database->connect();

                $quest = new Questionnaire($db);

                $rows = $quest->active();
                if($rows){
                    foreach($rows as $row){
                        echo '<tr>			   
                        <td>
                        <h4 class="ui header">
                            <div class="content">
                                <a href="assignment.php?quizid='.$row['id'].'">			          	
                                    '. $row['questionnaire'].'
                                </a>
                                <div class="sub header">'.$row['program'].'</div>
                            </div>
                        </h4>
                        </td>
                        <td>
                            <a href="result.php?quizid='.$row['id'].'">X</a>			       
                        </td>
                        <td>
                            <div class="ui circular blue icon bottom left pointing dropdown button" tabindex="0">
                            <i class="options icon"></i>
                            <div class="menu transition hidden" tabindex="-1">
                                <div class="item edit-quiz" data-qid="'.$row['id'].'">Edit Settings </div>
                                <div class="item hide-quiz" data-qid="'.$row['id'].'" data-viewx="1">Hide</div>					    
                                <div class="item del-quiz" data-qid="'.$row['id'].'">Delete</div>
                            </div>
                            </div>
                        </td>
                    </tr>';
                    }
                }else {
                    $message =  '<h1 class="ui block center aligned header">No available questionnaire</h1>';
                }
            ?>  
               
            </tbody>
		</table>

        
        <?php echo $message; ?>
        
        </div>
    </div>
        
    </div>
    <script>
    
    </script>
</body>