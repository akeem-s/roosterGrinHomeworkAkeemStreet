$(document).ready(() => {
  $('.button').prop('disabled', true);

  $('select[id="user_select"]').on("change", ()=>{
    if($('select[id="user_select"]').val() !== null && $('input[name="note"]').val().length > 0){
      $('.button').prop('disabled', false);
    }
  })

  $('input[name="note"]').on("change", ()=>{
    if($('select[id="user_select"]').val() !== null && $('input[name="note"]').val().length > 0){
      $('.button').prop('disabled', false);
    }
  })

  $("#notes_form").submit((e) => {
    $("#note_container").empty()
    e.preventDefault()
    let user = $('select[id="user_select"]').val()
    let note = $('input[name="note"]').val()

    if(user !== null && note.length > 0){
      let form = this
      $.post({
        url: 'http://localhost:3000/notes/create',
        data: {user: user, note: note}
      }).done((response) => {
        $("#initial_information_container").hide()
        $("#note_container").html("<h5>Your note is below:</h5>"+"<span id='note_text'><p class='example'>"+response.note+"'</p></span>"+"<br/><br/><p>Feel free to compose as many notes as you want! Just select another user and stretch out those twitter fingers!</p>")
        document.getElementById('notes_form').reset()
        $('.button').prop('disabled', true);
      })
    }
  })
})
