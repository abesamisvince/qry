<?php
    class School {
        private $conn;
        private $table = 'schools';

        public $schoolname;
        public $schoolid;
        public $program;
        public $status;

        public function __construct($db)
        {   
            $this->conn = $db;
        }

        public function create() {
            $query = 'INSERT INTO '. $this->table . ' SET '.
                    'schoolname=:schoolname, '.
                    'schoolid=:schoolid, '.
                    'program=:program, '.
                    'status=false';
            $stmt = $this->conn->prepare($query);
            

            $this->schoolname = htmlspecialchars(strip_tags($this->schoolname));
            $this->program = htmlspecialchars(strip_tags($this->program));
            // Set school unique ID
            $this->schoolid = md5(uniqid($this->schoolname.$this->program, TRUE));
            $this->schoolid = htmlspecialchars(strip_tags($this->schoolid));

            $stmt->bindParam(':schoolname', $this->schoolname);
            $stmt->bindParam(':schoolid', $this->schoolid);
            $stmt->bindParam(':program', $this->program);

            if($stmt->execute()){
                return true;
            }

            printf("Error: %s.\n", $stmt->error);
            return false;
        }

        public function find() {
            $query = 'SELECT * FROM '. $this->table . ' WHERE schoolid=:schoolid';
            $stmt = $this->conn->prepare($query);

            $this->schoolid = htmlspecialchars(strip_tags($this->schoolid));

            $stmt->bindParam(':schoolid', $this->schoolid);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if($row){
                $this->schoolname = $row['schoolname'];
                $this->program = $row['program'];
                $this->status = $row['status'];
            }

            return false;
        }

        public function all() {
            $query = 'SELECT * FROM ' . $this->table .' ORDER BY schoolname';
            $stmt = $this->conn->prepare($query);

            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if($rows){
                return $rows;
            }

            return false;
        }

        public function activate() {
            $query = 'UPDATE '. $this->table . ' SET status=!status WHERE schoolid=:schoolid';
            $stmt = $this->conn->prepare($query);

            $this->schoolid = htmlspecialchars(strip_tags($this->schoolid));
            $stmt->bindParam(':schoolid', $this->schoolid);
            if($stmt->execute()){
                return true;
            }
            
            return false;
        }

        public function deactivateAll() {
            $query = 'UPDATE '. $this->table . ' SET status=false WHERE status=true';
            $stmt = $this->conn->prepare($query);
            if($stmt->execute()){
                return true;
            }
            
            return false;
        }

        public function active() {
            $query = 'SELECT * FROM '. $this->table . ' WHERE status=true';
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            if($row){
                $this->schoolid = $row['schoolid'];
                $this->schoolname = $row['schoolname'];
                $this->program = $row['program'];
                $this->status = $row['status'];
                return true;
            }

            return false;
        }

    }