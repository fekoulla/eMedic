$(document).ready(function(){

  var compteur = 0;

  $('#submit_ajax').click(function(){

    $('#affichage_user').append($('#message').val());

    $.ajax({
      type: "GET",
      url: "controller.php",
      data: {compteur: compteur, message: $('#message').val()},
      dataType:'html',
      success: function(response){
        console.log(response);
        $('#ecran').append(response);
      }
    });

    compteur++;
  });

});
