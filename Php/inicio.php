<?php 

session_start();

function comprobar_usuario($usuario, $clave) {
    try{  
      $bbdd= new PDO('mysql:host=localhost;dbname=bbdd;charset=utf8','dwes','dwes');
      $bbdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      $sql="select * from usuarios WHERE usuario= :usuario " . "AND password = :password";
      $stmt = $bbdd->prepare($sql);
      $stmt->execute(array(':usuario' => $usuario, ':password' => $clave));
       
      $filas = $stmt->fetchAll();   
      
    } catch(PDOException $e) {
        echo "¡Error!: " . $e->getMessage() . "<br/>";
        exit;
    }       
    return sizeof($filas);   
}
$mensaje = '';  

if ( isset($_REQUEST['Enviar']) ) {  
   
   $usuario = $_REQUEST['usuario'];
   $clave = $_REQUEST['clave'];
   if ( $usuario != ""  &&  $clave != "" ) {    
      $rows = comprobar_usuario($usuario, $clave);     
      if ( $rows > 0 ) { 
         $_SESSION['usuario'] = $usuario;
         header("Location:usuarios.php"); // 
      }
      else 
         $mensaje = "El usuario/contraseña  son incorrectos"; 
   } 
   else
      $mensaje = "Debe introducir usuario y contraseña";  
}   
      
?>

<!DOCTYPE html>
  
   <head> 
      <meta charset="utf-8"/>
      <title>Login</title>
      <style> 
          
      </style>
   </head> 
   <body style="background-color: #2ECCFA">  
      <form action="" method="post">
          <h1>Login</h1>
            <label>Usuario:</label> 
             <input type="text" name="usuario" ><br/>
            <label>Contraseña:</label> 
              <input type="password" name="clave">             
              <input type="submit" name="Enviar" value="Enviar"><br>
            
      </form>    
       <p style="color: red; font-weight: bold;"><?php echo $mensaje; ?></p>          
   </body> 
</html>      