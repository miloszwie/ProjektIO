<?php
    $productId = $_GET['product_id'];

    try {
        $connection = new PDO('mysql:host=localhost;dbname=Clothes_shop', 'root', '', 
            array(
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
            )
        );

        $sql = 'SELECT * FROM clothes WHERE id='.$productId;
        $clothes_records = $connection->query($sql);

        while($row = $clothes_records->fetch()) {
            echo '<div class="col-md-10 card card-body product-preview" data-product="'.$row['id'].'">
                    <div class="card-body">
                        <img src="/clothes_shop/images/'.$row['main_img'].'">
                        <p class="product-title card-title">'.$row['name'].'</p>
                        <div class="row">
                            <div class="product-description">'.$row['description'].'</div>
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
?>