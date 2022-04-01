<h1>Liste des garages</h1>
<a href="garage_add.php">Ajouter un garage</a>

<?php

if(isset($_GET['alert'])) {
    if($_GET['alert'] == 'created') {
        echo '<p>Creation réussi</p>';
    }
    if($_GET['alert'] == 'deleted') {
        echo '<p>Suppresion réussi</p>';
    }
    if($_GET['alert'] == 'error') {
        echo '<p>Erreur</p>';
    }
}


require 'src/garage_queries.php';
$garageQueries = new GarageQueries();
$garageQueries->startConnection();
$garageQueries->showGarages();

?>