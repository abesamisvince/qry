<div class="ui attached segment">
           <form class="ui form"  method="POST" id="form1" action="<?php $_SERVER['PHP_SELF']; ?>">
                <div class="field">
                    
                    <h3 class="ui header">
                        Current School - <?php 
                                        $quest_id = $_GET['id'];
                                        $quest->id = $quest_id;
                                        $quest->find();
                                        $school = new School($db);
                                        $school->schoolid = $quest->curr_school;
                                        $school->find();
                                        echo $school->schoolname;
                                        ?>
                    </h3>
                    <label for="school">Search and Select school to activate</label>
                    <select name="school" id="school" class="ui fluid search dropdown">
                        <option value="">Select School</option>
                        <?php 
                        $response->quest_id = $quest_id;
                        $schools = $response->getResSchools();
                        foreach ($schools as $schoolx) {
                            echo '<option value="' . $schoolx['schoolid'] . '">' . $schoolx['schoolname'] . ' - ' . $schoolx['program'] . '</option>';
                        }
                        ?>
                    </select>
                </div>
                <div class="field">
                            <input type="hidden" name="idx" value="<?php echo $_GET['id']; ?>">
                        <div class="field"><button class="ui primary button" type="submit" name="activate-school" id="activate-school">
                            Select School
                            </button>
                        </div>
                </div>
           </form>
    </div>