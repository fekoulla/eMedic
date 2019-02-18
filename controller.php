<?php
/**
 * Created by PhpStorm.
 * User: aordogh
 * Date: 15/02/2019
 * Time: 15:46
 */

require_once 'connexion.php';

if( isset($_GET['message']) && trim($_GET['message']) != ''){

  if($_GET['compteur'] == 0){
    echo 'ok tu vas mal</br>';
    traitement_message($pdo, $_GET['message']);
  }elseif($_GET['compteur'] == 1){
    echo 'en fait ca va ^^</br>';
    traitement_message($pdo, $_GET['message']);
  }

}else{
  echo 'Vous n\'avez pas saisi de message</br>';
}

function traitement_message($bd, $message){

  $mots = explode(' ', $message);
  $noms_symptomes = array();
  $correlation = array();

  $query_symptomes = $bd->prepare("SELECT name, idsymptome FROM symptome");
  $query_symptomes->execute();
  $symptomes = $query_symptomes->fetchAll();

  foreach( $symptomes as $noms){
    array_push ($noms_symptomes, array($noms['name'], $noms['idsymptome']));
  }

  for($i = 0; $i < sizeof($mots); $i++){
    for($j = 0; $j < sizeof($noms_symptomes); $j++) {
      if ( 2 >= levenshtein($noms_symptomes[$j][0], $mots[$i],1, 1, 1)) {
        array_push($correlation, $noms_symptomes[$j][0]);
      }
    }
  }

  $correlation = implode(',', $correlation);

  $query_maladie = $bd->prepare("SELECT * FROM maladie, symptome, correlation WHERE symptome.name LIKE '%" . $correlation . "%' 
  AND (symptome.idsymptome = correlation.idSymptome
	AND correlation.idMaladie = maladie.idmaladie)");
  $query_maladie->execute();
  $maladie = $query_maladie->fetchAll();

  $diagnotique = array();

  foreach ($maladie as $noms_maladie){
    array_push($diagnotique, $noms_maladie[1]);
  }

  $diagnotique = implode(',', $diagnotique);

  echo 'Vous avez possiblement un/une ' . $diagnotique;

}

?>