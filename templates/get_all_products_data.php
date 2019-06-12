<?php
    try {
        $connection = new PDO("mysql:host=localhost;dbname=Clothes_shop;charset=utf8", "root", "", 
            array(
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
            )
        );

        $statement = $connection->prepare("SELECT * FROM clothes");
        $statement->execute();
        $results = $statement->fetchAll(PDO::FETCH_ASSOC);
        $json = json_encode($results);

        print $json;

    } catch(PDOException $error) {
        echo $error->getMessage();
    }
?>