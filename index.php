<?php 
session_start();

if(isset($_SESSION['user']) && isset($_SESSION['user_type'])){
    if($_SESSION['user_type']==1){
        header('Location: admin/index.php');
    }elseif($_SESSION['user_type']==2){
        header('Location: user/index.php');
    }
}
$errormsg = '';
if(isset($_POST['submit'])){
    include_once './config/Database.php';
    include_once './models/User.php';

    $database = new Database();
    $db = $database->connect();

    $user = new User($db);

    $user->token = $_POST['qry_token'];

    if($user->login()){
        $_SESSION['user'] = $user->token;
        $_SESSION['user_type'] = $user->user_type;
        if($_SESSION['user_type']==1){
            header('Location: admin/index.php');
        }else{
            header('Location: user/index.php');
        }
    }else{
        $errormsg = 'Invalid token.';
    }
}
include_once './header.php';
?>


<body>
    <div class="ui middle aligned center aligned grid">
        <div class="column">
        <div class="ui stacked segment">
        <img src="assets/aralinksfront.png" class="image center">
        <br>
            <h2 class="ui icon header blue">
            <div class="content">
                Aralinks QRY
            </div>
            </h2>
            <form class="ui big form" method="POST" action="<?php $_SERVER['PHP_SELF']; ?>">
                <div class="ui stacked segment">
                    <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <input type="password" name="qry_token" placeholder="Token">
                    </div>
                    </div>
                    <button class="ui fluid large blue submit button" name="submit">Enter</button>
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
        </div>
    </div>
    <script>
        if ( window.history.replaceState ) {
            window.history.replaceState( null, null, window.location.href );
        }
    </script>
</body>
</html>