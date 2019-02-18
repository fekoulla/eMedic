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
  }else{
    $sth = $pdo->prepare("SELECT * FROM categorie");
    $sth->execute();
    $res = $sth->fetchAll();
    var_dump($res);
  }

}else{
  echo 'Vous n\'avez pas saisi de message</br>';
}

function traitement_message($bd, $message){

  $mots = explode(' ', $message);
  $noms_symptomes = array();

  $query_symptomes = $bd->prepare("SELECT * FROM symptome");
  $query_symptomes->execute();
  $symptomes = $query_symptomes->fetchAll();

  foreach( $symptomes as $noms){
    array_push ($noms_symptomes, $noms['name']);
  }

  var_dump($noms_symptomes);

}

?>