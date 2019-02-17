console.log("Ce programme JS vient d'être chargé");
$(document).ready(function()
{
	console.log("Le document est pret");

	$('#pages').change(function(e){		//force le serveur à utiliser
		$.get('commentaires.php',	//construction du code html par le serveur
			{debut: parseInt($('#pages').val()),fin: parseInt($('#pages').val())+4},
			function(reponse){	//envoie du code html construit
				  $('#commentaires').html(reponse);	//traitement
				  console.log("Réponse reçue du serveur: ",reponse);
			});
	});

	$('#pages').change();

	$('#commentaires').on('click','.jaime-plus',function(){
		var pos=$(this);
		$.get('commentaires-jaime.php',
			{id: $(this).parent().parent().attr('data-com-id'),effet:"plus"},
			function(reponse){	//traitement
				pos.prev().text(reponse);
				console.log("Réponse reçue du serveur: ",reponse);
		});
	});
	
	$('#commentaires').on('click','.jaime-moins',function(){
		var pos=$(this);
		$.get('commentaires-jaime.php',
			{id: $(this).parent().parent().attr('data-com-id'),effet:"moins"},
			function(reponse){	//traitement
				pos.prev().prev().text(reponse);
				console.log("Réponse reçue du serveur: ",reponse);
		});
	});

	console.log("La mise en place est finie. En attente d'événements...");
});
