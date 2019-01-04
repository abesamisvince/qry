<?php

class Table {
    private $conn;
    public $table;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function all()
    {
        $query = 'SELECT * FROM ' . $this->table;
        $stmt = $this->conn->prepare($query);

        $stmt->execute();
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if ($rows) {
            return $rows;
        }

        return false;
    }
}