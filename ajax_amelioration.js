$(document).ready(function(){

  $("#message_amelioration").on("keyup", function(event) {
    if (event.keyCode === 13) {
      $("#submit_amelioration_bdd").click();
    }
  });

  $('#submit_amelioration_bdd').click(function(){

    $('#ecran').append("<div class=\"container\" >\n" +
      "              <div class=\"row\">\n" +
      "                 <div class=\"col-lg-1 col-md-1 col-sm-1\"> \n" +
      "                 </div> \n" +
      "                 <div class=\"col-lg-1 col-md-1 col-sm-1\"> \n" +
      "                     <i class=\"fas fa-robot fa-3x\" style=\"margin-top: 40px; margin-right: 10px;\"></i> \n" +
      "                 </div> \n" +
      "                 <div class=\"col-lg-5 col-md-5 col-sm-5\">\n" +
      "                   <div class=\"card card-body affichage_bot\" style=\"margin-top: 30px;\">\n" +
      "                     Merci, pour votre aide"+
      "                   </div>\n" +
      "                 </div>\n" +
      "                 <div class=\"col-lg-5 col-md-5 col-sm-5\"> \n" +
      "                  </div> \n" +
      "              </div>\n" +
      "          </div>");

    $.ajax({
      type: "GET",
      url: "controller.php",
      data: {message_amelioration: $('#message_amelioration').val()},
      dataType:'html',
      success: function(response){
        $('#ecran').append(response);
      }
    });
  });
});