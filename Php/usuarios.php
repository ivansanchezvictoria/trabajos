<?php

session_start();
if (!isset($_SESSION['usuario'])){
    header ("Location: inicio.php");
}
echo "Conectado como usuario: <b>". $_SESSION['usuario']."</b><br/>";


echo "<h1>Aplicación principal</h1>";
echo "<a href='usuarios.php'>Inicio</a><br>";
echo "<a href='consultas.php'>Consultar </a><br>";
echo "<a href='desconectar.php'>Cerrar Sesion</a>";
