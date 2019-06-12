CREATE DATABASE Clothes_shop CHARACTER SET utf8 COLLATE utf8_polish_ci;

use Clothes_shop;

CREATE TABLE `clothe_category` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(20) NOT NULL,
 `url_variable` varchar(20) NOT NULL,
 PRIMARY KEY (`id`)
); 

CREATE TABLE `clothes` (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `name` varchar(20) NOT NULL,
 `price` int(11) NOT NULL,
 `available_pieces` int(11) DEFAULT NULL,
 `description` varchar(256) DEFAULT NULL,
 `preview_img` varchar(100) DEFAULT NULL,
 `main_img` varchar(100) DEFAULT NULL,
 `category_id` int(11) DEFAULT NULL,
 PRIMARY KEY (`id`),
 KEY `category_id` (`category_id`),
 CONSTRAINT `clothes_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `clothe_category` (`id`)
);

INSERT INTO clothe_category (name, url_variable)
VALUES ('Buty', 'shoes'), ('Spodnie', 'trausers'), ('Koszulki', 'shirts'), ('Bluzki', 'hoodies'), ('Skarpety', 'socks');

INSERT INTO clothes (name, price, available_pieces, description, preview_img, main_img, category_id)
VALUES ('ADIDAS YEEZY 350 V2 BOOST BY1604', 200, 5,
        '- Materiał Primeknit
        - Podeszwa Boost
        - Ergonomiczna wkładka
        - Logo SPLY-350
        - Teksturowa podeszwa', 
        'buty1min.jpg',
        'buty1.jpg', 1), 

        ('Sneakersy POLO RALPH LAUREN', 150, 10,
        '-Producent Polo Ralph Lauren
        -Model Slaton Pony A85 Y2136 ROKDW W0166
        Kolor Czarny
        Cholewka skóra naturalna - licowa, materiał - materiał
        Wnętrze: materiał', 
        'buty2min.jpg',
        'buty2.jpg', 1), 

        ('ADIDAS YEEZY 350 V2 BOOST BY1604', 200, 5,
        '- Materiał Primeknit
        - Podeszwa Boost
        - Ergonomiczna wkładka
        - Logo SPLY-350
        - Teksturowa podeszwa', 
        'buty3min.jpg',
        'buty3.jpg', 1), 

        ('BUTY MĘSKIE', 150, 9,
        'materiał:  skóra licowa
        materiał dodatkowy:  materiał syntetyczny
        waga (kg):  0,8
        przybliżona wysokość obcasa (cm):  3
        typ obuwia:  pantofle
        kolekcja:  Obuwie
        Kształt noska:  migdałowy
        Rodzaj obcasa:  płaski obcas', 
        'buty4min.jpg',
        'buty4.jpg', 1), 

        ('Buty Led', 250, 9,
        'materiał dodatkowy:  materiał syntetyczny
        waga (kg):  0,8', 
        'buty5min.jpg',
        'buty5.jpg', 1), 


        ('KOSZULKA ANALOG / ICON BASIC / BLACK', 50, 50,
        'Długość 64 cm (w rozm. 36/38)
        Długość rękawów	Krótki rękaw', 
        'koszulka1min.jpg',
        'koszulka1.jpg', 3), 

        ('T-shirt', 90, 40,
        'Marka	RAINBOW
        Długość	64 cm (w rozm. 36/38)
        Długość rękawów	Krótki rękaw
        Dekolt	Okrągły dekolt
        Materiał Materiał wierzchni: 100% bawełna
        Kolor	czarny Żyrafa', 
        'koszulka2min.jpg',
        'koszulka2.jpg', 3),

        ('KOSZULKA MĘSKA POLO BEZ NADRUKU S758 - GRANATOWA', 80, 90,
        'Klasyczna polówka męska
        Materiał gładki bez nadruków
        Zapinana pod szyją na guziki
        Dół koszulki oraz rękawki wykończone kontrastową taśmą
        Kontrastowa wstawka przy guzikach
        Stylowy kołnierzyk
        Skład: 100% bawełna
        Kolor: granatowy', 
        'koszulka3min.jpg',
        'koszulka3.jpg', 3),

        ('KOSZULKA MĘSKA POLO BEZ NADRUKU S758 - GRANATOWA', 80, 90,
        'Klasyczna polówka męska
        Materiał gładki bez nadruków
        Zapinana pod szyją na guziki
        Dół koszulki oraz rękawki wykończone kontrastową taśmą
        Kontrastowa wstawka przy guzikach
        Stylowy kołnierzyk
        Skład: 100% bawełna
        Kolor: granatowy', 
        'koszulka3min.jpg',
        'koszulka3.jpg', 3),

        ('Polska - juniorska replika koszulki reprezentacji Polski 2018-2019 (NIKE)', 120, 10,
        '- kolor biały
        - herb Polski piersi nadrukowany
        - nadrukowane logo Nike
        - 100% poliester w technologii DRI-FIT', 
        'koszulka4min.jpg', 
        'koszulka4.jpg', 3),

        ('T-SHIRT MĘSKI Z NADRUKIEM S776 - GRANATOWY', 110, 110,
        'Koszulka męska z motywem patriotycznym
        Na froncie biało-czerwone nadruki
        Półokrągły dekolt
        Trzy wersje kolorystyczne
        Skład: 100% bawełna
        Kolor: granatowy', 
        'koszulka5min.jpg', 
        'koszulka5.jpg', 3),

        ('Męskie skarpety termiczne', 15, 110,
        'Bardzo ciepłe
        Męskie rozmiary', 
        'skarpety1min.jpg', 
        'skarpety1.jpg', 5),

        ('Stopki 2 pary', 25, 110,
        'Niska cholewka
        Materiał: bawełna, poliester i elastan
        Czarne z żółtymi elementami', 
        'skarpety2min.jpg', 
        'skarpety2.jpg', 5),

        ('Stopki 5 par', 45, 90,
        'Trzy kolory – biały, czarny i szary
        Materiał: Bawełna 75%, poliester 22%, elastan 3%', 
        'skarpety3min.jpg', 
        'skarpety3.jpg', 5),

        ('Skarpety 7 par', 55, 99,
        'Siedem par skarpet
        Materiał: Bawełna 75%, poliester 22%, elastan 3%', 
        'skarpety4min.jpg', 
        'skarpety4.jpg', 5),

        ('Skarpety robocze 3 pary', 25, 99,
        'Wzmocnienia na palcach i piętach', 
        'skarpety5min.jpg', 
        'skarpety5.jpg', 5),

        ('Spodnie turystyczne', 225, 99,
        'Wiele kieszeni
        Sznurki do ściągania w mankietach nogawek
        Guma w pasie', 
        'spodnie1min.jpg', 
        'spodnie1.jpg', 2),

        ('SPODNIE MĘSKIE JOGGERY P333 - GRANATOWE', 125, 79,
        'Męskie spodnie typu jogger
        Dwie kieszenie z przodu
        Dwie kieszenie naszyte z tyłu
        Fason: bojówki
        Obniżony stan
        Modne przeszycia
        Skład: 100% bawełna
        Kolor: granat', 
        'spodnie2min.jpg', 
        'spodnie2.jpg', 2),

        ('SPODNIE MĘSKIE JEANSOWE P564 - GRANATOWE', 155, 72,
        'Spodnie męskie typu JEANS
        Lekko zwężana nogawka
        Stylowo wybarwiany materiał
        Ozdobne, dyskretne przetarcia
        Dwie kieszenie z przodu, dwie z tyłu
        Zdobienia w postaci kontrastowych nici
        Skład: 98% bawełna, 2% poliester
        Kolor: granatowy', 
        'spodnie3min.jpg', 
        'spodnie3.jpg', 2),

        ('Spodnie robocze', 145, 65,
        'Wzór maskujący
        Kieszenie boczne, tylne i na nogawkach
        Kieszenie na nakolanniki', 
        'spodnie4min.jpg', 
        'spodnie4.jpg', 2),


        ('Rybaczki', 90, 15,
        'Wzmocnienie z przodu
        Wiele kieszeni na narzędzia/gwoździe
        Kieszenie na nakolanniki', 
        'spodnie5min.jpg', 
        'spodnie5min.jpg', 2);