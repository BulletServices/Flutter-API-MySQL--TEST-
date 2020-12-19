<?php
    require('connection.php');
    $makeQuery = "SELECT * FROM apptable";
    $stamement = $connection->prepare($makeQuery);
    $stamement->execute();

    $myarray = array();
    while($resultFrom = $stamement -> fetch()){
        array_push(
            $myarray, array(
                "id"=>$resultFrom['id'],
                "heading"=>$resultFrom['heading'],
                "body"=>$resultFrom['body'],
            )
        );
    }

echo json_encode($myarray);
?>