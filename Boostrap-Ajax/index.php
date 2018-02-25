<?php

// Recibe q, que es el valor del select de origen 
$q= intval($_GET['q']);

switch($q){
    case 0: echo "<option>Cerberos/Tiemblo</option>";break;
    case 1: echo "<option>Madrid(P.pio)</option>";break;
    case 2: echo "<option>Ciempozuelos</option>";break;
    case 3: echo "<option>Madrid(Legazpi)</option>";break;
    case 4: echo "<option>Majadahonda</option>";break;
    case 5: echo "<option>Pozuelo de Alarcón</option>";break;

}
?>