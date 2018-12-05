<?php
    class Sync{
        private $conn;
        private $table = 'questionnaires';
        
        public function __construct($db)
        {   
            $this->conn = $db;
        }
    }