<?php
/**
 * Created by PhpStorm.
 * User: aordogh
 * Date: 15/02/2019
 * Time: 15:46
 */

//Se connecte à la bdd
require_once 'connexion.php';

//Si le message est de type amélioration alors on ajoute cette amélioration dans la bdd
if( isset($_GET['message_amelioration']) && trim($_GET['message_amelioration']) != '') {

  amelioration_bdd($pdo, $_GET['message_amelioration']);

//Vérifie que le message saisi par l'utilisateur existe et n'est pas vide
}elseif( isset($_GET['message']) && trim($_GET['message']) != ''){

  //Supprime les accents et autres symboles non utf8
  $_GET['message'] = clean_text($_GET['message']);
  traitement_message($pdo, $_GET['message']);

//  if($_GET['compteur'] == 0){
//    traitement_message($pdo, $_GET['message']);
//  }elseif($_GET['compteur'] == 1){
//    traitement_message($pdo, $_GET['message']);
//  }

}elseif( !isset($_GET['message_amelioration']) ){
  echo "
    <div class=\"container\" style=\"width:700px;\">
      <div class=\"row\">
        <div id=\"affichage_bot\" class=\"card card-body\" style=\"margin-top: 30px;margin-right:320px; margin-left:15px;\">
           Vous n'avez pas saisi de message.
        </div>
      </div>
    </div>";
}

function traitement_message($bdd, $message){

  $mots = explode(' ', $message);
  $noms_symptomes = array();
  $id_symptomes = array();
  $symptomes = array();

  $query_symptomes = $bdd->prepare("SELECT name, idsymptome FROM symptome");
  $query_symptomes->execute();
  $fetch_symptomes = $query_symptomes->fetchAll();

  foreach( $fetch_symptomes as $noms){
    array_push ($symptomes, array(clean_text($noms['name']), $noms['idsymptome']));
  }

  for($i = 0; $i < sizeof($mots); $i++){
    for($j = 0; $j < sizeof($symptomes); $j++) {
      if ( 2 >= levenshtein($symptomes[$j][0], $mots[$i],1, 1, 1)) {
        array_push($noms_symptomes, $symptomes[$j][0]);
        array_push($id_symptomes, $symptomes[$j][1]);
      }
    }
  }

  $noms_symptomes = implode(',', $noms_symptomes);
  $id_symptomes = implode(',', $id_symptomes);
  $maladie = array();

  if(!empty($id_symptomes)){
    $query_maladie = $bdd->prepare("SELECT symptome.name, maladie.name, correlation.idMaladie, COUNT(correlation.idMaladie) count
    FROM symptome, correlation, maladie 
    WHERE symptome.idsymptome IN ($id_symptomes) 
    AND symptome.idsymptome = correlation.idSymptome 
    AND correlation.idMaladie = maladie.idmaladie
    GROUP BY maladie.name
    ORDER BY COUNT(*) DESC");
    $query_maladie->execute();
    $maladie = $query_maladie->fetchAll();
  }

  $diagnostic = array();
  array_push($diagnostic, $maladie[0]['name']);
  array_push($diagnostic, $maladie[0]['count']);
  var_dump($diagnostic);

  $diagnostic = implode(',', $diagnostic);
  if(!empty($diagnostic)){
    echo pop_up_amelioration($noms_symptomes, $diagnostic);
  }else{
    echo "
    <div class=\"container\" style=\"width:700px;\">
        <div class=\"row\">
            <div id=\"affichage_bot\" class=\"card card-body\" style=\"margin-top: 30px;margin-right:320px; margin-left:15px;\">
               Nous n'avons pas trouvé de maladie correspondant à vos symptomes($noms_symptomes). Pouvez-vous reformuler ?
            </div>
        </div>
    </div>";
  }

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
  $output = strtolower($output);
  $output = htmlspecialchars($output);
  $output = htmlentities($output);

  return $output;
}

function pop_up_amelioration($noms_symptomes, $diagnostic){
  return "
    <div class=\"container\" style=\"width:700px;\">
      <div class=\"row\">
        <div id=\"affichage_bot\" class=\"card card-body\" style=\"margin-top: 30px;margin-right:320px; margin-left:15px;\">
           Les symptomes repérés sont: $noms_symptomes. D'après nous vous avez possiblement un/une $diagnostic. <br>
           Aidez nous à améliorer notre système. En revenant vers nous quand vous aurez vue un médecin afin de nous communiquer votre malade/symptome. <br>
          <button type=\"button\" class=\"btn btn-link\" data-toggle=\"modal\" data-target=\"#suggestionModal\" style=\"text-align: right;\">
            Non
          </button>

          <div class=\"modal fade\" id=\"suggestionModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">
            <div class=\"modal-dialog\" role=\"document\">
              <div class=\"modal-content\">
                <div class=\"modal-header\">
                  <h5 class=\"modal-title\" id=\"exampleModalLabel\">Suggestion</h5>
                  <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">
                    <span aria-hidden=\"true\">&times;</span>
                  </button>
                </div>
                <div class=\"modal-body\">
                <p>Saisissez le diagnostic de votre médecin sous la forme: \"maladie, symptome1, symptome2 ...\"</p>
                  <input id=\"message_amelioration\" type=\"text\" class=\"form-control\" name=\"message\" placeholder=\"maladie, symptome1, symptome2 ...\" aria-label=\"informations\">
                </div> 
                <div class=\"modal-footer\">
                  <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Fermer</button>
                  <button id=\"submit_amelioration_bdd\" type=\"button\" class=\"btn btn-primary\" data-dismiss=\"modal\">Sauvegarder</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
  </div>
  <script src=\"ajax_amelioration.js?newversion\"></script>
  ";
}

function amelioration_bdd($bdd, $message_amelioration){

  $message_amelioration = explode(',', $message_amelioration);
  $maladie = $message_amelioration[0];
  unset($message_amelioration[0]);
  $symptomes = $message_amelioration;

  var_dump($maladie);
  var_dump($symptomes);

  if(!empty($maladie) && !empty($symptomes)){

    //Ajoute la maladie dans la bdd
    $verif_maladie_existe = $bdd->prepare('SELECT name FROM maladie WHERE name=' . $maladie);
    if( !empty($verif_maladie_existe)){
      $insert_maladie = $bdd->prepare("INSERT INTO maladie (name) VALUES (\'$maladie\')");
      $insert_maladie->execute();

      //Ajout le symptome dans la bdd
      foreach ($symptomes as $sympt){
        $verif_symptome_existe = $bdd->prepare('SELECT name FROM symptome WHERE name=' . $sympt);
        if( !empty($verif_symptome_existe)) {
          $insert_symptome = $bdd->prepare("INSERT INTO symptome (name) VALUES (\'$sympt\')");
          $insert_symptome->execute();
        }
      }
    }
  }
}

?>