<div class="ui middle aligned divided list">
        <?php 
        $question->position = $question->id;
        $hrows = $question->header();
        if($hrows){
            foreach ($hrows as $hrow) {
                echo '<h3 class="ui block header">' . $hrow['question'] . '</h3>';
            }
        }
        
        ?>
        <h3 class="ui top attached header">
            <?php echo $question->question; ?>
        </h3>
        <div class="ui attached segment" id="question-handle">
        <?php 
        if ($errormsg != '') {
            echo '<div class="ui negative message">';
            echo '<h4 class="ui header">';
            echo $errormsg;
            echo '</h4>';
            echo '</div>';
        }

        ?>
         <form class="ui form" id="formx" method="POST" action="<?php $_SERVER['PHP_SELF']; ?>" > 
            <!-- Hidden Inputs -->
            <input type="hidden" value="<?php echo $question->type_id; ?>" name="type">
            <input type="hidden" value="<?php echo $question->id; ?>" name="qid">
            <input type="hidden" value="<?php echo $question->min; ?>" name="min">
            <input type="hidden" value="<?php echo $question->max; ?>" name="max">
       
                <?php 
                $choice = new Choice($db);
                $choice->question_id = $question->id;
                switch ($question->type_id) {
                    case 1:
                        include_once 'components/yesno.php';
                        break;
                    case 2:
                        include_once 'components/textbox.php';
                        break;
                    case 3:
                        include_once 'components/radio.php';
                        break;
                    case 4:
                        include_once 'components/checkbox.php';

                        break;
                    case 5:
                        include_once 'components/dropdown.php';

                        break;
                    case 6:
                        include_once 'components/rate.php';
                        // Add loop

                        break;
                    case 7:
                        include_once 'components/numeric.php';

                        break;
                }
                ?>
                
                
                <button class="ui submit button primary" name="submitq" id="submitq">Submit</button>
            </div>
            
        </form>   
        
        </div>
        
        </div>