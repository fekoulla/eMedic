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

}elseif( !isset($_GET['message_amelioration']) ){
  echo "
    <div class=\"container\" >
      <div class=\"row\">
        <div class=\"col-lg-1 col-md-1 col-sm-1\">
        </div>
        <div class=\"col-lg-1 col-md-1 col-sm-1\">
            <i class=\"fas fa-robot fa-3x\" style=\"margin-top: 50px; margin-right: 10px;\"></i>
        </div>
        <div class=\"col-lg-5 col-md-5 col-sm-5\">
          <div class=\"card card-body affichage_bot\" style=\"margin-top: 30px;\">
            Vous n'avez pas saisi de message.
          </div>
        </div>
        <div class=\"col-lg-5 col-md-5 col-sm-5\">
        </div>
      </div>
    </div>";
}

function traitement_message($bdd, $message){

  $symptomes = extraire_symptomes($bdd, $message);

  $noms_symptomes = implode(',', $symptomes[0]);
  $id_symptomes = implode(',', $symptomes[1]);
  $noms_symptomes_affichage = implode(',', $symptomes[2]);

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

  if(!empty($maladie)){
    $id_maladie = $maladie[0]['idMaladie'];
    array_push($diagnostic, $maladie[0]['name']);
    array_push($diagnostic, $maladie[0]['count']);
  }

  if(!empty($diagnostic)){
    echo pop_up_amelioration($bdd, $noms_symptomes_affichage, $diagnostic, $id_maladie);
  }else{
    echo "
    <div class=\"container\" >
        <div class=\"row\">
          <div class=\"col-lg-1 col-md-1 col-sm-1\">
          </div>
          <div class=\"col-lg-1 col-md-1 col-sm-1\">
              <i class=\"fas fa-robot fa-3x\" style=\"margin-top: 50px; margin-right: 10px;\"></i>
          </div>
          <div class=\"col-lg-5 col-md-5 col-sm-5\">
              <div class=\"card card-body affichage_bot\" style=\"margin-top: 30px;\">
                Nous n'avons pas trouvé de maladie correspondant à vos symptomes. Pouvez-vous reformuler ?
              </div>
          </div>
          <div class=\"col-lg-5 col-md-5 col-sm-5\">
          </div>
        </div>
    </div>";
  }
}

