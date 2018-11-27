<?php 

include_once '../../config/Database.php';
include_once '../../models/Question.php';
                $message = '';
                $database = new Database();
                $db = $database->connect();

                $question = new Question($db);
                $question->id = $_POST['quest_id'];
                $row = $question->find();
                        echo '<tr>			   
                        <td>
                        <h4 class="ui header">
                            <div class="content">
                                <a href="assignment.php?quizid='.$question->id.'">			          	
                                    '. $question->question.'
                                </a>
                                <div class="sub header">'.$question->position.'</div>
                            </div>
                        </h4>
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
