$(document).on('turbolinks:load', function() {
  submitNewMessage();
  readMessage();
});

function submitNewMessage(){
  $('textarea#message_body').keydown(function(event) {
    if (event.keyCode == 13) {
        $('input[type=submit]').click();
        $('#message_body').val(" ")
        return false;
     }
  });
}

function readMessage(){
  $('textarea#message_body').focus(function(){
    
  });
}
