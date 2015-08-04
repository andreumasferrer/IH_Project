// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function() {


  // $('#myTab a').click(function (e) {
  //   e.preventDefault()
  //   $(this).tab('show')
  // })



  $('.date-row').mouseenter(function (e) {
    $(event.currentTarget).find(".delete-date").show();

  })

  $('.date-row').mouseleave(function (e) {
    $(event.currentTarget).find(".delte-date").hide();
  })

});
