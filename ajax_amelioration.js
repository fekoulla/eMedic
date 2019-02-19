$(document).ready(function(){

  $("#message_amelioration").on("keyup", function(event) {
    if (event.keyCode === 13) {
      $("#submit_amelioration_bdd").click();
    }
  });

  $('#submit_amelioration_bdd').click(function(){
    
    $('#ecran').append("<div class=\"container\" >\n" +
      "              <div class=\"row\">\n" +
      "                 <div class=\"col-lg-7 col-md-7 col-sm-7\">\n" +
      "                   <div id=\"affichage_bot\" class=\"card card-body\" style=\"margin-top: 30px;\">\n" +
      "Merci, pour votre aide"+
      "                   </div>\n" +
      "                 </div>\n" +
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