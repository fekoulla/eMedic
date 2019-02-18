<?php
/**
 * Created by PhpStorm.
 * User: aordogh
 * Date: 15/02/2019
 * Time: 15:46
 */

require_once 'connexion.php';

if(isset($_GET['compteur'])){


  if($_GET['compteur'] == 0){
    echo 'ok tu vas mal</br>';
  }elseif($_GET['compteur'] == 1){
    echo 'en fait ca va ^^</br>';
  }else{
    $sth = $pdo->prepare("SELECT * FROM categorie");
    $sth->execute();
    $res = $sth->fetchAll();

    var_dump($res);
  }

}

?>