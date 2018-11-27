<?php 
include_once '../session.php';

include_once '../config/Database.php';
include_once '../models/School.php';
include_once '../models/Questionnaire.php';
include_once '../models/User.php';

include_once 'header.php';
?>
<style>
    .content{
        min-height: 70px;
        max-height: 70px;
        overflow-x: srcoll;
    }
</style>
</head>
<body style="background-color: #FFFFF1; padding-top: 80px;">
    <?php include_once 'nav.php';?>
    <div class="ui center aligned container">
        <div class="ui three stackable cards">
        <?php 
            $message = '';
            $database = new Database();
            $db = $database->connect();

            $quest = new Questionnaire($db);

            $rows = $quest->active();
            if($rows){
                foreach($rows as $row){
                    echo '<div class="card">'.
                            '<div class="content">'.
                            '<div class="header">'. $row['questionnaire'] .'</div>'.
                            '</div>'.
                            '<a class="ui bottom attached blue button" href="actions/open_survey.php?quest_id='.$row['id'].'">'.
                            '<i class="play icon"></i>'.
                            'Enter'.
                            '</a>'.
                        '</div>';
                }
            }else {
                $message =  '<h1 class="ui block center aligned header">No available questionnaire</h1>';
            }
            

        ?>

        </div>
        <?php echo $message; ?>
    </div>
</body>