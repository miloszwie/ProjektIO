<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8">

    <title>Ciuszek - sklep odzieżowy</title>
    <link rel="shortcut icon" href="images/favicon.jpg">
    <meta name="description" content="Sklep odzieżowy">
    <meta name="author" content="Mateusz">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">

    <!--[if lt IE 9]>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
    <![endif]-->
</head>

<body>
    <?php include 'templates/header.php';?>
    <div class="container">
        <div class="row">
            <?php include 'templates/menu.php';?>
            <?php 
                if (isset($_GET['page'])) {
                    $page = 'templates/'.$_GET['page'].'.php';
                } else {
                    $page = 'templates/show_products.php';
                }
                include $page;
            ?>
        </div>
    </div>
    <?php include 'templates/footer.php';?>

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
</body>
</html>