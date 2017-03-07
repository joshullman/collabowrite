// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs

//= require_tree .

$(document).ready(function(){

	//Facebook 
	jQuery(function() {
	  $('body').prepend('<div id="fb-root"></div>');
	  return $.ajax({
	    url: "" + window.location.protocol + "//connect.facebook.net/en_US/all.js",
	    dataType: 'script',
	    cache: true
	  });
	});
	window.fbAsyncInit = function() {
	  FB.init({
	    appId: '229942094136138',
	    cookie: true
	  });
	  $('#sign_in').click(function(e) {
	    e.preventDefault();
	    return FB.login(function(response) {
	      if (response.authResponse) {
	        return window.location = '/auth/facebook/callback';
	      }
	    });
	  });
	  return $('#sign_out').click(function(e) {
	    FB.getLoginStatus(function(response) {
	      if (response.authResponse) {
	        return FB.logout();
	      }
	    });
	    return true;
	  });
	};

	//Profile and group buttons

	$('.scripts_button').click(function(){
		$('.scripts_button').css("text-decoration", "underline");
		$('.groups_button').css("text-decoration", "none");
		$('.members_button').css("text-decoration", "none");
		$('.comments_button').css("text-decoration", "none");
		$('.scripts_container').show();
    $('.groups_container').hide();
    $('.members_container').hide();
    $('.comments_container').hide();
  });

	$('.groups_button').click(function(){
		$('.scripts_button').css("text-decoration", "none");
		$('.groups_button').css("text-decoration", "underline");
		$('.members_button').css("text-decoration", "none");
		$('.comments_button').css("text-decoration", "none");
		$('.scripts_container').hide();
    $('.groups_container').show();
    $('.members_container').hide();
    $('.comments_container').hide();
  });

	$('.members_button').click(function(){
		$('.scripts_button').css("text-decoration", "none");
		$('.groups_button').css("text-decoration", "none");
		$('.members_button').css("text-decoration", "underline");
		$('.comments_button').css("text-decoration", "none");
		$('.scripts_container').hide();
    $('.groups_container').hide();
    $('.members_container').show();
    $('.comments_container').hide();
  });

	$('.comments_button').click(function(){
		$('.scripts_button').css("text-decoration", "none");
		$('.groups_button').css("text-decoration", "none");
		$('.members_button').css("text-decoration", "none");
		$('.comments_button').css("text-decoration", "underline");
		$('.scripts_container').hide();
    $('.groups_container').hide();
    $('.members_container').hide();
    $('.comments_container').show();
  });

  //Tooltips

});