<?php
    class User {
        private $conn;
        private $table = 'users';

        public $id;
        public $token;
        public $user_type;

        public function __construct($db)
        {   
            $this->conn = $db;
        }

        public function login() {
            $query = 'SELECT * FROM '. $this->table .' WHERE token=:token';
            $stmt = $this->conn->prepare($query);
            $stmt->bindParam(':token', $this->token);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if($row){
                $this->token = $row['token'];
                $this->user_type = $row['user_type'];

                return true;
            }
            
            //printf("Error: %s.\n", $stmt->error);
            return false;
        }

        public function create() {
            $query = 'INSERT INTO ' . $this->table . ' SET token=:token, user_type=:user_type';
            $stmt = $this->conn->prepare($query);

            $this->token = htmlspecialchars(strip_tags($this->token));
            $this->user_type = htmlspecialchars(strip_tags($this->user_type));

            $stmt->bindParam(':token', $this->token);
            $stmt->bindParam(':user_type', $this->user_type);

            if($stmt->execute()){
                return true;
            }

            printf("Error: %s.\n", $stmt->error);
            return false;
        }

        public function all(){
            $query = 'SELECT * FROM ' . $this->table . ' ORDER BY token';
            $stmt = $this->conn->prepare($query);

            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if ($rows) {
                return $rows;
            }

            return false;
        }

        public function find(){
            $query = 'SELECT * FROM ' . $this->table . ' WHERE token=:token';
            $stmt = $this->conn->prepare($query);

            $this->token = htmlspecialchars(strip_tags($this->token));

            $stmt->bindParam(':token', $this->token);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($row) {
                $this->id = $row['id'];
                $this->token = $row['token'];
                $this->user_type = $row['user_type'];
                return true;
            }

            return false;
        }
    }