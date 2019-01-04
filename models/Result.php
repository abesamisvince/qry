<?php 
    class Result {
        private $conn;
        private $table;

        public $survery_id;
        public $school_id;
        public $question_id;
        public $response_id;
        public $choice_id;

        public function __construct($db)
        {
            $this->conn = $db;
        }

        public function getReponses() {
            $query = 'SELECT response_id FROM quest_response '.
                    ' WHERE quest_id=:quest_id AND school=:school';
            $stmt = $this->conn->prepare($query);

            $this->survery_id = $this->survery_id;
            $this->school_id = $this->school_id;

            $stmt->bindParam(':quest_id', $this->survery_id);
            $stmt->bindParam(':school', $this->school_id);

            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if ($rows) {
                return $rows;
            }

            return false;
        }

        public function text() {
            $query = 'SELECT response FROM quest_response_text '.
                    'WHERE response_id=:response_id AND question_id=:question_id';
            $stmt = $this->conn->prepare($query);

            $this->response_id = $this->response_id;
            $this->question_id = $this->question_id;

            $stmt->bindParam(':response_id', $this->response_id);
            $stmt->bindParam(':question_id', $this->question_id);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($row) {
                return $row;
            }
            return false;
        }

        public function check() {
            $query = 'SELECT COUNT(id) AS checkCount  FROM quest_response_multiple '.
                        ' WHERE ' .
                        ' response_id IN (SELECT response_id FROM quest_response WHERE quest_id=:quest_id AND school=:school_id) AND '.
                        ' (question_id=:question_id AND choice_id=:choice_id)';
            $stmt = $this->conn->prepare($query);

            $this->survery_id = $this->survery_id;
            $this->school_id = $this->school_id;
            $this->question_id = $this->question_id;
            $this->choice_id = $this->choice_id;

            $stmt->bindParam(':quest_id', $this->survery_id);
            $stmt->bindParam(':school_id', $this->school_id);
            $stmt->bindParam(':question_id', $this->question_id);
            $stmt->bindParam(':choice_id', $this->choice_id);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($row) {
                return $row;
            }
            return false;
        }

        public function checkTotal() {
            $query = 'SELECT COUNT(id) AS checkCount  FROM quest_response_multiple ' .
                ' WHERE ' .
                ' response_id IN (SELECT response_id FROM quest_response WHERE quest_id=:quest_id AND school=:school_id) AND ' .
                ' (question_id=:question_id)';
            $stmt = $this->conn->prepare($query);

            $this->survery_id = $this->survery_id;
            $this->school_id = $this->school_id;
            $this->question_id = $this->question_id;


            $stmt->bindParam(':quest_id', $this->survery_id);
            $stmt->bindParam(':school_id', $this->school_id);
            $stmt->bindParam(':question_id', $this->question_id);
 
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($row) {
                return $row;
            }
            return false;
        }

        public function getCheckArray(){
            $query = 'SELECT content, `value` FROM quest_question_choice WHERE question_id=:question_id';
            $stmt = $this->conn->prepare($query);
            $this->question_id = $this->question_id;
            
            $stmt->bindParam(':question_id', $this->question_id);
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            echo '<table class="ui sortable compact celled table">
                    <thead>
                        <tr><th></th>
                        <th>Count</th>
                        <th>Percentage</th>
                    </tr></thead>
                    <tbody>';
            foreach ($rows as $row) {
                $this->choice_id = $row['value'];
                $crow = $this->check();
                echo '<tr>';
                echo '<td data-label="">' . $row['content'] . '</td>';
                echo '<td data-label="Count">' . $crow['checkCount'] . '</td>'; 
                echo '<td data-label="Percentage">';

                echo round(($crow['checkCount']/ $this->checkTotal()['checkCount']) * 100, 2). ' %' ;
                echo '</td>';
                    //  echo $row['content'].'=>'.$crow['checkCount'] .'<br>';
                    // $checkArray[] = '{name: '.$row['content'].',y:'. $crow['checkCount'].'}';
                    // array_push($dataset, $crow['checkCount']);
                    // array_push($dataset2, $row['content']);
                echo '</tr>';
            }
            echo '</tbody>
                    </table>';
            // foreach($rows AS $row){
            //     $this->choice_id = $row['value'];
            //      $crow = $this->check();
            //      echo $row['content'].'=>'.$crow['checkCount'] .'<br>';
            //     // $checkArray[] = '{name: '.$row['content'].',y:'. $crow['checkCount'].'}';
            //     // array_push($dataset, $crow['checkCount']);
            //     // array_push($dataset2, $row['content']);
            // }
            // return $checkArray;
        }

        public function radio() {
            $query = 'SELECT COUNT(id) AS checkCount  FROM quest_response_single '.
                        ' WHERE ' .
                        ' response_id IN (SELECT response_id FROM quest_response WHERE quest_id=:quest_id AND school=:school_id) AND '.
                        ' (question_id=:question_id AND choice_id=:choice_id)';
            $stmt = $this->conn->prepare($query);

            $this->survery_id = $this->survery_id;
            $this->school_id = $this->school_id;
            $this->question_id = $this->question_id;
            $this->choice_id = $this->choice_id;

            $stmt->bindParam(':quest_id', $this->survery_id);
            $stmt->bindParam(':school_id', $this->school_id);
            $stmt->bindParam(':question_id', $this->question_id);
            $stmt->bindParam(':choice_id', $this->choice_id);
            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($row) {
                return $row;
            }
            return false;
        }

        public function radioTotal()
        {
            $query = 'SELECT COUNT(id) AS checkCount  FROM quest_response_single ' .
                ' WHERE ' .
                ' response_id IN (SELECT response_id FROM quest_response WHERE quest_id=:quest_id AND school=:school_id) AND ' .
                ' (question_id=:question_id)';
            $stmt = $this->conn->prepare($query);

            $this->survery_id = $this->survery_id;
            $this->school_id = $this->school_id;
            $this->question_id = $this->question_id;


            $stmt->bindParam(':quest_id', $this->survery_id);
            $stmt->bindParam(':school_id', $this->school_id);
            $stmt->bindParam(':question_id', $this->question_id);

            $stmt->execute();
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($row) {
                return $row;
            }
            return false;
        }

        public function getRadioArray(){
            $query = 'SELECT content, `value` FROM quest_question_choice WHERE question_id=:question_id';
            $stmt = $this->conn->prepare($query);
            $this->question_id = $this->question_id;
            
            $stmt->bindParam(':question_id', $this->question_id);
            $stmt->execute();
            $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            echo '<table class="ui sortable compact celled table">
                <thead>
                    <tr><th></th>
                    <th>Count</th>
                    <th>Percentage</th>
                </tr></thead>
                <tbody>';
            foreach($rows AS $row){
                $this->choice_id = $row['value'];
                $crow = $this->radio();
                echo '<tr>';
                echo '<td data-label="">'. $row['content'] .'</td>';
                echo '<td data-label="Count">' . $crow['checkCount'] . '</td>';
                echo '<td data-label="Percentage">';

                echo round(($crow['checkCount'] / $this->radioTotal()['checkCount']) * 100, 2) . ' %';
                echo '</td>';

                //  echo $row['content'].'=>'.$crow['checkCount'] .'<br>';
                // $checkArray[] = '{name: '.$row['content'].',y:'. $crow['checkCount'].'}';
                // array_push($dataset, $crow['checkCount']);
                // array_push($dataset2, $row['content']);
                echo '</tr>';
            }
            echo '</tbody>
                </table>';
            // return $checkArray;
        }

        public function rating() {
             
        }

    }