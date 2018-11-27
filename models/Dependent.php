<?php
    class Dependent {
        private $conn;
        private $table = 'quest_dependency';

        public $id;
        public $questionid;
        public $surveyid;
        public $dependquestionid;
        public $dependchoiceid;
        public $dependlogic;
        public $dependandor;


        public function __construct($db)
        {
            $this->conn = $db;
        }

        public function create(){
            $query = 'INSERT INTO '. $this->table . ' SET '.
                    'questionid=:questionid, '.
                    'surveyid=:surveyid, '.
                    'dependquestionid=:dependquestionid, '.
                    'dependchoiceid=:dependchoiceid, '.
                    'dependlogic=0, '.
                    'dependandor=0';
            $stmt = $this->conn->prepare($query);

            $this->questionid = $this->questionid;
            $this->surveyid = $this->surveyid;
            $this->dependquestionid = $this->dependquestionid;
            $this->dependchoiceid = $this->dependchoiceid;

            $stmt->bindParam(':questionid', $this->questionid);
            $stmt->bindParam(':surveyid', $this->surveyid);
            $stmt->bindParam(':dependquestionid', $this->dependquestionid);
            $stmt->bindParam(':dependchoiceid', $this->dependchoiceid);

            if($stmt->execute()){
                return true;
            }

            return false;
        }

        public function check() {
            $query = 'SELECT * FROM '. $this->table . 
                ' WHERE questionid=:questionid AND surveyid=:surveyid';
            $stmt = $this->conn->prepare($query);

            $this->questionid = $this->questionid;
            $this->surveyid = $this->surveyid;

            $stmt->bindParam(':questionid', $this->questionid);
            $stmt->bindParam(':surveyid', $this->surveyid);

            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            
            if ($rows) {
                return $rows;
            }

            return false;
        }

        public function all() {
            $query = 'SELECT * FROM ' . $this->table . ' AS a ' .
                'INNER JOIN quest_question AS b ON b.id=a.dependquestionid '.
                ' WHERE a.questionid=:questionid AND a.surveyid=:surveyid'.
                ' GROUP BY b.id';
            $stmt = $this->conn->prepare($query);

            $this->questionid = $this->questionid;
            $this->surveyid = $this->surveyid;

            $stmt->bindParam(':questionid', $this->questionid);
            $stmt->bindParam(':surveyid', $this->surveyid);

            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if ($rows) {
                return $rows;
            }

            return false;
        }

        public function getChoice (){
            $query = 'SELECT a.content FROM quest_question_choice 
                    AS a WHERE 
                    value 
                    IN(SELECT dependchoiceid FROM quest_dependency 
                    WHERE 
                    questionid=:questionid AND dependquestionid=:dependquestionid) 
                    AND value !=0 AND question_id=:dependquestionid';
            $stmt = $this->conn->prepare($query);

            $this->questionid = $this->questionid;
            $this->dependquestionid = $this->dependquestionid;

            $stmt->bindParam(':questionid', $this->questionid);
            $stmt->bindParam(':dependquestionid', $this->dependquestionid);

            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if ($rows) {
                return $rows;
            }

            return false;
        }
    }