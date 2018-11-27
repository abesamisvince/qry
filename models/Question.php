<?php
    class Question{
        private $conn;
        private $table = 'quest_question';

        public $id;
        public $question_id;
        public $quest_id;
        public $name;
        public $type_id;
        public $question;
        public $required;
        public $position;
        public $min;
        public $max;
        public $status_;
        public $lastid;

        public $offset;

        public function __construct($db)
        {   
            $this->conn = $db;
        }

        // private function createID() {
        //     $this->username = $this->username;
        //     $this->school_id = $this->school_id;

        //     $key = $this->username . $this->school_id;
        //     return md5(uniqid($key, true));
        // }

        public function create() {
            $query = 'INSERT INTO '. $this->table . ' SET '.
            'quest_id=:quest_id, '.
            'name=:name, '.
            'type_id=:type_id, '.
            'question=:question, '.
            'required=:required, '.
            'position=:position, '.
            'min=:min, '.
            'max=:max, '.
            'status_=true ';
            $stmt = $this->conn->prepare($query);

            $this->quest_id = $this->quest_id;
            $this->name = htmlspecialchars(strip_tags($this->name));
            $this->type_id = htmlspecialchars(strip_tags($this->type_id));
            $this->question = htmlspecialchars(strip_tags($this->question));
            $this->required = htmlspecialchars(strip_tags($this->required));
            $this->position = $this->position;
            $this->min = $this->min;
            $this->max = $this->max;

            $stmt->bindParam(':quest_id', $this->quest_id);
            $stmt->bindParam(':name', $this->name);
            $stmt->bindParam(':type_id', $this->type_id);
            $stmt->bindParam(':question', $this->question);
            $stmt->bindParam(':required', $this->required);
            $stmt->bindParam(':position', $this->position);
            $stmt->bindParam(':min', $this->min);
            $stmt->bindParam(':max', $this->max);    

            if($stmt->execute()){
                return true;
            }

            printf("Error: %s.\n", $stmt->error);
            return false;
        }

        public function all() {
            $query = 'SELECT * FROM ' . $this->table . ' WHERE quest_id=:quest_id AND type_id!=8 ORDER BY position';
            $stmt = $this->conn->prepare($query);

            $stmt->bindParam(':quest_id', $this->quest_id);

            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if($rows){
                return $rows;
            }

            return false;
        }

        public function find() {
            $query = 'SELECT * FROM '. $this->table . ' WHERE id=:id';
            $stmt = $this->conn->prepare($query);

            $this->id = $this->id;

            $stmt->bindParam(':id', $this->id);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if($row){
                $this->id = $row['id'];
                $this->quest_id = $row['quest_id'];
                $this->name = $row['name'];
                $this->type_id = $row['type_id'];
                $this->question = $row['question'];
                $this->required = $row['required'];
                $this->position = $row['position'];
                $this->min = $row['min'];
                $this->max = $row['max'];
                $this->status_ = $row['status_'];
                return true;
            }

            return false;
        }

        public function update() {
            $query = 'UPDATE '.$this->table.' SET '.
                    'name=:name, ' .
                    'question=:question, ' .
                    'required=:required, ' .
                    'min=:min, ' .
                    'max=:max ' .
                    'WHERE id=:id';
            $stmt = $this->conn->prepare($query);

            $this->id = $this->id;
            $this->name = htmlspecialchars(strip_tags($this->name));
            $this->question = htmlspecialchars(strip_tags($this->question));
            $this->required = htmlspecialchars(strip_tags($this->required));
            $this->min = $this->min;
            $this->max = $this->max;

            $stmt->bindParam(':id', $this->id);
            $stmt->bindParam(':name', $this->name);
            $stmt->bindParam(':question', $this->question);
            $stmt->bindParam(':required', $this->required);
            $stmt->bindParam(':min', $this->min);
            $stmt->bindParam(':max', $this->max);

            if ($stmt->execute()) {
                return true;
            }

            printf("Error: %s.\n", $stmt->error);
            return false;
        }

        public function remove() {
            $query = 'DELETE FROM ' . $this->table . ' WHERE id=:id';
            $stmt = $this->conn->prepare($query);

            $this->id = htmlspecialchars(strip_tags($this->id));

            $stmt->bindParam(':id', $this->id);
            if($stmt->execute()){
                return true;
            }

            return false;
        }

        public function updatePosition() {
            $query = 'UPDATE ' . $this->table ;
        }

        public function getPosition() {
            $query = 'SELECT position from '. $this->table . ' WHERE quest_id=:quest_id ORDER BY position DESC LIMIT 1';
            $stmt = $this->conn->prepare($query);

            $stmt->bindParam(':quest_id', $this->quest_id);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if($row) {
                return $row['position'] + 1;
            }
            
            return 1;
            
        }

        public function next() {
            $query = 'SELECT * FROM ' . $this->table . ' WHERE quest_id=:quest_id AND `position`=:offsetx AND type_id!=8';
            // $query = 'SELECT * FROM '. $this->table . ' WHERE quest_id=:quest_id ORDER BY `position` LIMIT :offsetx , 1';
            $stmt = $this->conn->prepare($query);

            $this->offset = $this->offset - 1;
            $this->quest_id =$this->quest_id;
   

            $stmt->bindParam(':quest_id', intval($this->quest_id), PDO::PARAM_INT);
            $stmt->bindParam(':offsetx', intval($this->offset), PDO::PARAM_INT);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if($row){
                return $row['id'];
            }
            

            return false;
        }

        public function nextQuestion() {
            $query = 'SELECT * FROM ' . $this->table . ' WHERE quest_id=:quest_id AND `position`=:offsetx AND type_id!=8';
            $stmt = $this->conn->prepare($query);

            $this->offset = $this->offset;
            $this->quest_id = $this->quest_id;


            $stmt->bindParam(':quest_id', intval($this->quest_id), PDO::PARAM_INT);
            $stmt->bindParam(':offsetx', intval($this->offset), PDO::PARAM_INT);
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if ($rows) {
                return $rows;
            }

            return false;
        }

        public function header(){
            $query = 'SELECT * FROM '. $this->table . ' WHERE position=:position AND type_id=8';
            $stmt = $this->conn->prepare($query);

            $this->position = $this->position;


            $stmt->bindParam(':position', intval($this->position), PDO::PARAM_INT);
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if ($rows) {
                return $rows;
            }

            return false;
        }

        public function nextCountr()
        {
            $query = 'SELECT COUNT(id) AS countx FROM ' . $this->table . ' WHERE quest_id=:quest_id AND `position`=:offsetx AND type_id!=8';
            $stmt = $this->conn->prepare($query);

            $this->offset = $this->offset;
            $this->quest_id = $this->quest_id;


            $stmt->bindParam(':quest_id', intval($this->quest_id), PDO::PARAM_INT);
            $stmt->bindParam(':offsetx', intval($this->offset), PDO::PARAM_INT);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($row) {
                return $row['countx'];
            }

            return false;
        }

        

    }