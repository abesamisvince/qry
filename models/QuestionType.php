<?php
    class QuestionType {
        private $conn;
        private $table = 'question_type';

        public $id;
        public $type_id;
        public $type_;
        public $has_choices;
        public $response_tbl;

        public function __construct($db)
        {   
            $this->conn = $db;
        }

        public function create () {
            $query = 'INSERT INTO ' . $this->table . ' SET '.
                        'type_id=:type_id '.
                        'type_=:type_ '.
                        'has_choices=:has_choices '.
                        'response_tbl=:response_tbl';
            
            $stmt = $this->conn->prepare($query);

            $this->type_id = htmlspecialchars(strip_tags($this->type_id));
            $this->type_ = htmlspecialchars(strip_tags($this->type_));
            $this->has_choices = htmlspecialchars(strip_tags($this->has_choices));
            $this->response_tbl = htmlspecialchars(strip_tags($this->response_tbl));

            $stmt->bindParam(':type_id', $this->type_id);
            $stmt->bindParam(':type_', $this->type_);
            $stmt->bindParam(':has_choices', $this->has_choices);
            $stmt->bindParam(':response_tbl', $this->response_tbl);


            if($stmt->execute()){
                return true;
            }

            printf("Error: %s.\n", $stmt->error);
            return false;
        }

        public function all () {
            $query = 'SELECT * FROM ' . $this->table . ' ORDER BY type_';
            $stmt = $this->conn->prepare($query);

            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if($rows){
                return $rows;
            }

            return false;
        }

        public function find () {
            $query = 'SELECT * FROM ' . $this->table . ' WHERE type_id=:type_id';
            $stmt = $this->conn->prepare($query);

            $stmt->bindParam(':type_id', $this->type_id);

            $stmt->execute();
            $rows = $stmt->fetch(PDO::FETCH_ASSOC);

            if($rows){
                return $rows;
            }

            return false;
        }
    }