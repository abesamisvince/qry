<?php
    class Questionnaire{
        private $conn;
        private $table = 'questionnaires';

        public $id;
        public $questionnaire;
        public $program;
        public $for_;
        public $status;
        public $curr_school;

        public function __construct($db)
        {   
            $this->conn = $db;
        }

        public function create() {
            $query = 'INSERT INTO '. $this->table . ' SET '.
                    'questionnaire=:questionnaire, '.
                    'program=:program, '.
                    'for_=:for_, '.
                    '$status=false';
            $stmt = $this->conn->prepare($query);

            $this->questionnaire = htmlspecialchars(strip_tags($this->questionnaire));
            $this->program = htmlspecialchars(strip_tags($this->program));
            $this->for_ = htmlspecialchars(strip_tags($this->for_));

            $stmt->bindParam(':questionnaire', $this->questionnaire);
            $stmt->bindParam(':program', $this->program);
            $stmt->bindParam(':for_', $this->for_);

            if($stmt->execute()){
                return true;
            }

            printf("Error: %s.\n", $stmt->error);
            return false;
        }

        public function find() {
            $query = 'SELECT * FROM '. $this->table . ' WHERE id=:id';
            $stmt = $this->conn->prepare($query);

            $this->id = htmlspecialchars(strip_tags($this->id));

            $stmt->bindParam(':id', $this->id);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if($row){
                $this->id = $row['id'];
                $this->questionnaire = $row['questionnaire'];
                $this->program = $row['program'];
                $this->for_ = $row['for_'];
                $this->status = $row['status'];
                $this->curr_school = $row['curr_school'];
            }

            return false;
        }

        public function all() {
            $query = 'SELECT * FROM ' . $this->table;
            $stmt = $this->conn->prepare($query);

            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if($rows){
                return $rows;
            }

            return false;
        }

        public function active() {
            $query = 'SELECT * FROM ' . $this->table . ' WHERE status=true';
            $stmt = $this->conn->prepare($query);

            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if($rows){
                return $rows;
            }

            return false;
        }

        public function activate() {
            $query = 'UPDATE '. $this->table . ' SET status=!status WHERE id=:id';
            $stmt = $this->conn->prepare($query);

            $this->id = htmlspecialchars(strip_tags($this->id));
            $stmt->bindParam(':id', $this->id);
            if($stmt->execute()){
                return true;
            }
            
            return false;
        }

        public function activeSchool(){
            $query = 'UPDATE ' . $this->table . ' SET curr_school=:curr_school WHERE id=:id';
            $stmt = $this->conn->prepare($query);

            $this->curr_school = htmlspecialchars(strip_tags($this->curr_school));
            $this->id = htmlspecialchars(strip_tags($this->id));
            $stmt->bindParam(':id', $this->id);
            $stmt->bindParam(':curr_school', $this->curr_school);
            if ($stmt->execute()) {
                return true;
            }

            return false;
        }

    }