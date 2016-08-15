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
//= require moment
//= require bootstrap-datetimepicker
//= require bootstrap-sprockets
//= require bootstrap-colorpicker
//= require cocoon

//= require_tree .

$(document).ready(function(){
    $('.skillbar').each(function(){
        $(this).find('.skillbar-bar').animate({
            width:$(this).attr('data-percent')
        },2000);
    });
    $('.my-form-group input').on('focus blur', function (e) {
        $(this).parents('.my-form-group').toggleClass('my-active', (e.type === 'focus' || this.value.length > 0));
    }).trigger('blur');
});
