<h1>Liste des voitures</h1>

<?php

$garage_id = $_GET['garage_id'];

require 'src/garage_queries.php';
$garageQueries = new GarageQueries();
$garageQueries->startConnection();
$garageQueries->showCars($garage_id);  

?>