<?php

class GarageQueries {

    private $dbh;
    function startConnection() {
        $pass = 'root';
        $user = 'root';
        try{
            $this->dbh = new PDO('mysql:host=localhost;dbname=tp_sql;charset=UTF8',$user, $pass);
            // echo("Connection OK");
        }
        catch(PDOException $ex) {
            die("Connection KO");
        }
    }

    function showGarages() {
        $sql = "SELECT * FROM garages";
        $query = $this->dbh->query($sql);
        $garages = $query->fetchAll();
        
        foreach($garages as $garage) {
            echo '<p>';
            echo $garage['id'] . ' ';
            echo $garage['name'] . ' ';
            echo $garage['creation'] . ' ';
            if(isset($garage['city'])) {
                echo $garage['city'] . ' ';
            } else {
                echo ' N/A ';
            }
            echo '<a href="cars.php?garage_id='. $garage['id']  .'"> Showroom</a>';
            echo '<a href="garage_delete.php?garage_id='. $garage['id']  .'"> Delete</a>';
            echo '</p>';
        }
    }

    function showCars($garage_id) {
        $sql = "SELECT * FROM cars WHERE garage_id = " . $garage_id;
        $query = $this->dbh->query($sql);
        $cars = $query->fetchAll();
                
        foreach($cars as $car) {
            echo '<p>';
            echo $car['model']. ' ';
            echo $car['color']. ' ';
            echo $car['price']. '$'. ' ';
            echo '</p>';
        }
    }
    function addGarage($new_garage) {
        $sql = "INSERT INTO `garages` (name, creation, city, turnover) VALUES (:name, :creation, :city, :turnover)";
        $stmt = $this->dbh->prepare($sql);
        $succeed = $stmt->execute($new_garage);
        return $succeed;
    }

    function deleteGarage($garage_id) {
        $sql = " DELETE FROM `garages` WHERE id = " . $garage_id;
        $stmt = $this->dbh->prepare($sql);
        $succeed = $stmt->execute();
        return $succeed;
    }

}

?>