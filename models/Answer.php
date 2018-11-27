<?php
    class Answer {
        private $conn;
        public $table;
        public $type;

        public $id;
        public $response_id;
        public $question_id;
        public $choice_id;
        public $rank;
        public $response;

        public function __construct($db)
        {
            $this->conn = $db;
        }

        public function create() {
            $this->table = $this->table;
            $this->response_id = $this->response_id;
            $this->question_id = $this->question_id;
            $this->choice_id = $this->choice_id;
            
            $this->response = htmlspecialchars(strip_tags($this->response));

            $this->type = $this->type;
            if($this->type == 6){
                //Rank Type
                $this->rank = $this->rank;
                $query = 'INSERT INTO '. $this->table .' SET '.
                    'response_id=:response_id, '.
                    'question_id=:question_id, '.
                    'choice_id=:choice_id, '.
                    'rank=:rank';
                $stmt = $this->conn->prepare($query);

                $stmt->bindParam(':response_id', $this->response_id);
                $stmt->bindParam(':question_id', $this->question_id);
                $stmt->bindParam(':choice_id', $this->choice_id);
                $stmt->bindParam(':rank', $this->rank);
            }elseif($this->type == 2 || $this->type == 7){
                //Text and numeric
                $query = 'INSERT INTO '. $this->table .' SET '.
                    'response_id=:response_id, '.
                    'question_id=:question_id, '.
                    'response=:response';
                $stmt = $this->conn->prepare($query);

                $stmt->bindParam(':response_id', $this->response_id);
                $stmt->bindParam(':question_id', $this->question_id);
                $stmt->bindParam(':response', $this->response);
            }else {
                // Choice and Single Choice
                $query = 'INSERT INTO '. $this->table .' SET '.
                    'response_id=:response_id, '.
                    'question_id=:question_id, '.
                    'choice_id=:choice_id';
                $stmt = $this->conn->prepare($query);

                $stmt->bindParam(':response_id', $this->response_id);
                $stmt->bindParam(':question_id', $this->question_id);
                $stmt->bindParam(':choice_id', $this->choice_id);
            }
            
            if($stmt->execute()){
                return true;
            }

            return false;
        }

        public function findAnswer() {
            $this->table = $this->table;
            $this->response_id = $this->response_id;
            $this->question_id = $this->question_id;
            $this->choice_id = $this->choice_id;

            if($this->type == 4){
                // Look in quest_response_multiple
                
            }elseif($this->type == 1 || $this->type == 3 || $this->type == 5){
                // Look in quest_response_single
                $query = 'SELECT * FROM ' . $this->table . ' WHERE '.
                        'response_id=:response_id AND question_id=:question_id AND choice_id=:choice_id';
                $stmt = $this->conn->prepare($query);

                $stmt->bindParam(':response_id', $this->response_id);
                $stmt->bindParam(':question_id', $this->question_id);
                $stmt->bindParam(':choice_id', $this->choice_id);

                $stmt->execute();
                $row = $stmt->fetch(PDO::FETCH_ASSOC);

                if ($row) {
                    return 1;
                }

                return 0;
                
            }
        }
    }