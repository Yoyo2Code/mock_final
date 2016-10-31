function searchParams() {
  $("#search").keyup(function(){
    var filter = $(this).val();

    $(".links").each(function() {

      if( $(this).find("#link-url").text().includes(filter) ) {
        $(this).show();
      } else if( $(this).find("#link-title").text().includes(filter) ) {
        $(this).show();
      } else {
        $(this).hide();
      };
    });
  });
}

$(document).ready(function(){
  searchParams();
})
