<?php

if(strlen($_POST['name']) < 3) {
    header('Location:garages.php?alert=error');
}

$name =  $_POST['name'];

$new_garage = [
    "name" => $name,
    "city" => $_POST['city'],
    "creation" => $_POST['creation'],
    "turnover" => $_POST['turnover']
];

require 'src/garage_queries.php';
$garageQueries = new GarageQueries();
$garageQueries->startConnection();
$succeed = $garageQueries->addGarage($new_garage);

if($succeed == true) {
    header('Location:garages.php?alert=created');
} else {
    header('Location:garages.php?alert=error');
}