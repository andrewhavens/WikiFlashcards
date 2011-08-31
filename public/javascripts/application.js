$(function(){
	$('#flashcards_list .card_actions').hide();
	$('#flashcards_list tr').hover(function(){
		$(this).find('.card_actions').show();
	},function(){
		$(this).find('.card_actions').hide();
	});
	
	// $('.add_to_my_books').live('click', function(event){
	    // event.preventDefault();
	    // $.post($(this).attr('href'), {
	    	// 'book_id': $(this).attr('data-book-id')
    	// }, function(data){}
    	// );
	// });

});