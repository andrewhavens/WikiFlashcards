jQuery(function($){

  $('#new_chapter_form').hide();
  
  $('#add_new_chapter').click(function(e)){
    e.preventDefault();
    $('#new_chapter_form').show();
  });
  
});