function extraire_symptomes($bdd, $message){

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

  $symptome_original = array();
  $noms_symptomes_affichage = array();

  //Fait une copie de l'array $mots
  foreach ( $symptomes as $sympt ){
    array_push($symptome_original, $sympt);
  }

  for($i = 0; $i < sizeof($mots); $i++){
    for($j = 0; $j < sizeof($symptomes); $j++) {

      $mots[$i] = str_replace(' ','',$mots[$i]);
      $symptomes[$j] = str_replace(' ','',$symptomes[$j]);

      //On test si le mot et le symptome se ressemble (à une distance levenshtein de 2 max
      if ( 1 >= levenshtein($symptomes[$j][0], $mots[$i],1, 1, 1)) {

        array_push($noms_symptomes, $symptomes[$j][0]);
        array_push($id_symptomes, $symptomes[$j][1]);
        array_push($noms_symptomes_affichage, $symptome_original[$j][0]);

        //Si on ne trouve pas de symptome on test en prennant 2(vision trouble) mots ensembles puis 3(mal au bras)
      }else{

        if($i < sizeof($mots)-1){

          $en_deux_mots = $mots[$i].$mots[$i+1];
          //On applique le levenshtein sur le mot compose de 2
          if ( 2 >= levenshtein($symptomes[$j][0], $en_deux_mots,1, 1, 1) ) {
            array_push($noms_symptomes, $symptomes[$j][0]);
            array_push($id_symptomes, $symptomes[$j][1]);
            array_push($noms_symptomes_affichage, $symptome_original[$j][0]);
          }else{

            if($i < sizeof($mots)-2) {

              $en_trois_mots = $mots[$i].$mots[$i + 1].$mots[$i + 2];
              //On applique le levenshtein sur le mot compose de 3
              if ( 2 >= levenshtein($symptomes[$j][0], $en_trois_mots, 1, 1, 1) ) {
                array_push($noms_symptomes, $symptomes[$j][0]);
                array_push($id_symptomes, $symptomes[$j][1]);
                array_push($noms_symptomes_affichage, $symptome_original[$j][0]);
              }
            }
          }
        }
      }
    }
  }

  $noms_symptomes = array_unique($noms_symptomes);
  $id_symptomes = array_unique($id_symptomes);
  $noms_symptomes_affichage = array_unique($noms_symptomes_affichage);

  $resultats = array();
  array_push($resultats, $noms_symptomes);
  array_push($resultats, $id_symptomes);
  array_push($resultats, $noms_symptomes_affichage);

  return $resultats;
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

function pop_up_amelioration($bdd, $noms_symptomes, $diagnostic, $id_maladie){

  $maladie = $diagnostic[0];
  $nb_symptomes_message = $diagnostic[1];

  //Calcul le nombre total de symptomes correspondants à la maladie prédite
  $query_maladie = $bdd->prepare('SELECT COUNT(correlation.idcorrelation) FROM correlation WHERE correlation.idMaladie = ' . $id_maladie);
  $query_maladie->execute();
  $nb_total_symptomes = $query_maladie->fetchAll();

  $nb_total_symptomes = $nb_total_symptomes[0][0];

  $popup =  "
    <div class=\"container\" >
      <div class=\"row\">
        <div class=\"col-lg-1 col-md-1 col-sm-1\">
        </div>
        <div class=\"col-lg-1 col-md-1 col-sm-1\">
            <i class=\"fas fa-robot fa-3x\" style=\"margin-top: 50px; margin-right: 10px;\"></i>
        </div>
        <div class=\"col-lg-5 col-md-5 col-sm-5\">
          <div class=\"card card-body affichage_bot\" style=\"margin-top: 30px;\">
            Les symptomes repérés sont: $noms_symptomes. D'après nous vous avez possiblement un/une $maladie. Avec $nb_symptomes_message symptomes correspondants sur $nb_total_symptomes.<br>
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
          <div class=\"col-lg-5 col-md-5 col-sm-5\">
          </div>
        </div>
      </div>
  </div>";

  if(isset($_GET['compteur'])){
    if($_GET['compteur'] == 0){
      $popup = $popup ."<script src=\"ajax_amelioration.js?newversion\"></script>";
    }
  }

  return $popup;
}

//Permet d'ajouter des maladies avec leurs symptomes
function amelioration_bdd($bdd, $message_amelioration){


  $message_amelioration = clean_text($message_amelioration);

  $message_amelioration = explode(',', $message_amelioration);
  $maladie = $message_amelioration[0];
  unset($message_amelioration[0]);
  $symptomes = $message_amelioration;

  if(!empty($maladie) && !empty($symptomes)){
    //Vérification de l'existence ou non de la maladie
    $verif_maladie_existe = $bdd->prepare('SELECT * FROM maladie WHERE LOWER(maladie.name)=\'' . strtolower($maladie) .'\'');
    $verif_maladie_existe->execute();
    $existanceMaladie = $verif_maladie_existe->fetch();

    //Si elle n'existe pas, on insère le tout
    if(empty($existanceMaladie)){
      // Insertion Maladie et récupération lastInsertId
      $req = 'INSERT INTO maladie (name)
                  VALUES (:name)';

      $insert_maladie = $bdd->prepare($req);
      $data['name'] = ucfirst($maladie);
      $insert_maladie->execute($data);
      $lastIdMaladie = $bdd->lastInsertId();

      // On prépare l'array destiné à recueillir tous les ID des symptomes
      $lastIdSymptome = array();

      // Insertion Symptome et récupération lastInsertId
      foreach ($symptomes as $sympt){
        // On vérifie l'existence ou non du symptome en cours dans le foreach
        $verif_symptome_existe = $bdd->prepare('SELECT * FROM symptome WHERE LOWER(symptome.name)=\'' . strtolower($sympt) .'\'');
        $verif_symptome_existe->execute();
        $existanceSymptome = $verif_symptome_existe->fetch();

        // S'il n'exite pas, on l'insère
        if(empty($existanceSymptome)){
          $req = 'INSERT INTO symptome (name)
                          VALUES (:name)';

          $insert_symptome = $bdd->prepare($req);
          $data['name'] = ucfirst($sympt);
          $insert_symptome->execute($data);

          // Ici c'est important, on récupère CHAQUE lastInsertId des symptomes insérés et on le place dans l'array
          array_push($lastIdSymptome, $bdd->lastInsertId());
        }
      }

      // Une fois que la maladie et les symptomes ont été insérés, on effectue la jonction
      // en insérant dans la table corrélation pour chaque symptome
      foreach ($symptomes as $key => $value){
        $key--;
        $data = array();
        $req = 'INSERT INTO correlation (idMaladie, idSymptome)
                      VALUES (:idMaladie, :idSymptome)';

        $insert_correlation = $bdd->prepare($req);
        $data['idMaladie']  = $lastIdMaladie;
        $data['idSymptome'] = $lastIdSymptome[$key];
        $insert_correlation->execute($data);
      }
    }
    // En revanche, si cette maladie existe, nous devons lier ses symptomes
    else
    {
        $maladie_a_mettre_a_jour = $bdd->prepare('SELECT * FROM maladie WHERE LOWER(maladie.name)=\'' . strtolower($maladie) .'\'');
        $maladie_a_mettre_a_jour->execute();
        $updateMaladie = $maladie_a_mettre_a_jour->fetch();

        // On prépare l'array destiné à recueillir tous les ID des symptomes
        $lastIdSymptome = array();

        // Insertion Symptome et récupération lastInsertId
        foreach ($symptomes as $sympt){
          // On vérifie l'existence ou non du symptome en cours dans le foreach
          $verif_symptome_existe = $bdd->prepare('SELECT * FROM symptome WHERE LOWER(symptome.name)=\'' . strtolower($sympt) .'\'');
          $verif_symptome_existe->execute();
          $existanceSymptome = $verif_symptome_existe->fetch();

          // S'il n'exite pas, on l'insère
          if(empty($existanceSymptome)){
            $req = 'INSERT INTO symptome (name)
                            VALUES (:name)';

            $insert_symptome = $bdd->prepare($req);
            $data['name'] = ucfirst($sympt);
            $insert_symptome->execute($data);

            // Ici c'est important, on récupère CHAQUE lastInsertId des symptomes insérés et on le place dans l'array
            array_push($lastIdSymptome, $bdd->lastInsertId());

            // Une fois que la maladie et les symptomes ont été insérés, on effectue la jonction
            // en insérant dans la table corrélation pour chaque symptome en le liant à la maladie en cours
            foreach ($symptomes as $key => $value){
              $key--;
              $data = array();
              $req = 'INSERT INTO correlation (idMaladie, idSymptome)
                            VALUES (:idMaladie, :idSymptome)';

              $insert_correlation = $bdd->prepare($req);
              $data['idMaladie']  = $updateMaladie[0];
              $data['idSymptome'] = $lastIdSymptome[$key];
              $insert_correlation->execute($data);
            }

          }
        }


    }

  }
}

?>
