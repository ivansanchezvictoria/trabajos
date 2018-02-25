
<?php
    session_start();
        if (!isset($_SESSION['usuario'])){
        header ("Location: inicio.php");
        }
        echo "Conectado como usuario: <b>". $_SESSION['usuario']."</b><br/>";
    try {
      
        echo "<html>";
        echo "<head><meta charset='utf-8' /></head><body>";
  
        
        $conn = new PDO('mysql:host=localhost;dbname=bbdd;charset=utf8','root','');
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        $sql="SELECT * FROM usuarios";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
      
        echo "<h2>Usuarios</h2>";
        echo "<table border=1>";
        echo "<tr><th>Usuario</th><th>Email</th><th>Nombre</th><th>Apellidos</th></tr>";
        while ( $users = $stmt->fetch() ) {
           echo "<tr>";
           echo "<td>".$users['usuario']."</td><td>".$users['email']."</td><td>".$users['nombre']."</td><td>".$users['apellidos']."</td>";
           echo "</tr>";
        }
        echo "</table>";
        echo "</body></html>"; 
        
        echo "<a href='usuarios.php'>Regresar</a><br>";
        echo "<a href='desconectar.php'>Cerrar Sesion</a>";
    }
    
    catch (PDOException $ex) {
      print "¡Error!: " . $ex->getMessage() . "<br/>";
      exit;
    }
?>