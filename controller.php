<?php
/**
 * Created by PhpStorm.
 * User: aordogh
 * Date: 15/02/2019
 * Time: 15:46
 */

require_once 'connexion.php';

$sth = $pdo->prepare("SELECT * FROM categorie");
$sth->execute();
$res = $sth->fetchAll();

var_dump($res);

?>