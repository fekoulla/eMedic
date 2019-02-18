$(document).ready(function(){

  var compteur = 0;

  $('#submit_ajax').click(function(){

    $.ajax({
      type: "GET",
      url: "controller.php",
      data: {compteur: compteur},
      dataType:'html',
      success: function(response){
        console.log(response);
        $('#affichage').append(response);
      }
    });

    compteur++;
  });

});
