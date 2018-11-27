<?php
    class Response {
        private $conn;
        private $table = 'quest_response';

        public $id;
        public $response_id;
        public $quest_id;
        public $submitted;
        public $complete;
        public $username;
        public $school_id;

        public function __construct($db)
        {
            $this->conn = $db;
        }

        public function checkResponseID(){
            $query = 'SELECT response_id FROM '. $this->table .' WHERE response_id=:response_id';
            $stmt = $this->conn->prepare($query);

            $this->response_id = $this->response_id;

            $stmt->bindParam(':response_id', $this->response_id);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if($row){
                return true;
            }
            return false;
        }

        public function createId() {
            $this->username = $this->username;
            $this->school_id = $this->school_id;
            
            $key = $this->username.$this->school_id;
            return md5(uniqid($key, true));
        }
        
        public function create() {
            $query = 'INSERT INTO '. $this->table . ' SET '.
                'response_id=:response_id, '.
                'quest_id=:quest_id, '.
                'submitted=:submitted, '.
                'complete=:complete, '.
                'username=:username, '.
                'school=:school_id';

            $stmt = $this->conn->prepare($query);
            
            $this->response_id = $this->response_id;
            $this->quest_id = $this->quest_id;
            $this->submitted = time();
            $this->complete = 1;
            $this->username = $this->username;
            $this->school_id = $this->school_id;

            $stmt->bindParam(':response_id', $this->response_id);
            $stmt->bindParam(':quest_id', $this->quest_id);
            $stmt->bindParam(':submitted', $this->submitted);
            $stmt->bindParam(':complete', $this->complete);
            $stmt->bindParam(':username', $this->username);
            $stmt->bindParam(':school_id', $this->school_id);

            if($stmt->execute()){
                return true;
            }

            printf("Error: %s.\n", $stmt->error);
            return false;
        }

        public function find() {
            $query = 'SELECT * FROM '.$this->table.' WHERE response_id=response_id';
            $stmt = $this->conn->prepare($query);

            $this->response_id = $this->response_id;

            $stmt->bindParam(':response_id', $this->response_id);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            if($row){
                $this->id = $row['id'];
                $this->response_id = $row['response_id'];
                $this->quest_id = $row['quest_id'];
                $this->submitted = $row['submitted'];
                $this->complete = $row['complete'];
                $this->username = $row['username'];
                $this->school_id = $row['school'];

                return true;
            }   
            return false;
        }

        public function findSchool() {
            $query = 'SELECT * FROM ' 
                . $this->table . ' 
                WHERE quest_id=:quest_id AND school=:school_id';

            $stmt = $this->conn->prepare($query);

            $this->quest_id = $this->quest_id;
            $this->school_id = $this->school_id;

            $stmt->bindParam(':quest_id', $this->quest_id);
            $stmt->bindParam(':school_id', $this->school_id);

            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if($rows){
                return $rows;
            }

            return false;
        }

        public function check() {
            $query = 'SELECT * FROM '.$this->table.' WHERE quest_id=:quest_id AND username=:username AND school=:school_id';
            $stmt = $this->conn->prepare($query);

            $this->username = $this->username;
            $this->school_id = $this->school_id;
            $this->quest_id = $this->quest_id;

            $stmt->bindParam(':quest_id', $this->quest_id);
            $stmt->bindParam(':username', $this->username);
            $stmt->bindParam(':school_id', $this->school_id);

            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if($row){
                $this->id = $row['id'];
                $this->response_id = $row['response_id'];
                $this->quest_id = $row['quest_id'];
                $this->submitted = $row['submitted'];
                $this->complete = $row['complete'];
                $this->username = $row['username'];
                $this->school_id = $row['school'];
                return true;
            }

            return false;
        }

        public function updatePosition() {
            $query = 'UPDATE '. $this->table . ' SET complete=:complete WHERE response_id=:response_id';
            $stmt = $this->conn->prepare($query);

            $this->complete = $this->complete;
            $this->response_id = $this->response_id;

            $stmt->bindParam(':complete', $this->complete);
            $stmt->bindParam(':response_id', $this->response_id);

            if($stmt->execute()){
                return true;
            }

            return false;
        }

        public function findPosition() {
            $query = 'SELECT complete FROM '. $this->table . ' WHERE response_id=:response_id';
            $stmt = $this->conn->prepare($query);

            $stmt->bindParam(':response_id', $this->response_id);

            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if ($rows) {
                
                return $rows;
            }

            return false;
        }

        public function countResponses(){
            $query = 'SELECT COUNT(response_id) AS rescount FROM '. $this->table . ' WHERE quest_id=:quest_id';
            $stmt = $this->conn->prepare($query);

            $this->quest_id = $this->quest_id;

            $stmt->bindParam(':quest_id', $this->quest_id);

            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($row) {
                return $row['rescount'];
            }

            return false;
        }

        public function truncate(){
            $query = 'TRUNCATE TABLE '.$this->table;
            $stmt = $this->conn->prepare($query);

            if ($stmt->execute()) {
                return true;
            }

            return false;
        }

        public function getResSchools () {
            $query = 'SELECT schoolname, schoolid, program FROM schools 
                    WHERE 
                    schoolid IN
                    (SELECT DISTINCT(school) FROM quest_response WHERE quest_id=:quest_id)';
            $stmt = $this->conn->prepare($query);

            $this->quest_id = $this->quest_id;

            $stmt->bindParam(':quest_id', $this->quest_id);

            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if($rows){
                return $rows;
            }

            return false;
        }

    }