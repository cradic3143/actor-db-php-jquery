<?php include '_partials/header.php'; ?>

    <h1>Search Actors By Last Name</h1>
    <form id="action-selector" action="index.php" method="post">
    	<select name="q" id="q">
    		<?php
    		$alphabet = str_split('abcdefghijklmnopqrstuvwxyz');
    		foreach( $alphabet as $letter ) {
    			echo "<option value='$letter'>$letter</option>";	
    		}
    		?>
    	</select>
    	<button type="submit">Go!</button>
    </form>

    <ul class="actors-list">
    	<?php 
        foreach( $actors as $actor ) {
    		echo "<li data-actor_id='{$actor->actor_id}'><a href='actor.php?actor_id={$actor->actor_id}''>{$actor->first_name} {$actor->last_name}</a></li>";
    	}
    	?>

        <script id="actor-list-template" type="text/x-handlebars-template">
            {{#each this}}
            <li data-actor_id="{{actor_id}}">
                <a href="actor.php?actor_id={{actor_id}}">{{fullName this}}</a>
            </li>
            {{/each}}
        </script>
    </ul>
<?php include '_partials/footer.php'; ?>
