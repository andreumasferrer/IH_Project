// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function() {


  $('.date-row').mouseenter(function (e) {
    $(event.currentTarget).find(".delete-date").show();

  })

  $('.date-row').mouseleave(function (e) {
    $(event.currentTarget).find(".delte-date").hide();
  })

  /* Super plan modal stuff*/
  $('#finish, #next-when').attr("disabled", "disabled");
  $('#planName, #shortDesc').keyup(function (e){
     var validated = true;
     if($('#planName').val().length === 0) validated = false;
     if($('#shortDesc').val().length === 0) validated = false;
     if(validated) {
       $("#finish, #next-when").removeAttr("disabled")
     }else{
       $('#finish, #next-when').attr("disabled", "disabled");
     }
  })
  $('#planName').trigger('keyup');

  $('#next-when').click(function (e){
    $("#what-div").animate({width:'toggle'},350);
    $('#when-div').fadeIn()
  })

  $('#previous-what').click(function (e){
    $("#when-div").hide();
    $('#what-div').fadeIn()
  })

});
