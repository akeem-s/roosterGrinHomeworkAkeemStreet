// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
// require base
$(document).ready(function(){
  $("#notes_form").submit(function(e) {
    $("#note_container").empty()
    e.preventDefault()
    var form = this
    var user = $('select[id="user_select"]').val()
    var note = $('input[name="note"]').val()
    console.log(user)
    console.log(note)
    if(user !== null && note.length > 0){
      $.post({
        url: 'http://localhost:3000/notes/create',
        data: {user: user, note: note}
      }).done(function(response){
        $("#note_container").html("<p>Your note is below:</p><br/>'"+response.note+"'"+"<br/><br/>Feel free to compose as many notes as you want! Just select another user and stretch out those twitter fingers!")
        form.reset()

      })
    }

    user == null ? $("#user_error_container").html("You must include a User") : $("#user_error_container").empty()
    note.length < 1 ? $("#note_error_container").html("You must include a Note") : $("#note_error_container").empty()

  })
})
