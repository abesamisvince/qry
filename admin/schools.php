<?php 
include_once '../session.php';

include_once '../config/Database.php';
include_once '../models/School.php';
include_once '../models/Questionnaire.php';
include_once '../models/User.php';

$database = new Database();
$db = $database->connect();


if(isset($_POST['add-school'])){
    $schools = new School($db);

    $schools->schoolname = $_POST['schoolname'];
    $schools->program = $_POST['program'];

    $schools->create();


}

if(isset($_POST['add-schools'])){
    $schools = new School($db);

    $tmpName = $_FILES['csvfile']['tmp_name'];
    $csvAsArray = array_map('str_getcsv', file($tmpName));
    foreach($csvAsArray as $array){
        echo 'School: '.$array[0].'; Program: '.$array[1]. '<br>';

        $schools->schoolname = $array[0];
        $schools->program = $array[1];
        $schools->create();
    }

}
include_once 'header.php';
?>
<style>
    .dataTables_filter input {
    background: #fff none repeat scroll 0 0;
    border: 1px solid rgba(34, 36, 38, 0.15);
    border-radius: 0.285714rem;
    box-shadow: none;
    color: rgba(0, 0, 0, 0.87);
    flex: 1 0 auto;
    font-family: "Helvetica Neue",Arial,Helvetica,sans-serif;
	height:2.5em;
    margin: 0;
    max-width: 100%;
    outline: 0 none;
    padding: .4em;
    text-align: left;
    transition: background-color 0.1s ease 0s, box-shadow 0.1s ease 0s, border-color 0.1s ease 0s;
}
</style>
<script>
  $(document)
    .ready(function() {
      $('.ui.form').form();
      $('.ui.accordion').accordion();
      $('.ui.dropdown').dropdown();
      $('.menu .item').tab();
       $('table.examplex').DataTable({
      "order": [[ 1, "ASC" ]]
    });
    });
  </script>

</head>
<body style="background-color: #FFFFFF; padding-top: 80px; padding-bottom:30px;">
<?php include_once 'nav.php'; ?>
    <div class="ui container white">
    <h3 class="ui top attached header">
             Schools
        </h3>

        
        <div class="ui attached segment">
            <form class="ui form small" method="POST" id="form1" action="<?php $_SERVER['PHP_SELF']; ?>" autocomplete="off">
                    <h4>Add School</h4>       
                    <div class="two fields">
                        <div class="field">
                            <label>School Name</label>
                            <input type="text" name="schoolname" />
                        </div>
                        <div class="field">
                            <label>Program</label>
                            <select name="program" id="program" class="ui dropdown">
                                <option value="">Program</option>
                                <option value="Hub">Hub</option>
                                <option value="NGS">NGS</option>
                                <option value="Teachnology">Teachnology</option>
                            </select>
                        </div>
                    </div>
                    <div class="field">
                        <div class="field"><button class="ui primary button" type="submit" name="add-school" id="add-school">
                            Add
                            </button>
                        </div>
                    </div>
            </form>
        </div>
        <div class="ui attached segment">
            <form class="ui form small" method="POST" id="form2" action="<?php $_SERVER['PHP_SELF']; ?>" enctype="multipart/form-data">
                    <h4>Add Schools via CSV</h4>       
                    <div class="two fields">
                        <div class="field">
                            <label>Select CSV</label>
                            <input type="file" name="csvfile" />
                        </div>
                    </div>
                    <div class="field">
                        <div class="field"><button class="ui primary button" type="submit" name="add-schools" id="add-schools">
                            Add
                            </button>
                        </div>
                    </div>
            </form>
           
        </div>
    </div>
    <div class="ui container white">
        

    <h3 class="ui top attached header">
        School List
    </h3>
    <div class="ui attached segment">
        <table class="ui celled table examplex" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>School</th>
                    <th>Program</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                $schools = new School($db);
                    $rowxs = $schools->all();
                    foreach($rowxs as $rowx){
                        echo '<tr>';
                            echo '<td>'.$rowx['schoolname'].'</td>';
                            echo '<td>' . $rowx['program'] . '</td>';
                            echo '<td>' . $rowx['id'] . '</td>';
                        echo '</tr>';
                    }
                ?>
            </tbody>
        </table>

    </div>
        
    </div>
    <script>
        if ( window.history.replaceState ) {
            window.history.replaceState( null, null, window.location.href );
        }
    </script>
</body>