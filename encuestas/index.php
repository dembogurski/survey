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
          
        $t = new Y_Template("Encuestas.html");
        $t->Show("headers");
	$t->Show("form"); 
        $t->Show("script"); 
         
    }
} 

new Encuestas();
?>
