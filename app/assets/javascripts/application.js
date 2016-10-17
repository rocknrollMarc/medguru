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
//= require foundation
//= require video

$(function(){ $(document).foundation(); });


$(document).ready(function(){
  $('.main_nav ul li.dropdown a').click(function(e){
    e.preventDefault();
    var displayMenu=!$(this).hasClass('click');
    var element = $(this);
    $(".main_nav ul li a").removeClass("click");
    if(displayMenu){
      element.addClass('click');
      $('.gradient').css('opacity',1);
      $('.submenu').slideDown();
    }else{
      $('.gradient').css('opacity',0);
      $('.submenu').slideUp();
    }
  })

  $('.startpage_effects .columns').css('opacity','0')

  function check_visibility(){

      /* Check the location of each desired element */
      $('.startpage_effects .columns').each( function(i){

          var bottom_of_object = $(this).position().top;
          var bottom_of_window = $(window).scrollTop() + $(window).height();
          /* If the object is completely visible in the window, fade it it */
          if( bottom_of_window > bottom_of_object ){
              $(this).animate({'opacity':'1'}, 800);
          }

      });

  }

  check_visibility();

  $(window).scroll( function(){

    check_visibility();

  });

});
