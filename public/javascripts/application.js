$(function(){
	$('#flashcards_list .card_actions').hide();
	$('#flashcards_list tr').hover(function(){
		$(this).find('.card_actions').show();
	},function(){
		$(this).find('.card_actions').hide();
	});
});