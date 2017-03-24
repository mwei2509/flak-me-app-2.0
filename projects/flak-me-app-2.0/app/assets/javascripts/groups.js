$(document).on('turbolinks:load', function() {
  submitNewMessage();
  submitNewFlash();
  readMessage();
  // notificationsExists();
});

// function notificationsExists(){
//   if ($('#notifications').length > 0){
//     console.log("poop");
//   }
// }

function submitNewMessage(){
  $('textarea#message_body').keydown(function(event) {
    if (event.keyCode == 13) {
        $('input[type=submit]').submit();
        $('#message_body').val(" ")
        return false;
     }
  });
}

function submitNewFlash(){
  $('textarea#flash_body').keydown(function(event) {
    if (event.keyCode == 13) {
      $(this).closest('form').submit();
      $('#flash_body').val('');
        // $('input[type=submit]').click();
      return false;
     }
  });
}

function readMessage(){
  $('textarea#message_body').focus(function(){

  });
}
