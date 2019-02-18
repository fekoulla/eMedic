$(document).ready(function(){

	$('#submit_ajax').click(function(){

    $.ajax({
      type: "GET",
      url: "controller.php",
      //data: {action: 'test'},
      dataType:'html',
      success: function(response){
        console.log(response);
        $('#affichage').html(response);
      }
    });
  });
});
