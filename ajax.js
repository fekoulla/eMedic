$.get(
  'index.php', // Le fichier cible côté serveur.
  'true', // Nous utilisons true, pour dire que nous envoyons des données.
  'send_response', // Nous renseignons uniquement le nom de la fonction de retour.
  'html' // Format des données reçues.
);

function send_response(message){
  // Du code pour gérer le retour de l'appel AJAX.
  alert(message);
}





