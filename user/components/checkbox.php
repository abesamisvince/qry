<div class="ui huge form">
    <?php 
    $rows = $choice->all();
    foreach ($rows as $row) {
        echo '<div class="required inline field">' .
                '<div class="field">' .
                    '<div class="ui checkbox">' .
                        '<input class="checkbox" type="checkbox" name="checkbox[]" value="'. $row['value'] . '" tabindex="0" class="hidden">' .
                        '<label>' . $row['content'] . '</label>' .
                    '</div>' .
                '</div>' .
            '</div>';
    }
    ?>
