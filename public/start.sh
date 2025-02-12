<?php

$contents = file_get_contents($_GET['file'] ? $_GET['file'] : "/start.sh");

echo '<pre>' . $contents;


?>