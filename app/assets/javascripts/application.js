// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require jquery.flip/jquery.flip.js
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
	
	//make edit/delete card links show on hover
	$('#flashcards_list .card_actions').hide();
	$('#flashcards_list tr').hover(function(){
		$(this).find('.card_actions').show();
	},function(){
		$(this).find('.card_actions').hide();
	});
	
	$('#add_new_cards').click(function(e){
		e.preventDefault();
		var $form = $('#quick_add_card_form form'),
			$flashcardsListTableBody = $('#flashcards_list tbody');
		for (i=0; i < 3; i++) {
			var $newTextFields = $form.find('tr.text_fields').clone();
			$newTextFields.find('input[type=text]').blur(function(){
				var fieldsWithValues = 0;
				var $fields = $(this).closest('tr').find('input[type=text]');
				$fields.each(function(){
					if ($.trim($(this).val()).length > 0) {
						fieldsWithValues++;
					}
				});
				if (fieldsWithValues == 2) {
					$fields.each(function(){
						$form.find('#' + $(this).attr('id')).val($(this).val());
					});
					$.post($form.attr('action'), $form.serialize(), function(data){
						console.log(data);
						//now remove the fields and replace with a normal row
						var $newRow = $('<tr />');
						$fields.each(function(){
							$newRow.append('<td>' + $(this).val() + '</td>');
						});
						$newRow.append('<td />');
						$fields.closest('tr').before($newRow);
						$fields.closest('tr').remove();
					});
				}
			});
			$flashcardsListTableBody.append($newTextFields);
		}
		$flashcardsListTableBody.append($('tr.submit_button', $form).clone());
	});
	
	//not being used since we're using button :remote
	// $('.add_to_my_books').live('click', function(event){
	    // event.preventDefault();
	    // $.post($(this).attr('href'), {
	    	// 'book_id': $(this).attr('data-book-id')
    	// }, function(data){}
    	// );
	// });

});