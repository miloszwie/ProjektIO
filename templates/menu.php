<aside class="col-md-2">
    <header class="card-header">Lista kategorii</header>
    <ul class="list-group list-group-flush">
    <?php
        try {
            $connection = new PDO("mysql:host=localhost;dbname=Clothes_shop", "root", "", 
                array(
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
                )
            );
            $sql = "SELECT * FROM clothe_category;";
            $clothe_category_records = $connection->query($sql);

            while($row = $clothe_category_records->fetch()) {
                echo '<li class="list-group-item"><a href="?page=show_products&type='.$row['id'].'">'.$row['name'].'</a></li>';
            }

            $clothe_category_records->closeCursor();
        } catch(PDOException $error) {
            echo $error->getMessage();
        }
    ?>
    </ul>
    <?php include 'templates/basket.php';?>
</aside>