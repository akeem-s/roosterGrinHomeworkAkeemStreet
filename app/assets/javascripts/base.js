$(document).ready(function(){
  $("#notes_form").submit(function(e) {
    e.preventDefault()
    $("#error_container").empty()
    $("#note_container").empty()
    var form = this
    var user = $('select[id="user_select"]').val()
    var note = $('input[name="note"]').val()

    if(user !== null && note.length > 0){
      $.post({
        url: 'http://localhost:3000/notes/create',
        data: {user: user, note: note}
      }).done(function(response){

        form.reset()
      })
    }

    if(user !== null < 1){
      $("#error_container").html("You must include a User")
    }
    if(note.length < 1){
      $("#note_container").html("You must include a Note")
    }
  })
})
