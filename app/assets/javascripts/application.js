// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
    $('.bets-choose').on('click',function(){
        $('#modal-waiting').modal();
        $("#user-choose").attr("src", $(this).find('img').attr('src'));
        $.ajax({
            url: '/games/throw',
            type: 'POST',
            data: {
                bet: $(this).data('bet'),
                authenticity_token: $('[name="csrf-token"]')[0].content
            }
        })
    });
});

