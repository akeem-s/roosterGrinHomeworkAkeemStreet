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

$(document).ready(function(){
  $("#notes_form").submit(function(e) {
    e.preventDefault()
    var user = $('select[id="user_select"]').val()
    var note = $('input[name="note"]').val()
    console.log(e.target)

    $.ajax({
      method: 'post',
      url: 'http://localhost:3000/notes/create',
      data: {user: user, note: note}
    }).then(function(response){
      console.log(response)
    })
  })
})
