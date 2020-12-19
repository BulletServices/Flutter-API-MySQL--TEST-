<?php

try{
    $connection = new PDO('mysql:host=localhost;dbname=id15718874_flutterteste','id15718874_serveruser','Almeidinha@1');
    $connection -> setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    echo('Connected');
}catch(PDOException $exc){
     echo $exc -> getMessage();
     die("erro");
}

?>