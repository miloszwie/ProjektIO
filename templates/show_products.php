<div class="row col-md-10 products-preview">
    <?php
        if (isset($_GET['type'])) {
            $type = $_GET['type'];
        } else {
            $type = null;
        }

        try {
            $connection = new PDO('mysql:host=localhost;dbname=Clothes_shop', 'root', '', 
                array(
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
                )
            );

            $sql = prepareSqlQuery($type);
            $clothes_records = $connection->query($sql);

            while($row = $clothes_records->fetch()) {
                echo '<div data-product="'.$row['id'].'" class="product card">
                        <div class="card-body">
                            <a class="product-link" href="?page=product_details&product_id='.$row['id'].'">
                                <img class="product-preview-image card-img-top" src="/clothes_shop/images/'.$row['preview_img'].'">
                                <p class="product-title card-title">'.$row['name'].'</p>
                            </a>
                            <div class="row">
                                <div class="col-md-7" class="col-md-7">
                                    <span>Cena: '.$row['price'].' zł</span></br>
                                    <span class="product-availability">Dostępnych: <span data-available-pieces="'.$row['id'].'"</span>'.$row['available_pieces'].'</span>
                                </div>
                                <div class="col-md-5">
                                    <button data-buy-button="'.$row['id'].'" href="#" class="btn btn-primary product-but-btn" data-product-id="'.$row['id'].'">Do koszyka</button>
                                </div>
                            </div>
                        </div>
                    </div>';
            }

            $clothes_records->closeCursor();
        } catch(PDOException $error) {
            echo $error->getMessage();
        }

        function prepareSqlQuery($type) {
            $query = 'SELECT * FROM clothes ';
            if ($type) {
                $query = $query.'WHERE category_id = '.$type;
            } else {
                $query = $query.'LIMIT 20';
            }
            return $query;
        }
    ?>
</div>