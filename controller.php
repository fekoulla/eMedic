<?php
/**
 * Created by PhpStorm.
 * User: aordogh
 * Date: 15/02/2019
 * Time: 15:46
 */

//Se connecte à la bdd
require_once 'connexion.php';

//Vérifie que le message saisi par l'utilisateur existe et n'est pas vide
if( isset($_GET['message']) && trim($_GET['message']) != ''){

  //Supprime les accents et autres symboles non utf8
  $_GET['message'] = clean_text($_GET['message']);

  traitement_message($pdo, $_GET['message']);

//  if($_GET['compteur'] == 0){
//    traitement_message($pdo, $_GET['message']);
//  }elseif($_GET['compteur'] == 1){
//    traitement_message($pdo, $_GET['message']);
//  }

}else{
  echo 'Vous n\'avez pas saisi de message</br>';
}

function traitement_message($bdd, $message){

  $mots = explode(' ', $message);
  $noms_symptomes = array();
  $correlation = array();

  $query_symptomes = $bdd->prepare("SELECT name, idsymptome FROM symptome");
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

  $query_maladie = $bdd->prepare("SELECT * FROM maladie, symptome, correlation WHERE symptome.name LIKE '%" . $correlation . "%' 
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

//Supprime les accents, et tous les caractères non utf8
function clean_text($input){

  $cible = [
    'À', 'Á', 'Â', 'Ã', 'Ä', 'Å', 'Æ', 'Ă', 'Ą',
    'Ç', 'Ć', 'Č', 'Œ',
    'à', 'á', 'â', 'ã', 'ä', 'å', 'æ', 'ă', 'ą',
    'ç', 'ć', 'č', 'œ',
    'È', 'É', 'Ê', 'Ë', 'Ę', 'Ě',
    'Ì', 'Í', 'Î', 'Ï', 'İ',
    'è', 'é', 'ê', 'ë', 'ę', 'ě',
    'ì', 'í', 'î', 'ï', 'ı',
    'ĺ', 'ľ', 'ł',
    'Ñ', 'Ń', 'Ň',
    'Ò', 'Ó', 'Ô', 'Õ', 'Ö', 'Ø', 'Ő',
    'ñ', 'ń', 'ň',
    'ò', 'ó', 'ô', 'ö', 'ø', 'ő',
    'Ù', 'Ú', 'Û', 'Ų', 'Ü', 'Ů', 'Ű',
    'ù', 'ú', 'û', 'ų', 'ü', 'ů', 'ű'
  ];

  $rempl = [
    'A', 'A', 'A', 'A', 'A', 'A', 'AE', 'A', 'A',
    'C', 'C', 'C', 'CE',
    'a', 'a', 'a', 'a', 'a', 'a', 'ae', 'a', 'a',
    'c', 'c', 'c', 'ce',
    'E', 'E', 'E', 'E', 'E', 'E',
    'I', 'I', 'I', 'I', 'I',
    'e', 'e', 'e', 'e', 'e', 'e',
    'i', 'i', 'i', 'i', 'i',
    'l', 'l', 'l',
    'N', 'N', 'N',
    'O', 'O', 'O', 'O', 'O', 'O', 'O',
    'n', 'n', 'n',
    'o', 'o', 'o', 'o', 'o', 'o',
    'U', 'U', 'U', 'U', 'U', 'U', 'U',
    'u', 'u', 'u', 'u', 'u', 'u', 'u'
  ];

  $output = str_replace($cible, $rempl, $input);
  strtolower($output);

  return $output;
}

?>