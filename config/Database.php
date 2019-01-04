<?php
    class Database{
        private $host = 'localhost';
        private $db_name = 'qry_db5';
        private $username = 'root';
        private $password = '';
        private $conn;

        public function connect() {
            $this->conn = null;
            $options = array(
                PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
                PDO::ATTR_PERSISTENT		=> true,
                PDO::ATTR_ERRMODE		=> PDO::ERRMODE_EXCEPTION
            );

            try{
                $this->conn = new PDO('mysql:host='. $this->host . ';dbname='. $this->db_name, $this->username, $this->password, $options);
            }catch (PDOException $e){
                echo 'Connection Error: ' . $e->getMessage();
            }

            return $this->conn;
        }
    }