<div id="content-main" class="container">
   
    <table>
        <tr>
            <th width="15%;">Username</th>
            <th width="15%;">Row 2</th>
            <th width="15%;">Row 3</th>
            <th             >Row 4</th>
            <th width="15%;">Row 5</th>
        </tr>

        <?php
        
        foreach ($users as $row) {
            echo '<tr>';
            echo '<th>' . $row['user_name'] . '</th>';
            echo '<th>' . $row['user_email'] . '</th>';
            echo '<th>' . $row['age'] . '</th>';
            echo '<th>' . $row['user_current_country'] . '</th>';
            echo '<th>' . $row['description'] . '</th>';
            echo '</tr>';
        }
        
        ?>
        
    </table>

</div>