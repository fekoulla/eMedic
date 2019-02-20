$(document).ready(function(){

  var compteur = 0;

  $("#message").on("keyup", function(event) {
    if (event.keyCode === 13) {
      $("#submit_ajax").click();
    }
  });

  $('#submit_ajax').click(function(){

    $('#ecran').append("<div class=\"container\" >\n" +
      "              <div class=\"row\">\n" +
      "                 <div class=\"col-lg-5 col-md-5 col-sm-5\"> \n" +
      "                 </div> \n" +
      "                 <div class=\"col-lg-5 col-md-5 col-sm-5\">\n" +
      "                   <div class=\"card card-body affichage_user\" style=\"margin-top: 30px; background-color: #d0f5d0;\">\n" +
      $('#message').val()+
      "                   </div>\n" +
      "                 </div> \n" +
      "                 <div class=\"col-lg-1 col-md-1 col-sm-1\"> \n" +
      "                   <i class=\"fas fa-user fa-3x\" style=\"margin-top: 40px; margin-right: 10px;\"></i> \n" +
      "                 </div> \n" +
      "                  <div class=\"col\"> \n" +
      "                 </div> \n" +
      "                 </div>\n" +
      "              </div>\n" +
      "          </div>");

    $.ajax({
      type: "GET",
      url: "controller.php",
      data: { compteur: compteur, message: $('#message').val()},
      dataType:'html',
      success: function(response){
        $('#ecran').append(response);
      }
    });
    compteur++;
  });
});