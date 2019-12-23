$(window).on('load resize', function(){
  var height = $('.navbar').height();
  $('body').css('padding-top',height); 
});