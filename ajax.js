$(document).ready(function(){

  var compteur = 0;

  $('#submit_ajax').click(function(){

    $('#ecran').append("<div class=\"container\" >\n" +
      "              <div class=\"row\">\n" +
      "                 <div class=\"col-lg-7 col-md-7 col-sm-7\">\n" +
      "                   <div id=\"affichage_user\" class=\"card card-body\" style=\"margin-top: 30px;\">\n" +
      $('#message').val()+
      "                   </div>\n" +
      "                 </div>\n" +
      "              </div>\n" +
      "          </div>");

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
