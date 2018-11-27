<?php

if(isset($_POST['id'])){
    include_once '../../config/Database.php';
    include_once '../../models/Question.php';
    $message = '';
    $database = new Database();
    $db = $database->connect();

    $question = new Question($db);
    $question->id = $_POST['id'];
    $row = $question->find();
    if($row){

    
    ?>
        <div class="header">Edit Question</div>
        <div class="content" >
                <form class="ui form" id="formx" method="POST" action="<?php $_SERVER['PHP_SELF']; ?>" >
                    <input type="hidden" name="qid" value="<?php echo $question->id; ?>">
                    <input type="hidden" name="quest_id" value="<?php echo $question->quest_id; ?>">
                    <?php  ?>
                    <div class="required field">
                        <label>Question Name</label>
                        <input required type="text" name="name" value="<?php echo $question->name; ?>"/>
                    </div>
                    <div class="required field">
                        <label>Question</label>
                        <textarea rows="2" name="questionx"><?php echo $question->question; ?></textarea>
                    </div>

                    <?php 
                    if($question->type_id == 4){
                        ?>
                        <div class="ten fields">
                            <div class="required field">
                                <label>Min</label>
                                <input type="number" name="min" value="<?php echo $question->min; ?>"/>
                            </div>
                            <div class="required field">
                                <label>Max</label>
                                <input type="number" name="max" value="<?php echo $question->max; ?>"/>                                
                            </div>
                        </div>
                        
                        <?php
                    }else{
                        ?>
                        <input type="hidden" name="min" value="<?php echo $question->min; ?>"/>
                        <input type="hidden" name="max" value="<?php echo $question->max; ?>"/>                                
                        
                        <?php
                    }
                    ?>
                    <div class="field">

                        <div class="field">
                            <button class="ui primary button" type="submit" name="edit-quest" id="edit-quest" >
                            Update
                            </button>
                        </div>

                    </div>
                </form>
            
        </div>
    <?php
    }
}else{
    header("Location: http://" . $_SERVER['HTTP_HOST'] . "/qry/admin");
}

?>

