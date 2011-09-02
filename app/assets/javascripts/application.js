// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function(){
	
	if ($('#notice').is(':visible')) {
		setTimeout(function(){
			$('#notice').animate({
				height: 0,
				opacity: 0
			}, 500);
		}, 4000);
	}
	
	$('#flashcards_list .card_actions').hide();
	$('#flashcards_list tr').hover(function(){
		$(this).find('.card_actions').show();
	},function(){
		$(this).find('.card_actions').hide();
	});
	
	$('.add_to_my_books').live('click', function(event){
	    event.preventDefault();
	    $.post($(this).attr('href'), {
	    	'book_id': $(this).attr('data-book-id')
    	}, function(data){}
    	);
	});

});