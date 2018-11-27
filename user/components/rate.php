

<table class="ui definition table">
    <thead>
        <tr>
            <th class="four wide"></th>
            <?php 
            $rows = $choice->all(); 
            $columnx = 0;
            foreach($rows AS $row){
                if($row['value'] != 0){
                    echo '<th class="two wide">'.$row['content'].'</th>';
                    $columnx++;
                }
            }   
            ?>
        </tr>
    </thead>
    <tbody>
        <?php 
        foreach($rows AS $row){
            if ($row['value'] == 0) {
                echo '<tr>';
                echo '<td>' . $row['content'] . '</td>';
                for($x = 1; $x <= $columnx; $x++){
                    echo '<td><input type="radio" name="q-'.$row['id'].'" tabindex="0" class="hidden" value="'. $row['id'].'-'.$x.'" checked></td>';
                }
                echo '</tr>';
            }
        }
        ?>
    </tbody>
</table>

