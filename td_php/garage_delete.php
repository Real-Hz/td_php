<?php

$garage_id = $_GET['garage_id'];

require 'src/garage_queries.php';
$garageQueries = new GarageQueries();
$garageQueries->startConnection();
$succeed = $garageQueries->deleteGarage($garage_id);


if($succeed == true) {
    header('Location:garages.php?alert=deleted');
} else {
    header('Location:garages.php?alert=error');
}

?>