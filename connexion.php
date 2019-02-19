<?php
/**
 * Created by PhpStorm.
 * User: aordogh
 * Date: 15/02/2019
 * Time: 15:41
 */

$dbHost = 'localhost';
$dbName = 'emedic';
$user   = 'root';
$password = "";

try{
  $pdo = new PDO('mysql:host='.$dbHost.';dbname='.$dbName.'', $user, $password);
  $pdo -> exec("set names utf8");
}
catch (PDOException $e){
  exit($e->getMessage());
}
