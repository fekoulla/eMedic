$(document).ready(function(){

  var compteur = 0;

  $('#submit_ajax').click(function(){

    $.ajax({
      type: "GET",
      url: "controller.php",
      data: {compteur: compteur, message: $('#message').val()},
      dataType:'html',
      success: function(response){
        console.log(response);
        $('#affichage').append(response);
      }
    });

    compteur++;
  });

});
