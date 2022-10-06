

  /*user menu list hide and show action */
 
/* like */
  $(document).ready(function(){
    $(".like").click(function(){
      $(".like").hide();
      $(".unlike").show();
    });
  });
/* unlike to like */
  $(document).ready(function(){
    $(".unlike").click(function(){
      $(".unlike").hide();
      $(".like").show();
    });
  });




  /* notification */
  $('#notification').delay(5000).fadeOut('slow');