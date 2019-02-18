$(document).ready(function(){

	$('#submit_ajax').click(function(){

		$.get('controller.php',
			{id: $('#message')},
			function(reponse){	//traitement
				console.log("Réponse reçue du serveur: ",reponse);
		});
	});

});
