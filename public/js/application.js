$(document).ready(function() {

  $('#search-spots-button').on("click", function(event){
      event.preventDefault();

      var path = $('#search-spots-form').attr('action');

      var request = $.ajax({
        url: path,
        type: "GET",
        data: $('#search-spots-form').serialize()
      });

      request.done(function(response) {
          // console.log(response + 'you made it here 2');
        $( ".spot-list" ).remove();
        $('.container').append(response);
      });
    });

    $('.new-comment-button').on("click", function(event){
      event.preventDefault();

      var path = $('.new-comment-form').attr('action');

      var request = $.ajax({
        url: path,
        type: "POST",
        data: $('.new-comment-form').serialize()
      });

      request.done(function(response) {
          console.log(response + 'you made it here 2');
        $('.comment-list').append(response);
        $('.new-comment-input').val("");
        $('#no-comment-alert').hide();
      });

      request.fail(function(response) {
          console.log(response + 'you made it here failure');
      });
    });



});
