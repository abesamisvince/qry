
    <div class="ui huge form">
        <?php 
        $rows = $choice->all();
        foreach($rows AS $row){
            echo '<div class="inline field">'.
                '<div class="field">'.
                    '<div class="ui radio checkbox">'.
                        '<input type="radio" name="radio" value="'.$row['value'].'" tabindex="0" class="hidden">'.
                        '<label>'.$row['content'].'</label>'.
                    '</div>'.
                '</div>'.
            '</div>';
        }
        ?>


