<?php 
include_once '../session.php';

include_once '../config/Database.php';
include_once '../models/School.php';
include_once '../models/Questionnaire.php';
include_once '../models/User.php';

$database = new Database();
$db = $database->connect();

$errormsg = '';
$errormsgx = '';
if (isset($_POST['add-user'])) {
    if($_POST['token'] != ''){
        $user = new User($db);

        $user->token = $_POST['token'];
        $user->user_type = $_POST['userlevel'];
        if (!$user->find()) {
            $user->create();
        } else {
            $errormsg = 'Token already exist';
        }
    }else{
        $errormsg = 'Please enter token';
    }

}

if (isset($_POST['add-users'])) {
    if($_POST['identifier'] != ''){
        if($_POST['num'] != ''){
            $user = new User($db);
            $identifier = $_POST['identifier'];
            $num =$_POST['num'] + 1;

            for ($i=1; $i < $num; $i++) {
                $user->token = $identifier.$i;
                $user->user_type = 2;
                $user->create();
            }

        }else{
            $errormsgx = 'Please enter number of user/s';
        }
    }else{
        $errormsgx = 'Please enter identifier';
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
             Users
        </h3>

        
        <div class="ui attached segment">
            <form class="ui form small" method="POST" id="form1" action="<?php $_SERVER['PHP_SELF']; ?>" autocomplete="off">
                    <h4>Add Token</h4>       
                    <div class="two fields">
                        <div class="field">
                            <label>Token</label>
                            <input type="text" name="token" />
                        </div>
                        <div class="field">
                            <label>Program</label>
                            <select name="userlevel" id="userlevel" class="ui dropdown">
                                <option value="">User Level</option>
                                <option value="1">Admin</option>
                                <option value="2">User</option>
                            </select>
                        </div>
                    </div>
                    <div class="field">
                        <div class="field"><button class="ui primary button" type="submit" name="add-user" id="add-user">
                            Add
                            </button>
                        </div>
                    </div>
                 <?php 
                if ($errormsg != '') {
                    echo '<div class="ui negative message">';
                    echo '<h4 class="ui header">';
                    echo $errormsg;
                    echo '</h4>';
                    echo '</div>';
                }
                ?>   
            </form>
        </div>
        <div class="ui attached segment">
            <form class="ui form small" method="POST" id="form2" action="<?php $_SERVER['PHP_SELF']; ?>" autocomplete="off">
                    <h4>Create Multiple Users</h4>       
                    <div class="two fields">
                        <div class="field">
                            <label>Identifier</label>
                            <input type="text" name="identifier" value="<?php if(isset($_POST['identifier'])){echo $_POST['identifier'];}?>"/>
                        </div>
                        <div class="field">
                            <label>Number of Users</label>
                            <input type="number" name="num" />
                        </div>
                    </div>
                    <div class="field">
                        <div class="field"><button class="ui primary button" type="submit" name="add-users" id="add-users">
                            Create
                            </button>
                        </div>
                    </div>
                    <?php 
                        if ($errormsgx != '') {
                            echo '<div class="ui negative message">';
                            echo '<h4 class="ui header">';
                            echo $errormsgx;
                            echo '</h4>';
                            echo '</div>';
                        }
                    ?> 
            </form>
           
        </div>
    </div>
    <div class="ui container white">
        

    <h3 class="ui top attached header">
        User List
    </h3>
    <div class="ui attached segment">
        <table class="ui celled table examplex" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Token</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                $users = new User($db);
                $rowxs = $users->all();
                foreach ($rowxs as $rowx) {
                    echo '<tr>';
                    echo '<td>' . $rowx['token'] . '</td>';
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