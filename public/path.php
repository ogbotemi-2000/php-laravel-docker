<?php

$dirPath = $_GET['dir'] ? $_GET['dir'] : '../vendor';

echo '<pre>';

$files = scandir($dirPath);
foreach ($files as $file) {
    if (is_file($dirPath . '/' . $file)) {
        echo "File:   " . $file . "<br>";
    } elseif (is_dir($dirPath . '/' . $file)) {
        echo "Folder: " . $file . "<br>";
    }
}

?>