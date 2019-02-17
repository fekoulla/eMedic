<?php

session_start();
require_once 'commentaires-fonctions.php';

// Chercher tous les commentaires
$commentaires=commentaires();

$id=(int)$_GET['id'];
$cle_id=commentaires_chercher_cle_de_id($commentaires,$id);

if($_GET['effet']=="plus"){

	$commentaires[$cle_id]['jaime']++;
}else{
	$commentaires[$cle_id]['jaime']--;
}

enregistrer_commentaires($commentaires);

echo $commentaires[$cle_id]['jaime'];
?>
