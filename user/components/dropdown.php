
<div class="ui large form">
    <div class="field">
        <label>Choice</label>
        <div class="ui selection dropdown">
            <input type="hidden" name="checkbox">
            <i class="dropdown icon"></i>
            <div class="default text">Choice</div>
            <div class="menu">
                <?php 
                $rows = $choice->all();
                foreach ($rows as $row) {
                    echo '<div class="item" data-value="'.$row['value'].'">'.$row['content'].'</div>';
                }
                ?>
            </div>
        </div>
    </div>