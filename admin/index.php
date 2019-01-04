<?php 
include_once '../session.php';
if($_SESSION['user_type']!=1){
    header("Location: http://" . $_SERVER['HTTP_HOST'] . "/qry/index.php");
}
include_once '../config/Database.php';
include_once '../models/School.php';
include_once '../models/Questionnaire.php';
include_once '../models/User.php';
include_once '../models/Response.php';

$database = new Database();
$db = $database->connect();
$school = new School($db);

if(isset($_POST['activate-school'])){
    $school->schoolid = $_POST['school'];
    $school->deactivateAll();

    $school->activate();
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
<body style="background-color: #FFFFFF; padding-top: 80px; padding-bottom:30px;">
<?php include_once 'nav.php';?>
    <div class="ui container white">
        <h3 class="ui top attached header">
            Activate School
        </h3>
        <div class="ui attached segment">
           <form class="ui form"  method="POST" id="form1" action="<?php $_SERVER['PHP_SELF']; ?>">
                <div class="field">
                    <h3 class="ui header">
                        Current School - <?php 
                            $school->active();
                            echo $school->schoolname;
                        
                        ?>
                    </h3>
                    <label for="school">Search and Select school to activate</label>
                    <select name="school" id="school" class="ui fluid search dropdown">
                        <option value="">Select School</option>
                        <?php 
                            
                            $schools = $school->all();
                            foreach($schools as $schoolx){
                                echo '<option value="'.$schoolx['schoolid'].'">'.$schoolx['schoolname'].' - '.$schoolx['program'].'</option>';
                            }
                        ?>
                    </select>
                </div>
                <div class="field">
                        <div class="field"><button class="ui primary button" type="submit" name="activate-school" id="activate-school">
                            Activate School
                            </button>
                        </div>
                </div>
           </form>
        </div>
    </div>
    <div class="ui container white">
        

    <h3 class="ui top attached header">
        Questionnaires
    </h3>
    <div class="ui attached segment">
        <a href="new.php" class="ui primary button">
            <i class="plus icon"></i>
            Add New
        </a>
        <p></p>
        <div class="ui middle aligned divided list">
        <table class="ui  basic celled table">
			<thead>
                <tr>
                    <th class="thirteen wide sorted ascending">Surveys</th>
                    <th>Attempts</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            
			<tbody>
            <?php 
                $message = '';
                

                $quest = new Questionnaire($db);

                $rows = $quest->all();
                if($rows){
                    foreach($rows as $row){
                        echo '<tr>			   
                        <td>
                        <h4 class="ui header">
                            <div class="content">
                                <a href="questionnaire.php?id='.$row['id'].'">			          	
                                    '. $row['questionnaire'].'
                                </a>
                                <div class="sub header">'.$row['program']. '</div>
                            </div>
                        </h4>
                        </td>
                        <td><a href="result.php?id=' . $row['id'] . '">';
                        $response = new Response($db);
                        $response->quest_id = $row['id'];
                        echo $response->countResponses();
                        echo '</a></td>
                        <td>
                            <div class="ui toggle checkbox togglex" data-qid="' . $row['id'] . '" >';
                                if($row['status']==0){
                                   echo '<input  type="checkbox" name="togglex-' . $row['id'] . '">';
                                }elseif($row['status'] == 1){
                                    echo '<input type="checkbox" name="togglex-' . $row['id'] . '"  checked>';
                                }
                    //      echo '</div>		       
                    //     </td>
                        
                    //     <td>
                    //         <div class="ui circular blue icon bottom left pointing dropdown button" tabindex="0">
                    //         <i class="options icon"></i>
                    //         <div class="menu transition hidden" tabindex="-1">
                    //             <a href="preview.php?id=' . $row['id'] . '" class="item edit-quiz" data-qid="'.$row['id']. '">Preview </a>
                                				    
                    //             <div class="item del-quiz" data-qid="'.$row['id']. '">Delete</div>
                    //             <a href="reset.php?id=' . $row['id'] . '" class="item hide-quiz" data-qid="' . $row['id'] . '" data-viewx="1">Reset Responses</a>	
                    //         </div>
                    //         </div>
                    //     </td>
                    // </tr>';
                    echo '</div>		       
                        </td>
                        
                        <td>
                            <div class="ui circular blue icon bottom left pointing dropdown button" tabindex="0">
                            <i class="options icon"></i>
                            <div class="menu transition hidden" tabindex="-1">
                                <a href="preview.php?id=' . $row['id'] . '" class="item edit-quiz" data-qid="' . $row['id'] . '">Preview </a>
                                				    
                                <div class="item del-quiz" data-qid="' . $row['id'] . '">Delete</div>

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
        $(document).on('click', '.toggle', function(){
            var qid = $(this).data('qid');
            $.ajax({
                url: 'actions/toggle.php',
                type: 'post',
                data: 'qid='+qid,
                success: function(data) {
            }
            });

        });
    </script>
    <script>
        if ( window.history.replaceState ) {
            window.history.replaceState( null, null, window.location.href );
        }
    </script>
    
</body>
