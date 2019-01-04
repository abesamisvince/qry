<?php
    class Sync{
        private $conn;
        public $table;

        // Response Table Params
        public $id;
        public $response_id;
        public $quest_id;
        public $submitted;
        public $complete;
        public $username;
        public $school_id;


        public $choice_id;
        public $question_id;
        public $rank;
        public $response;
        
        public function __construct($db)
        {   
            $this->conn = $db;
        }

        public function all() {
            $query = 'SELECT * FROM '.$this->table;
            $stmt = $this->conn->prepare($query);

            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if($rows){
                return $rows;
            }

            return false;
        }

        public function syncResponseDups() {
            $query = 'SELECT response_id FROM quest_response WHERE response_id=:response_id AND school=:school_id';
            $stmt = $this->conn->prepare($query);

            $this->response_id = $this->response_id;
            $this->school_id = $this->school_id;

            $stmt->bindParam(':response_id', $this->response_id);
            $stmt->bindParam(':school_id', $this->school_id);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if($row){
                return true;
            }
            return false;
        }

        public function syncResponse(){
            $query = 'INSERT INTO quest_response SET ' .
                'response_id=:response_id, ' .
                'quest_id=:quest_id, ' .
                'submitted=:submitted, ' .
                'complete=:complete, ' .
                'username=:username, ' .
                'school=:school_id';

            $stmt = $this->conn->prepare($query);

            $this->response_id = $this->response_id;
            $this->quest_id = $this->quest_id;
            $this->submitted = $this->submitted;
            $this->complete = $this->complete;
            $this->username = $this->username;
            $this->school_id = $this->school_id;

            $stmt->bindParam(':response_id', $this->response_id);
            $stmt->bindParam(':quest_id', $this->quest_id);
            $stmt->bindParam(':submitted', $this->submitted);
            $stmt->bindParam(':complete', $this->complete);
            $stmt->bindParam(':username', $this->username);
            $stmt->bindParam(':school_id', $this->school_id);

            if ($stmt->execute()) {
                return true;
            }

            printf("Error: %s.\n", $stmt->error);
            return false;
        }


        public function syncResponseBoolDups() {
            $query = 'SELECT response_id FROM quest_response_bool WHERE response_id=:response_id AND question_id=:question_id AND choice_id=:choice_id';
            $stmt = $this->conn->prepare($query);

            $this->response_id = $this->response_id;
            $this->question_id = $this->question_id;
            $this->choice_id = $this->choice_id;

            $stmt->bindParam(':response_id', $this->response_id);
            $stmt->bindParam(':question_id', $this->question_id);
            $stmt->bindParam(':choice_id', $this->choice_id);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if($row){
                return true;
            }
            return false;
        }

        public function syncResponseBool() {
            $query = 'INSERT INTO quest_response_bool SET ' .
                'response_id=:response_id, ' .
                'question_id=:question_id, ' .
                'choice_id=:choice_id';


            $stmt = $this->conn->prepare($query);

            $this->response_id = $this->response_id;
            $this->question_id = $this->question_id;
            $this->choice_id = $this->choice_id;

            $stmt->bindParam(':response_id', $this->response_id);
            $stmt->bindParam(':question_id', $this->question_id);
            $stmt->bindParam(':choice_id', $this->choice_id);

            if ($stmt->execute()) {
                return true;
            }

            printf("Error: %s.\n", $stmt->error);
            return false;
        }

        public function syncResponseMultDups() {
            $query = 'SELECT response_id FROM quest_response_multiple WHERE response_id=:response_id AND question_id=:question_id AND choice_id=:choice_id';
            $stmt = $this->conn->prepare($query);

            $this->response_id = $this->response_id;
            $this->question_id = $this->question_id;
            $this->choice_id = $this->choice_id;

            $stmt->bindParam(':response_id', $this->response_id);
            $stmt->bindParam(':question_id', $this->question_id);
            $stmt->bindParam(':choice_id', $this->choice_id);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if($row){
                return true;
            }
            return false;
        }

        public function syncResponseMult() {
            $query = 'INSERT INTO quest_response_multiple SET ' .
                'response_id=:response_id, ' .
                'question_id=:question_id, ' .
                'choice_id=:choice_id';


            $stmt = $this->conn->prepare($query);

            $this->response_id = $this->response_id;
            $this->question_id = $this->question_id;
            $this->choice_id = $this->choice_id;

            $stmt->bindParam(':response_id', $this->response_id);
            $stmt->bindParam(':question_id', $this->question_id);
            $stmt->bindParam(':choice_id', $this->choice_id);

            if ($stmt->execute()) {
                return true;
            }

            printf("Error: %s.\n", $stmt->error);
            return false;
        }

        public function syncResponseRankDups() {
            $query = 'SELECT response_id FROM quest_response_rank WHERE response_id=:response_id AND question_id=:question_id AND choice_id=:choice_id AND rank=:rank';
            $stmt = $this->conn->prepare($query);

            $this->response_id = $this->response_id;
            $this->question_id = $this->question_id;
            $this->choice_id = $this->choice_id;
            $this->rank = $this->rank;

            $stmt->bindParam(':response_id', $this->response_id);
            $stmt->bindParam(':question_id', $this->question_id);
            $stmt->bindParam(':choice_id', $this->choice_id);
            $stmt->bindParam(':rank', $this->rank);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if($row){
                return true;
            }
            return false;
        }

        public function syncResponseRank() {
            $query = 'INSERT INTO quest_response_rank SET ' .
                'response_id=:response_id, ' .
                'question_id=:question_id, ' .
                'choice_id=:choice_id, '.
                'rank=:rank';


            $stmt = $this->conn->prepare($query);

            $this->response_id = $this->response_id;
            $this->question_id = $this->question_id;
            $this->choice_id = $this->choice_id;
            $this->rank = $this->rank;

            $stmt->bindParam(':response_id', $this->response_id);
            $stmt->bindParam(':question_id', $this->question_id);
            $stmt->bindParam(':choice_id', $this->choice_id);
            $stmt->bindParam(':rank', $this->rank);

            if ($stmt->execute()) {
                return true;
            }

            printf("Error: %s.\n", $stmt->error);
            return false;
        }

        public function syncResponseSingleDups() {
            $query = 'SELECT response_id FROM quest_response_single WHERE response_id=:response_id AND question_id=:question_id AND choice_id=:choice_id';
            $stmt = $this->conn->prepare($query);

            $this->response_id = $this->response_id;
            $this->question_id = $this->question_id;
            $this->choice_id = $this->choice_id;

            $stmt->bindParam(':response_id', $this->response_id);
            $stmt->bindParam(':question_id', $this->question_id);
            $stmt->bindParam(':choice_id', $this->choice_id);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if($row){
                return true;
            }
            return false;
        }

        public function syncResponseSingle() {
            $query = 'INSERT INTO quest_response_single SET ' .
                'response_id=:response_id, ' .
                'question_id=:question_id, ' .
                'choice_id=:choice_id';


            $stmt = $this->conn->prepare($query);

            $this->response_id = $this->response_id;
            $this->question_id = $this->question_id;
            $this->choice_id = $this->choice_id;

            $stmt->bindParam(':response_id', $this->response_id);
            $stmt->bindParam(':question_id', $this->question_id);
            $stmt->bindParam(':choice_id', $this->choice_id);

            if ($stmt->execute()) {
                return true;
            }

            printf("Error: %s.\n", $stmt->error);
            return false;
        }

        public function syncResponseTextDups() {
            $query = 'SELECT response_id FROM quest_response_text WHERE response_id=:response_id AND question_id=:question_id AND response=:response';
            $stmt = $this->conn->prepare($query);

            $this->response_id = $this->response_id;
            $this->question_id = $this->question_id;
            $this->response = $this->response;

            $stmt->bindParam(':response_id', $this->response_id);
            $stmt->bindParam(':question_id', $this->question_id);
            $stmt->bindParam(':response', $this->response);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if($row){
                return true;
            }
            return false;
        }

        public function syncResponseText() {
            $query = 'INSERT INTO quest_response_text SET ' .
                'response_id=:response_id, ' .
                'question_id=:question_id, ' .
            'response=:response';


            $stmt = $this->conn->prepare($query);

            $this->response_id = $this->response_id;
            $this->question_id = $this->question_id;
            $this->response = $this->response;

            $stmt->bindParam(':response_id', $this->response_id);
            $stmt->bindParam(':question_id', $this->question_id);
            $stmt->bindParam(':response', $this->response);

            if ($stmt->execute()) {
                return true;
            }

            printf("Error: %s.\n", $stmt->error);
            return false;
        }

    }