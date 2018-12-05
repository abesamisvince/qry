<?php
    class Choice {
        private $conn;
        private $table = 'quest_question_choice';

        public $id;
        public $question_id;
        public $content;
        public $value;

        public function __construct($db)
        {   
            $this->conn = $db;
        }

        public function create() {
            $query = 'INSERT INTO ' . $this->table . ' SET '.
                        'question_id=:question_id, '.
                        'content=:content, '.
                        'value=:value';
            
            $stmt = $this->conn->prepare($query);

            $this->question_id = htmlspecialchars(strip_tags($this->question_id));
            $this->content = htmlspecialchars(strip_tags($this->content));
            $this->value = htmlspecialchars(strip_tags($this->value));

            $stmt->bindParam(':question_id', $this->question_id);
            $stmt->bindParam(':content', $this->content);
            $stmt->bindParam(':value', $this->value);


            if($stmt->execute()){
                return true;
            }

            printf("Error: %s.\n", $stmt->error);
            return false;
        }

        public function all() {
            $query = 'SELECT * FROM ' . $this->table . ' WHERE question_id=:question_id ORDER BY value';
            $stmt = $this->conn->prepare($query);

            $stmt->bindParam(':question_id', $this->question_id);

            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if($rows){
                return $rows;
            }

            return false;
        }
    }