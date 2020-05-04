<?php

require_once("../Y_Template.class.php");
require_once("../Y_DB_MySQL.class.php");

/**
 * Description of Audit
 *
 * @author Doglas
 */
class Encuestas {
 

    function __construct() {
        $action = $_REQUEST['action'];
        if (isset($action)) {
            $this->{$action}();
        } else {
            $this->main();
        }
    }

    function main() {
        
         $db = new My();
        
        //$db->Database ="survey";
          
        $t = new Y_Template("Encuestas.html");
        $t->Show("headers");
       
        $db->Query("SELECT cod_estudio, descripcion FROM niveles_estudios ORDER BY descripcion ASC");
        $estudios = "";
        while ($db->NextRecord()){
            $cod_estudio = $db->Record['cod_estudio'];
            $descripcion   = $db->Record['descripcion'];  
            $estudios.="<option value='$cod_estudio'>$descripcion</option>";
        }
        $t->Set("estudios",$estudios);  
        
        $db->Query("SELECT cod_disp, descrip FROM survey.dispositivos ");
        $disp = "";
        while ($db->NextRecord()){
            $cod_disp = $db->Record['cod_disp'];
            $descripcion   = $db->Record['descrip'];  
            $disp.="<label class='dispositivos'><input type='checkbox' id='$cod_disp'  value='$descripcion'> $descripcion </label><br>";
        }
        $t->Set("dispositivos",$disp);  
        
	$t->Show("form"); 
        $t->Show("script"); 
         
    }
} 

new Encuestas();
?>
